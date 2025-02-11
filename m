Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 526B5A306DC
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 10:24:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E24D910E488;
	Tue, 11 Feb 2025 09:23:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [5.144.164.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73DFF10E46C;
 Tue, 11 Feb 2025 09:23:57 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits)
 server-digest SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id B596D20113;
 Tue, 11 Feb 2025 10:23:55 +0100 (CET)
Date: Tue, 11 Feb 2025 10:23:54 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Ethan Carter Edwards <ethan@ethancedwards.com>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dpu: Fix uninitialized variable
Message-ID: <zj7sqsg3ruev4akl5paedsg65qyh53iddqvssrye2pjtfofs3q@u4g3kevpl2jn>
References: <20250209-dpu-v2-1-114dfd4ebefd@ethancedwards.com>
 <8e40c1bf-6da7-46b1-925c-53d1fa25f3ce@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e40c1bf-6da7-46b1-925c-53d1fa25f3ce@quicinc.com>
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

On 2025-02-10 14:14:14, Abhinav Kumar wrote:
> 
> 
> On 2/9/2025 7:51 PM, Ethan Carter Edwards wrote:
> > There is a possibility for an uninitialized *ret* variable to be
> > returned in some code paths.
> > 
> > Fix this by initializing *ret* to 0.
> > 
> > Addresses-Coverity-ID: 1642546 ("Uninitialized scalar variable")
> > Fixes: 774bcfb731765d ("drm/msm/dpu: add support for virtual planes")
> > Signed-off-by: Ethan Carter Edwards <ethan@ethancedwards.com>
> > ---
> > Changes in v2:
> > - Return explicit 0 when no error occurs
> > - Add hardening mailing lists
> > - Link to v1: https://lore.kernel.org/r/20250209-dpu-v1-1-0db666884f70@ethancedwards.com
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 7 +++----
> >   1 file changed, 3 insertions(+), 4 deletions(-)
> > 
> 
> Thanks for your patch, this was addressed with
> 
> https://patchwork.freedesktop.org/patch/631567/ but since this is better 
> I am fine with this, will pick this one up

The `return 0;` in this patch should certainly fix this issue entirely and we
don't need to inline the `int ret` for that, which I think is against mixed
declaration rules anyway?

As far as I understand that's what Dmitry suggested in v1, but he r-b'd it in
this form.  Dmitry, was that intended?

- Marijn

> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > index 098abc2c0003cde90ce6219c97ee18fa055a92a5..af3e541f60c303eb5212524e877129359b5ca98c 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > @@ -1164,7 +1164,6 @@ int dpu_assign_plane_resources(struct dpu_global_state *global_state,
> >   			       unsigned int num_planes)
> >   {
> >   	unsigned int i;
> > -	int ret;
> >   
> >   	for (i = 0; i < num_planes; i++) {
> >   		struct drm_plane_state *plane_state = states[i];
> > @@ -1173,13 +1172,13 @@ int dpu_assign_plane_resources(struct dpu_global_state *global_state,
> >   		    !plane_state->visible)
> >   			continue;
> >   
> > -		ret = dpu_plane_virtual_assign_resources(crtc, global_state,
> > +		int ret = dpu_plane_virtual_assign_resources(crtc, global_state,
> >   							 state, plane_state);
> >   		if (ret)
> > -			break;
> > +			return ret;
> >   	}
> >   
> > -	return ret;
> > +	return 0;
> >   }
> >   
> >   static void dpu_plane_flush_csc(struct dpu_plane *pdpu, struct dpu_sw_pipe *pipe)
> > 
> > ---
> > base-commit: a64dcfb451e254085a7daee5fe51bf22959d52d3
> > change-id: 20250209-dpu-c3fac78fc617
> > 
> > Best regards,
> 
