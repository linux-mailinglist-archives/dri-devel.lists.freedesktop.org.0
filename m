Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D287255DB
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 09:36:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9055810E44E;
	Wed,  7 Jun 2023 07:36:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 791DD10E44E
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 07:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686123401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VCpM3n9uxiNBqWYphesbEdJfBdCBdNVjlNpr9KooViE=;
 b=IXtZa3k9G+j2InWFcIipN6/AtSQoZyrLaSy9r0BLgAmFyrJ+HDripo8AV/zugNQ0+zoyGm
 fgRT3oWOrLtNrt1rqHwbxn6TH1O9/8gm9zJC2sMiFCE25OM0Z6VX2zi+6iCbd69PBQpxzB
 ctOc10/YsT5b72Gqbbq+SPsulkWtINc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-Oe6jFz0PMJil0sNcSNmnHw-1; Wed, 07 Jun 2023 03:36:40 -0400
X-MC-Unique: Oe6jFz0PMJil0sNcSNmnHw-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f70f9995aeso33800465e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jun 2023 00:36:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686123399; x=1688715399;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VCpM3n9uxiNBqWYphesbEdJfBdCBdNVjlNpr9KooViE=;
 b=ihBHL0DWU7cE8fX+pqbaFn5KIYP8lG/haN+Ocfh+qKH+FP1UWxUYzBtiDrd79hOzRM
 vXwOwmIZUQgGL7utAwzvbOCTMJBLTmTdb26ByvTNRyUL4t+FAHPHrskcXlFe42i03Qjl
 My9ZLZbr8oAwqpNseXMPUHHKKzZUkUX01witsEmnxDVD4jCiwrsIqgPTvjDSGx9UWMdH
 xJKtbEyI4RPVktdeOrupWR3HQzKal9uGql2O45MkY8OSSiezF1ZJHjTRmvDd0Gaqq1IE
 ReclEk7PBbOUo4aPxsG8pNzifroAuBkUIGQOe2sYWuy+hV7JTSUIM4m77X7i4/Bg3OUn
 50Og==
X-Gm-Message-State: AC+VfDxbl6p+LESlzPT779oM7ewcp45om0c3DZfccJZHdxItIaEaft0w
 nqANBLr6V/+Fskwu0ttfm6y3cl1i7ieYj1SI0vzfLxvCD+dPIGiJo5mEcoH5MMnKoUBW1hAq7zY
 gVchNj4oWLdoJY3DtUNCN6G2LXE3C
X-Received: by 2002:adf:fc48:0:b0:30a:f0fd:dca4 with SMTP id
 e8-20020adffc48000000b0030af0fddca4mr3438817wrs.3.1686123399229; 
 Wed, 07 Jun 2023 00:36:39 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4QHTJetA/ydYNcZpnkz18WI9SIVhHJpnswtj0+WuXSdy2RjUolx7XRR0vsMR7cmSEWXP1qKQ==
X-Received: by 2002:adf:fc48:0:b0:30a:f0fd:dca4 with SMTP id
 e8-20020adffc48000000b0030af0fddca4mr3438803wrs.3.1686123398984; 
 Wed, 07 Jun 2023 00:36:38 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 t7-20020a1c7707000000b003f6cf9afc25sm1125337wmi.40.2023.06.07.00.36.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jun 2023 00:36:38 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 sam@ravnborg.org, deller@gmx.de, geert+renesas@glider.be, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com
Subject: Re: [PATCH 04/30] fbdev/atyfb: Reorder backlight and framebuffer
 init/cleanup
In-Reply-To: <20230605144812.15241-5-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-5-tzimmermann@suse.de>
Date: Wed, 07 Jun 2023 09:36:37 +0200
Message-ID: <873533hgfu.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-staging@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> The driver's backlight code requires the framebuffer to be
> registered. Therefore reorder the init and cleanup calls for
> both data structures.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

