Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4F8A9AE04
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 14:53:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F13310E7E5;
	Thu, 24 Apr 2025 12:53:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=robert.mader@collabora.com header.b="i26E65Ep";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0951C10E7E5
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 12:53:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1745499204; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Fp2+HnHkcZ+B4Vsrl+glV81tXHzXNTbcHnXWJ1Wde+vr8rwCnUMFUcoJ7W6VN/cgNfaV9xDdIM37VuOlTqxQTWL5inuQ00fAogQceLnS/Y9Dr5LfdTLSzecTzzWTRMUoyoGO/ZlRXxkrEyxdJ0PQxgEnp+du7En36ztoDC4llNU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1745499204;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=StCVCbEyg4EmAXix4UYyyC5CH9VAKmEnJJ/edCUJfdw=; 
 b=gSA47iYtkDQeFWxvhrxOpqus9JVGQe6SFD8wqtXwQX1n+Nl3oa/nKsnp8I32PsdCQKT2oqHA8P42StgzItwngRzHysj9vDf5Ta88oZs5g5nlYHiQJP9Xg5UJseM9CwvGTBIPzT7cgBVCds60dgOGpTxuV6f0NdeBl4LT9vmFaNU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=robert.mader@collabora.com;
 dmarc=pass header.from=<robert.mader@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745499204; 
 s=zohomail; d=collabora.com; i=robert.mader@collabora.com;
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:References:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=StCVCbEyg4EmAXix4UYyyC5CH9VAKmEnJJ/edCUJfdw=;
 b=i26E65EpahmUSZsBaxJFHVZQtyQlgSw3ouOmSEK9OHVlYXfBnGnoPkNk+ZXUZ+CQ
 QKuY0u5iPFY7UXLVoU/pTK2tZitADtOCPW1AR9v082VkkFyHPxFUJLKMEe/Jpbk0HaM
 ALtnStQwL3GBTErK3mv75L1VkeyDNhq0mvhgJP8U=
Received: by mx.zohomail.com with SMTPS id 1745499201646388.84502105620004;
 Thu, 24 Apr 2025 05:53:21 -0700 (PDT)
Message-ID: <dde3c5c3-4e23-4962-a165-38fa6b004ef1@collabora.com>
Date: Thu, 24 Apr 2025 14:53:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: drm_fourcc: add 10/12bit software decoder YCbCr
 formats
To: dri-devel@lists.freedesktop.org
References: <20250407191314.500601-1-robert.mader@collabora.com>
Content-Language: en-US, de-DE, en-GB
Cc: Christopher Obbard <chris.obbard@collabora.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
From: Robert Mader <robert.mader@collabora.com>
In-Reply-To: <20250407191314.500601-1-robert.mader@collabora.com>
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

Chris, Javier, Laurent - sorry for the noise, but given you reviewed 
changes in the respective files before, maybe you can help me moving 
this forward? I'd be very happy for any feedback to get this landed, 
thanks! :)

