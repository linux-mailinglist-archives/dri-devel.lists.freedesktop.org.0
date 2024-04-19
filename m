Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C518AB725
	for <lists+dri-devel@lfdr.de>; Sat, 20 Apr 2024 00:18:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6C0810E2BE;
	Fri, 19 Apr 2024 22:18:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [5.144.164.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D04210E314
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 22:18:42 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits)
 server-digest SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 6AF05405E9;
 Sat, 20 Apr 2024 00:18:40 +0200 (CEST)
Date: Sat, 20 Apr 2024 00:18:39 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Archit Taneja <architt@codeaurora.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>, Vinod Koul <vkoul@kernel.org>, 
 Sravanthi Kollukuduru <skolluku@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jordan Crouse <jordan@cosmicpenguin.net>, Rajesh Yadav <ryadav@codeaurora.org>,
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 ~postmarketos/upstreaming@lists.sr.ht, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>
Subject: Re: [PATCH 2/7] drm/msm/dsi: Pass bonded-DSI hdisplay/2 to DSC
 timing configuration
Message-ID: <7fqwkryeumkt7zxsec6va7ys22nfs3tr4rrcz323extdz3f6zv@w4uu2lk4uh7v>
References: <20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-0-78ae3ee9a697@somainline.org>
 <20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-2-78ae3ee9a697@somainline.org>
 <CAA8EJpq-1QwoM2hEyegpfKnVH+qrswjmTd_hpYs9d9B7gikHjg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpq-1QwoM2hEyegpfKnVH+qrswjmTd_hpYs9d9B7gikHjg@mail.gmail.com>
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

On 2024-04-17 14:58:25, Dmitry Baryshkov wrote:
> On Wed, 17 Apr 2024 at 02:57, Marijn Suijten
> <marijn.suijten@somainline.org> wrote:
> >
> > When configuring the timing of DSI hosts (interfaces) in
> > dsi_timing_setup() all values written to registers are taking bonded
> > DSI into account by dividing the original mode width by 2 (half the
> > data is sent over each of the two DSI hosts), but the full width
> > instead of the interface width is passed as hdisplay parameter to
> > dsi_update_dsc_timing().
> >
> > Currently only msm_dsc_get_slices_per_intf() is called within
> > dsi_update_dsc_timing() with the `hdisplay` argument which clearly
> > documents that it wants the width of a single interface (which, again,
> > in bonded DSI mode is half the total width of the mode).  Thus pass the
> > bonded-mode-adjusted hdisplay parameter into dsi_update_dsc_timing()
> > otherwise all values written to registers by this function (i.e. the
> > number of slices per interface or packet, and derived from this the EOL
> > byte number) are twice too large.
> >
> > Inversely the panel driver is expected to only set the slice width and
> > number of slices for half the panel, i.e. what will be sent by each
> > host individually, rather than fixing that up like hdisplay here.
> >
> > Fixes: 08802f515c3c ("drm/msm/dsi: Add support for DSC configuration")
> > Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> > ---
> >  drivers/gpu/drm/msm/dsi/dsi_host.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Thanks, it seems this patch has already been picked up for 6.10 [1] to test at
least, but I'd advise you to drop it until I resend it in v2, as it no longer
performs as written in the title.

When I wrote this patch in in June 2023, commit efcbd6f9cdeb ("drm/msm/
dsi: Enable widebus for DSI") from August 2023 wasn't there yet.  That patch
updates hdisplay (because it is unused after that point) with the number
of compressed bytes to be sent over each interface, which is effectively
hdisplay (based on slice_count * slice_width, so as explained in the commit
message that corresponds to half the panel width), divided by a compression
ratio of 3 or 6 depending on widebus, thus passing a way too low value into
dsi_update_dsc_timing().

As a result this patch regresses the DSC panel on my SM8150 Sony Xperia 1, and
likely also explains why it was quite hard to get the porches "just right" on
the Xperia 1 III with its dual-DSI dual-DSC 4k@120Hz panel (that these patches
are specifically for).

I'm still thinking of how to best fix that: probably introducing a new separate
local variable, though dsi_update_dsc_timing() only uses it to calculate
the number of slices per interface, which again as written in the commit
description, is currently required to already be for one interface (in other
words, the Xperia 1 with only a single intf sets slice_count=2, but the Xperia 1
III with 2 bonded DSI interfaces sets slice_count=1).  Which means that this is
always equivalent to slice_per_intf = dsc->slice_count.

Let me know which approach is preferred.

- Marijn

[1]: https://gitlab.freedesktop.org/drm/msm/-/merge_requests/110
