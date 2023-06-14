Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB29272FB3F
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jun 2023 12:39:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6B0410E440;
	Wed, 14 Jun 2023 10:39:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [5.144.164.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7357710E437
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jun 2023 10:39:14 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 820473F78E;
 Wed, 14 Jun 2023 12:39:12 +0200 (CEST)
Date: Wed, 14 Jun 2023 12:39:11 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 1/2] drm/msm/dpu: drop SSPP register dumpers
Message-ID: <lsfofftdomumlm4w7nilkez26weckb3wd2rndrpqikwkxtfar4@ryjvbumfetlu>
References: <20230521172147.4163085-1-dmitry.baryshkov@linaro.org>
 <fihs3di7da5rnvx63n4ums65rer62nps2ber77rojrtwacrgih@3r3aeedfvdr2>
 <kb25ll3emyh6jymyewzpqjtzuw4jekfysruar5pvgxbp37glf2@wf2pqlnhh64m>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <kb25ll3emyh6jymyewzpqjtzuw4jekfysruar5pvgxbp37glf2@wf2pqlnhh64m>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-05-21 21:16:39, Marijn Suijten wrote:
> On 2023-05-21 20:12:00, Marijn Suijten wrote:
> > On 2023-05-21 20:21:46, Dmitry Baryshkov wrote:
> > > Drop SSPP-specifig debugfs register dumps in favour of using
> > > debugfs/dri/0/kms or devcoredump.
> > > 
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 
> > Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> > 
> > > ---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 25 ---------------------
> > >  1 file changed, 25 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> > > index bfd82c2921af..6c5ebee2f7cd 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> > > @@ -727,31 +727,6 @@ int _dpu_hw_sspp_init_debugfs(struct dpu_hw_sspp *hw_pipe, struct dpu_kms *kms,
> > >  	debugfs_create_xul("features", 0600,
> > >  			debugfs_root, (unsigned long *)&hw_pipe->cap->features);
> > >  
> > > -	/* add register dump support */
> > > -	dpu_debugfs_create_regset32("src_blk", 0400,
> > > -			debugfs_root,
> > > -			sblk->src_blk.base + cfg->base,
> > > -			sblk->src_blk.len,
> 
> Note that this fails to apply on top of
> https://lore.kernel.org/linux-arm-msm/20230429012353.2569481-2-dmitry.baryshkov@linaro.org/

Also noticing just now that this whole patch makes sblk unused:

drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c: In function '_dpu_hw_sspp_init_debugfs':
drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c:620:41: warning: unused variable 'sblk' [-Wunused-variable]
  620 |         const struct dpu_sspp_sub_blks *sblk = cfg->sblk;
      |                                         ^~~~

- Marijn

> 
> - Marijn
> 
> > > -			kms);
> > > -
> > > -	if (cfg->features & BIT(DPU_SSPP_SCALER_QSEED3) ||
> > > -			cfg->features & BIT(DPU_SSPP_SCALER_QSEED3LITE) ||
> > > -			cfg->features & BIT(DPU_SSPP_SCALER_QSEED2) ||
> > > -			cfg->features & BIT(DPU_SSPP_SCALER_QSEED4))
> > > -		dpu_debugfs_create_regset32("scaler_blk", 0400,
> > > -				debugfs_root,
> > > -				sblk->scaler_blk.base + cfg->base,
> > > -				sblk->scaler_blk.len,
> > > -				kms);
> > > -
> > > -	if (cfg->features & BIT(DPU_SSPP_CSC) ||
> > > -			cfg->features & BIT(DPU_SSPP_CSC_10BIT))
> > > -		dpu_debugfs_create_regset32("csc_blk", 0400,
> > > -				debugfs_root,
> > > -				sblk->csc_blk.base + cfg->base,
> > > -				sblk->csc_blk.len,
> > > -				kms);
> > > -
> > >  	debugfs_create_u32("xin_id",
> > >  			0400,
> > >  			debugfs_root,
> > > -- 
> > > 2.39.2
> > > 
