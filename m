Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10985C57D88
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 15:07:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68FD210E0BF;
	Thu, 13 Nov 2025 14:07:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="a2TqmdAg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED6DC10E0BF
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 14:07:20 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-47778b23f64so6701285e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 06:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763042839; x=1763647639; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=3cf0bJfE0DHgZ8cmT4vSAdpERQZSI+WOrcGvjTZDl8w=;
 b=a2TqmdAg3rpVouknv+iSTJ7L4Z1izcmlYQMfC0uzCnTLnknqfrlN7c+uHz7RrXYcN9
 F83k1fPSF53dmBnlAumiSf83QuYZt4jHlc3GfkW+FVtBrzLYD7nkceOHYXE1kNYOqyCh
 k4f5+APSvafhCdgQGA2FNvTJiDYuDE+MWp0iw2h5GJ8WN4idy+U9ywk3tkIB6sa4a8uV
 smekH+IbHAWru4bj0cHPHfLCY21UzRR4sPEKoRaOjWR7uvf8cyXWMXW3GXw3H57VNl9R
 XaGWzCO0FmCqKnq9XGnB+DY41j+BGC4j2+SkNXyrd371cfrsUP9q542dg11Y08PZDkcl
 O/bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763042839; x=1763647639;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3cf0bJfE0DHgZ8cmT4vSAdpERQZSI+WOrcGvjTZDl8w=;
 b=RZIJrBsNxlmC5xpQ3/PkbWwEviuth7PHjfcES8BS90EsoRfsmcWxhWEcLwn4aodoFk
 oWpkBpe7jFooNV1diTckprQ+ik7mrSNxdrhVnKPxmLHNYC7Jhk4aEbX7ECQrMrwG610i
 u1N4Hq1Ms069qiPSMV4Y200w7sbcboFsQjXR4C1n5SGEgoTIGIIA0j5p8Xmv0UZABndH
 +uptQ58hLPd21RAjY9fUKHW/XU91k44WqcRXXiez16T3Bpqd1qEfRZfyA2/gHlCH0tFr
 0IYHzzdAcGWKH64TRpeiF42vgqQ92SpgDT5ftJki+bKiqoMZbnqq/OjQoLUtoZbIJxu2
 BicQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrprPPkebIASex3KWYjoMVhrKQwwODWO9Z0tYUeTAIlCiNxKdHSFtxEQ5vaEAdxe/X2LHdOqV6TZI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxG05MUfjZ0iZfsb+YI2U9QOlOIQ6mXNsEd3YUJ+uyacWP8nMBS
 8f47XvZDqfh3/XzhojQoAc/zV5WG9xZCCYh0P1gJ2MX+St3yuH15uxGj
X-Gm-Gg: ASbGncuVqbWiXCTMk1jQpWDaRW+fjMIav2H1TlmFvS8dJ5t+dpfQ9FDdt42XKufuNNO
 D3BHCadxbqWItYz2uW/ZDk2yhrk3m91HAbUgdrr8rhIhQ7rS8f5W6exAbq/tDxcktV3Hb/hxCF/
 JEcAy3jXR8+PfrnuJ9rZ1Fqr8UFLd1nEqDiyw8bBI26vUPgILwbfEftcVV2lAqFG70Hw/lY5U++
 XfTPEOj3SIFYy8IR0ZLcspZpuj8fz0MphOl0UuXo6CDh173ZPQD4KGaB7qyq6gbGtX/F9JOzdUl
 ePAMnjRYNkEYv/8VxNWyXix9wzr+RozxHMB6zFYDlaIqEGYVdh/N8PjrySnqUru1F2jkk61exti
 QbkYqDZGzGf87hsz2GpHhHbzfMqFK6SqdLl2j2ILKye8CbSW5gXxc1NsEziLuye3sfki+YSQYsw
 ==
X-Google-Smtp-Source: AGHT+IESPvGeYnNPQ2jFxLjtUUJRNV1uNh5/dmN4S/q8mZbuTNaMbF9v84Ad5WEPzh9SzlvoRQ6M+w==
X-Received: by 2002:a05:600c:c4a3:b0:477:6d96:b3dd with SMTP id
 5b1f17b1804b1-47787070768mr75665415e9.1.1763042839195; 
 Thu, 13 Nov 2025 06:07:19 -0800 (PST)
Received: from fedora ([94.73.38.14]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4778bb2f9c8sm22460805e9.1.2025.11.13.06.07.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 06:07:18 -0800 (PST)
Date: Thu, 13 Nov 2025 15:07:15 +0100
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 victoria@system76.com, sebastian.wick@redhat.com,
 thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH RESEND v2 02/32] drm/vkms: Explicitly display plane type
Message-ID: <aRXmE0cBmjN1noyK@fedora>
References: <20251029-vkms-all-config-v2-0-a49a2d4cba26@bootlin.com>
 <20251029-vkms-all-config-v2-2-a49a2d4cba26@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251029-vkms-all-config-v2-2-a49a2d4cba26@bootlin.com>
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

On Wed, Oct 29, 2025 at 03:36:39PM +0100, Louis Chauvet wrote:
> Debug information are mainly read by human, so use full name instead
> of values.

Reviewed-by: José Expósito <jose.exposito@redhat.com>

> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_config.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
> index f8394a063ecf..cfdd5f32f234 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.c
> +++ b/drivers/gpu/drm/vkms/vkms_config.c
> @@ -348,8 +348,8 @@ static int vkms_config_show(struct seq_file *m, void *data)
>  
>  	vkms_config_for_each_plane(vkmsdev->config, plane_cfg) {
>  		seq_puts(m, "plane:\n");
> -		seq_printf(m, "\ttype=%d\n",
> -			   vkms_config_plane_get_type(plane_cfg));
> +		seq_printf(m, "\ttype=%s\n",
> +			   drm_get_plane_type_name(vkms_config_plane_get_type(plane_cfg)));
>  	}
>  
>  	vkms_config_for_each_crtc(vkmsdev->config, crtc_cfg) {
> 
> -- 
> 2.51.0
> 
