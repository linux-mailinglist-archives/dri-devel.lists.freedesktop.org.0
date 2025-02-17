Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D240A38CEB
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 21:00:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58AE910E126;
	Mon, 17 Feb 2025 20:00:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SEgrAazD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B52210E126
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 20:00:26 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-54626a71b40so870649e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 12:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739822424; x=1740427224; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=gpqEL8DpAJMrJ/rNxfQI3uKIUT/9KC6tNWKUzxHa+5g=;
 b=SEgrAazDyAP9uA0LkRWaZ6a3Gz/sIIyPZP5E05FSPq9dre2opS/1p8rjNn6JkFpJFv
 KXQRI7fzluNRIx+yOtK+C4Qg7x+M+3cyh3kQKTy9xBRhuqvU1x3f5KHXD5PBE+GHdrMa
 1FBvk5CMJrOs+KRL5+/631B/HOVMvjbUZmSe2VTWc7VyGZOjKu7PJW2Q/ZNI1z7sf+qR
 QTaS1UZhzurlZaeSohPeYzJFyMKxGCqfcZ0GpvFJbnT71Xv4ZBSwS4F8RZeLbUcYwjD4
 f6MZyYQ1gpKMUjs0znlTl9SwuHcE+wo9YuAsQINUmkawoDMjg5W49aBTTwhMAsczGfQ/
 S65A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739822424; x=1740427224;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gpqEL8DpAJMrJ/rNxfQI3uKIUT/9KC6tNWKUzxHa+5g=;
 b=lpcwGKRe9MdMID50xFM43W6Ru4pr7ToSK9821lAeGu93JAfRp5ZI60q7CcNnMvM8kk
 JroQsl7J/l1jVi/XbbuIz/5bcCUr0BXkER77DnHS/kfBZ7p5fh/o129Gd/EqcjDlS0Bz
 cPk4ergmIemweN5tB5eibTZ5HnWvz4Hu5J7HqN3nqZ/0N8K4K5VKfaSeFYHFLgrtGjTu
 lCUtonl7fkiK2HJkKksxrn9RlsLKNySmWIOMFHgJBxdRv5s+tyvyZ/powVXrlf3Sh4md
 jflZ6miLpeki4zqj3H280is5xG5dVbLR+jlbBlcTOnib5V7QWVPfTxHhZ6pA+obDz7C7
 D2Hg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbaVckFTYqvT8w3Ky5S5rDPTrkYGOSwmenjTCicvd1xZZe7wEugNtxHBUZcmpv6vOOMsjMsYZelzI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzW6BgWbiUADPKmlCdYBXhM9p6l4YJDb0b+fQBBQd/DeTMRV46f
 uU9xOZA/oNCHt/hErANyxvE7VJBbovRoBgIL5sF2a5ewIuXiUdtZy6aRsQfeGU8=
X-Gm-Gg: ASbGncvPNhx5JC3IKI5qAdNsvzXeqa9nv0o0ET465sLFLmSVj1zSmyxsetJq/srIQ0d
 03fM0V533LtAk9nmzglEpqz47CYa0sFtM4DhymhZtQHZONI/jg2lGI7/J/IZbWB0SNGwvd+En67
 INjN/ORAuvCuJ2dmscpuk+G+83376zzNxqkRzPXW/6JUKbmh/Cd4OS7RLFHmKbGSkQvxjWJ3N41
 9BTr/CQk3IVPxN9rmaNivK1RRZCkCnA4vxQ2gzT8JymOplFLigYF3dXsh/OA/mb0ZxqsBT6XaCb
 aS3IEhQ+XsNt5UzFLJ9K0RMmqZHYpX0V2Mdh0cp+4EKjbWnKRvktmmWYXajV80j5xbw4qMM=
X-Google-Smtp-Source: AGHT+IHfYFHYucbMv9ssVZrygfyI/KAzMXlRnYVSK6/tZCdLiSCDTSlyjiu2Y9vqwm/0Wc+nrvZGmQ==
X-Received: by 2002:a05:6512:2398:b0:545:2c86:17e6 with SMTP id
 2adb3069b0e04-5452fe2f270mr3457419e87.5.1739822424412; 
 Mon, 17 Feb 2025 12:00:24 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54525784de2sm1436453e87.109.2025.02.17.12.00.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 12:00:23 -0800 (PST)
