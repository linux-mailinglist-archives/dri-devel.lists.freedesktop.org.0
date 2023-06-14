Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C91B672FE6B
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jun 2023 14:23:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4F7710E12D;
	Wed, 14 Jun 2023 12:23:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [5.144.164.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B855110E12D
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jun 2023 12:23:40 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 57B7D3F403;
 Wed, 14 Jun 2023 14:23:38 +0200 (CEST)
Date: Wed, 14 Jun 2023 14:23:36 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 1/3] drm/msm/dpu: Add DPU_INTF_DATABUS_WIDEN feature flag
 for DPU >= 5.0
Message-ID: <ycgei43x4kfmjk7g7gbeglehtiiinfbqmrjbdzcy56frxbtd2z@yk2f5kgrkbrt>
References: <20230525-add-widebus-support-v1-0-c7069f2efca1@quicinc.com>
 <20230525-add-widebus-support-v1-1-c7069f2efca1@quicinc.com>
 <wpjxrnhbcanbc5iatxnff25yrrdfrtmgb24sgwyo457dz2oyjz@e2docpcb6337>
 <f4fb042c-1458-6077-3c49-8cc02638b27c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f4fb042c-1458-6077-3c49-8cc02638b27c@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-06-14 15:01:59, Dmitry Baryshkov wrote:
> On 14/06/2023 14:42, Marijn Suijten wrote:
> > On 2023-06-13 18:57:11, Jessica Zhang wrote:
> >> DPU 5.x+ supports a databus widen mode that allows more data to be sent
> >> per pclk. Enable this feature flag on all relevant chipsets.
> >>
> >> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 3 ++-
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 ++
> >>   2 files changed, 4 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >> index 36ba3f58dcdf..0be7bf0bfc41 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >> @@ -103,7 +103,8 @@
> >>   	(BIT(DPU_INTF_INPUT_CTRL) | \
> >>   	 BIT(DPU_INTF_TE) | \
> >>   	 BIT(DPU_INTF_STATUS_SUPPORTED) | \
> >> -	 BIT(DPU_DATA_HCTL_EN))
> >> +	 BIT(DPU_DATA_HCTL_EN) | \
> >> +	 BIT(DPU_INTF_DATABUS_WIDEN))
> > 
> > This doesn't work.  DPU 5.0.0 is SM8150, which has DSI 6G 2.3.  In the
> > last patch for DSI you state and enable widebus for DSI 6G 2.5+ only,
> > meaning DPU and DSI are now desynced, and the output is completely
> > corrupted.

Tested this on SM8350 which actually has DSI 2.5, and it is also
corrupted with this series so something else on this series might be
broken.

> > Is the bound in dsi_host wrong, or do DPU and DSI need to communicate
> > when widebus will be enabled, based on DPU && DSI supporting it?
> 
> I'd prefer to follow the second approach, as we did for DP. DPU asks the 
> actual video output driver if widebus is to be enabled.

Doesn't it seem very strange that DPU 5.x+ comes with a widebus feature,
but the DSI does not until two revisions later?  Or is this available on
every interface, but only for a different (probably DP) encoder block?

- Marijn
