Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CED0940A19
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 09:41:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C621A10E4D2;
	Tue, 30 Jul 2024 07:41:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="WGfIZ9Aw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A65A10E4D1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 07:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1722325272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9UJBBKJZlG7oc0T3bLxJIlFGWreSWYduKLQbK/k7Sco=;
 b=WGfIZ9Awh1hnAyEscie3bD4E8cf3eM+wWj5detnYnXjDT8cV5+ANAIaGuGA9D66vYhvmM9
 o1C2Ztag0Y7vTRy8vf3zTqamcKPov/1xI8LfmXPouePy0dkUKj1Z5kCmjumzWjlBzIQfn8
 91Gv1gtqgOCI5j7I7Oa2Fz0bbcCTE94=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-117-CMCYwCuyO9GBQNXLSBTN_A-1; Tue, 30 Jul 2024 03:41:10 -0400
X-MC-Unique: CMCYwCuyO9GBQNXLSBTN_A-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2ef2b0417cdso41450541fa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 00:41:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722325268; x=1722930068;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9UJBBKJZlG7oc0T3bLxJIlFGWreSWYduKLQbK/k7Sco=;
 b=EWuV6ftz7c4W+b8z5iCF3h29TuWB4MRPDBPiAiHAXaLkrGtIKNhoolj3tUFQCfjUZI
 r5wmZG0HbO4iKc5R5dv/xbohVL/cVUYs9pgTpoOa93g20QSvEJvi2yqQKHrNYkRpCGOX
 pHRAMAwBrikI8/97ssQyQh+QXNl4RDnWZ15zGt6Hxivfas1aZkY4aNFrG6rg7C1q+c/D
 bEEDK6+xeTx6SFoP/nuIzXkM5987oocW/KvtDEdJvCIY2h3UlpDvDbTcZe4WLaJ4ey55
 Im/hzNwOOzOSnd4PRzx45Q6gAIOvn6YAHzANoj03dMCC209L7MMFWtNj8RyMDR3K+/ut
 Ha5A==
X-Gm-Message-State: AOJu0YzDS9ZyLLTGLsuubRmqbWdROS9Uoqi2VDTykJsQ7VnE0hV9WHLl
 gLrnG73AH/5ARj9kvNZRsTAJJqP3P3EoOwofNlly9hdzHK1lRYmhMXH0pVNdQ9sj1hTu6qJn3dp
 8I9Trj47aNQlyyspaeYS9IwkuVcjBgjX+F3Hpdj44mpu4Yc4E8CW/888Jf3TkzwW8rQ==
X-Received: by 2002:a2e:a595:0:b0:2ec:3d74:88ca with SMTP id
 38308e7fff4ca-2f12edd6041mr69210701fa.25.1722325268671; 
 Tue, 30 Jul 2024 00:41:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOnOMCn0Yp5rPtXoj78fa6iqnq31J7B898jysQvPKuGUBPmIU1eGITevHr58vmz6wBsL0mJg==
