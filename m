Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E49DB434595
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 08:57:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59FE66E217;
	Wed, 20 Oct 2021 06:57:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A0DA6E216;
 Wed, 20 Oct 2021 06:57:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3918960F9E;
 Wed, 20 Oct 2021 06:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634713068;
 bh=FWddtQcYwrlzWTV77Jdm3QP9dowcs8BdUV9+ROkK/2s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iLeD8Jr2GXRILm+s50KwHvB3JIOerCkXUihSZmvhWu3vndyEtcMQNe7qCDd26EbVu
 TJm+CNV2iOoAcbE2bEgNQl/pQGtjkvRJI68nUWnth/0uNqr+NdvyG3TzAkXL6qErlj
 H5OXv777Cjq8etnHhFCbImz9sOSyMe5FdQ4fnIOApXzAGcrRsy1hgqhH9sG7/6Z+8V
 QCA4XEsoom1UoeCFxkP+2Xu8Xqhtknfv/aoYxStQEXODWLgeYlLdkAl7IkLHoGkrbU
 cZfdGR5frPH3+2zCWOjBoNnyEmjdB7vLcp9ZnUk51OiWwXmv78xMpPJmlDjTA5MLwC
 ODvQ2l8p5GeNw==
Date: Wed, 20 Oct 2021 12:27:43 +0530
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
Subject: Re: [PATCH v2 06/11] drm/msm/disp/dpu1: Don't use DSC with mode_3d
Message-ID: <YW+957ZKnbf1g/89@matsya>
References: <20211007070900.456044-1-vkoul@kernel.org>
 <20211007070900.456044-7-vkoul@kernel.org>
 <11becace-7b44-6141-5a8b-1bd6d0673243@linaro.org>
 <35eb95c5-1c42-94d1-3f33-df029f753ab3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <35eb95c5-1c42-94d1-3f33-df029f753ab3@linaro.org>
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

On 14-10-21, 16:50, Dmitry Baryshkov wrote:
> On 14/10/2021 16:41, Dmitry Baryshkov wrote:
> > On 07/10/2021 10:08, Vinod Koul wrote:
> > > We cannot enable mode_3d when we are using the DSC. So pass
> > > configuration to detect DSC is enabled and not enable mode_3d
> > > when we are using DSC
> > > 
> > > We add a helper dpu_encoder_helper_get_dsc_mode() to detect dsc
> > > enabled and pass this to .setup_intf_cfg()
> > > 
> > > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > > ---
> > > Changes since
> > > v1:
> > >   - Move this patch from 7 to 6
> > >   - Update the changelog
> > >   - Make dsc as int and store the DSC indices
> > > 
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h     | 11 +++++++++++
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c |  2 ++
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c           |  5 +++--
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h           |  2 ++
> > >   4 files changed, 18 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> > > b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> > > index e7270eb6b84b..fca07ed03317 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> > > @@ -332,6 +332,17 @@ static inline enum dpu_3d_blend_mode
> > > dpu_encoder_helper_get_3d_blend_mode(
> > >       return BLEND_3D_NONE;
> > >   }
> > > +static inline bool dpu_encoder_helper_get_dsc_mode(struct
> > > dpu_encoder_phys *phys_enc)
> > > +{
> > > +    struct drm_encoder *drm_enc = phys_enc->parent;
> > > +    struct msm_drm_private *priv = drm_enc->dev->dev_private;
> > > +
> > > +    if (priv->dsc)
> > > +        return BIT(0) | BIT(1); /* Hardcoding for 2 DSC topology */
> > 
> > Please use defined values here rater than just BIT().
> 
> Ah, it's a list of DSC blocks used. So the function name is misleading (as
> it's not a mode). I think we'd better pass DSC_n names here. What about
> using an array for cfg->dsc?

Yeah I can do better names.

> 
> > 
> > > +
> > > +    return 0;
> > > +}
> > > +
> > >   /**
> > >    * dpu_encoder_helper_split_config - split display configuration
> > > helper function
> > >    *    This helper function may be used by physical encoders to
> > > configure
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > > b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > > index aa01698d6b25..8e5c0911734c 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > > @@ -70,6 +70,8 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
> > >       intf_cfg.intf_mode_sel = DPU_CTL_MODE_SEL_CMD;
> > >       intf_cfg.stream_sel = cmd_enc->stream_sel;
> > >       intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);
> > > +    intf_cfg.dsc = dpu_encoder_helper_get_dsc_mode(phys_enc);
> > > +
> > >       ctl->ops.setup_intf_cfg(ctl, &intf_cfg);
> > >   }
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> > > b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> > > index 64740ddb983e..3c79bd9c2fe5 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> > > @@ -118,7 +118,7 @@ static u32 dpu_hw_ctl_get_pending_flush(struct
> > > dpu_hw_ctl *ctx)
> > >       return ctx->pending_flush_mask;
> > >   }
> > > -static inline void dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
> > > +static void dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
> > >   {
> > >       if (ctx->pending_flush_mask & BIT(MERGE_3D_IDX))
> > > @@ -519,7 +519,8 @@ static void dpu_hw_ctl_intf_cfg(struct
> > > dpu_hw_ctl *ctx,
> > >       intf_cfg |= (cfg->intf & 0xF) << 4;
> > > -    if (cfg->mode_3d) {
> > > +    /* In DSC we can't set merge, so check for dsc too */
> > > +    if (cfg->mode_3d && !cfg->dsc) {
> > 
> > The more I think about this hunk, the more I'm unsure about it.
> > Downstream has the following topoligies defined:
> >   * @SDE_RM_TOPOLOGY_DUALPIPE_3DMERGE_DSC: 2 LM, 2 PP, 3DMux, 1 DSC, 1
> > INTF/WB
> >   * @SDE_RM_TOPOLOGY_QUADPIPE_3DMERGE_DSC  4 LM, 4 PP, 3DMux, 3 DSC, 2 INTF
> > 
> > While the latter is not supported on sdm845, the former one should be
> > (by the hardware). So in the driver I think we should make sure that
> > mode_3d does not get set rather than disallowing it here.
> > 
> > >           intf_cfg |= BIT(19);
> > >           intf_cfg |= (cfg->mode_3d - 0x1) << 20;
> > >       }
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> > > b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> > > index 806c171e5df2..5dfac5994bd4 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> > > @@ -39,6 +39,7 @@ struct dpu_hw_stage_cfg {
> > >    * @mode_3d:               3d mux configuration
> > >    * @merge_3d:              3d merge block used
> > >    * @intf_mode_sel:         Interface mode, cmd / vid
> > > + * @dsc:                   DSC BIT masks
> > >    * @stream_sel:            Stream selection for multi-stream interfaces
> > >    */
> > >   struct dpu_hw_intf_cfg {
> > > @@ -46,6 +47,7 @@ struct dpu_hw_intf_cfg {
> > >       enum dpu_3d_blend_mode mode_3d;
> > >       enum dpu_merge_3d merge_3d;
> > >       enum dpu_ctl_mode_sel intf_mode_sel;
> > > +    unsigned int dsc;
> 
> I think this should be:
> enum dpu_dsc dsc[MAX_DSCS];
> unsigned int num_dsc;

hmmm, how do we go about getting the num_dsc value here.
dpu_encoder_phys does not know about that..

-- 
~Vinod
