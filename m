Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3AD39B2D3B
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 11:46:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 125CB10E46C;
	Mon, 28 Oct 2024 10:46:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xAXaQ+g+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B71A210E46C
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 10:46:14 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-539e4b7409fso4026421e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 03:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730112373; x=1730717173; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=CHj4nYgiHaKiW5aEYPKVHro023TFgtEOxg1MzyObDrg=;
 b=xAXaQ+g+8QxBHPK4iso2dQfb22RWk9qTmWst4CifypIYwPw5xOsCc9hoS43peoi/kF
 HUJzljo7J6+DcVyDyH++Qf37P/ooY4S9MGfjRj8M77WvqiwN7vtC805UUNkO74SmZfd+
 9kFkG1EINrLbVs/cZWiHKTRUI/gCvul3P5T1hQZ+PvTlAPpgfD9uo71emYdEtd4d9S38
 aYw+YXrgkz+QW0FaW42MjbiATt0DfTnXaBbzlsuWWrL/uoltraaDhhGapCazo4hSZdKV
 3ea1eO5viYFJI5VfFuw+8jdYJcpIpuxY+HVDIGvTxSkvQ9XNyvVQBehguIjrfSx5B6O0
 caLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730112373; x=1730717173;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CHj4nYgiHaKiW5aEYPKVHro023TFgtEOxg1MzyObDrg=;
 b=FwDDPJt8MfrfhzQMI4Ydo/TZEGswuLLQsp8jY+gfKx5M+R8dYm9N0bg7hVG0RBgTWX
 dKl4dF3sm8YG23kKnuSs5M8lTC5xy69waJVLUhIakXIcnpY5vl8r8JJPOAWaL0M9d7lD
 C6I/I6BFSuTV0wfmKw6qN7rAt5c+E4MdoOFgYkDE+2XnJgjbETyZKaHK88KzkSTCkPp/
 jzZPRGgG0ZE0DmcOQBrTXcfGInecPGw0S7hGV3czZ+pMU4MbRzLzgW8oXR2AAUr93vTV
 zCMJ35ZtzhHkFR7vTfwRyYKWSKOS17N6Abz9JBnKCvji3FgCQRcTKrO19qocCBxwvU9V
 mH4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXDOJFqEEvg4c2VyAne221TUs0j2pWunipateeTtLgk5FYneKSUzTJZ7b41/nnyjp+mZhsZmTdYCM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw7cwr6I3LnvB3sLVHbD6kPGciPv/3GMawELnY+JW5foq8dIsJD
 LBdk/zU5iduNxUYX1M6GadgmYWW0C+F7i30I3wptVknhcALuvFpB+6qI14WHKJA=
X-Google-Smtp-Source: AGHT+IHmdmeAg2Am8DAe8AvOhZdn+dyWxgaURYqcx9xeJb14r6Mw3+xvZqYxW/k7eyS8xGuqbReo7g==
X-Received: by 2002:a19:6a12:0:b0:539:fd75:2b6c with SMTP id
 2adb3069b0e04-53b2375231dmr3431313e87.21.1730112372556; 
 Mon, 28 Oct 2024 03:46:12 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53b2e1cbe9dsm1053140e87.225.2024.10.28.03.46.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2024 03:46:12 -0700 (PDT)
Date: Mon, 28 Oct 2024 12:46:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/9] drm/msm/dpu: move pstate->pipe initialization to
 dpu_plane_atomic_check
Message-ID: <jk4tfzg3zw4g23pg7rpre2pn32h6h46u2rc5ydnzuwo7mk3mam@ybw64lkaidyb>
References: <20241025-dpu-virtual-wide-v6-0-0310fd519765@linaro.org>
 <20241025-dpu-virtual-wide-v6-2-0310fd519765@linaro.org>
 <1dcf786e-463f-4e51-af71-66ee6077b5f1@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1dcf786e-463f-4e51-af71-66ee6077b5f1@quicinc.com>
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

On Fri, Oct 25, 2024 at 12:00:20PM -0700, Abhinav Kumar wrote:
> 
> 
> On 10/24/2024 5:20 PM, Dmitry Baryshkov wrote:
> > In preparation for virtualized planes support, move pstate->pipe
> > initialization from dpu_plane_reset() to dpu_plane_atomic_check(). In
> > case of virtual planes the plane's pipe will not be known up to the
> > point of atomic_check() callback.
> > 
> 
> I had R-bed this in v5. Did anything change in v6?

No, nothing. I'm sorry for forgetting to run `b4 trailers -u`.

> But one comment below.
> 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 25 +++++++++++--------------
> >   1 file changed, 11 insertions(+), 14 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > index 37faf5b238b0..725c9a5826fd 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > @@ -797,13 +797,22 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
> >   	uint32_t max_linewidth;
> >   	unsigned int rotation;
> >   	uint32_t supported_rotations;
> > -	const struct dpu_sspp_cfg *pipe_hw_caps = pstate->pipe.sspp->cap;
> > -	const struct dpu_sspp_sub_blks *sblk = pstate->pipe.sspp->cap->sblk;
> > +	const struct dpu_sspp_cfg *pipe_hw_caps;
> > +	const struct dpu_sspp_sub_blks *sblk;
> >   	if (new_plane_state->crtc)
> >   		crtc_state = drm_atomic_get_new_crtc_state(state,
> >   							   new_plane_state->crtc);
> > +	pipe->sspp = dpu_rm_get_sspp(&kms->rm, pdpu->pipe);
> > +	r_pipe->sspp = NULL;
> > +
> > +	if (!pipe->sspp)
> > +		return -EINVAL;
> > +
> > +	pipe_hw_caps = pipe->sspp->cap;
> > +	sblk = pipe->sspp->cap->sblk;
> > +
> >   	min_scale = FRAC_16_16(1, sblk->maxupscale);
> >   	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
> >   						  min_scale,
> 
> Do you think it will be better to move the get_sspp() call after the
> drm_atomic_helper_check_plane_state()?

I'd say, it makes no difference. I'll check your suggestion if I have to
send another iteration.

> 
> > @@ -820,7 +829,6 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
> >   	pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> >   	r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> >   	r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> > -	r_pipe->sspp = NULL;
> >   	pstate->stage = DPU_STAGE_0 + pstate->base.normalized_zpos;
> >   	if (pstate->stage >= pdpu->catalog->caps->max_mixer_blendstages) {
> > @@ -1286,7 +1294,6 @@ static void dpu_plane_reset(struct drm_plane *plane)
> >   {
> >   	struct dpu_plane *pdpu;
> >   	struct dpu_plane_state *pstate;
> > -	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
> >   	if (!plane) {
> >   		DPU_ERROR("invalid plane\n");
> > @@ -1308,16 +1315,6 @@ static void dpu_plane_reset(struct drm_plane *plane)
> >   		return;
> >   	}
> > -	/*
> > -	 * Set the SSPP here until we have proper virtualized DPU planes.
> > -	 * This is the place where the state is allocated, so fill it fully.
> > -	 */
> > -	pstate->pipe.sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
> > -	pstate->pipe.multirect_index = DPU_SSPP_RECT_SOLO;
> > -	pstate->pipe.multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> > -
> > -	pstate->r_pipe.sspp = NULL;
> > -
> >   	__drm_atomic_helper_plane_reset(plane, &pstate->base);
> >   }
> > 

-- 
With best wishes
Dmitry