X-Received: by 2002:a2e:a595:0:b0:2ec:3d74:88ca with SMTP id
 38308e7fff4ca-2f12edd6041mr69210561fa.25.1722325268293; 
 Tue, 30 Jul 2024 00:41:08 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:d3ea:62cf:3052:fac6?
 ([2a01:e0a:d5:a000:d3ea:62cf:3052:fac6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427f9413501sm250236875e9.43.2024.07.30.00.41.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jul 2024 00:41:07 -0700 (PDT)
Message-ID: <ee82c602-ab0e-412d-a6e2-e8e9395b0125@redhat.com>
Date: Tue, 30 Jul 2024 09:41:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] drm/ast: astdp: Only test HDP state in
 ast_astdp_is_connected()
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20240717143319.104012-1-tzimmermann@suse.de>
 <20240717143319.104012-4-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240717143319.104012-4-tzimmermann@suse.de>
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



On 17/07/2024 16:24, Thomas Zimmermann wrote:
> The overall control flow of the driver ensures that it never reads
> EDID or sets display state on unconnected outputs. Therefore remove
> all tests for Hot Plug Detection from these helpers. Also rename
> the register constants.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_dp.c  | 12 +++---------
>   drivers/gpu/drm/ast/ast_reg.h |  3 +--
>   2 files changed, 4 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
> index 59885d10d308..c45b336baf45 100644
> --- a/drivers/gpu/drm/ast/ast_dp.c
> +++ b/drivers/gpu/drm/ast/ast_dp.c
> @@ -9,7 +9,7 @@
>   
>   bool ast_astdp_is_connected(struct ast_device *ast)
>   {
> -	if (!ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDF, ASTDP_HPD))
> +	if (!ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDF, AST_IO_VGACRDF_HPD))
>   		return false;
>   	if (!ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDC, ASTDP_LINK_SUCCESS))
>   		return false;
> @@ -23,11 +23,9 @@ int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata)
>   
>   	/*
>   	 * CRDC[b0]: DP link success
> -	 * CRDF[b0]: DP HPD
>   	 * CRE5[b0]: Host reading EDID process is done
>   	 */
>   	if (!(ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDC, ASTDP_LINK_SUCCESS) &&
> -		ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDF, ASTDP_HPD) &&
>   		ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xE5,
>   								ASTDP_HOST_EDID_READ_DONE_MASK))) {
>   		goto err_astdp_edid_not_ready;
> @@ -61,8 +59,7 @@ int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata)
>   			mdelay(j+1);
>   
>   			if (!(ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDC,
> -							ASTDP_LINK_SUCCESS) &&
> -				ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDF, ASTDP_HPD))) {
> +							ASTDP_LINK_SUCCESS))) {
>   				goto err_astdp_jump_out_loop_of_edid;
>   			}
>   
> @@ -111,8 +108,6 @@ int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata)
>   err_astdp_edid_not_ready:
>   	if (!(ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDC, ASTDP_LINK_SUCCESS)))
>   		return (~0xDC + 1);
> -	if (!(ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDF, ASTDP_HPD)))
> -		return (~0xDF + 1);
>   	if (!(ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xE5, ASTDP_HOST_EDID_READ_DONE_MASK)))
>   		return (~0xE5 + 1);
>   
> @@ -182,8 +177,7 @@ void ast_dp_set_on_off(struct drm_device *dev, bool on)
>   	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xE3, (u8) ~AST_DP_VIDEO_ENABLE, on);
>   
>   	// If DP plug in and link successful then check video on / off status
> -	if (ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDC, ASTDP_LINK_SUCCESS) &&
> -		ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDF, ASTDP_HPD)) {
> +	if (ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDC, ASTDP_LINK_SUCCESS)) {
>   		video_on_off <<= 4;
>   		while (ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDF,
>   						ASTDP_MIRROR_VIDEO_ENABLE) != video_on_off) {
> diff --git a/drivers/gpu/drm/ast/ast_reg.h b/drivers/gpu/drm/ast/ast_reg.h
> index 569de3188191..e61954dabf1a 100644
> --- a/drivers/gpu/drm/ast/ast_reg.h
> +++ b/drivers/gpu/drm/ast/ast_reg.h
> @@ -38,6 +38,7 @@
>   #define AST_IO_VGACRCB_HWC_ENABLED	BIT(1)
>   
>   #define AST_IO_VGACRD1_MCU_FW_EXECUTING	BIT(5)
> +#define AST_IO_VGACRDF_HPD		BIT(0)
>   
>   #define AST_IO_VGAIR1_R			(0x5A)
>   #define AST_IO_VGAIR1_VREFRESH		BIT(3)
> @@ -70,11 +71,9 @@
>   
>   /*
>    * CRDC[b0]: DP link success
> - * CRDF[b0]: DP HPD
>    * CRE5[b0]: Host reading EDID process is done
>    */
>   #define ASTDP_LINK_SUCCESS		BIT(0)
> -#define ASTDP_HPD			BIT(0)
>   #define ASTDP_HOST_EDID_READ_DONE	BIT(0)
>   #define ASTDP_HOST_EDID_READ_DONE_MASK	GENMASK(0, 0)
>   

