Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B8C7AECFC
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 14:38:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A1E010E3C3;
	Tue, 26 Sep 2023 12:38:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8717F10E3C2;
 Tue, 26 Sep 2023 12:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OYOYgjPeYmq+DBmY0mWHAyiWarbRtpm1hDJfxevpjpg=; b=hccWc1vCqIYDvTcr7sliQK+BoK
 XcBGqzBVMtNPMKl/qEKgMyJnUeEtZQOmj/p6uf9ynWALMneWGSx8EhGtxNrGGjbxr0YsUn7j5Czq8
 OArvpJ6Xxu6OisWE820qj+7NhdAYrlUnifoW/DXR79RlSF4R2HHvZB9C7etnvAlAIaKfTvHpv/5NW
 UnsxJCeB+C/BwrBQGF6JFlbq7UiTe4v2LVOfdmJk3ApEwqkR7SIQKIMbj1VKKjWBBSY0R8ay+JkRV
 iGRuzIrTF45m8AVuzf/ur4m9N720OU8Uaow7foxX9fpS2MxgjzgbZ7AlW7x4L2cmoeTw6VbgCPjYW
 wCg5tBQw==;
Received: from [102.213.205.115] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1ql7KH-008Vrm-Ue; Tue, 26 Sep 2023 14:38:06 +0200
Date: Tue, 26 Sep 2023 11:38:01 -0100
From: Melissa Wen <mwen@igalia.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [RFC PATCH v2 3/5] drm/amd/display: create DCN3-specific log for
 MPC state
Message-ID: <20230926123729.d4j3rgmxa6bgnddk@mail.igalia.com>
References: <20230913164329.123687-1-mwen@igalia.com>
 <20230913164329.123687-4-mwen@igalia.com>
 <c5004296-7f2b-4433-a81c-65d5672403c1@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c5004296-7f2b-4433-a81c-65d5672403c1@amd.com>
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
Cc: Krunoslav Kovac <krunoslav.kovac@amd.com>, kernel-dev@igalia.com,
 Shashank Sharma <Shashank.Sharma@amd.com>, sunpeng.li@amd.com,
 Xinhui.Pan@amd.com, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 amd-gfx@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/25, Harry Wentland wrote:
