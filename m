Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2785F4B3B
	for <lists+dri-devel@lfdr.de>; Tue,  4 Oct 2022 23:58:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FA4510E195;
	Tue,  4 Oct 2022 21:57:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E901910E128
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Oct 2022 21:57:48 +0000 (UTC)
Received: from SoMainline.org (94-209-172-39.cable.dynamic.v4.ziggo.nl
 [94.209.172.39])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 3A869200F1;
 Tue,  4 Oct 2022 23:57:46 +0200 (CEST)
Date: Tue, 4 Oct 2022 23:57:45 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH 5/5] drm/dsc: Prevent negative BPG offsets from shadowing
 adjacent bitfields
Message-ID: <20221004215745.zdfvulqx4exlujgk@SoMainline.org>
Mail-Followup-To: Marijn Suijten <marijn.suijten@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vinod Koul <vkoul@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Douglas Anderson <dianders@chromium.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Lyude Paul <lyude@redhat.com>
References: <20221001190807.358691-1-marijn.suijten@somainline.org>
 <20221001190807.358691-6-marijn.suijten@somainline.org>
 <55d7e20b-79cd-ece6-b643-8b542beb7474@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55d7e20b-79cd-ece6-b643-8b542beb7474@quicinc.com>
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
Cc: David Airlie <airlied@linux.ie>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 phone-devel@vger.kernel.org, Javier Martinez Canillas <javierm@redhat.com>,
 linux-arm-msm@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, Vinod Koul <vkoul@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-10-04 13:22:25, Abhinav Kumar wrote:
> 
> On 10/1/2022 12:08 PM, Marijn Suijten wrote:
> > msm's dsi_host specifies negative BPG offsets which fill the full 8 bits
> > of a char thanks to two's complement: this however results in those bits
> > bleeding into the next parameter when the field is only expected to
> > contain 6-bit wide values.
> > As a consequence random slices appear corrupted on-screen (tested on a
> > Sony Tama Akatsuki device with sdm845).
> > 
> > Use AND operators to limit all values that constitute the RC Range
> > parameter fields to their expected size.
> > 
> > Fixes: b9080324d6ca ("drm/msm/dsi: add support for dsc data")
> > Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> > ---
> >   drivers/gpu/drm/display/drm_dsc_helper.c | 6 +++---
> >   1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/display/drm_dsc_helper.c b/drivers/gpu/drm/display/drm_dsc_helper.c
> > index c869c6e51e2b..2e7ef242685d 100644
> > --- a/drivers/gpu/drm/display/drm_dsc_helper.c
> > +++ b/drivers/gpu/drm/display/drm_dsc_helper.c
> > @@ -243,11 +243,11 @@ void drm_dsc_pps_payload_pack(struct drm_dsc_picture_parameter_set *pps_payload,
> >   	 */
> >   	for (i = 0; i < DSC_NUM_BUF_RANGES; i++) {
> >   		pps_payload->rc_range_parameters[i] =
> > -			cpu_to_be16((dsc_cfg->rc_range_params[i].range_min_qp <<
> > +			cpu_to_be16(((dsc_cfg->rc_range_params[i].range_min_qp & 0x1f) <<
> >   				     DSC_PPS_RC_RANGE_MINQP_SHIFT) |
> > -				    (dsc_cfg->rc_range_params[i].range_max_qp <<
> > +				    ((dsc_cfg->rc_range_params[i].range_max_qp & 0x1f) <<
> >   				     DSC_PPS_RC_RANGE_MAXQP_SHIFT) |
> > -				    (dsc_cfg->rc_range_params[i].range_bpg_offset));
> > +				    (dsc_cfg->rc_range_params[i].range_bpg_offset & 0x3f));
> >   	}
> >   
> 
> Looking at some examples of this for other vendors, they have managed to 
> limit the value to 6 bits in their drivers:
> 
> https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/i915/display/intel_vdsc.c#L532
> 
> https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/amd/display/dc/dsc/rc_calc_dpi.c#L87
> 
> Perhaps, msm should do the same thing instead of the helper change.

Thanks, I should have done my due-diligence and look up how other
drivers dealt with this, but wasn't immediately expecting negative
values elsewhere.

Alas, as explained in the cover letter I opted to perform the masking in
the PPS packing code as the DSC block code also reads these values, and
would suddenly write 6-bit intead of 8-bit values to the
DSC_RANGE_BPG_OFFSET registers.  Quick testing on the mentioned sdm845
platform shows no regressions, but I'm not sure if that's safe to rely
on?

> If you want to move to helper, other drivers need to be changed too to 
> remove duplicate & 0x3f.

Sure, we only have to confirm whether those drivers also read back the
value(s) in rc_range_params, and expect / allow this to be 8 instead of
6 bits.

> FWIW, this too has already been fixed in the latest downstream driver too.

What is this supposed to mean?  Is there a downstream DPU project that
has pending patches needing to be upstreamed?  Or is the downstream SDE,
techpack/display, or whatever it is called nowadays, slowly using more
DRM structs like drm_dsc_config and this drm_dsc_pps_payload_pack()
helper function as pointed out in an earlier mail?

Offtopic: are SDE and DPU growing closer together, hopefully achieving
feature parity allowing the SDE project to be dropped in favour of a
fully upstreamed DPU driver for day-one out-of-the-box mainline support
for new SoCs (as long as work is published and on its way upstream)?

- Marijn
