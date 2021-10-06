Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6DB423DED
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 14:43:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4674B6EDC1;
	Wed,  6 Oct 2021 12:43:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0935C6EDB2;
 Wed,  6 Oct 2021 12:43:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E8A5B60F23;
 Wed,  6 Oct 2021 12:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633524200;
 bh=NXX/YVeSC1/xMv0e7rgZCXBKEbXgorLqIvzRSnMfkfA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KiwZEZTBaFLkFv2VNrd0e9f56QbQwT/fvCufaFLfozr4TRjxw1yntvxAKGYX8gbtL
 s9Ilw6I4jGZr/w9X7NtIvuZBR2GqSG6mxyfJASQ3v5p7+U+SARrT3cEhZb+M6CmAzf
 wuc/FZIYjZdMGAyTNDB5etmzBwMaNXjlOqmrartbq1wcGlBcESlsAvP/siFZz9aO1j
 RFXVme+4roOdlkjaxzxSKMj3IdwVZUGhE+w6aTMpGS/UywqEhpcmvZDPU4sAByK1Ao
 rjEd7tzi+ZToE5W7ngVUO56CiBeG1rbLXAbpkrlhLeDRWbVXD8ZuyJN685m37EY1C+
 2Ja2arWnSxQeA==
Date: Wed, 6 Oct 2021 18:13:16 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH 08/11] drm/msm/disp/dpu1: Add support for DSC in encoder
Message-ID: <YV2Z5JbfFAgLo0n6@matsya>
References: <20210715065203.709914-1-vkoul@kernel.org>
 <20210715065203.709914-9-vkoul@kernel.org>
 <0227846a-47b1-96e7-f14c-7dc3b4f1ba47@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0227846a-47b1-96e7-f14c-7dc3b4f1ba47@linaro.org>
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

On 29-07-21, 23:54, Dmitry Baryshkov wrote:
> On 15/07/2021 09:52, Vinod Koul wrote:

> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > index 8d942052db8a..41140b781e66 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -21,12 +21,17 @@
> >   #include "dpu_hw_intf.h"
> >   #include "dpu_hw_ctl.h"
> >   #include "dpu_hw_dspp.h"
> > +#include "dpu_hw_dsc.h"
> >   #include "dpu_formats.h"
> >   #include "dpu_encoder_phys.h"
> >   #include "dpu_crtc.h"
> >   #include "dpu_trace.h"
> >   #include "dpu_core_irq.h"
> > +#define DSC_MODE_SPLIT_PANEL		BIT(0)
> > +#define DSC_MODE_MULTIPLEX		BIT(1)
> > +#define DSC_MODE_VIDEO			BIT(2)
> 
> This should go into dpu_hw_dsc.h. Ah. They are already defined there and
> just redefined there. Remove the defines here.

Sure, updated

> It might be cleaner to add bool flags to struct msm_display_dsc_config and
> then calculate common mode in the dpu_hw_dsc_config().

How would that be better than calculating here? I dont see much of an
advantage.

> > +static void dpu_encoder_dsc_pipe_cfg(struct dpu_hw_dsc *hw_dsc,
> > +				     struct dpu_hw_pingpong *hw_pp,
> > +				     struct msm_display_dsc_config *dsc,
> > +				     u32 common_mode)
> > +{
> > +	if (hw_dsc->ops.dsc_config)
> > +		hw_dsc->ops.dsc_config(hw_dsc, dsc, common_mode);
> > +
> > +	if (hw_dsc->ops.dsc_config_thresh)
> > +		hw_dsc->ops.dsc_config_thresh(hw_dsc, dsc);
> > +
> > +	if (hw_pp->ops.setup_dsc)
> > +		hw_pp->ops.setup_dsc(hw_pp);
> > +
> > +	if (hw_pp->ops.enable_dsc)
> > +		hw_pp->ops.enable_dsc(hw_pp);
> 
> I think, we do not need to split these operations, I'd suggest having just
> hw_dsc->ops.dsc_config() and hw_pp->ops.enable_dsc(), merging
> dsc_config_thres() and setup_dsc() into respective methods.

Merging hw_dsc->ops.dsc_config() and hw_dsc->ops.dsc_config_thresh() would make
it from L to XL size, so lets keep them split.

We could merge the small hw_pp->ops.setup_dsc() and
hw_pp->ops.enable_dsc() though.

> >   void dpu_encoder_prepare_for_kickoff(struct drm_encoder *drm_enc)
> >   {
> >   	struct dpu_encoder_virt *dpu_enc;
> >   	struct dpu_encoder_phys *phys;
> > +	struct msm_drm_private *priv;
> >   	bool needs_hw_reset = false;
> >   	unsigned int i;
> > @@ -1841,6 +1977,10 @@ void dpu_encoder_prepare_for_kickoff(struct drm_encoder *drm_enc)
> >   			dpu_encoder_helper_hw_reset(dpu_enc->phys_encs[i]);
> >   		}
> >   	}
> > +
> > +	priv = drm_enc->dev->dev_private;
> > +	if (priv->dsc)
> > +		dpu_encoder_prep_dsc(dpu_enc, priv->dsc);
> 
> Not quite. This makes dsc config global, while we can have several encoders
> enabled at once (think of DSI + DP). So the dsc should be a per-encoder
> setting rather than global.

I agree it would make sense to have per-encoder. The DP part needs to be
comprehended for DSC and would need more changes. I think updating this
for DP then and making it generic as required for DP would be better,
right? In that case I will skip moving to encoder for now.

-- 
~Vinod
