Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D51A5C1EA
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 14:07:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FA2B10E5AD;
	Tue, 11 Mar 2025 13:07:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="H/2eme/5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63EA410E5AD
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 13:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741698460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PRaJcl4pv1GBKSj9TjKmhUJgkF/kvR8KRC0NkEExJis=;
 b=H/2eme/5LJl/2AU/oOH5PmBaSs+g/2o8YB25rmZLTm9TAxqId1k2JmagGrbX5cF5WvD8pU
 shbtJjjenC6soJBHACUGk1luH3NRhzQIE5o87pYVnUogqLFRDUSB95NjMLMZWVRgjE97HU
 fmtDKhSGj7Xg/aXCjtJnyGmKVY396bY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-59-gdTcoSGLMbKq2cinZktSIQ-1; Tue, 11 Mar 2025 09:07:39 -0400
X-MC-Unique: gdTcoSGLMbKq2cinZktSIQ-1
X-Mimecast-MFC-AGG-ID: gdTcoSGLMbKq2cinZktSIQ_1741698458
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43941ad86d4so26583235e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 06:07:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741698458; x=1742303258;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PRaJcl4pv1GBKSj9TjKmhUJgkF/kvR8KRC0NkEExJis=;
 b=Ak6ygv9G+DIOu+SHnpYEI4Kq96D1rzpxNkBCeqI+RA4R2jnkIjdIxXaDn6sE6q1q+U
 bRjWir6ylZxszXVSmRHJex4nOj6Az29shlfX2QzASMRZ9SnNS4BcpvJ6Znije/yul99z
 4Kqaliw1nc7PtDEI9C5jF29zRUJGzo39sJtMKX0L/r/9OWuSIrvSP5kqxwDSsaVM6FBP
 OoikPXFyKWBTi+OZYv/JEq4lI3CCKMzA/pA1SlmmKMxd90anwURnz/VaIya8sp1zlq+v
 o3+HTA3h3ikHDRoONYG+NKcgxcFmll4DpCXva57ZVJGOoicpER3n2SXc0KW0JyXLZF2a
 KQhw==
X-Gm-Message-State: AOJu0Yw0FCIyNv3NPPusFZH1Qp/ryLGvRKAYeIRlEPAtIe3K3BPOrgWe
 hKAWJ+jnBwcqSDDyqYEvjSQsiFO6pEaipud/e462eo1JXbRSInMzZk3KXWLgwmzjxtJHlpc2q6D
 YPUmVTo0/eIA3W+QhWt1bPqCMvoI3B7FyTZrFZCkbZSjqeGqr9tValQm7lykhczyDdw==
X-Gm-Gg: ASbGncugIpC2C3BM1DVeD23ec1AJv3n6oYnR6p5gg4exzgUDbe8mpcoRYeD3L+eMCLl
 xRbtVaMTcjnllb7FZZf5mMuiDuGsDtxTiaBia/YCBlsFpuArdi6aeHt9iwc2+aX7e7A91z+f6r9
 bP56ZnxsS8mohgfs1LpcdRBP3C/FRvjF4OXtro9HkpQROU4Zcnbfq2nd6caUwSriXZS2YCydDT/
 85j/EEIHlt4aGpSxYKxlCZzwxn0oQevVtNycA8zBvWFQHJ3pbwYWbhwwRefZTYtjNh+n1MILiV5
 D+W0BOpoax+NcNAsuKWMgf7w3wmJLmLfna81Xwhfg8PonprUcKZoLk4=
X-Received: by 2002:a05:600c:3510:b0:43b:d1ad:9241 with SMTP id
 5b1f17b1804b1-43c601d889dmr117399315e9.9.1741698457978; 
 Tue, 11 Mar 2025 06:07:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEI6BhUtCxhEWpw8Y08IorlgXPkTO2OP0A5H0/lns0sXG47nqRADZSYLOzYc5pWP505cPhHDw==
X-Received: by 2002:a05:600c:3510:b0:43b:d1ad:9241 with SMTP id
 5b1f17b1804b1-43c601d889dmr117398775e9.9.1741698457507; 
 Tue, 11 Mar 2025 06:07:37 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43cfd5082ccsm53050635e9.32.2025.03.11.06.07.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 06:07:37 -0700 (PDT)
Message-ID: <1326612b-c288-4934-b9c6-4a860e2d0b88@redhat.com>
Date: Tue, 11 Mar 2025 14:07:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] drm/ast: cursor: Add helpers for computing
 location in video memory
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org
References: <20250305163207.267650-1-tzimmermann@suse.de>
 <20250305163207.267650-5-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250305163207.267650-5-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yhXokYLxTYjcj4SP2fR_kLLWcOW8yt8phYcS-gbTTZs_1741698458
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

On 05/03/2025 17:30, Thomas Zimmermann wrote:
> The ast drivers stores the cursor image at the end of the video memory.
> Add helpers to calculate the offset and size.
> 
Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_cursor.c | 21 +++++++++++++++++++--
>   drivers/gpu/drm/ast/ast_drv.h    |  1 +
>   2 files changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_cursor.c b/drivers/gpu/drm/ast/ast_cursor.c
> index 139ab00dee8f..05e297f30b4e 100644
> --- a/drivers/gpu/drm/ast/ast_cursor.c
> +++ b/drivers/gpu/drm/ast/ast_cursor.c
> @@ -45,6 +45,21 @@
>   #define AST_HWC_SIGNATURE_HOTSPOTX	0x14
>   #define AST_HWC_SIGNATURE_HOTSPOTY	0x18
>   
> +static unsigned long ast_cursor_vram_size(void)
> +{
> +	return AST_HWC_SIZE + AST_HWC_SIGNATURE_SIZE;
> +}
> +
> +long ast_cursor_vram_offset(struct ast_device *ast)
> +{
> +	unsigned long size = ast_cursor_vram_size();
> +
> +	if (size > ast->vram_size)
> +		return -EINVAL;
> +
> +	return PAGE_ALIGN_DOWN(ast->vram_size - size);
> +}
> +
>   static u32 ast_cursor_calculate_checksum(const void *src, unsigned int width, unsigned int height)
>   {
>   	u32 csum = 0;
> @@ -276,7 +291,7 @@ int ast_cursor_plane_init(struct ast_device *ast)
>   	struct drm_plane *cursor_plane = &ast_plane->base;
>   	size_t size;
>   	void __iomem *vaddr;
> -	u64 offset;
> +	long offset;
>   	int ret;
>   
>   	/*
> @@ -290,7 +305,9 @@ int ast_cursor_plane_init(struct ast_device *ast)
>   		return -ENOMEM;
>   
>   	vaddr = ast->vram + ast->vram_fb_available - size;
> -	offset = ast->vram_fb_available - size;
> +	offset = ast_cursor_vram_offset(ast);
> +	if (offset < 0)
> +		return offset;
>   
>   	ret = ast_plane_init(dev, ast_plane, vaddr, offset, size,
>   			     0x01, &ast_cursor_plane_funcs,
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
> index 2c7861835cfb..ec9ec77260e9 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -432,6 +432,7 @@ int ast_vga_output_init(struct ast_device *ast);
>   int ast_sil164_output_init(struct ast_device *ast);
>   
>   /* ast_cursor.c */
> +long ast_cursor_vram_offset(struct ast_device *ast);
>   int ast_cursor_plane_init(struct ast_device *ast);
>   
>   /* ast dp501 */

