Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CC885B740
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 10:24:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D376C10E286;
	Tue, 20 Feb 2024 09:24:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="JvwWqmfh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D12B310E286
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 09:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1708421093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c4+PDNGzX9gnQXfniAcrsImd8TqIIQS8SH49RAkCR2I=;
 b=JvwWqmfhNvjtskAglVEPJbuWbwW2PMbuoksovrte0+VEAriNPyff0bgOq9wrp2DaOK1dQl
 OhSm4uRdNGdMJNb1yNeihGI/l7Jr5GlEShJqvTJDfS7o//ZfluAmLRS5mRkUN9ezp6BrC4
 bRlEpM2kMkTJBBbi7ahd0s6UE1dW8yQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-538-s929PpbyPm2cGEsAjcDH1w-1; Tue, 20 Feb 2024 04:24:51 -0500
X-MC-Unique: s929PpbyPm2cGEsAjcDH1w-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-411ce6e7708so28741835e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 01:24:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708421090; x=1709025890;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xshxlpsQluS7qRAd7fMDdSOWA/KW0tH/DDlQJBA+rDs=;
 b=ReIURczOUEn5XKsFF5oSn4vduPL60EC+N8FZBh+2wRd7cNFI+TGJZI04ystR07Zeuh
 ihCixoJfprv5asXtequR597jNmjOGHVbaHRgDp05KMfGbO2Fftxmzh7Hx5+OBVxYEtNb
 R+bE/l8VUoCRIBAVIHzVraCJfGBrcn7T2/M3pG2LwkkFg7YeJCzVi23f4OqIN30Y/JEe
 eeupkC4AuyS8Q0/UnD46saRR4lvRjWJ2h2Uh8Itv68pt/XkPhHQRMN8dJdrK04kjfJBQ
 p5jqEP5iZ8up2iRanABH9u8QWHin2PY3ewrIFsqZdL2Upl/NuQeRs9DoAHsDsN+z03Y7
 9lbA==
X-Gm-Message-State: AOJu0Yxm7z3Cak17TqA8NT0wthWH4SopubbizbVN0OJ74mvOwiO3ONf6
 u9YwJYSCbNdVV3TGtrNv9CZ/ZlJM8ZiIlTbcsfvHLE7CfRxvlJiDWqqCl1fnIZAihzsUDtF/M6i
 ajy8Jl1fst9gZ0WUZzQCU7q3Q+o9zdAsBFJVJ05apvtsQ/hOS1kXYyQiazJq6Tz/TWA==
X-Received: by 2002:a05:600c:1d26:b0:40f:de6a:2a27 with SMTP id
 l38-20020a05600c1d2600b0040fde6a2a27mr7454597wms.40.1708421090415; 
 Tue, 20 Feb 2024 01:24:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHkPjh10xOQRjnJMuYej9HPk/BhMMWKcIszDd75k/eW3ji67ZhUwGUtMHTKJ5oYHxYrfH7Zng==
X-Received: by 2002:a05:600c:1d26:b0:40f:de6a:2a27 with SMTP id
 l38-20020a05600c1d2600b0040fde6a2a27mr7454582wms.40.1708421090135; 
 Tue, 20 Feb 2024 01:24:50 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 y10-20020a1c4b0a000000b00412704a0e4asm779017wma.2.2024.02.20.01.24.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 01:24:49 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, deller@gmx.de
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-input@vger.kernel.org, linux-pwm@vger.kernel.org, Thomas Zimmermann
 <tzimmermann@suse.de>, Bruno =?utf-8?Q?Pr=C3=A9mont?=
 <bonbons@linux-vserver.org>
Subject: Re: [PATCH 04/10] hid/hid-picolcd: Remove struct
 backlight_ops.check_fb
In-Reply-To: <20240212162645.5661-5-tzimmermann@suse.de>
References: <20240212162645.5661-1-tzimmermann@suse.de>
 <20240212162645.5661-5-tzimmermann@suse.de>
Date: Tue, 20 Feb 2024 10:24:49 +0100
Message-ID: <8734tnjxni.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> The driver sets struct fb_info.bl_dev to the correct backlight
> device. Thus rely on the backlight core code to match backlight
> and framebuffer devices, and remove the extra check_fb function
> from struct backlight_ops.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: "Bruno Pr=C3=A9mont" <bonbons@linux-vserver.org>
> ---

[...]

> +#ifdef CONFIG_HID_PICOLCD_BACKLIGHT
> +=09info->bl_dev =3D data->backlight;
> +#endif
> +

The robot complains about this, I think that you also need to guard
against CONFIG_FB_BACKLIGHT being defined. Alternatively, you could
include a preparatory patch to fix the HID_PICOLCD_BACKLIGHT config
symbol dependencies.

Other than that,

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

