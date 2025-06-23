Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D356AE3BDB
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 12:12:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 934C210E05B;
	Mon, 23 Jun 2025 10:12:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="L+xW7cbi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FE7D10E05B
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 10:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750673530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZYLo8wP+y+o3VIS7TqC+HJOW2Pflfi59Nw4T7VkfABc=;
 b=L+xW7cbiEVwgHhnlqtRl7ZD0ifcEaWRFz3ELbvvswsP+BPSOr8AC+nakdSj/+2KRiZBmy6
 f2KzySFER/T7xNxwceo7L9PuSyC0+jgVvfGEWzhXEjPZeaLE1T/CaLCoo/0BSwhPzEdeTy
 TeccD01NzBqnxhOan07whQR1mSS246o=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-JIBlNbTJMPq8-YbCYjKzPw-1; Mon, 23 Jun 2025 06:12:09 -0400
X-MC-Unique: JIBlNbTJMPq8-YbCYjKzPw-1
X-Mimecast-MFC-AGG-ID: JIBlNbTJMPq8-YbCYjKzPw_1750673528
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3a3696a0d3aso1723415f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 03:12:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750673528; x=1751278328;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZYLo8wP+y+o3VIS7TqC+HJOW2Pflfi59Nw4T7VkfABc=;
 b=KbonHjuJeMRvP8uCkriXs0oSu5zeZ7rKznKouQqTuf0LjjY54e5Secpw838s0rnpC2
 pVYquN6u8MCP2dXyfaX6CXe8WJJCGMmEvggHhSYnAA5fgegXgHOS70TC2PRANc+koz0m
 /BgUXR1RWyY2tOqfFHuBeoemcADTnloJ29g2m0M+mIQEYVkW5N21QFosi0w9YeEGSvRa
 5xqGEq6MwCfADF7YijbLHrryjVbslFeh28z939txxMYfyX3gTx8ZoaIN9vsEQwVuCGke
 h91Suwol53sU+z/5UXok+bgeXVVyIZTp6cw7bQdgtYRzxQHbQ36Y4XQfQOT4RFPWXr9I
 /dJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKxAhEIWF6iG17IruxCr84HhzLbsIEAg4PWJvfx+EnaZh+IDJv53Zfzpv4FC7ZdpyjvjbtiXYIK50=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzTooheLvsIVXQBXfJN80po69XXcPXmcot2R6a4G78StpdYPJZE
 QY4WzrselEdrPTkGdriQcuHzLPdoEDXJ2mrsZcsv5MojmISn+ZJPZDzID2nL+QX/QPjPiggbAaX
 7cQ4W2sccA23fMCsoAqmzvK6Hf9Dj+fY9DczSxMNfLdNY2W26VlmAStZNFhabXyYDYaeq9w==
X-Gm-Gg: ASbGnctRrzJsixTBwz69c+YTG3lE93YNxCv2wCmKqVICdoyHQsKOi+rWnBuU1soCQso
 iZh3UBoJ+JGVxVVMZp/I9+zbf/d6pWk1wGDtnCUbYDc+F6SvxzFs7WYqnhkmOCATiZRzyKzK4TC
 Qa7UTqwmAzCcHZ+9UvLnhuOa9uM3ULNdNO93KKm6BtIDY64DWR0Yl0/C/otN4ZDnwAuC2QJGUvK
 74QXdsixvzdkimyVSxFb6wUDiHBKS/B9ybLec3F6SlhYUFolWoE0B8N728IE8xWQAMTLB/OF4Ye
 czE9XDrXXF7K8ivKZ/flYS1mLHY+qzYD5Pv4HCVp5dM1dEd5Xg6+gqIFSzbbwg==
X-Received: by 2002:a5d:64c4:0:b0:3a5:2b75:56cc with SMTP id
 ffacd0b85a97d-3a6d12a595emr9714564f8f.23.1750673527770; 
 Mon, 23 Jun 2025 03:12:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCL4na2uglOQFNEUAANK+zA52+SQuukZvQq//WUH0f114XAeIMlx0mcV3sqHLNJE6Ahlk+RQ==
X-Received: by 2002:a5d:64c4:0:b0:3a5:2b75:56cc with SMTP id
 ffacd0b85a97d-3a6d12a595emr9714535f8f.23.1750673527348; 
 Mon, 23 Jun 2025 03:12:07 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a6d2236452sm8895293f8f.59.2025.06.23.03.12.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jun 2025 03:12:06 -0700 (PDT)
Message-ID: <acbb1b02-593f-4a46-b4cb-99781d595e33@redhat.com>
Date: Mon, 23 Jun 2025 12:12:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH drm-next] drm/bochs: Add support for drm_panic
To: Ryosuke Yasuoka <ryasuoka@redhat.com>, kraxel@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
Cc: virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20250613132023.106946-1-ryasuoka@redhat.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250613132023.106946-1-ryasuoka@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4sSh9HZsBNmgqjrd_RT9ZBixfuHHh0AN61fcm_WmSic_1750673528
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

On 13/06/2025 15:20, Ryosuke Yasuoka wrote:
> Add drm_panic moudle for bochs drm so that panic screen can be displayed
> on panic.

I just pushed it to drm-misc-next, with the typo in the commit message 
fixed.

Thanks,

-- 

Jocelyn

> 
> Signed-off-by: Ryosuke Yasuoka <ryasuoka@redhat.com>
> ---
>   drivers/gpu/drm/tiny/bochs.c | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
> index 8706763af8fb..ed42ad5c4927 100644
> --- a/drivers/gpu/drm/tiny/bochs.c
> +++ b/drivers/gpu/drm/tiny/bochs.c
> @@ -19,6 +19,7 @@
>   #include <drm/drm_gem_shmem_helper.h>
>   #include <drm/drm_managed.h>
>   #include <drm/drm_module.h>
> +#include <drm/drm_panic.h>
>   #include <drm/drm_plane_helper.h>
>   #include <drm/drm_probe_helper.h>
>   
> @@ -469,10 +470,28 @@ static void bochs_primary_plane_helper_atomic_update(struct drm_plane *plane,
>   	bochs_hw_setformat(bochs, fb->format);
>   }
>   
> +static int bochs_primary_plane_helper_get_scanout_buffer(struct drm_plane *plane,
> +							  struct drm_scanout_buffer *sb)
> +{
> +	struct bochs_device *bochs = to_bochs_device(plane->dev);
> +	struct iosys_map map = IOSYS_MAP_INIT_VADDR_IOMEM(bochs->fb_map);
> +
> +	if (plane->state && plane->state->fb) {
> +		sb->format = plane->state->fb->format;
> +		sb->width = plane->state->fb->width;
> +		sb->height = plane->state->fb->height;
> +		sb->pitch[0] = plane->state->fb->pitches[0];
> +		sb->map[0] = map;
> +		return 0;
> +	}
> +	return -ENODEV;
> +}
> +
>   static const struct drm_plane_helper_funcs bochs_primary_plane_helper_funcs = {
>   	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
>   	.atomic_check = bochs_primary_plane_helper_atomic_check,
>   	.atomic_update = bochs_primary_plane_helper_atomic_update,
> +	.get_scanout_buffer = bochs_primary_plane_helper_get_scanout_buffer,
>   };
>   
>   static const struct drm_plane_funcs bochs_primary_plane_funcs = {
> 
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494

