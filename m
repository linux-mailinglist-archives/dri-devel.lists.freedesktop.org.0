Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A73A6EC0B
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 10:01:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69D8410E179;
	Tue, 25 Mar 2025 09:01:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="DT/UdW+O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F2E610E179
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 09:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742893272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1j1ooVFaTIz+Ag3IxO/2LQz1vPByp2zpNenvgrYOIio=;
 b=DT/UdW+Oz8h4d29LTI4IxQlG0nToxAMuY7y1Tog6eD2R1NmeHhTTZ8kmGeegVar4AecTCf
 jmrzwrElzVUrQ08AeggLS5nmuhOn9duC2kW+nPHQvjZkgvNvm1kr6//uDKZtrVAKEf1Gc0
 U6iHBpNUFdd9DT46VlaYUK1J/MiBibg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-434-bSBRJbDhMLWTYcnVjX76ww-1; Tue, 25 Mar 2025 05:01:09 -0400
X-MC-Unique: bSBRJbDhMLWTYcnVjX76ww-1
X-Mimecast-MFC-AGG-ID: bSBRJbDhMLWTYcnVjX76ww_1742893269
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-43cf446681cso29730235e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 02:01:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742893268; x=1743498068;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1j1ooVFaTIz+Ag3IxO/2LQz1vPByp2zpNenvgrYOIio=;
 b=fsPlDIhJJJ7FJ76PAkx1byox2xcMpQ1zkDztA3jI1GZdc5QrU75OECAHSsovG67HlD
 dfXrQTPN8ALLDHSlIYiMZ/wrm35gZThS5+DTIPJfko9LARzE7HMtSXCLBvf1B1tYVqAk
 N8otXv4oA7kS/Jl3U1+0VARD4XqIc8NI4rZj8Tx2lfli8GTNnPOcSmLgftw2Ogoy+Ml9
 K6fpbrnqG2t0EUw2n4kBVChs75WERupv+jpaCFJS+cutbUYe2EXYZT2emiQt01YH/T9R
 uuqmEY5LVoI089VBUJS+Lf4oJTDJdS+O/xb0/L7O4kbCw23OBzmDryIjNnMz93q+tp2U
 csLQ==
X-Gm-Message-State: AOJu0Yx9U9b22cnD+OTgEL3ULnm5uGH5smxE0hsyY0xMAdo1VQ8q9dJS
 DAv971KbIjgtkfIOXPYu05fQb49ku5bJ2pudavCcqVYnmHe9ay23sfUFUVySH7VPcQI0Qxu6ibm
 D9FSGFNDF7TViyDOm9aE4z7fSlxXrfJFybdnYEgIyD6fKwVFYIPaFASYrUzcT1ZVG5w==
X-Gm-Gg: ASbGncsIJTCPibRzCqSDZd3OX5hi0y68Lt0aejezP6n0TeEbkac/oy4Jw5vLvGE2I6s
 XSFby8VcIOxVL6cQIpWSqM8eZqIZwMxFI/S5grfI77LaLkzWhJL4tkxhkdi1QH+buh1rL39GSbQ
 EjJ8Q+ewwxRE55EhIlW4oq8VFdb/jsZcsf+Z4T3SS4WPrpf0Dfn28+tuh/v59lcREv9dA5zc7wU
 LzWEvihGlIxYMxSATkEbOP2geX0zbH5eySKbtnK4gcZ0gpiVneVNc5JEydJkiJRQEPVd453S9Pv
 IynlcxlOGLRjS9ZniQomEsbwTGgQe5nvAmFh5f67Y8QGXofOnxuaoBo=
X-Received: by 2002:a5d:6c61:0:b0:38f:2856:7d96 with SMTP id
 ffacd0b85a97d-3997f8f605cmr14709908f8f.1.1742893268512; 
 Tue, 25 Mar 2025 02:01:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEm5G7j/HXCRX+Mtin++Mmvo/4nbXyGoEvepSzjyEZb9r9psaOAvFHJsZNo7u5I5/q56BD5CQ==
X-Received: by 2002:a5d:6c61:0:b0:38f:2856:7d96 with SMTP id
 ffacd0b85a97d-3997f8f605cmr14709852f8f.1.1742893268029; 
 Tue, 25 Mar 2025 02:01:08 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f99561dsm13355974f8f.12.2025.03.25.02.01.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Mar 2025 02:01:07 -0700 (PDT)
Message-ID: <3dc6aa2b-8e03-4e43-b150-e8148b83c066@redhat.com>
Date: Tue, 25 Mar 2025 10:01:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/ast: Fix comment on modeset lock
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org, stable@vger.kernel.org
References: <20250324094520.192974-1-tzimmermann@suse.de>
 <20250324094520.192974-2-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250324094520.192974-2-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Gznr3zj6EZIPhGuUtJ9-Y4dNIqWkZwGVzNfjTEQeAHs_1742893269
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

On 24/03/2025 10:44, Thomas Zimmermann wrote:
> The ast driver protects the commit tail against concurrent reads
> of the display modes by acquiring a lock. The comment is misleading
> as the lock is not released in atomic_flush, but at the end of the
> commit-tail helper. Rewrite the comment.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 1fe182154984 ("drm/ast: Acquire I/O-register lock in atomic_commit_tail function")
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Jocelyn Falempe <jfalempe@redhat.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v6.2+
> ---
>   drivers/gpu/drm/ast/ast_mode.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index 4cac5c7f4547..20fbea11b710 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -939,9 +939,9 @@ static void ast_mode_config_helper_atomic_commit_tail(struct drm_atomic_state *s
>   
>   	/*
>   	 * Concurrent operations could possibly trigger a call to
> -	 * drm_connector_helper_funcs.get_modes by trying to read the
> -	 * display modes. Protect access to I/O registers by acquiring
> -	 * the I/O-register lock. Released in atomic_flush().
> +	 * drm_connector_helper_funcs.get_modes by reading the display
> +	 * modes. Protect access to registers by acquiring the modeset
> +	 * lock.
>   	 */
>   	mutex_lock(&ast->modeset_lock);
>   	drm_atomic_helper_commit_tail(state);

