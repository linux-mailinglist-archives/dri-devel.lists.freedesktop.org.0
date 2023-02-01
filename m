Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B39F368699D
	for <lists+dri-devel@lfdr.de>; Wed,  1 Feb 2023 16:10:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4310D10E408;
	Wed,  1 Feb 2023 15:10:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [5.144.164.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3AFF10E0BC
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Feb 2023 15:10:42 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 944051F8F0;
 Wed,  1 Feb 2023 16:10:39 +0100 (CET)
Date: Wed, 1 Feb 2023 16:10:37 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [v1 2/3] drm/msm/disp/dpu1: add dspps into reservation if there
 is a ctm request
Message-ID: <20230201151037.sm3ai2bgw35e6aar@SoMainline.org>
References: <1675092092-26412-1-git-send-email-quic_kalyant@quicinc.com>
 <1675092092-26412-3-git-send-email-quic_kalyant@quicinc.com>
 <20230201111604.htgczy6yvdkywhvl@SoMainline.org>
 <38466a0f-686d-ab19-2669-e81ca6d6ec17@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <38466a0f-686d-ab19-2669-e81ca6d6ec17@linaro.org>
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
Cc: Kalyan Thota <quic_kalyant@quicinc.com>, devicetree@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-arm-msm@vger.kernel.org, swboyd@chromium.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dianders@chromium.org, robdclark@chromium.org, freedreno@lists.freedesktop.org,
 quic_vpolimer@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-02-01 15:48:02, Dmitry Baryshkov wrote:
> On 01/02/2023 13:16, Marijn Suijten wrote:
> > On 2023-01-30 07:21:31, Kalyan Thota wrote:
> >> Add dspp blocks into the topology for reservation, if there is a ctm
> >> request for that composition.
> > 
> > DSPP
> > 
> >> Changes in v1:
> >> - Minor nits (Dmitry)
> > 
> > This should go below the triple dashes, so that it /does not/ become
> > part of the patch/commit that is applied to the tree (where review
> > history is irrelevant as it can be searched for separately).
> 
> This is one of DRM peculiarities which we have to live with.

Not sure I follow.  Keeping "changes since vXX" out of commit messages
seems to be a kernel-wide convention, after all the title doesn't
include which revision of the patch ended up being applied to the tree
either.  Having the changelog checked in to the tree has no relevance.

> >> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
> >> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >> ---
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 13 ++++++-------
> >>   1 file changed, 6 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> index 9c6817b..3bd46b4 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> @@ -545,7 +545,8 @@ bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
> >>   static struct msm_display_topology dpu_encoder_get_topology(
> >>   			struct dpu_encoder_virt *dpu_enc,
> >>   			struct dpu_kms *dpu_kms,
> >> -			struct drm_display_mode *mode)
> >> +			struct drm_display_mode *mode,
> >> +			struct drm_crtc_state *crtc_state)
> >>   {
> >>   	struct msm_display_topology topology = {0};
> >>   	int i, intf_count = 0;
> >> @@ -573,11 +574,9 @@ static struct msm_display_topology dpu_encoder_get_topology(
> >>   	else
> >>   		topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
> >>   
> >> -	if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI) {
> >> -		if (dpu_kms->catalog->dspp &&
> >> -			(dpu_kms->catalog->dspp_count >= topology.num_lm))
> >> -			topology.num_dspp = topology.num_lm;
> >> -	}
> >> +	if (dpu_kms->catalog->dspp &&
> >> +	    crtc_state->ctm && (dpu_kms->catalog->dspp_count >= topology.num_lm))
> > 
> > Multiline-if-clause is typically indented with two tabs, not a half tab
> > (4 spaces).
> 
> I tend to disagree here. Lately I have mostly seen it being indented to 
> the opening parenthesis, so that nested statements also indent nicely.

Ack, hence double-checked in a followup message; there's no concistency
in dpu1 now but I agree that for ts=8 a 4-space-indented wraparound
neatly aligns with the expression on the first line /and/ prevents
inadvertently aligning with the conditional body on the next line.

Will fix up in my own series too, thanks!

> > Nit: swap the && here?  dspp and dspp_count are related, so check ctm
> > first or last but not in the middle - makes reading easier.
> 
> I think we can ignore dpu_kms->catalog->dspp completely. checking 
> dspp_count should be enough for the purpose of the check (and note, the 
> check for dspp/dspp_count is misleading and should be omitted).

Ack, thanks!

- Marijn
