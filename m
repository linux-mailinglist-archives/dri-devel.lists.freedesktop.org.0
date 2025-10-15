Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4D5BDD2AA
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 09:40:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 550A710E73D;
	Wed, 15 Oct 2025 07:40:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="QTC9K8fR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B403B10E73D
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 07:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760514028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ujTOKpW4+kTHAHvK2HOwXbMj2GJWfrBWrxqkTtniSz8=;
 b=QTC9K8fR1Q5ClXeM/j07tNiszA7bFoOAeXAMyqdDWrlO/GHOHOgZVEBFU7l0tECIK/ir3d
 mM0fXI9Tm4xxOVmTQFqO6Y0kAckPUbrSqu7VJ41QlB6yFjWzyBUn/ZDqDdTQSyTyHJ8NaW
 K2SS6hr6LM5ZJRcSbCGwFiTSS6qJIy0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596-a3tofgQBNSWNpcx6w4cngg-1; Wed, 15 Oct 2025 03:40:27 -0400
X-MC-Unique: a3tofgQBNSWNpcx6w4cngg-1
X-Mimecast-MFC-AGG-ID: a3tofgQBNSWNpcx6w4cngg_1760514026
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-426d3ee72f5so3169796f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 00:40:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760514026; x=1761118826;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ujTOKpW4+kTHAHvK2HOwXbMj2GJWfrBWrxqkTtniSz8=;
 b=S7JbaVLDDahb8pWa4NNbWFDOGRBzSWzY+gb5yBtU+8jlCxztsJ7g2TDjv4Gf+KMjlF
 aeef+eONXNPvkqvi3CqcbVeR2k2clCVqS1amddPE8EHg+043ggdphajeurp/s22jxfb+
 n2obUwSvE5yPGG2mrFeNJ+h8a9/9HLIoqlcaT81YVZBsvObDvf4ZhDz07T1CshIhk9wM
 QcS3NmEAsi0nr3gwlpqLmzd7VBBapd1IHUECPqn1EitA59xnBvV+oe7um4IuYrdM4wdQ
 /mMBTrYxBOIK0fGX440U9NNY0Cq9cxCvkueupw0Oyhe5Hp0h0gpvXwxgYk8uw6lpYMoA
 X0/A==
X-Gm-Message-State: AOJu0YwhN2JzEaIBrH10xuaQgnSbdyp5g0iyxNQUnx0NM6vX17FxdN8C
 EOFrOUJr4KFYUc2JkyWiKSlEaUHPzHndkt5BoQ/QZ0kdIImzoX0dsWlgm9p4EdQxGDCLs02RJXk
 efwAX09zF0gWAuL+gFWW0IP8Tz9hqtU0I7bf8gTNmdTmMqcTTDaQ2cuVUw7i3Epu6/TS5jA==
X-Gm-Gg: ASbGnctnuEj5Tr8ZokQu0QkMPhczyuV/BQBGAncf7bE5RM0cBe5ufDUjuifkPiExf2B
 x6cz1tCvFg2i41PtAECpyw74DR+vJQJBy9qq8NlNdaALeiTB/MqYza5as52HJ9isyeB1+KE/Dxx
 JllllCvikUl30T9vio1LIJy5lsH+4OXhLzn5YTU5e0orE9xMxv6tb1tqppyzyOvHpOt/X7hGM9a
 4Czc81aAC6ssT3BYwGoLCdUGPJCw57p7CWYXTUnwDG9cyEqGgGfZgZ8QXdCByR/IRmIFw+U/OxQ
 YpUQMwL9CebwcjXxPVEchsomTVpGdnQ3EHceOWEoRcAJWHjdi59BISahMNt4kxbGa43LBBXN8U8
 V25+L
X-Received: by 2002:a05:600c:a4a:b0:471:672:3486 with SMTP id
 5b1f17b1804b1-471067234b4mr3484475e9.15.1760514025921; 
 Wed, 15 Oct 2025 00:40:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHELt2IvsOdxF5qtPebQELtoGEEK7IQ3SKyT74C+N+nJQNpZFsZIZnrEjv2umUEVDTOP4080g==
X-Received: by 2002:a05:600c:a4a:b0:471:672:3486 with SMTP id
 5b1f17b1804b1-471067234b4mr3484245e9.15.1760514025488; 
 Wed, 15 Oct 2025 00:40:25 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fab524f92sm166882235e9.7.2025.10.15.00.40.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Oct 2025 00:40:25 -0700 (PDT)
Message-ID: <46f046a6-0d51-45b0-8af1-61b4cc2c8127@redhat.com>
Date: Wed, 15 Oct 2025 09:40:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm/panic: avoid WARN when checking format support
To: Francesco Valla <francesco@valla.it>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251014-drm_draw_conv_check-v2-0-05bef3eb06fb@valla.it>
 <20251014-drm_draw_conv_check-v2-3-05bef3eb06fb@valla.it>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20251014-drm_draw_conv_check-v2-3-05bef3eb06fb@valla.it>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ey2E9Lgk2eaD8Iy_teCIfHzRsndXtRRw2g7jEdWCmxE_1760514026
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

On 14/10/2025 22:08, Francesco Valla wrote:
> Use drm_draw_can_convert_from_xrgb8888() instead of
> drm_draw_color_from_xrgb8888() while checking if a color format is
> usable. This avoids a WARN in case the first format is not usable.
> 

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> Signed-off-by: Francesco Valla <francesco@valla.it>
> ---
>   drivers/gpu/drm/drm_panic.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index 1d6312fa142935fcf763381920ad889ca4cf4b27..4ba961e445e576d03cfb58953eead90d32b40151 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -785,7 +785,7 @@ static bool drm_panic_is_format_supported(const struct drm_format_info *format)
>   {
>   	if (format->num_planes != 1)
>   		return false;
> -	return drm_draw_color_from_xrgb8888(0xffffff, format->format) != 0;
> +	return drm_draw_can_convert_from_xrgb8888(format->format);
>   }
>   
>   static void draw_panic_dispatch(struct drm_scanout_buffer *sb)
> 

