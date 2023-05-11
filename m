Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1EC66FEB9D
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 08:15:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A4F510E5A6;
	Thu, 11 May 2023 06:15:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::164])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DB4910E5A5
 for <dri-devel@lists.freedesktop.org>; Thu, 11 May 2023 06:15:54 +0000 (UTC)
Received: from SoMainline.org (unknown [89.205.226.142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id A1D992030C;
 Thu, 11 May 2023 08:15:49 +0200 (CEST)
Date: Thu, 11 May 2023 08:15:47 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH v7 4/8] drm/msm: Add MSM-specific DSC helper methods
Message-ID: <rvqyvkpspwos6peqzf3lrmnv4pkxrnyxm2eohdza6yujyykwui@xe2m33ez6mec>
References: <20230329-rfc-msm-dsc-helper-v7-0-df48a2c54421@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v7-4-df48a2c54421@quicinc.com>
 <4jjgeylpyofynlybonwuveumwvyjphtnbtctu6pwdrigckropw@dmkahbb3au3d>
 <489fb0ea-3b37-f7ed-0183-f4cb1b003326@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <489fb0ea-3b37-f7ed-0183-f4cb1b003326@quicinc.com>
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
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-05-10 14:03:14, Jessica Zhang wrote:
> 
> 
> On 5/9/2023 11:33 PM, Marijn Suijten wrote:
> > On 2023-05-09 15:06:50, Jessica Zhang wrote:
> >> Introduce MSM-specific DSC helper methods, as some calculations are
> >> common between DP and DSC.
> >>
> >> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/Makefile         |  1 +
> >>   drivers/gpu/drm/msm/msm_dsc_helper.c | 26 ++++++++++++++
> >>   drivers/gpu/drm/msm/msm_dsc_helper.h | 69 ++++++++++++++++++++++++++++++++++++
> >>   3 files changed, 96 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> >> index 7274c41228ed..b814fc80e2d5 100644
> >> --- a/drivers/gpu/drm/msm/Makefile
> >> +++ b/drivers/gpu/drm/msm/Makefile
> >> @@ -94,6 +94,7 @@ msm-y += \
> >>   	msm_atomic_tracepoints.o \
> >>   	msm_debugfs.o \
> >>   	msm_drv.o \
> >> +	msm_dsc_helper.o \
> >>   	msm_fb.o \
> >>   	msm_fence.o \
> >>   	msm_gem.o \
> >> diff --git a/drivers/gpu/drm/msm/msm_dsc_helper.c b/drivers/gpu/drm/msm/msm_dsc_helper.c
> >> new file mode 100644
> >> index 000000000000..29feb3e3b5a4
> >> --- /dev/null
> >> +++ b/drivers/gpu/drm/msm/msm_dsc_helper.c
> >> @@ -0,0 +1,26 @@
> >> +// SPDX-License-Identifier: GPL-2.0-only
> >> +/*
> >> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved
> >> + */
> >> +
> >> +#include <linux/kernel.h>
> >> +#include <drm/drm_fixed.h>
> >> +
> >> +#include "msm_dsc_helper.h"
> >> +
> >> +s64 msm_dsc_get_bytes_per_soft_slice(struct drm_dsc_config *dsc)
> >> +{
> >> +	return drm_fixp_from_fraction(dsc->slice_width * msm_dsc_get_bpp_int(dsc), 8);
> > 
> > How about using dsc->slice_chunk_size?
> 
> Hi Marijn,
> 
> Thanks for pointing this out. However, I would prefer to keep this fixed 
> point version of the slice_chunk_size math as the downstream DP math 
> also uses fixed point [1].

That looks like a totally different computation.  For this specific
value it appears drm_fixp_from_fraction does rounding whereas
DIV_ROUND_UP always rounds up when used for slice_chunk_size, but these
values are generally multiples of 8.  slice_chunk_size will also take
fractional bpp into account (even if unsupported by DPU otherwise).

> If we are able to confirm that integer math also works for DP, we will 
> make the change to use slice_chunk_size within the DP DSC series.

Don't think the DP series alone should point that out, as it heavily
depends on the relation between slice size and bpp parameters, and
whether those end up with a fractional part or not (are you able to test
and confirm all those combinations?).  Regardless it seems more natural
to use slice_chunk_size which is used in various other ways and sent in
the PPS: it wouldn't make sense to adhere to a different slice byte
count elsewhere.

> I also want to note that this math has stayed the same throughout all 7 
> revisions. In the interest of making review more efficient, I think it 
> would be helpful to point out important details like this early on in 
> the process. That way we can address major concerns early on and keep 
> the number of revisions per series low.

I've already expressed to Abhinav and you that the revisions for all
these series were coming in way too hot, leaving no time for review and
discussions before the next revision hits the list.  If you want to keep
the number of revisions low, v8 shouln't have already been sent.

I desire to review *and test* all these patches (which I believe is in
everyone's best interest) and have not initially been able to do so as
all these efforts come out of my free time, which is sometimes limited
of has been used to finalize the INTF TE series (which is a dependency
of these series).

It should be pretty obvious to see that this patch has not had a reply
from me on any of the previous revisions, and there are more patches
that I have not been able to comment on yet.

The alternative to that is of course not seeing enough value in my
review and testing (or ""late"" comments...) and merging it regardless
at some point, but that's not up to me to decide.

- Marijn

> 
> [1] 
> https://github.com/ianmacd/gts6lwifi/blob/master/drivers/gpu/drm/msm/dp/dp_panel.c#L335
> 
> > 
> >> +}
> >> +
> >> +u32 msm_dsc_get_bytes_per_intf(struct drm_dsc_config *dsc, int intf_width)
> >> +{
> >> +	u32 bytes_per_soft_slice;
> >> +	s64 bytes_per_soft_slice_fp;
> >> +	int slice_per_intf = msm_dsc_get_slice_per_intf(dsc, intf_width);
> >> +
> >> +	bytes_per_soft_slice_fp = msm_dsc_get_bytes_per_soft_slice(dsc);
> >> +	bytes_per_soft_slice = drm_fixp2int_ceil(bytes_per_soft_slice_fp);
> >> +
> >> +	return bytes_per_soft_slice * slice_per_intf;
> >> +}
> >> diff --git a/drivers/gpu/drm/msm/msm_dsc_helper.h b/drivers/gpu/drm/msm/msm_dsc_helper.h
> >> new file mode 100644
> >> index 000000000000..38f3651d0b79
> >> --- /dev/null
> >> +++ b/drivers/gpu/drm/msm/msm_dsc_helper.h
> >> @@ -0,0 +1,69 @@
> >> +/* SPDX-License-Identifier: GPL-2.0-only */
> >> +/*
> >> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved
> >> + */
> >> +
> >> +#ifndef MSM_DSC_HELPER_H_
> >> +#define MSM_DSC_HELPER_H_
> >> +
> >> +#include <linux/bug.h>
> >> +#include <linux/math.h>
> >> +#include <drm/display/drm_dsc_helper.h>
> >> +
> >> +/*
> >> + * Helper methods for MSM specific DSC calculations that are common between timing engine,
> >> + * DSI, and DP.
> >> + */
> >> +
> >> +/**
> >> + * msm_dsc_get_bpp_int - get bits per pixel integer value
> > 
> > For all function docs, don't forget the trailing parenthesis after the
> > function name: msm_dsc_get_bpp_int()
> > 
> > https://www.kernel.org/doc/html/next/doc-guide/kernel-doc.html#function-documentation
> 
> Acked.
> 
> > 
> >> + * @dsc: Pointer to drm dsc config struct
> >> + * Returns: BPP integer value
> >> + */
> >> +static inline int msm_dsc_get_bpp_int(struct drm_dsc_config *dsc)
> >> +{
> >> +	WARN_ON_ONCE(dsc->bits_per_pixel & 0xf);
> >> +	return dsc->bits_per_pixel >> 4;
> >> +}
> >> +
> >> +/**
> >> + * msm_dsc_get_slice_per_intf - get number of slices per interface
> >> + * @dsc: Pointer to drm dsc config struct
> >> + * @intf_width: interface width
> >> + * Returns: Integer representing the slice per interface
> >> + */
> >> +static inline int msm_dsc_get_slice_per_intf(struct drm_dsc_config *dsc, int intf_width)
> >> +{
> >> +	return DIV_ROUND_UP(intf_width, dsc->slice_width);
> > 
> > Looks good.
> > 
> >> +}
> >> +
> >> +/**
> >> + * msm_dsc_get_bytes_per_line - Calculate bytes per line
> >> + * @dsc: Pointer to drm dsc config struct
> >> + * Returns: Integer value representing pclk per interface
> >> + *
> >> + * Note: This value will then be passed along to DSI and DP for some more
> >> + * calculations. This is because DSI and DP divide the pclk_per_intf value
> >> + * by different values depending on if widebus is enabled.
> >> + */
> >> +static inline int msm_dsc_get_bytes_per_line(struct drm_dsc_config *dsc)
> >> +{
> >> +	return DIV_ROUND_UP(dsc->slice_width * dsc->slice_count * msm_dsc_get_bpp_int(dsc), 8);
> > 
> > dsc->slice_chunk_size * dsc->slice_count?
> 
> Acked.
> 
> > 
> >> +}
> >> +
> >> +/**
> >> + * msm_dsc_get_bytes_per_soft_slice - get size of each soft slice for dsc
> > 
> > Explain to the reader what a "soft" slice is?
> 
> A soft slice is a slice defined in software as opposed to "hard slices" 
> that are defined by hardware.
> 
> Since the slice-related variables in drm_dsc_config hold information 
> related to soft slices and there is no separate variable for hard 
> slices, I'll change this name to *_get_bytes_per_slice instead.
> 
> Thanks,
> 
> Jessica Zhang
> 
> > 
> > - Marijn
> > 
> >> + * @dsc: Pointer to drm dsc config struct
> >> + * Returns: s31.32 fixed point value representing bytes per soft slice
> >> + */
> >> +s64 msm_dsc_get_bytes_per_soft_slice(struct drm_dsc_config *dsc);
> >> +
> >> +/**
> >> + * msm_dsc_get_bytes_per_intf - get total bytes per interface
> >> + * @dsc: Pointer to drm dsc config struct
> >> + * @intf_width: interface width
> >> + * Returns: u32 value representing bytes per interface
> >> + */
> >> +u32 msm_dsc_get_bytes_per_intf(struct drm_dsc_config *dsc, int intf_width);
> >> +
> >> +#endif /* MSM_DSC_HELPER_H_ */
> >>
> >> -- 
> >> 2.40.1
> >>
