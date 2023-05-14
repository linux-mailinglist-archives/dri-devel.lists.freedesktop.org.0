Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12892701FBA
	for <lists+dri-devel@lfdr.de>; Sun, 14 May 2023 23:25:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE0CA10E071;
	Sun, 14 May 2023 21:25:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D53610E0DC
 for <dri-devel@lists.freedesktop.org>; Sun, 14 May 2023 21:25:12 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 7F8E43EBD4;
 Sun, 14 May 2023 23:25:09 +0200 (CEST)
Date: Sun, 14 May 2023 23:25:08 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH v10 4/8] drm/msm: Add MSM-specific DSC helper methods
Message-ID: <kx3be4c2okye2ts4rzy4j4ltnveixf7v4rxp5v4tl2irvevg6t@c5tuelunmn4c>
References: <20230329-rfc-msm-dsc-helper-v10-0-4cb21168c227@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v10-4-4cb21168c227@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230329-rfc-msm-dsc-helper-v10-4-4cb21168c227@quicinc.com>
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
Cc: Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-05-12 14:32:14, Jessica Zhang wrote:
> 
> Introduce MSM-specific DSC helper methods, as some calculations are
> common between DP and DSC.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/msm_dsc_helper.h | 65 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_dsc_helper.h b/drivers/gpu/drm/msm/msm_dsc_helper.h
> new file mode 100644
> index 000000000000..0d2a097b428d
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/msm_dsc_helper.h
> @@ -0,0 +1,65 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved
> + */
> +
> +#ifndef MSM_DSC_HELPER_H_
> +#define MSM_DSC_HELPER_H_
> +
> +#include <linux/bug.h>
> +#include <linux/math.h>
> +#include <drm/display/drm_dsc_helper.h>
> +
> +/*
> + * Helper methods for MSM specific DSC calculations that are common between timing engine,
> + * DSI, and DP.
> + */

Isn't this more common to have directly below the copyright statement,
above the includes?

> +
> +/**
> + * msm_dsc_get_bpp_int() - get bits per pixel integer value
> + * @dsc: Pointer to drm dsc config struct
> + * Returns: BPP integer value
> + */
> +static inline int msm_dsc_get_bpp_int(struct drm_dsc_config *dsc)

Const, as requested elsewhere.  But this function is not used anywhere
in any of the series (because we replaced the usages with more sensible
member accesses like slice_chunk_size).

> +{
> +	WARN_ON_ONCE(dsc->bits_per_pixel & 0xf);
> +	return dsc->bits_per_pixel >> 4;
> +}
> +
> +/**
> + * msm_dsc_get_slice_per_intf() - get number of slices per interface
> + * @dsc: Pointer to drm dsc config struct
> + * @intf_width: interface width

Width of the interface (to query), *in pixels*

> + * Returns: Integer representing the slice per interface

the *number of slices* per interface.

Also, the returned value applies specifically to *the given interface*
(width).

> + */
> +static inline int msm_dsc_get_slice_per_intf(struct drm_dsc_config *dsc, int intf_width)

Const pointer.

Also: sliceS_per_intf?  It's pluiral in the docs too.

Should the argument and return value be u32, to match the uses?  Same
for everything below.

> +{
> +	return DIV_ROUND_UP(intf_width, dsc->slice_width);
> +}
> +
> +/**
> + * msm_dsc_get_bytes_per_line() - Calculate bytes per line

Calculate -> (lowecase) get
(to match all the other helpers in this file)

> + * @dsc: Pointer to drm dsc config struct
> + * Returns: Integer value representing pclk per interface
> + *
> + * Note: This value will then be passed along to DSI and DP for some more
> + * calculations. This is because DSI and DP divide the pclk_per_intf value
> + * by different values depending on if widebus is enabled.

Can you elaborate what this "note" is trying to tell users of this
function?  That they should not use bytes_per_line raw?  That it doesn't
actually represent bytes_per_line if the extra calculations mentioned
here are not applied?

> + */
> +static inline int msm_dsc_get_bytes_per_line(struct drm_dsc_config *dsc)

const, return u32.

> +{
> +	return dsc->slice_count * dsc->slice_chunk_size;

This is a u8 times a u16.  Could it overflow a u16 and should we hence
cast one of the expressions to u32 first?

> +}
> +
> +/**
> + * msm_dsc_get_bytes_per_intf() - get total bytes per interface
> + * @dsc: Pointer to drm dsc config struct
> + * @intf_width: interface width
> + * Returns: u32 value representing bytes per interface

Nit: no need to repeat the type, I think?  Just "number of bytes per
interface" is more concise.

> + */
> +static inline u32 msm_dsc_get_bytes_per_intf(struct drm_dsc_config *dsc, int intf_width)

And one more const.  Not sure that this helper is useful though: it is
only used where msm_dsc_get_slice_per_intf() was already called, so it
makes more sense to the reader to just multiply slice_per_intf by
slice_chunk_size than to defer to an opaque helper.

- Marijn

> +{
> +	return dsc->slice_chunk_size * msm_dsc_get_slice_per_intf(dsc, intf_width);
> +}
> +
> +#endif /* MSM_DSC_HELPER_H_ */
> 
> -- 
> 2.40.1
> 
