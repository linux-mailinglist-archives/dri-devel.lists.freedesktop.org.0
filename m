Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0032DC57DA0
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 15:09:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7634910E822;
	Thu, 13 Nov 2025 14:09:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="K4C01RFY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2087110E81E
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 14:09:15 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-42b3c5defb2so578179f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 06:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763042953; x=1763647753; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=TZyGvcYiCgEWiRpNWtQD8KconPlU7M6IpPd18MQ9pr0=;
 b=K4C01RFYorQ+1rgVvrybarQKOfHfazkEyBbx4lUwEJLMecW3pHDTEL6ja5AWLoZQ/E
 kGO7OS+vlXBOCMaIfpn+LODJX8Ab/Qzkm8kqyO3Kg808aCgEm7V2JNdbIDRwLBkd7MWR
 KqVXwlVR0qtRhpferg5bucVW0c3K4XlNrWwUEdY1BtcnJr3bAEKuLiFrY1U/ZcQW10Dw
 6bNNXin0J1fMrsiPDFeaLRgXl6Im/bveP8kaEEqwifMNWiJ4TP1ZJR+8SCnlK6+3ealE
 1ixzOAz3lskRGQVjbZlGJA+RjmZipSyI5XCc8Lenf+4zkNp4GzJhyGzXE9f76qP1+FF6
 YTFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763042953; x=1763647753;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TZyGvcYiCgEWiRpNWtQD8KconPlU7M6IpPd18MQ9pr0=;
 b=iW6bcRLFlj5+v7gFBFk/yGtnF4NEqv96clbzWKsbGhr4ZcA7FBr3xNV7G0af9oXAvq
 lHHi7/aV/g3VixVqdJ4z8WUorQeN9SJIbY8Wheq0vWVdIAxTS/PwrqVxETsiig7LBC2o
 Xs+WXbsqW7wJEQCdoOXqmdQl42kTVqYXpx/k2CkK7jqrV1bZQi5mkRE0QbMQvfvjmspa
 1tu7qS6Nq8EyEBmClgQl2SM88YpTPTKcB1oKEGdyryovcf9EM6v0qoSxvXb7Yyv7u2ZM
 3Ucw2LsKMOdGhaU8eC34QgraIcz9NK82hHhEV1LrRHLl1R6jh3cxcYGSHo2w8JN+M+3h
 7QzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVXOJbfPRSjrO6ftFi3cP3ztOrPPyKKA3PEtVR/CbaHB29gSSZ44h+iQh5hZe4+SE/RISt2Blveu0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz7SfOnGTCFozoIv9uvNuc53HA85XL2W4xmWDIjy6TDOTLk1FJF
 cBk0LQprpehvzimJR2sn3nCVIjIOhx7ufzd74cXTr88f7AfAIF1dKjxs
X-Gm-Gg: ASbGncuEglaQNeo2xFyA9KA0qZQ3XIOFK9l+4/Jw/OvdsEUriPcIgn5UHOraEULfF35
 z0GvEGvmwziT3S+1l0DrWKUABXi5kg9if/BFkc4Ph8xwIKj/pKSpWiI8bwduOWNs5NBjQFxmJWq
 PumiMgQUFYjSUE/+k+nJpb/K89xz9n4ZmCC2hs+LffFZeXciP9Da76Aex/eOHKNjU3LLwFlaX6/
 Jljp5P5xcerjt7+81+TBwc1HoNecwH+ONzmh+WMTfwAmEr3gFYRiQsm0Nb/EdQvOl4DVoEmisZR
 wCPNOKSiTNctwHyqbiuQ4OXstmoI4wuTtnjdzuj7HmQ0yNyY0iBGCHzJqFpPXizUL4oyfjz9LN/
 waRSJXWzmveKPkizpo+71QaiW4BXxQTWum1qWJXO72iZMgylIaH94Lc7cgjCbmSZ1ulrvyviGKA
 ==
X-Google-Smtp-Source: AGHT+IFeNfJ1eyONHrbz+WXHARO/AJILEljcspBbpTWg7b7/P997IAGWloWsSUmV91qlQ+SipQ99TA==
X-Received: by 2002:a05:6000:1788:b0:429:bc56:cd37 with SMTP id
 ffacd0b85a97d-42b4bb74cc7mr4917562f8f.6.1763042953261; 
 Thu, 13 Nov 2025 06:09:13 -0800 (PST)
Received: from fedora ([94.73.38.14]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b53e7b14bsm3981192f8f.9.2025.11.13.06.09.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 06:09:08 -0800 (PST)
Date: Thu, 13 Nov 2025 15:09:06 +0100
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
Subject: Re: [PATCH RESEND v2 03/32] drm/vkms: Use enabled/disabled instead
 of 1/0 for debug
Message-ID: <aRXmghF0m0ypbQMs@fedora>
References: <20251029-vkms-all-config-v2-0-a49a2d4cba26@bootlin.com>
 <20251029-vkms-all-config-v2-3-a49a2d4cba26@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251029-vkms-all-config-v2-3-a49a2d4cba26@bootlin.com>
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

On Wed, Oct 29, 2025 at 03:36:40PM +0100, Louis Chauvet wrote:
> Debug information are mainly read by human, so display human
> readable values.

Today I learned. I wasn't aware of those helpers, nice!

Reviewed-by: José Expósito <jose.exposito@redhat.com>

> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_config.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
> index cfdd5f32f234..391794d391c5 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.c
> +++ b/drivers/gpu/drm/vkms/vkms_config.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0+
>  
>  #include <linux/slab.h>
> +#include <linux/string_choices.h>
>  
>  #include <drm/drm_print.h>
>  #include <drm/drm_debugfs.h>
> @@ -354,8 +355,8 @@ static int vkms_config_show(struct seq_file *m, void *data)
>  
>  	vkms_config_for_each_crtc(vkmsdev->config, crtc_cfg) {
>  		seq_puts(m, "crtc:\n");
> -		seq_printf(m, "\twriteback=%d\n",
> -			   vkms_config_crtc_get_writeback(crtc_cfg));
> +		seq_printf(m, "\twriteback=%s\n",
> +			   str_enabled_disabled(vkms_config_crtc_get_writeback(crtc_cfg)));
>  	}
>  
>  	vkms_config_for_each_encoder(vkmsdev->config, encoder_cfg)
> 
> -- 
> 2.51.0
> 