Date: Mon, 17 Feb 2025 22:00:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Vishal Sagar <vishal.sagar@amd.com>, 
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Michal Simek <michal.simek@amd.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3 02/11] drm/fourcc: Add DRM_FORMAT_XV15/XV20
Message-ID: <e5ujn5lhj5vuvkbavoc3oppt3cpxnr7mm2vwh6liojmpxkfy2d@grpmckvbl5h4>
References: <20250212-xilinx-formats-v3-0-90d0fe106995@ideasonboard.com>
 <20250212-xilinx-formats-v3-2-90d0fe106995@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212-xilinx-formats-v3-2-90d0fe106995@ideasonboard.com>
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

On Wed, Feb 12, 2025 at 04:56:06PM +0200, Tomi Valkeinen wrote:
> Add two new pixel formats:
> 
> DRM_FORMAT_XV15 ("XV15")
> DRM_FORMAT_XV20 ("XV20")
> 
> The formats are 2 plane 10 bit per component YCbCr, with the XV15 2x2
> subsampled whereas XV20 is 2x1 subsampled.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/drm_fourcc.c  | 8 ++++++++
>  include/uapi/drm/drm_fourcc.h | 8 ++++++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
> index 1e9afbf6ef99..bb0a2294573b 100644
> --- a/drivers/gpu/drm/drm_fourcc.c
> +++ b/drivers/gpu/drm/drm_fourcc.c
> @@ -346,6 +346,14 @@ const struct drm_format_info *__drm_format_info(u32 format)
>  		{ .format = DRM_FORMAT_P030,            .depth = 0,  .num_planes = 2,
>  		  .char_per_block = { 4, 8, 0 }, .block_w = { 3, 3, 0 }, .block_h = { 1, 1, 0 },
>  		  .hsub = 2, .vsub = 2, .is_yuv = true},
> +		{ .format = DRM_FORMAT_XV15,		.depth = 0,
> +		  .num_planes = 2, .char_per_block = { 4, 8, 0 },
> +		  .block_w = { 3, 3, 0 }, .block_h = { 1, 1, 0 }, .hsub = 2,
> +		  .vsub = 2, .is_yuv = true },
> +		{ .format = DRM_FORMAT_XV20,		.depth = 0,
> +		  .num_planes = 2, .char_per_block = { 4, 8, 0 },
> +		  .block_w = { 3, 3, 0 }, .block_h = { 1, 1, 0 }, .hsub = 2,
> +		  .vsub = 1, .is_yuv = true },

It might be beneficial to use the same formatting as previous entries,
it simplifies reviewing. If the patchset is resent, it would be nice to
get that fixed..

However the patch looks correct, so


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>



>  	};
>  
>  	unsigned int i;
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index e41a3cec6a9e..ead756a71825 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -304,6 +304,14 @@ extern "C" {
>  #define DRM_FORMAT_RGB565_A8	fourcc_code('R', '5', 'A', '8')
>  #define DRM_FORMAT_BGR565_A8	fourcc_code('B', '5', 'A', '8')
>  
> +/*
> + * 2 plane 10 bit per component YCrCb
> + * index 0 = Y plane, [31:0] x:Y2:Y1:Y0 2:10:10:10 little endian
> + * index 1 = Cb:Cr plane, [63:0] x:Cr2:Cb2:Cr1:x:Cb1:Cr0:Cb0 2:10:10:10:2:10:10:10 little endian
> + */
> +#define DRM_FORMAT_XV15		fourcc_code('X', 'V', '1', '5') /* 2x2 subsampled Cr:Cb plane 2:10:10:10 */
> +#define DRM_FORMAT_XV20		fourcc_code('X', 'V', '2', '0') /* 2x1 subsampled Cr:Cb plane 2:10:10:10 */
> +
>  /*
>   * 2 plane YCbCr
>   * index 0 = Y plane, [7:0] Y
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
