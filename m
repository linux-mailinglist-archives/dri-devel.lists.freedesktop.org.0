Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4F8A5C1D7
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 14:03:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3FA610E5A8;
	Tue, 11 Mar 2025 13:03:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="aGiPB/+9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FEDB10E5A8
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 13:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741698216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rx50IkK4wqYWq0Xb8oIJ28JNvAo23jy++9cBoFzuUSI=;
 b=aGiPB/+9sK8oVPsdjtyB7xJuedE3UNM8XJ4oc48WhhJZEhCxBn41DF1ukREqcM+cL4Rh/y
 wFXSxVe71pnOIQZzLUeTbmMXdrWMzOVIH85Gjg/nBeRvprw1xm2NrJRPe4nSXBOagUoNTL
 UmtagBsI3RJXMMBQmFNW7eBrwDLmePE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-338-d5Moo9wxOVqEATAfoSS4hw-1; Tue, 11 Mar 2025 09:03:34 -0400
X-MC-Unique: d5Moo9wxOVqEATAfoSS4hw-1
X-Mimecast-MFC-AGG-ID: d5Moo9wxOVqEATAfoSS4hw_1741698214
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-43d025a52c2so5479185e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 06:03:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741698213; x=1742303013;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Rx50IkK4wqYWq0Xb8oIJ28JNvAo23jy++9cBoFzuUSI=;
 b=Tt1hFlBY6md1MmLPpApkfP/ueKhmjuiOhRakI1EYV0Js9oUOxRS7bupvsSl5RS39Jo
 B2x0vgWBRz1TE1PU+W6RvMokKYxixO7OONwGn6SZfcPeNjgIvD8WxTDkWUo4BKxg+6PU
 08aZghDiGSjwJn2+bmVSOdpatn0ZSf0IuMVEVWzie7Toen5LVwV/NMKv4JGsnRKZ26O+
 Xeh0wZFnq3WuLTtAAAjK+bKQhRRj2fAZtKnITbpj3PPzIcF0s+5ggUP+jLbAzqXqP/za
 yiM8bWq3L0/6MdulHDXqDf8rIjs/ZMAfcBqf5Ak/eBCBe5bhHGdV6RPheqAhGV12Qrlq
 XKhQ==
X-Gm-Message-State: AOJu0Yyu3nPhD44ODNHcK4V5/mep1WMjj2Kis/KfhG8+GRmNGP9tsvwy
 POdG+MH5Tzy+Mpip0/fCQyz64K+f3GwTfI8PRo8/i5+4EXlxL/++xP39Y553EtsVQmWtyQ8Iuz4
 0dcbjJHFpIIZ3WxaqdT6qyWqTr2WoowCOEtPbR4yhATzn6dWgsx5badQSeL1QY8dguQ==
X-Gm-Gg: ASbGncveolWjoxvfXPManoFCnbJHm1hiMnu39zRe5+2x/vD0Pk4+9Sr/McQ0aylfPkZ
 Qvpy6ja+TQIQw5hj5ynysFJp0uJ7lj01C+HiRXtMZylJFtzMmJoXQ6nQKVs/WYErZl8+QP2wRMA
 tUu71GSiEG4pnAejQKntXZRnT1mD+xMUeAhqWFD3qgipsWGNDIhivyj0eF6GzM8072xuY9P+8vl
 j81wEmf+rjbuP0ITU4NsgsmXLBvW82w+/syXO/YSvVl2lUzIrOKtAw2jMsIO2476PG/uAx0X/Uj
 5yGhAqbbhRv4y/e1N3yD4Tn62hYAdqdEoS7mw35pVhMERKHVAInQIgA=
X-Received: by 2002:a05:600c:4f0c:b0:43c:eeee:b706 with SMTP id
 5b1f17b1804b1-43ceeeeb95amr71588055e9.24.1741698213460; 
 Tue, 11 Mar 2025 06:03:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExOGrFk7o2Q+/fyL65pS7Agyr6EAe6a3Tbs3r7araeoj9JA84lThIfTvKejdGlefGq1+fCsw==
X-Received: by 2002:a05:600c:4f0c:b0:43c:eeee:b706 with SMTP id
 5b1f17b1804b1-43ceeeeb95amr71587565e9.24.1741698212925; 
 Tue, 11 Mar 2025 06:03:32 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ce3d5a0e2sm127883105e9.12.2025.03.11.06.03.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 06:03:32 -0700 (PDT)
Message-ID: <33ec42ea-1b21-4911-926b-f040824de7a0@redhat.com>
Date: Tue, 11 Mar 2025 14:03:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] drm/ast: cursor: Add helpers for computing location
 in video memory
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org
References: <20250305134401.60609-1-tzimmermann@suse.de>
 <20250305134401.60609-5-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250305134401.60609-5-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OLlzKh5G-57YDHhz1IpaKCYZ7CdgsCTDd1mb-lt9B3Q_1741698214
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

On 05/03/2025 14:35, Thomas Zimmermann wrote:
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

