Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5E39BF240
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 16:54:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62AED10E083;
	Wed,  6 Nov 2024 15:54:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b="FZe7Ay07";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88EF910E083
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2024 15:54:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1730908434; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=RDm7RT7XDUs+o5P3a5YII1jpRlcQTxdoG3dw7k3iUha2rlRNi2MCs4ZdIjEZy9uyeqobiMNGF2zBKoqc4TBdqRXMoTLWcJGf5NRM06W/PykEsY9q6O83u8l98ZqKPQhBN8saHNIwnn1ZOJj0+fBOLyZMFI++hjbyo9Ec/LJitrA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1730908434;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=d9owUKVL5RmM44FaajdtaQ+bTNIjOEZeFrlJJspbg7w=; 
 b=RUH9yDRxkPh320DjBhZvGnnpGVfVJ0zV4q/UFgJF5XrdgMcMyVegWXAGO7E5+NyDmIH0SSffH3ROB8cdhhEGJlNKhnybDYds38EVE5VSoKftZd977WlrJXuWhfQ2H6r8Ikrwq+OGy/1Ajdt/E+pXXR+H/QPGQHBXvIy+bWuBG0c=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
 dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1730908434; 
 s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=d9owUKVL5RmM44FaajdtaQ+bTNIjOEZeFrlJJspbg7w=;
 b=FZe7Ay07ArzBMSFjQX0XLOx9cMvA6QUHwOiKr0jP6TovnpwHiKIOPd58myBSUgaX
 oc4UoeEmAgeO9VrB54/BV3i4zQE0ssDq6cs4PUryqaTI9M0PwHqNdVCfwjkrvO+2Uid
 7avAcRnP88Xd2D0n7r1c1YUdVTfPFRssk9AyXv+E=
Received: by mx.zohomail.com with SMTPS id 173090843306930.84842752758027;
 Wed, 6 Nov 2024 07:53:53 -0800 (PST)
Message-ID: <e5b0252f-f097-4e47-ad07-701cadd965fb@collabora.com>
Date: Wed, 6 Nov 2024 16:53:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/fourcc: Add modifier definition for describing
 Verisilicon video framebuffer
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 laurentiu.palcu@nxp.com, aisheng.dong@nxp.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Collabora Kernel ML <kernel@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <0102019301ab1b2d-5539e1c7-e026-47bc-8692-b3335f6f7584-000000@eu-west-1.amazonses.com>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <0102019301ab1b2d-5539e1c7-e026-47bc-8692-b3335f6f7584-000000@eu-west-1.amazonses.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

+ nicolas

Le 06/11/2024 à 14:30, Benjamin Gaignard a écrit :
> Verisilicon hardware video decoders can produce tiled (8x4 or 4x4)
> and compressed video framebuffers.
> It considerably reduces memory bandwidth while writing and reading
> frames in memory.
>
> The underlying storage in NV12 (for 8-bit) or NV15 (for 10-bit).
>
> Display controllers, like imx DCSS, could use these modifier definition
> as input for overlay planes.
>
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
> The original code comes from:
> https://github.com/nxp-imx/linux-imx/commit/ab01b7fe82d5a11dfb533cfbd08c4dfa140815de
> I have port it and modify DRM_FORMAT_MOD_VENDOR_VSI value.
>
>   include/uapi/drm/drm_fourcc.h | 27 +++++++++++++++++++++++++++
>   1 file changed, 27 insertions(+)
>
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index 78abd819fd62..31d09a98d0d7 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -421,6 +421,7 @@ extern "C" {
>   #define DRM_FORMAT_MOD_VENDOR_ARM     0x08
>   #define DRM_FORMAT_MOD_VENDOR_ALLWINNER 0x09
>   #define DRM_FORMAT_MOD_VENDOR_AMLOGIC 0x0a
> +#define DRM_FORMAT_MOD_VENDOR_VSI     0x0b
>   
>   /* add more to the end as needed */
>   
> @@ -1607,6 +1608,32 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
>   #define AMD_FMT_MOD_CLEAR(field) \
>   	(~((__u64)AMD_FMT_MOD_##field##_MASK << AMD_FMT_MOD_##field##_SHIFT))
>   
> +/* Verisilicon framebuffer modifiers */
> +
> +/*
> + * Verisilicon 8x4 tiling layout
> + *
> + * This is G1 VPU tiled layout using tiles of 8x4 pixels in a row-major
> + * layout.
> + */
> +#define DRM_FORMAT_MOD_VSI_G1_TILED fourcc_mod_code(VSI, 1)
> +
> +/*
> + * Verisilicon 4x4 tiling layout
> + *
> + * This is G2 VPU tiled layout using tiles of 4x4 pixels in a row-major
> + * layout.
> + */
> +#define DRM_FORMAT_MOD_VSI_G2_TILED fourcc_mod_code(VSI, 2)
> +
> +/*
> + * Verisilicon 4x4 tiling with compression layout
> + *
> + * This is G2 VPU tiled layout using tiles of 4x4 pixels in a row-major
> + * layout with compression.
> + */
> +#define DRM_FORMAT_MOD_VSI_G2_TILED_COMPRESSED fourcc_mod_code(VSI, 3)
> +
>   #if defined(__cplusplus)
>   }
>   #endif