On 07.04.25 21:13, Robert Mader wrote:
> This adds FOURCCs for 10/12bit YCbCr formats used by software decoders
> like ffmpeg, dav1d and libvpx. The intended use-case is buffer sharing
> between SW-decoders and GPUs by allocating buffers with udmabuf or
> dma-heaps, avoiding unnecessary copies or format conversions.
>
> Unlike formats typically used by hardware decoders these formats
> use a LSB alignment. In order to allow fast implementations in GL
> and Vulkan the padding must contain only zeros, so the float
> representation can calculated by simple multiplicating with 2^6=64
> or 2^4=16.
>
> WIP MRs for Mesa, Vulkan and Gstreamer can be found at:
>   - https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/34303
>   - https://github.com/rmader/Vulkan-Docs/commits/ycbcr-16bit-lsb-formats/
>   - https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8540
>
> The values where inspired by the corresponding VA_FOURCC_I010, however
> suggestions are very welcome.
>
> Signed-off-by: Robert Mader <robert.mader@collabora.com>
> ---
>   drivers/gpu/drm/drm_fourcc.c  | 18 ++++++++++++++++++
>   include/uapi/drm/drm_fourcc.h | 20 ++++++++++++++++++++
>   2 files changed, 38 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
> index 3a94ca211f9c..917f77703645 100644
> --- a/drivers/gpu/drm/drm_fourcc.c
> +++ b/drivers/gpu/drm/drm_fourcc.c
> @@ -346,6 +346,24 @@ const struct drm_format_info *__drm_format_info(u32 format)
>   		{ .format = DRM_FORMAT_P030,            .depth = 0,  .num_planes = 2,
>   		  .char_per_block = { 4, 8, 0 }, .block_w = { 3, 3, 0 }, .block_h = { 1, 1, 0 },
>   		  .hsub = 2, .vsub = 2, .is_yuv = true},
> +		{ .format = DRM_FORMAT_I010,            .depth = 0,  .num_planes = 3,
> +		  .char_per_block = { 2, 2, 2 }, .block_w = { 1, 1, 1 }, .block_h = { 1, 1, 1 },
> +		  .hsub = 2, .vsub = 2, .is_yuv = true},
> +		{ .format = DRM_FORMAT_I210,            .depth = 0,  .num_planes = 3,
> +		  .char_per_block = { 2, 2, 2 }, .block_w = { 1, 1, 1 }, .block_h = { 1, 1, 1 },
> +		  .hsub = 2, .vsub = 1, .is_yuv = true},
> +		{ .format = DRM_FORMAT_I410,            .depth = 0,  .num_planes = 3,
> +		  .char_per_block = { 2, 2, 2 }, .block_w = { 1, 1, 1 }, .block_h = { 1, 1, 1 },
> +		  .hsub = 1, .vsub = 1, .is_yuv = true},
> +		{ .format = DRM_FORMAT_I012,            .depth = 0,  .num_planes = 3,
> +		  .char_per_block = { 2, 2, 2 }, .block_w = { 1, 1, 1 }, .block_h = { 1, 1, 1 },
> +		  .hsub = 2, .vsub = 2, .is_yuv = true},
> +		{ .format = DRM_FORMAT_I212,            .depth = 0,  .num_planes = 3,
> +		  .char_per_block = { 2, 2, 2 }, .block_w = { 1, 1, 1 }, .block_h = { 1, 1, 1 },
> +		  .hsub = 2, .vsub = 1, .is_yuv = true},
> +		{ .format = DRM_FORMAT_I412,            .depth = 0,  .num_planes = 3,
> +		  .char_per_block = { 2, 2, 2 }, .block_w = { 1, 1, 1 }, .block_h = { 1, 1, 1 },
> +		  .hsub = 1, .vsub = 1, .is_yuv = true},
>   	};
>   
>   	unsigned int i;
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index e41a3cec6a9e..f22c80031595 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -397,6 +397,26 @@ extern "C" {
>   #define DRM_FORMAT_YUV444	fourcc_code('Y', 'U', '2', '4') /* non-subsampled Cb (1) and Cr (2) planes */
>   #define DRM_FORMAT_YVU444	fourcc_code('Y', 'V', '2', '4') /* non-subsampled Cr (1) and Cb (2) planes */
>   
> +/*
> + * 3 plane YCbCr LSB aligned
> + * index 0 = Y plane, [15:0] x:Y [6:10] little endian
> + * index 1 = Cr plane, [15:0] x:Cr [6:10] little endian
> + * index 2 = Cb plane, [15:0] x:Cb [6:10] little endian
> + */
> +#define DRM_FORMAT_I010	fourcc_code('I', '0', '1', '0') /* 2x2 subsampled Cb (1) and Cr (2) planes 10 bits per channel */
> +#define DRM_FORMAT_I210	fourcc_code('I', '2', '1', '0') /* 2x1 subsampled Cb (1) and Cr (2) planes 10 bits per channel */
> +#define DRM_FORMAT_I410	fourcc_code('I', '4', '1', '0') /* non-subsampled Cb (1) and Cr (2) planes 10 bits per channel */
> +
> +/*
> + * 3 plane YCbCr LSB aligned
> + * index 0 = Y plane, [15:0] x:Y [4:12] little endian
> + * index 1 = Cr plane, [15:0] x:Cr [4:12] little endian
> + * index 2 = Cb plane, [15:0] x:Cb [4:12] little endian
> + */
> +#define DRM_FORMAT_I012	fourcc_code('I', '0', '1', '2') /* 2x2 subsampled Cb (1) and Cr (2) planes 12 bits per channel */
> +#define DRM_FORMAT_I212	fourcc_code('I', '2', '1', '2') /* 2x1 subsampled Cb (1) and Cr (2) planes 12 bits per channel */
> +#define DRM_FORMAT_I412	fourcc_code('I', '4', '1', '2') /* non-subsampled Cb (1) and Cr (2) planes 12 bits per channel */
> +
>   
>   /*
>    * Format Modifiers:
