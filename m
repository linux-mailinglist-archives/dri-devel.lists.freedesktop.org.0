Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02016A5C1EF
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 14:08:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 545B010E5AE;
	Tue, 11 Mar 2025 13:08:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="MaC7LYoS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A185B10E5AE
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 13:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741698492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=58hbt3C3ko4UzEzLuDrzbnIj5lSuinoBYdsY/+LDqhg=;
 b=MaC7LYoSWCTvdSQROprH4wM9rW66O7MUKpObOjHX57hnqh3+PoeQsM29b3sxU2NEr75bSn
 76vec44tbSsRv+5ErF8aBiuZ0TMMLKBwHktaHlCVgl6fym0s5gELwQejtEQJWtudDCtV7X
 MmkIR5CjPXed+xLT+wN+Zt6pXuYY8Xk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-246-zSYAIojzO-mZLRzbCn0UAw-1; Tue, 11 Mar 2025 09:08:11 -0400
X-MC-Unique: zSYAIojzO-mZLRzbCn0UAw-1
X-Mimecast-MFC-AGG-ID: zSYAIojzO-mZLRzbCn0UAw_1741698490
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43cf327e9a2so18378905e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 06:08:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741698490; x=1742303290;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=58hbt3C3ko4UzEzLuDrzbnIj5lSuinoBYdsY/+LDqhg=;
 b=q70XJp9TYJmm7Z0gr7FkBi8HQ5ny34EjwZSX6jHvmda94xJRxbs9EstwFfwORqDqF8
 xhr/gRGZ+qvb4vCLwyPvZ1N3yOGKeTLjARPLxdrqkmWlZSCawa7Yyn5rBCCMwhfgHZml
 TaDkTYea4h2f8AKvEks9pyN80yw/AmO26WkiIq+X48JXMPEyTQEIYome1xRNPnxmjx0a
 zZGda9YyITYGKZT91MVCR/L/M1TjLiq23MZUq23U0lpPy1E6nsdvsMVxd5oLl3Ub31ZL
 +nFFA3+gcBEXYdvgDnuwUHK4YsEd799IWc8ffyLG/0yPneW6YFSy42FRY/kSGi2WZbbO
 SwwA==
X-Gm-Message-State: AOJu0Yyl7Z2P5uR4yLlfKJ4iUqP/Qgg+kglIxdTtAMk13m+WzmVHraqX
 SIpflYWJeAMSEQ/9hoka+MACr3TRbTmUEHO4RkVmrlcEUk7Ao/7s96/1IoiUje7kDcWvNqv2OhG
 DFA4Dn6di7xPYDCH4wUnVmzsaHTTPAWi/PeJJDZC5R2GO9r7hywJ7/+nC0fkpt37fQPycxmM4SQ
 ==
X-Gm-Gg: ASbGncuBv0KroikdWFEn2L4Lt8vIEjpZxp3urllw9boCThTsWFrYRmyTIzFgYFt3tAk
 UhzNCMy9zvtHcBFv3n5CCoSdp0wdISt8cyP8ReEM8+SHZtGSNlosC+RutD/SAbgNaRcBRAqR7KM
 kw1QBTeGmvkO+rfmtet0l4BsmzMXSuo+hIQQR5D2RKfcLIFwbRtMCZI+yQxGLiNzosMf+GDgi+1
 rMdwrWYCJWMVnT+JpwoDocjmQRwcIPlODJTvLjmjiqJ7SGVEPa0snpa/ocSfHGl18w0NDj7tzFf
 zLnfAD0RET4WIyr3QOEfL19cZzxp5nFqVPPW78AVSTt7x2QckwG6yWo=
X-Received: by 2002:a05:600c:45d3:b0:43b:c0fa:f9cd with SMTP id
 5b1f17b1804b1-43d01bdbdb1mr50714925e9.7.1741698490030; 
 Tue, 11 Mar 2025 06:08:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwM6wxpUFo+U0khL2YY+0gZxD1oInTc3TMY9kAgy63tGvPA1hqs8hMkSpv1tH/RK6ACkCsUQ==
X-Received: by 2002:a05:600c:45d3:b0:43b:c0fa:f9cd with SMTP id
 5b1f17b1804b1-43d01bdbdb1mr50714225e9.7.1741698489404; 
 Tue, 11 Mar 2025 06:08:09 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c11e9desm17808027f8f.101.2025.03.11.06.08.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 06:08:08 -0700 (PDT)
Message-ID: <5cd4e334-5e37-40d9-bc06-4474a25d22ae@redhat.com>
Date: Tue, 11 Mar 2025 14:08:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] drm/ast: Add helper for computing framebuffer
 location in video memory
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org
References: <20250305163207.267650-1-tzimmermann@suse.de>
 <20250305163207.267650-6-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250305163207.267650-6-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9YgPEmh5V1Dur0wEpOAr0NvP7Z_onmIZGGOBTrtw9EU_1741698490
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
> The ast driver stores the primary plane's image in the framebuffer
> memory up to where the cursor is located. Add helpers to calculate
> the offset and size.
> 
Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_mode.c | 25 +++++++++++++++++++++----
>   1 file changed, 21 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index c3b950675485..4cac5c7f4547 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -51,6 +51,24 @@
>   
>   #define AST_LUT_SIZE 256
>   
> +static unsigned long ast_fb_vram_offset(void)
> +{
> +	return 0; // with shmem, the primary plane is always at offset 0
> +}
> +
> +static unsigned long ast_fb_vram_size(struct ast_device *ast)
> +{
> +	struct drm_device *dev = &ast->base;
> +	unsigned long offset = ast_fb_vram_offset(); // starts at offset
> +	long cursor_offset = ast_cursor_vram_offset(ast); // ends at cursor offset
> +
> +	if (cursor_offset < 0)
> +		cursor_offset = ast->vram_size; // no cursor; it's all ours
> +	if (drm_WARN_ON_ONCE(dev, offset > cursor_offset))
> +		return 0; // cannot legally happen; signal error
> +	return cursor_offset - offset;
> +}
> +
>   static inline void ast_load_palette_index(struct ast_device *ast,
>   				     u8 index, u8 red, u8 green,
>   				     u8 blue)
> @@ -609,9 +627,8 @@ static int ast_primary_plane_init(struct ast_device *ast)
>   	struct ast_plane *ast_primary_plane = &ast->primary_plane;
>   	struct drm_plane *primary_plane = &ast_primary_plane->base;
>   	void __iomem *vaddr = ast->vram;
> -	u64 offset = 0; /* with shmem, the primary plane is always at offset 0 */
> -	unsigned long cursor_size = roundup(AST_HWC_SIZE + AST_HWC_SIGNATURE_SIZE, PAGE_SIZE);
> -	unsigned long size = ast->vram_fb_available - cursor_size;
> +	u64 offset = ast_fb_vram_offset();
> +	unsigned long size = ast_fb_vram_size(ast);
>   	int ret;
>   
>   	ret = ast_plane_init(dev, ast_primary_plane, vaddr, offset, size,
> @@ -942,7 +959,7 @@ static enum drm_mode_status ast_mode_config_mode_valid(struct drm_device *dev,
>   	struct ast_device *ast = to_ast_device(dev);
>   	unsigned long fbsize, fbpages, max_fbpages;
>   
> -	max_fbpages = (ast->vram_fb_available) >> PAGE_SHIFT;
> +	max_fbpages = ast_fb_vram_size(ast) >> PAGE_SHIFT;
>   
>   	fbsize = mode->hdisplay * mode->vdisplay * max_bpp;
>   	fbpages = DIV_ROUND_UP(fbsize, PAGE_SIZE);

