Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BEFA2ED44
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 14:12:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEA2610E522;
	Mon, 10 Feb 2025 13:11:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="GvvxBZ4x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BDCA10E522
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 13:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739193091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dG6NL6a25Eds14Y5y7MRJxtfyjuNqOojx4FKGsssSuw=;
 b=GvvxBZ4x+Kzo5kBtcGkELcjljr8ojAq452Rt9ecKcOs/qnBNBs0bC7fhbmtvtuEap+aD4b
 wj1nGDKPnKSdu3iRu7VMxiXcQjcjxj9pEqJm6xI7aDGqzv5s3Z1queJF67FK1GUbQPYchv
 p+7YmzxivBNm1T18WWmfOQZ7sB0mZH0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-241-mGXuxDHSM06RwWPR184Pdw-1; Mon, 10 Feb 2025 08:11:30 -0500
X-MC-Unique: mGXuxDHSM06RwWPR184Pdw-1
X-Mimecast-MFC-AGG-ID: mGXuxDHSM06RwWPR184Pdw
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43935bcec74so9405895e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 05:11:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739193089; x=1739797889;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dG6NL6a25Eds14Y5y7MRJxtfyjuNqOojx4FKGsssSuw=;
 b=umTlP8eUFwb7OFuBdyX8gk2rTG2sHe2dRunu4XK2crXQEejYL/qCW+jrjDRtuGKl5v
 ht+CIgrCnxQFRIG4FOAvHTJbSnYaK/hdCdRy8LIKf6ae11rzr6pQG1CxRmzrvnjiWXuv
 EZrQEKfbNZJyLuUy/OxQ4Bq/eZdyO4tPQbe9Ys7UZaapQ+oazwDVzHlaBCWLuPNsVqXk
 WgkTMQTbSumXzZm9jp71pdbHLhDuYbnumA5IpApequioJEzv/aBsMAawVyMz4SeBNwcs
 s+h7kFs+v7wyglIgNFPyg2BeNxj5GX5SVLbt/wj1wz/s93d2Hmm/ksKhx+XrJ5C0GOGw
 UEjg==
X-Gm-Message-State: AOJu0YzOEdCaERYRGEjnDQKWZv14kB8J0Nsz0XVqBrpzrCCzLWfLpF/J
 3EboSTsVRZYeW7hkanCHbIeTZfjyubfK8Kk/Hu0mmIL0YLeraB2HfW8lINTxcLPfpDPlOTrwNO9
 TumU2OAsQXWhR2fUogcmTy+vRGV/jxQ9cbkKyU3aCXlBGviBeDeNwc+zShNA6ZYuOAg==
X-Gm-Gg: ASbGncshMItF5C2dzHV7o+kADKXhhK7TDVnt2nNOyfryeYilLyhnhiirdC3FdOKQLZN
 eg1Rr3cSA2aKHR4O/oCdYfOrcQ3JJ1ZqZhXT0G6ooHyh+P/33kNH8HYctxU/f1dXrfUqwNUc24F
 VPL4d0Q7TiGHD6/8bqeGAhA/sYfqi1CzZjYaYhuYtxpyO3ly8RXEjt5g7yIbaPvtTzPUyCQNgMQ
 N6FB6G8aS3jOK+nRudRu3LVvCXZ7WolcWf1GKdEg8Fs2KGEHq1Ko3BEdcq55gB8GlJFzV+T+zwO
 02McRFK4X25RaaMblJGcMUOje3n3Cln8Bp7K81B4uJFX
X-Received: by 2002:a05:600c:1d0d:b0:434:9499:9e87 with SMTP id
 5b1f17b1804b1-439249cab31mr83023475e9.25.1739193088781; 
 Mon, 10 Feb 2025 05:11:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHjlCIpj77inYbYhyH65f1IN6r/g2Fi5H7ONA2cuqZi+o34j6luIo/ayHemQdvoLdS+1k3Qqw==
X-Received: by 2002:a05:600c:1d0d:b0:434:9499:9e87 with SMTP id
 5b1f17b1804b1-439249cab31mr83023265e9.25.1739193088390; 
 Mon, 10 Feb 2025 05:11:28 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4390d94d7d4sm183412115e9.10.2025.02.10.05.11.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 05:11:27 -0800 (PST)
