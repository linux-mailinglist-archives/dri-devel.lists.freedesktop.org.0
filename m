Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A97291BBFA
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 11:55:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A2EC10EBFC;
	Fri, 28 Jun 2024 09:55:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ExEMbOUk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 115A710EBFC
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 09:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719568500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hoYzDchyQCAyOlp13ye8KRV22u7Y4luixj+ZPTA4qqY=;
 b=ExEMbOUkzNyvO5KSTXH8XLGu2pte7AmDBK8Cjr6JqXQBv/Ua/xJErIz47LgDM34u65n8y0
 Cb2vHz24eyES+Lxt0v9zgyl4zcymUSOZR1h1pVhuX+NqfmK7svK5TranHCWSElYJZGAByb
 A/Dgox61yp8lAtRwJOkhtv4PIxeqUFM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-jP_TBp1VMQSWuig1JzhwPg-1; Fri, 28 Jun 2024 05:54:56 -0400
X-MC-Unique: jP_TBp1VMQSWuig1JzhwPg-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4255f94080bso3908805e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 02:54:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719568495; x=1720173295;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hoYzDchyQCAyOlp13ye8KRV22u7Y4luixj+ZPTA4qqY=;
 b=uL1q7kM2/57Ub8vRuDbW97+LEAL9/p23HlVqK/SY+AyF+4AtQC6rFZlMPUZh6vsq8Y
 thlxF+mauIWFuF+gR+5tesugiJETwV4roEkTTtLGm2EDSljvP3I6fpYHKZCi5SmL9djL
 l/zYIq5mMNVYYbT9I9DrJcQc6R3H3Gil0uidWKCigREe4ifQFf4rnvZDjuVaQau7biQY
 sXFlaLfzROuvUhJq6Pjpgpn0UXhMQu8fjwCy60t6bXW5m3D9zRgJsa1afUXp4N7acCvN
 bNPyhxpFKieT56lEt2EDdJRyAZO6Go6FDSNOcIEqE0eUe9+/cT6cEFRJ11haua+Z6112
 BrMw==
X-Gm-Message-State: AOJu0Yx4ewjNau8URjINjh7toQ034W5PBOH6oGL+8lhApj7q7X7NQfjm
 CENWd9LXVWtArEX/InsfGc769gSevt2PuTlJlndVoXRN2iKBJxbdXAAVSv9wO1p2e8hLzNgRC+3
 UoJ03weSlIqU56zLvrTpgBI+7a63l7XeUdVxCjAx6n9907EbwwdOoc52NWo0ANd+fnw==
X-Received: by 2002:a05:600c:1c1e:b0:425:692d:c728 with SMTP id
 5b1f17b1804b1-425692dd38dmr18037925e9.28.1719568495674; 
 Fri, 28 Jun 2024 02:54:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8VRFf0oHskHHSC5L2ukLMTCuXv2hQb3me3Xp1mooeRUWligVrtL7for0Esxwhd+ttMD4l5g==
X-Received: by 2002:a05:600c:1c1e:b0:425:692d:c728 with SMTP id
 5b1f17b1804b1-425692dd38dmr18037845e9.28.1719568495445; 
 Fri, 28 Jun 2024 02:54:55 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e?
 ([2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a0d8df0sm1747064f8f.29.2024.06.28.02.54.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jun 2024 02:54:55 -0700 (PDT)
Message-ID: <f01717b3-3b12-4d39-b479-042db5ba2ec4@redhat.com>
Date: Fri, 28 Jun 2024 11:54:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] drm/ast: Remove gamma LUT updates from DPMS code
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org
References: <20240627153638.8765-1-tzimmermann@suse.de>
 <20240627153638.8765-6-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240627153638.8765-6-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
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



On 27/06/2024 17:27, Thomas Zimmermann wrote:
> The DPMS code, called from the CRTC's atomic_enable, rewrites the
> gamma LUT. This is already done in the CRTC's atomic_flush. Remove
> the duplication.

Thanks, it looks good te me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_mode.c | 12 ------------
>   1 file changed, 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index 6a81d657175d..e90179bc0842 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -1023,8 +1023,6 @@ static void ast_crtc_dpms(struct drm_crtc *crtc, int mode)
>   {
>   	struct ast_device *ast = to_ast_device(crtc->dev);
>   	u8 ch = AST_DPMS_VSYNC_OFF | AST_DPMS_HSYNC_OFF;
> -	struct ast_crtc_state *ast_state;
> -	const struct drm_format_info *format;
>   
>   	/* TODO: Maybe control display signal generation with
>   	 *       Sync Enable (bit CR17.7).
> @@ -1033,16 +1031,6 @@ static void ast_crtc_dpms(struct drm_crtc *crtc, int mode)
>   	case DRM_MODE_DPMS_ON:
>   		ast_set_index_reg_mask(ast, AST_IO_VGASRI,  0x01, 0xdf, 0);
>   		ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xb6, 0xfc, 0);
> -
> -		ast_state = to_ast_crtc_state(crtc->state);
> -		format = ast_state->format;
> -
> -		if (format) {
> -			if (crtc->state->gamma_lut)
> -				ast_crtc_set_gamma(ast, format, crtc->state->gamma_lut->data);
> -			else
> -				ast_crtc_set_gamma_linear(ast, format);
> -		}
>   		break;
>   	case DRM_MODE_DPMS_STANDBY:
>   	case DRM_MODE_DPMS_SUSPEND:

