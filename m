Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7301B651CC6
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 10:02:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC90A10E069;
	Tue, 20 Dec 2022 09:02:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7BF210E069
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 09:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671526952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ISEJwQvRU7BCX1Eq3uhxA8ruWz68wiH+flj6iQgeivA=;
 b=Nu+Fc9vb7XUtehz/fYnr+eoZ60gZ67lTeo59kvVyY7OK3peLIqirO0P/W7xxvQGGNdvBm4
 +T1T7s2ebGTLjOmufEuirRJbhpPyI8QKQGuxGVyXJ+ciuuWppqBhoAoIQAOHt/jPDHG8iQ
 c9+tCF7iKHVmDI1UogmcnTIYj8kjvdM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-126-9x1Qlbe6OcCCWdFu9gGVgw-1; Tue, 20 Dec 2022 04:02:31 -0500
X-MC-Unique: 9x1Qlbe6OcCCWdFu9gGVgw-1
Received: by mail-wm1-f70.google.com with SMTP id
 b47-20020a05600c4aaf00b003d031aeb1b6so7752389wmp.9
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 01:02:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ISEJwQvRU7BCX1Eq3uhxA8ruWz68wiH+flj6iQgeivA=;
 b=u0162brnN6wkwLxET8fIJ2wTOLfs33FmMlODwakYl4RgZLyTrx4dzMgHwPKYKHRUwR
 vwVRnowew8lCQugBsLhI+T6WQyNNKTcUBd/PyuRkYE8nAVDsjlHsOScHoI5eJ4PSVU2s
 SwcjFdrLgTNtLTYWIv+DDv1QhaRj/YBfjC3XctfO+lKeOtkSUzUvmTi6o8Z9TdxHur8j
 av3Qx/AkO2xwzw/DGyaA7gsw4Ip2406FGYs2QCGO+d5Z4pZ3fq2vvjVNcTG5TZIaBv6/
 NiZ70mkxB/cvxiL6kg6JBHxChTEz9/SVk4FxdJtsCDaxDcH78HyBDdOOAniqy4RPEW1T
 yryQ==
X-Gm-Message-State: AFqh2krh/C4IV7EA78382J+3ME+tpsVoIHKz38nBU0sdsqY+pjl4yj97
 zDH9DV5fx6WWbhQCb3Kr9bwIG+U5TT9qBodrwMhJL28udayN5np9Fctp3+X2KMHpXIqDpk8sNpE
 QKJ5ijdzzKR4/qc/FVeGlLOvbLmHb
X-Received: by 2002:adf:da43:0:b0:261:d8be:3047 with SMTP id
 r3-20020adfda43000000b00261d8be3047mr3875367wrl.3.1671526949943; 
 Tue, 20 Dec 2022 01:02:29 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtDSck0vpp9O4zLrwaXxUoSu6Jn5ebuv0yYQst5gp9Ny9hsT/bzSiOaz91unNnwKxw8z3Hitg==
X-Received: by 2002:adf:da43:0:b0:261:d8be:3047 with SMTP id
 r3-20020adfda43000000b00261d8be3047mr3875341wrl.3.1671526949445; 
 Tue, 20 Dec 2022 01:02:29 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e?
 ([2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e])
 by smtp.gmail.com with ESMTPSA id
 o5-20020a5d4a85000000b0023662245d3csm12021248wrq.95.2022.12.20.01.02.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 01:02:28 -0800 (PST)
Message-ID: <a28be4a8-b408-2032-0c8c-01c7de504e89@redhat.com>
Date: Tue, 20 Dec 2022 10:02:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] drm/ast: Init iosys_map pointer as I/O memory for damage
 handling
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 daniel@ffwll.ch, airlied@gmail.com
References: <20221216193005.30280-1-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20221216193005.30280-1-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: kernel test robot <lkp@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/12/2022 20:30, Thomas Zimmermann wrote:
> Ast hardware scans out the primary plane from video memory, which
> is in I/O-memory space. Hence init the damage handler's iosys_map
> pointer as I/O memory.
> 
> Not all platforms support accessing I/O memory as system memory,
> although it's usually not a problem in ast's x86-based systems.
> 
> The error report is at [1].
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: f2fa5a99ca81 ("drm/ast: Convert ast to SHMEM")
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Jocelyn Falempe <jfalempe@redhat.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> Link: https://lore.kernel.org/lkml/202212170111.eInM0unS-lkp@intel.com/T/#u # 1
> ---
>   drivers/gpu/drm/ast/ast_mode.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index c7443317c747..e82e9a8d85e5 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -636,7 +636,7 @@ static void ast_handle_damage(struct ast_plane *ast_plane, struct iosys_map *src
>   			      struct drm_framebuffer *fb,
>   			      const struct drm_rect *clip)
>   {
> -	struct iosys_map dst = IOSYS_MAP_INIT_VADDR(ast_plane->vaddr);
> +	struct iosys_map dst = IOSYS_MAP_INIT_VADDR_IOMEM(ast_plane->vaddr);
>   
>   	iosys_map_incr(&dst, drm_fb_clip_offset(fb->pitches[0], fb->format, clip));
>   	drm_fb_memcpy(&dst, fb->pitches, src, fb, clip);

It looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

-- 

Jocelyn

