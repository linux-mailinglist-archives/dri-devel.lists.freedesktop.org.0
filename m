Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0097A496C3
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 11:16:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C45E10E290;
	Fri, 28 Feb 2025 10:16:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sPi4kJMp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E5CA10E290
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 10:16:20 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-548878c6a5aso2037632e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 02:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740737778; x=1741342578; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Wat92wf7UjNd1anwYmYBV9KhWwXM1sob582ltedV7ts=;
 b=sPi4kJMp3WCFNoH4WI1ghqi3mqdE0DiH2KE99YBrD6DMdW2EpqmbSFL4Vx9RZD70pN
 PgltyfVeJ3iBx2EJToc7V8yt4SJcjdo2HtP5sHK9S1Okm9iuXEPcloSELTkAtTXXBOoK
 /SEcO6ty2+9MBDcH2F+BLfk/CUevx91nSw0iIujaM7k13d8UqFUQhFtmtOPq/xKj5HZC
 lwQNbQGdKcYqwjLJ0Sn5c6xm7jC3vlNeBhP/J3CCaHhRrQwmDhDFNWhpx+0UhEMjzeWB
 skXP2FBV1g9IzEVF8SqsvHEgVa/QmXOq3tb1gT/HMh8YNa0Vwa+gTf5Fn2rV5Az+X1vM
 A/YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740737778; x=1741342578;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wat92wf7UjNd1anwYmYBV9KhWwXM1sob582ltedV7ts=;
 b=XSECHlvVrms5cTKNfEh4b8JmxUXyo6SlaXbSJrhq6RZHYQGGPKTHiVqjo2CdJDRz/H
 acnc5z0vMl7GzCmaKEwT6bBzww0PZORbLPnvi4GWymDQrwrzsRX6RfZOeAZ2t/GqBq3Q
 Xma20M6Oh+vIMOvzda5SY3jh1K09AS4wSRmVklxZvfWLeUx/x/Q+mrExf293+rCas3xo
 HgvXEhV4IMICh4GQFacdgNp5TFBaUPQJt3rAwor0x5FRs4waqvA/Bk8Uqwh7/LfNXz8d
 /ZCOxb9li9xApLIp9PqJCz2Ud0bIQVOgIxNATi+inJID2f6d6Pq8cFraHgWvFj0tVefH
 cmtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYVZ+yHD/MNlJioyXkVToMm8N5iNs07CKCFdluXU5RZjI88qAgA1d71RBd6hYUyaHh1bbOOKC0imk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyTWkDJcsl2Bcy4BFz5Nx2fuyRkrfb20mwz7Q0ky7hpzRTl1hHm
 hVxMjeEjf9xqZ3ldS+L5CPQgw0dTCyBDxMdlkjezma4vns18sxrumQ2gOUNHjqE=
X-Gm-Gg: ASbGnctXIId9yKRejT16kFKLn1n0h1Q4BSAjJDEpPvLP1K9ryUOr5HPu8mJiPLt238c
 +67Cd90eR2CzZneAjkp8yFkfMiBEdIEL82ZGZBDW1eeiNMG74yhBWAjgFAwuCI8ziR6/3Jl8/lA
 e9t9cRQ4swfFRXgS9WJAMAGHfQ5s5HqiG0olCjL3Ua4HicQpob+sevYavvB8lnHf4/HKSIFb2B5
 lqDAF3SjSK0IIBtP+2pOc7JjMwhOOzoNoIYDKWHBVBcsWXs7aoB7XhNdttOLdLBoXAv17JRILp3
 MuUMmgI+vjkBbW/FxRu7DJLoKsnEVROjRud4wpGpyQrG+wm8ZINdShysvvs+HcXjYSRsVVDK0/7
 +oi2sTw==
X-Google-Smtp-Source: AGHT+IGBfL2RkQl+kxLXV/hMApga37HIH6Rl9s2LmnykJ9ZsNHMREbfcwnGOHv1Q2EhRdw2KuDyx9g==
X-Received: by 2002:a05:6512:1047:b0:545:a1a:5576 with SMTP id
 2adb3069b0e04-5494c32905fmr1113184e87.22.1740737778531; 
 Fri, 28 Feb 2025 02:16:18 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549443cb6ccsm445728e87.212.2025.02.28.02.16.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2025 02:16:17 -0800 (PST)
