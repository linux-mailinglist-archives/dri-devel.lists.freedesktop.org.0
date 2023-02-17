Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 015E569AC62
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 14:27:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F85A10EFC9;
	Fri, 17 Feb 2023 13:27:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A52010EFC9
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 13:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676640472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kn959pjERWlA4NN9FBj9jpzem6CtQEXiCh01CPZcaQU=;
 b=hcE7WR68MxGDfMAO6FSqqeij7DxpsIyJjfKHj0GTsn5+ntO0n6U8z9cjtwsZhNe4AL+Zyy
 LTQX7ER4ybrw7rDoOBTCx/HD6aKFxrCrr9FL4bTpjEfDFyofg8l+njl1mzZLAZyLhbOnY1
 VFwXoRK4RKRWonixLsGs9YI+A/TkaZo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-59-I0UW4EivM4CfHBIPhwrWvw-1; Fri, 17 Feb 2023 08:27:42 -0500
X-MC-Unique: I0UW4EivM4CfHBIPhwrWvw-1
Received: by mail-wm1-f71.google.com with SMTP id
 k2-20020a05600c1c8200b003dd41ad974bso639944wms.3
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 05:27:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kn959pjERWlA4NN9FBj9jpzem6CtQEXiCh01CPZcaQU=;
 b=IvKN3jPgch+G405MO+DNMzOJ5V7Mt29asnFlXiXRfuszEM502+P+sqpbWsvr8qIqSU
 ibDCY4EPvbj55+ZtaxdUJjivLvF6T4GJTHGLekHoOvUHzo3l8fnmkru85EhT4cY9zxqK
 //oWoQ5r6ls8vD9zzbtslEWyVBUOGAGMIeu/VHzTIV+tb7h5GsG/kbr2AhsAjd5w+91x
 chP7zyKtpW1vSGQth0L3fNIAhKlBXarqtzMxBIYXtUvsKY1gzJfIFOH7onsCcRNxZns0
 96UdaZ4g4T/IkAPQcjtNTRflFOEnaqWeGwPEQaqdEK+0EfFrDnqbeFjv165dWdzunIV5
 YndA==
X-Gm-Message-State: AO0yUKXU9x2p3gJBWdfIoQDFFUX07Zg6RO/bJQQxRo5gxDDhuSz84NZ9
 y0T7p7SIZTfXxXcAeKEde60DGFubuqlqx1kY30ynCvqMz6v1vEdaY2NtUmMbbsaViCrEWhKsAJg
 vfq3kvu3h3MYBFBEc8nEKO/mLQYt+
X-Received: by 2002:a5d:6991:0:b0:2c6:e7f6:49af with SMTP id
 g17-20020a5d6991000000b002c6e7f649afmr1556174wru.27.1676640461077; 
 Fri, 17 Feb 2023 05:27:41 -0800 (PST)
X-Google-Smtp-Source: AK7set9yVkkm9UCCO49jiKgpfSadK+RO9VSBY7lFWa3rTjTG4MwGlSNfyA+xztMuBtzsCBzyDPXl/w==
X-Received: by 2002:a5d:6991:0:b0:2c6:e7f6:49af with SMTP id
 g17-20020a5d6991000000b002c6e7f649afmr1556159wru.27.1676640460831; 
 Fri, 17 Feb 2023 05:27:40 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 t10-20020a05600001ca00b002c53f5b13f9sm4172620wrx.0.2023.02.17.05.27.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 05:27:40 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, jyri.sarha@iki.fi, tomba@kernel.org
Subject: Re: [PATCH 5/6] drm/tidss: Remove return values from
 dispc_plane_{setup, enable}()
In-Reply-To: <20230209154107.30680-6-tzimmermann@suse.de>
References: <20230209154107.30680-1-tzimmermann@suse.de>
 <20230209154107.30680-6-tzimmermann@suse.de>
Date: Fri, 17 Feb 2023 14:27:39 +0100
Message-ID: <87fsb4ifqs.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Calls to dispc_plane_setup() and dispc_plane_enable() cannot fail.
> Remove the return value.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
Javier