Message-ID: <0b0dd193-1a6e-4daa-8d3c-eb2df67d40e3@redhat.com>
Date: Mon, 10 Feb 2025 14:11:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/ast: astdp: Inline mode-index calculation
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org
References: <20250204133209.403327-1-tzimmermann@suse.de>
 <20250204133209.403327-3-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250204133209.403327-3-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8eUnnwq6Iz_hqehBhEweIGsgTVac3cbARfRtXw1JG0A_1739193089
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 04/02/2025 14:26, Thomas Zimmermann wrote:
> Programming the astdp transmitter chip requires a magic value for
> individual modes. Inline the helper for calculating the value into
> its only caller (i.e., the encoder's atomic_mode_set).
> 
> With further refactoring, the atomic check will be able to detect
> invalid modes before attempting to program them.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_dp.c | 52 +++++++++++++++---------------------
>   1 file changed, 21 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
> index 9c49b507a0d2..e7b00153c37e 100644
> --- a/drivers/gpu/drm/ast/ast_dp.c
> +++ b/drivers/gpu/drm/ast/ast_dp.c
> @@ -52,7 +52,7 @@ to_ast_astdp_connector_state(const struct drm_connector_state *state)
>   	return container_of(state, struct ast_astdp_connector_state, base);
>   }
>   
> -static int __ast_astdp_get_mode_index(unsigned int hdisplay, unsigned int vdisplay)
> +static int ast_astdp_get_mode_index(unsigned int hdisplay, unsigned int vdisplay)
>   {
>   	const struct ast_astdp_mode_index_table_entry *entry = ast_astdp_mode_index_table;
>   
> @@ -65,35 +65,6 @@ static int __ast_astdp_get_mode_index(unsigned int hdisplay, unsigned int vdispl
>   	return -EINVAL;
>   }
>   
> -static int ast_astdp_get_mode_index(const struct ast_vbios_enhtable *vmode)
> -{
> -	int mode_index;
> -	u8 refresh_rate_index;
> -
> -	mode_index = __ast_astdp_get_mode_index(vmode->hde, vmode->vde);
> -	if (mode_index < 0)
> -		return mode_index;
> -
> -	if (vmode->refresh_rate_index < 1 || vmode->refresh_rate_index > 255)
> -		return -EINVAL;
> -	refresh_rate_index = vmode->refresh_rate_index - 1;
> -
> -	/* FIXME: Why are we doing this? */
> -	switch (mode_index) {
> -	case ASTDP_1280x800_60_RB:
> -	case ASTDP_1440x900_60_RB:
> -	case ASTDP_1600x900_60_RB:
> -	case ASTDP_1680x1050_60_RB:
> -		mode_index = (u8)(mode_index - (u8)refresh_rate_index);
> -		break;
> -	default:
> -		mode_index = (u8)(mode_index + (u8)refresh_rate_index);
> -		break;
> -	}
> -
> -	return mode_index;
> -}
> -
>   static bool ast_astdp_is_connected(struct ast_device *ast)
>   {
>   	if (!ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDF, AST_IO_VGACRDF_HPD))
> @@ -333,13 +304,32 @@ static void ast_astdp_encoder_helper_atomic_mode_set(struct drm_encoder *encoder
>   	struct drm_device *dev = encoder->dev;
>   	struct ast_device *ast = to_ast_device(dev);
>   	struct ast_crtc_state *ast_crtc_state = to_ast_crtc_state(crtc_state);
> +	const struct ast_vbios_enhtable *vmode = ast_crtc_state->vmode;
>   	int mode_index;
> +	u8 refresh_rate_index;
>   	u8 vgacre0, vgacre1, vgacre2;
>   
> -	mode_index = ast_astdp_get_mode_index(ast_crtc_state->vmode);
> +	mode_index = ast_astdp_get_mode_index(vmode->hde, vmode->vde);
>   	if (drm_WARN_ON(dev, mode_index < 0))
>   		return;
>   
> +	if (drm_WARN_ON(dev, vmode->refresh_rate_index < 1 || vmode->refresh_rate_index > 255))
> +		return;
> +	refresh_rate_index = vmode->refresh_rate_index - 1;
> +
> +	/* FIXME: Why are we doing this? */
> +	switch (mode_index) {
> +	case ASTDP_1280x800_60_RB:
> +	case ASTDP_1440x900_60_RB:
> +	case ASTDP_1600x900_60_RB:
> +	case ASTDP_1680x1050_60_RB:
> +		mode_index = (u8)(mode_index - (u8)refresh_rate_index);
> +		break;
> +	default:
> +		mode_index = (u8)(mode_index + (u8)refresh_rate_index);
> +		break;
> +	}
> +
>   	/*
>   	 * CRE0[7:0]: MISC0 ((0x00: 18-bpp) or (0x20: 24-bpp)
>   	 * CRE1[7:0]: MISC1 (default: 0x00)

