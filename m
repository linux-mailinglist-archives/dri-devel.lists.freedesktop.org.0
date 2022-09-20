Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CF55BEFDA
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 00:13:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9613F10E0F5;
	Tue, 20 Sep 2022 22:13:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D005B10E0F5
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 22:13:30 +0000 (UTC)
Received: from maud (138-51-69-53-lsn-2.nat.utoronto.ca [138.51.69.53])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: alyssa)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 02C956600375;
 Tue, 20 Sep 2022 23:13:27 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1663712008;
 bh=uLcAxGmpt1elrsYZXFI0S7w8WCn7Homoh+My+TD71ls=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eazgEhoEfeN8Ic7HcXhKQb9H2u7TPdfJ2xnyW6mQutNL/9P/GLunZPNfRUcwhz9t5
 uT8UXj6ZNBIjyZiMX37gRqtAEUfDxjAQfDtDigh9jj5HsD/xkmjwCT5zU6tg1ol7i5
 FY/XYwJLj3CR6RrmPEQ3wEJV8KXRFK4WoPXbc3D4YfaQ+uNq34FdC4KUVNjo3SHMvb
 WirKBImOgpqvpgcGRKOrb2LshCn00TMfU70uHjRXsEay/fqUj6td9t4MYf9aKQpqdX
 0PrKBSUaZ76VHXEhLN1DIFCEZzXadJn3DIKL/wd/9iDn3fW7jMIWrluJJRvFbqjV2K
 2e2jV7Jg6X8Ew==
Date: Tue, 20 Sep 2022 18:13:23 -0400
From: Alyssa Rosenzweig <alyssa@collabora.com>
To: Adri??n Larumbe <adrian.larumbe@collabora.com>
Subject: Re: [PATCH 2/2] drm/panfrost: replace endian-specific types with
 generic ones
Message-ID: <Yyo7A1eolIBssv/i@maud>
References: <YynVAAaQPIPhuN55@maud>
 <20220920211545.1017355-1-adrian.larumbe@collabora.com>
 <20220920211545.1017355-2-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220920211545.1017355-2-adrian.larumbe@collabora.com>
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
Cc: alyssa.rosenzweig@collabora.com, dri-devel@lists.freedesktop.org,
 steven.price@arm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tentative r-b, but we *do* need to make a decision on how we want to
handle endianness. I don't have strong feelings but the results of that
discussion should go in the commit message.

On Tue, Sep 20, 2022 at 10:15:45PM +0100, Adri??n Larumbe wrote:
> __le32 and __l64 endian-specific types aren't portable and not available on
> FreeBSD, for which there's a uAPI compatible reimplementation of Panfrost.
> 
> Replace these specific types with more generic unsigned ones, to prevent
> FreeBSD Mesa build errors.
> 
> Bug: https://gitlab.freedesktop.org/mesa/mesa/-/issues/7252
> Fixes: 730c2bf4ad39 ("drm/panfrost: Add support for devcoredump")
> Signed-off-by: Adri??n Larumbe <adrian.larumbe@collabora.com>
> ---
>  include/uapi/drm/panfrost_drm.h | 30 +++++++++++++++---------------
>  1 file changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/include/uapi/drm/panfrost_drm.h b/include/uapi/drm/panfrost_drm.h
> index bd77254be121..c1a10a9366a9 100644
> --- a/include/uapi/drm/panfrost_drm.h
> +++ b/include/uapi/drm/panfrost_drm.h
> @@ -236,24 +236,24 @@ struct drm_panfrost_madvise {
>  #define PANFROSTDUMP_BUF_TRAILER (PANFROSTDUMP_BUF_BO + 1)
>  
>  struct panfrost_dump_object_header {
> -	__le32 magic;
> -	__le32 type;
> -	__le32 file_size;
> -	__le32 file_offset;
> +	__u32 magic;
> +	__u32 type;
> +	__u32 file_size;
> +	__u32 file_offset;
>  
>  	union {
>  		struct {
> -			__le64 jc;
> -			__le32 gpu_id;
> -			__le32 major;
> -			__le32 minor;
> -			__le64 nbos;
> +			__u64 jc;
> +			__u32 gpu_id;
> +			__u32 major;
> +			__u32 minor;
> +			__u64 nbos;
>  		} reghdr;
>  
>  		struct {
> -			__le32 valid;
> -			__le64 iova;
> -			__le32 data[2];
> +			__u32 valid;
> +			__u64 iova;
> +			__u32 data[2];
>  		} bomap;
>  
>  		/*
> @@ -261,14 +261,14 @@ struct panfrost_dump_object_header {
>  		 * with new fields and also keep it 512-byte aligned
>  		 */
>  
> -		__le32 sizer[496];
> +		__u32 sizer[496];
>  	};
>  };
>  
>  /* Registers object, an array of these */
>  struct panfrost_dump_registers {
> -	__le32 reg;
> -	__le32 value;
> +	__u32 reg;
> +	__u32 value;
>  };
>  
>  #if defined(__cplusplus)
> -- 
> 2.37.0
> 
