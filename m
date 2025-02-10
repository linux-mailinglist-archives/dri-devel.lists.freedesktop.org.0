Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 274B5A2ED4C
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 14:14:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B8CC10E524;
	Mon, 10 Feb 2025 13:14:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="JMkIRPVp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5E4410E524
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 13:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739193267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rSfcdcJq7PEyoT+HfyqF1lDqdfHfYEjmKGQWTqZ0WIY=;
 b=JMkIRPVpD0UNWGDr64Tvgn+sS64BZnELsQYnIqPZDHotpK45I4gxvYuwIP7yqrntMkc83Y
 UG3P6K25yKwCv+/tQMNRA9tfFJJsXtH6rvIYVhCzFPanPbWmqU/gT6EmCoaEadEHV3T9BD
 tK+p0T3IdFfl5qN+TmkhYkp0pUniU/M=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-522-tVF-IhnKOva7IL-YLnLLMQ-1; Mon, 10 Feb 2025 08:14:25 -0500
X-MC-Unique: tVF-IhnKOva7IL-YLnLLMQ-1
X-Mimecast-MFC-AGG-ID: tVF-IhnKOva7IL-YLnLLMQ
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4388eee7073so25029765e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 05:14:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739193264; x=1739798064;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rSfcdcJq7PEyoT+HfyqF1lDqdfHfYEjmKGQWTqZ0WIY=;
 b=wweY5TTf/jAGB/m1DSSwUySfHX6qE2RBnofCofa9TYy1uqOc0GtJM+chL++Z/p0f7c
 RufCdBSwdYt3an/lXOvDBkKw7Mgyel05wAHtFjrflR6YbLc/NXbwOE/AW50RmaQ/HUP9
 eMxrfy1wjgYJZT+AyFWcZ3ZH88OmSkcBearMCVcTjkIHFElbfmg4AASZbe4vtg7D6xPW
 3BmGk4aLtdHrOgWOjkwWantPPq9r2BbKD7CdpXwuf6PbZoUic8lB99/eCqQAPF5sA/1U
 vdDXFNsqTAQtxCstKXMZCssZd0Ww1WdrzVW0l7mM7/Q3I4gVQCz3sbOG0ikQemkhH/Mi
 WtOw==
X-Gm-Message-State: AOJu0Yy+NflKb8Wm2btBhOqIdSV3hHQ/30VGi89DulzoF8+OjUNs5Nso
 Nzz51BQy5ZZRD3Kdq8Hc9TWuL051ugQwY2zZqrW3mied8Pc2tF0FMLoXDgwOyqz4Q+ZA5k4Ue4X
 68N+BCOlqmf4FWkKRmHknCtsmJeVyo+o6NzBKz1Z6r56fADd82CxNnuT8DyZSlC8Cfg==
X-Gm-Gg: ASbGncsWLzkpUtYScPiaGudsjzFQt5S2X+S9RPMyKDYIldd2wt6oHn0kRnycRDxBSZj
 R7XoC5XUYRP97dbm8ZZvsErX8DN7qOQrcKLZ37URP5mmcpL6M2nGn2mZ4KGoGEGH5gf4Tcm5NDg
 T9SpIXn2ZoJ8DZQ5PPKXnqQV5XORQn8KoHS8fGTv+f8vg3E6aAhqi+RGqYiO++t0q8LkfYZMtKy
 DDnZxCBRStHYaO2RL7VTwJYLX5usnYaJTdrxzjhUGDJ//ZCTyPpdki27mzXo5q5pzsUYRyGuL+3
 r50+slal8VZ7F2aG1EliVsM0OBaxJBxv7ek2QkB7/ii5
X-Received: by 2002:a05:600c:3d06:b0:434:f3d8:62db with SMTP id
 5b1f17b1804b1-43925536e50mr96695175e9.2.1739193264532; 
 Mon, 10 Feb 2025 05:14:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFceuYEc+WBPCwO97f4qdtzWW1S0jvM+ZA2TuWQd9pQ4+z5vAHYT8hk5xfTzrteh0FQJdNpvw==
X-Received: by 2002:a05:600c:3d06:b0:434:f3d8:62db with SMTP id
 5b1f17b1804b1-43925536e50mr96694955e9.2.1739193264128; 
 Mon, 10 Feb 2025 05:14:24 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4390daf44f3sm184610775e9.29.2025.02.10.05.14.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 05:14:23 -0800 (PST)
Message-ID: <c925da51-8c3a-4a67-a791-d282cf2fdb25@redhat.com>
Date: Mon, 10 Feb 2025 14:14:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/ast: astdp: Validate display modes
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org
References: <20250204133209.403327-1-tzimmermann@suse.de>
 <20250204133209.403327-5-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250204133209.403327-5-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: C9dnag0pgrAUzCjFWgqzqetwd7yPrVHPBmIcYHbkX14_1739193265
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
> Validate each display mode against the astdp transmitter chips. Filters
> out modes that the chip does not support.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_dp.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
> index 056991afde7f..19c04687b0fe 100644
> --- a/drivers/gpu/drm/ast/ast_dp.c
> +++ b/drivers/gpu/drm/ast/ast_dp.c
> @@ -300,6 +300,19 @@ static const struct drm_encoder_funcs ast_astdp_encoder_funcs = {
>   	.destroy = drm_encoder_cleanup,
>   };
>   
> +static enum drm_mode_status
> +ast_astdp_encoder_helper_mode_valid(struct drm_encoder *encoder,
> +				    const struct drm_display_mode *mode)
> +{
> +	int res;
> +
> +	res = ast_astdp_get_mode_index(mode->hdisplay, mode->vdisplay);
> +	if (res < 0)
> +		return MODE_NOMODE;
> +
> +	return MODE_OK;
> +}
> +
>   static void ast_astdp_encoder_helper_atomic_mode_set(struct drm_encoder *encoder,
>   						     struct drm_crtc_state *crtc_state,
>   						     struct drm_connector_state *conn_state)
> @@ -389,6 +402,7 @@ static int ast_astdp_encoder_helper_atomic_check(struct drm_encoder *encoder,
>   }
>   
>   static const struct drm_encoder_helper_funcs ast_astdp_encoder_helper_funcs = {
> +	.mode_valid = ast_astdp_encoder_helper_mode_valid,
>   	.atomic_mode_set = ast_astdp_encoder_helper_atomic_mode_set,
>   	.atomic_enable = ast_astdp_encoder_helper_atomic_enable,
>   	.atomic_disable = ast_astdp_encoder_helper_atomic_disable,