Date: Fri, 28 Feb 2025 12:16:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/8] drm/msm/dpu: program master INTF value
Message-ID: <r6lkyug64endt2oos4anz4lqven3rstw3oupfywnrwd3i6qece@zt36tm33lqc2>
References: <20250228-dpu-active-ctl-v2-0-9a9df2ee5193@linaro.org>
 <20250228-dpu-active-ctl-v2-2-9a9df2ee5193@linaro.org>
 <CAACA6C8-441A-4B6E-AC07-A46094A02126@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAACA6C8-441A-4B6E-AC07-A46094A02126@somainline.org>
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

On Fri, Feb 28, 2025 at 10:23:54AM +0100, Marijn Suijten wrote:
> On 28 February 2025 05:14:06 CET, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> >If several interfaces are being handled through a single CTL, a main
> >('master') INTF needs to be programmed into a separate register. Write
> >corresponding value into that register.
> >
> >Co-developed-by: Marijn Suijten <marijn.suijten@somainline.org>
> >Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> >Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >---
> > drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 12 ++++++++++++
> > drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h |  2 ++
> > 2 files changed, 14 insertions(+)
> >
> >diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> >index 32ab33b314fc44e12ccb935c1695d2eea5c7d9b2..ffff60c4206c6f2833293fdcc56b653f7d3124a5 100644
> >--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> >+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> >@@ -583,6 +583,9 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
> > 	DPU_REG_WRITE(c, CTL_DSC_ACTIVE, dsc_active);
> > 	DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE, merge_3d_active);
> > 
> >+	if (cfg->intf_master)
> >+		DPU_REG_WRITE(c, CTL_INTF_MASTER, BIT(cfg->intf_master - INTF_0));
> >+
> > 	if (cfg->cdm)
> > 		DPU_REG_WRITE(c, CTL_CDM_ACTIVE, cfg->cdm);
> > }
> >@@ -625,6 +628,7 @@ static void dpu_hw_ctl_reset_intf_cfg_v1(struct dpu_hw_ctl *ctx,
> > {
> > 	struct dpu_hw_blk_reg_map *c = &ctx->hw;
> > 	u32 intf_active = 0;
> >+	u32 intf_master = 0;
> > 	u32 wb_active = 0;
> > 	u32 merge3d_active = 0;
> > 	u32 dsc_active;
> >@@ -651,6 +655,14 @@ static void dpu_hw_ctl_reset_intf_cfg_v1(struct dpu_hw_ctl *ctx,
> > 		intf_active = DPU_REG_READ(c, CTL_INTF_ACTIVE);
> > 		intf_active &= ~BIT(cfg->intf - INTF_0);
> > 		DPU_REG_WRITE(c, CTL_INTF_ACTIVE, intf_active);
> >+
> >+		intf_master = DPU_REG_READ(c, CTL_INTF_MASTER);
> >+
> >+		/* Unset this intf as master, if it is the current master */
> >+		if (intf_master == BIT(cfg->intf - INTF_0)) {
> >+			DPU_DEBUG_DRIVER("Unsetting INTF_%d master\n", cfg->intf - INTF_0);
> 
> Don't think you want to include my testing ramblings here: we didn't print a message either when the master was _set_, and don't print messages for other register writes either.

Okay, I'll drop it.

> 
> After that:
> 
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> 
> >+			DPU_REG_WRITE(c, CTL_INTF_MASTER, 0);
> >+		}
> > 	}
> > 
> > 	if (cfg->wb) {
> >diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> >index 85c6c835cc8780e6cb66f3a262d9897c91962935..e95989a2fdda6344d0cb9d3036e6ed22a0458675 100644
> >--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> >+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> >@@ -36,6 +36,7 @@ struct dpu_hw_stage_cfg {
> > /**
> >  * struct dpu_hw_intf_cfg :Describes how the DPU writes data to output interface
> >  * @intf :                 Interface id
> >+ * @intf_master:           Master interface id in the dual pipe topology
> 
> Not sure if you've seen my comment in v1 about the dual word; maybe the quadpipe series can update it since they might need a master (or two?) as well?

Yes, it should be updated by the quad-pipe series.

> 
> - Marijn
> 
> >  * @mode_3d:               3d mux configuration
> >  * @merge_3d:              3d merge block used
> >  * @intf_mode_sel:         Interface mode, cmd / vid
> >@@ -45,6 +46,7 @@ struct dpu_hw_stage_cfg {
> >  */
> > struct dpu_hw_intf_cfg {
> > 	enum dpu_intf intf;
> >+	enum dpu_intf intf_master;
> > 	enum dpu_wb wb;
> > 	enum dpu_3d_blend_mode mode_3d;
> > 	enum dpu_merge_3d merge_3d;
> >
> 

-- 
With best wishes
Dmitry
