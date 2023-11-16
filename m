Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1779F7EDEC7
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 11:47:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC9FC10E5B8;
	Thu, 16 Nov 2023 10:47:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48D2F10E5B8
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 10:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700131617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+mneAN+O3HdG8FQxpQR7zP/PBFf56Dx1XY7777+VaPU=;
 b=Ri19zgFfVhUogLVGJ/yWPXKujsw53rcwez1xMMRQjOT6o0uy4tLEHz8Z561dq6+kQFWpgr
 iefNVni5SjXxmvr5Qw48Q6ttMk4VN4RKW1bRRzskN/qtGmwVLI/18ML263K2eqsAiHUnN7
 sTicPh5/5Q0fwVmm2EVr5xfd/VK7ELw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-492-LlrPnG9XPdG0X_GJ3utVtA-1; Thu, 16 Nov 2023 05:46:56 -0500
X-MC-Unique: LlrPnG9XPdG0X_GJ3utVtA-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-32fd5f67818so296020f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 02:46:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700131614; x=1700736414;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+mneAN+O3HdG8FQxpQR7zP/PBFf56Dx1XY7777+VaPU=;
 b=EAxzjzFqLq1Irn5/GpbeOxc99KisHBvK9uo2jLmdHYhJLyA9k9Hz6yfpoGRrkl3qln
 xCbrPA2FvdfUBpXlnNIEv26fCiK5Qp8r6onbbbuRgGM8cvYCqX34E4Bw7Mz8PmtyKdIw
 CNEV0MXGbF3bnBOBdeKhlO3ARdInaAZcJwbrCBhYpg3Q3OltcfHxJyCCoZ18HJW3lFRG
 FI+vBMz7wW4RvPxRSql6+UIotxwdWLpOzbtLtubQ0hn55aaMWKFAmItG75EEE+YRmLTy
 h8lriD2xBiavNpWYOnT8N3m24M5lkfOfrb/FDalXrNHucP3ItGFkkvGDDo7WHq2TRPDd
 4Jmw==
X-Gm-Message-State: AOJu0Yy1RsgtviO8cYMtLDqS6Q9b9T/XMQFsyDzNfAaBRha/5bOM88V1
 jYANPfsk+zBgEnkAy9nQf3UePiMoQa/ioWYLIon0C2II0+PZdenyCe4AjXGADRjCvEDRk5s+a1B
 Lj2467QUf7BRuL3MH9yVlGBwkw8xo00DdGnwW
X-Received: by 2002:a5d:5888:0:b0:32f:7d50:62ef with SMTP id
 n8-20020a5d5888000000b0032f7d5062efmr12951188wrf.13.1700131614508; 
 Thu, 16 Nov 2023 02:46:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGAs6+6iy0Dt/lOmxHJQefZHE92U1Biwcc/qBBdf7doNIMGHO/Iod5CVM74R3HcwWPPe6TRCA==
X-Received: by 2002:a5d:5888:0:b0:32f:7d50:62ef with SMTP id
 n8-20020a5d5888000000b0032f7d5062efmr12951175wrf.13.1700131614223; 
 Thu, 16 Nov 2023 02:46:54 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 j16-20020a056000125000b0032f983f7306sm13152500wrx.78.2023.11.16.02.46.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Nov 2023 02:46:54 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de
Subject: Re: [PATCH 15/32] fbdev/udlfb: Select correct helpers
In-Reply-To: <20231115102954.7102-16-tzimmermann@suse.de>
References: <20231115102954.7102-1-tzimmermann@suse.de>
 <20231115102954.7102-16-tzimmermann@suse.de>
Date: Thu, 16 Nov 2023 11:46:53 +0100
Message-ID: <87cywa3rhe.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> The driver uses deferred I/O. Select the correct helpers via
> FB_SYSMEM_HELPERS_DEFERRED in the Kconfig file.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