> 
> 
> On 2023-09-13 12:43, Melissa Wen wrote:
> > Logging DCN3 MPC state was following DCN1 implementation that doesn't
> > consider new DCN3 MPC color blocks. Create new elements according to
> > DCN3 MPC color caps and a new DCN3-specific function for reading MPC
> > data.
> > 
> > Signed-off-by: Melissa Wen <mwen@igalia.com>
> > ---
> >  .../gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c  | 55 ++++++++++++++++++-
> >  drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h   | 13 +++++
> >  2 files changed, 67 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c
> > index d1500b223858..d164fbf89212 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c
> > +++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c
> > @@ -1382,8 +1382,61 @@ static void mpc3_set_mpc_mem_lp_mode(struct mpc *mpc)
> >  	}
> >  }
> >  
> > +static void mpc3_read_mpcc_state(
> > +		struct mpc *mpc,
> > +		int mpcc_inst,
> > +		struct mpcc_state *s)
> > +{
> > +	struct dcn30_mpc *mpc30 = TO_DCN30_MPC(mpc);
> > +	uint32_t rmu_status = 0xf;
> > +
> > +	REG_GET(MPCC_OPP_ID[mpcc_inst], MPCC_OPP_ID, &s->opp_id);
> > +	REG_GET(MPCC_TOP_SEL[mpcc_inst], MPCC_TOP_SEL, &s->dpp_id);
> > +	REG_GET(MPCC_BOT_SEL[mpcc_inst], MPCC_BOT_SEL, &s->bot_mpcc_id);
> > +	REG_GET_4(MPCC_CONTROL[mpcc_inst], MPCC_MODE, &s->mode,
> > +			MPCC_ALPHA_BLND_MODE, &s->alpha_mode,
> > +			MPCC_ALPHA_MULTIPLIED_MODE, &s->pre_multiplied_alpha,
> > +			MPCC_BLND_ACTIVE_OVERLAP_ONLY, &s->overlap_only);
> > +	REG_GET_2(MPCC_STATUS[mpcc_inst], MPCC_IDLE, &s->idle,
> > +			MPCC_BUSY, &s->busy);
> > +
> > +	/* Color blocks state */
> > +	REG_GET(MPC_RMU_CONTROL, MPC_RMU0_MUX_STATUS, &rmu_status);
> > +	if (rmu_status == mpcc_inst) {
> > +		REG_GET(SHAPER_CONTROL[0],
> > +			MPC_RMU_SHAPER_LUT_MODE_CURRENT, &s->shaper_lut_mode);
> > +		REG_GET(RMU_3DLUT_MODE[0],
> > +			MPC_RMU_3DLUT_MODE_CURRENT,  &s->lut3d_mode);
> > +		REG_GET(RMU_3DLUT_READ_WRITE_CONTROL[0],
> > +			MPC_RMU_3DLUT_30BIT_EN, &s->lut3d_bit_depth);
> > +		REG_GET(RMU_3DLUT_MODE[0],
> > +			MPC_RMU_3DLUT_SIZE, &s->lut3d_size);
> > +	} else {
> > +		REG_GET(SHAPER_CONTROL[1],
> > +			MPC_RMU_SHAPER_LUT_MODE_CURRENT, &s->shaper_lut_mode);
> > +		REG_GET(RMU_3DLUT_MODE[1],
> > +			MPC_RMU_3DLUT_MODE_CURRENT,  &s->lut3d_mode);
> > +		REG_GET(RMU_3DLUT_READ_WRITE_CONTROL[1],
> > +			MPC_RMU_3DLUT_30BIT_EN, &s->lut3d_bit_depth);
> > +		REG_GET(RMU_3DLUT_MODE[1],
> > +			MPC_RMU_3DLUT_SIZE, &s->lut3d_size);
> > +	}
> > +         REG_GET_2(MPCC_OGAM_CONTROL[mpcc_inst],
> > +		   MPCC_OGAM_MODE_CURRENT, &s->rgam_mode,
> > +		   MPCC_OGAM_SELECT_CURRENT, &s->rgam_lut);
> > +	REG_GET(MPCC_GAMUT_REMAP_MODE[mpcc_inst],
> > +		MPCC_GAMUT_REMAP_MODE_CURRENT, &s->gamut_remap_mode);
> > +	if (s->gamut_remap_mode == 1) {
> > +		s->gamut_remap_c11_c12 = REG_READ(MPC_GAMUT_REMAP_C11_C12_A[mpcc_inst]);
> > +		s->gamut_remap_c33_c34 = REG_READ(MPC_GAMUT_REMAP_C33_C34_A[mpcc_inst]);
> > +	} else if (s->gamut_remap_mode == 2) {
> > +		s->gamut_remap_c11_c12 = REG_READ(MPC_GAMUT_REMAP_C11_C12_B[mpcc_inst]);
> > +		s->gamut_remap_c33_c34 = REG_READ(MPC_GAMUT_REMAP_C33_C34_B[mpcc_inst]);
> 
> Any reason we're getting (and printing) only the first and last
> coefficients? Is it to avoid printing lines that are too wide?

I'm unable to reach the other coefficients through this
`MPC_GAMUT_REMAP` register prefix. But I'm probably missing something
since I can see the registers using UMR. I'll try to find the right path
and update it.

Melissa

> 
> Harry
> 
> > +	}
> > +}
> > +
> >  static const struct mpc_funcs dcn30_mpc_funcs = {
> > -	.read_mpcc_state = mpc1_read_mpcc_state,
> > +	.read_mpcc_state = mpc3_read_mpcc_state,
> >  	.insert_plane = mpc1_insert_plane,
> >  	.remove_mpcc = mpc1_remove_mpcc,
> >  	.mpc_init = mpc1_mpc_init,
> > diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h b/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
> > index 8d86159d9de0..e60b3503605b 100644
> > --- a/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
> > +++ b/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
> > @@ -193,6 +193,19 @@ struct mpcc_state {
> >  	uint32_t overlap_only;
> >  	uint32_t idle;
> >  	uint32_t busy;
> > +	uint32_t shaper_lut_mode;
> > +	uint32_t lut3d_mode;
> > +	uint32_t lut3d_bit_depth;
> > +	uint32_t lut3d_size;
> > +	uint32_t rgam_mode;
> > +	uint32_t rgam_lut;
> > +	uint32_t gamut_remap_mode;
> > +	uint32_t gamut_remap_c11_c12;
> > +	uint32_t gamut_remap_c13_c14;
> > +	uint32_t gamut_remap_c21_c22;
> > +	uint32_t gamut_remap_c23_c24;
> > +	uint32_t gamut_remap_c31_c32;
> > +	uint32_t gamut_remap_c33_c34;
> >  };
> >  
> >  /**
> 
