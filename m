Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCFCA5CAD6
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 17:29:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0927810E210;
	Tue, 11 Mar 2025 16:29:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DGihK8Rw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7025610E1EE;
 Tue, 11 Mar 2025 16:28:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0CA685C6802;
 Tue, 11 Mar 2025 16:26:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEE5AC4CEE9;
 Tue, 11 Mar 2025 16:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741710537;
 bh=8OMFcL17uY6gRsTtXxJDcoNAW0nxjeHevA06z8Dqk8c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DGihK8RwnXcf3DnbbaIW/U/FdSBz92bwToI+TYJyMCBQPfDWDeKNjt1OK52W+W+x5
 9Wel/gkGxvsan8B5WywVcuX/uw/fOOzDF1ivuAxc+p6V1r0Ik+jxE/be3wJm+JmikA
 tB2l76Cj8LiTXcWVwUAPr024J3qDTybb034auXx1KqHXlnE/A4zo8z7XZy+zwwJrWf
 ow9nBgOUT3Mu94FZ/DJ4WErLdwpEUn/oRHgLLzU9wi9H8lghTRqOFLVco/zIlF9zOu
 lNnzLt/5axCkugPxNwGQIEXcHArQPZo98Zik5rg0Aw4GfXRYLhPTDe/Iyhu3wZ/3uZ
 D1kV980Lv+utg==
Date: Tue, 11 Mar 2025 18:28:50 +0200
From: Dmitry Baryshkov <lumag@kernel.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 3/4] drm/vc4: use new helper to get ACR values
Message-ID: <wass63nz24l4h3umszsyptb5bnkny4h2wmnbeunjrdfhyacl4l@w6emq2ipt552>
References: <20250309-drm-hdmi-acr-v1-0-bb9c242f4d4b@linaro.org>
 <20250309-drm-hdmi-acr-v1-3-bb9c242f4d4b@linaro.org>
 <20250310-invisible-married-firefly-945c84@houat>
 <esgb42dyhpjixm62tfk2nfzdiygnfn4bcwq4zn7rhydmt4np2q@7v77p7kveb4e>
 <20250311-intrepid-obedient-lizard-64ad2c@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311-intrepid-obedient-lizard-64ad2c@houat>
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

On Tue, Mar 11, 2025 at 09:07:10AM +0100, Maxime Ripard wrote:
> On Mon, Mar 10, 2025 at 10:18:04PM +0200, Dmitry Baryshkov wrote:
> > On Mon, Mar 10, 2025 at 03:51:53PM +0100, Maxime Ripard wrote:
> > > On Sun, Mar 09, 2025 at 10:13:58AM +0200, Dmitry Baryshkov wrote:
> > > > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > 
> > > > Use drm_hdmi_acr_get_n_cts() helper instead of calculating N and CTS
> > > > values in the VC4 driver.
> > > > 
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > ---
> > > >  drivers/gpu/drm/vc4/vc4_hdmi.c | 10 +++-------
> > > >  drivers/gpu/drm/vc4/vc4_hdmi.h |  7 +++++++
> > > >  2 files changed, 10 insertions(+), 7 deletions(-)
> > > > 
> > 
> > > > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
> > > > index e3d989ca302b72533c374dfa3fd0d5bd7fe64a82..0a775dbfe99d45521f3d0a2016555aefa81d7934 100644
> > > > --- a/drivers/gpu/drm/vc4/vc4_hdmi.h
> > > > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
> > > > @@ -211,6 +211,13 @@ struct vc4_hdmi {
> > > >  	 * KMS hooks. Protected by @mutex.
> > > >  	 */
> > > >  	enum hdmi_colorspace output_format;
> > > > +
> > > > +	/**
> > > > +	 * @tmds_char_rate: Copy of
> > > > +	 * @drm_connector_state.hdmi.tmds_char_rate for use outside of
> > > > +	 * KMS hooks. Protected by @mutex.
> > > > +	 */
> > > > +	unsigned long long tmds_char_rate;
> > > >  };
> > > 
> > > This should be in drm_connector_hdmi if it's useful
> > 
> > That would mean bringing the state to a non-state structure on the
> > framework level. Is it fine from your POV?
> 
> Sorry, I'm changing my mind a little bit, but it's pretty much the same
> case than for accessing the infoframes from debugfs: we want to get some
> information stored in the state from outside of KMS.
> 
> What we did for the infoframes is that we're actually just taking the
> connection_mutex from the DRM device and access the drm_connector->state
> pointer.
> 
> I guess it would also work for ALSA?

I'd really prefer to follow the drm_connector.infoframes.audio. It makes
sense to group all ALSA-related functionality together. Maybe I should
refactor it to:

struct drm_connector {
    struct {
	struct mutex lock;
	struct drm_connector_hdmi_infoframe audio_infoframe;
	unsigned long long tmds_char_rate;
    } audio;
};

WDYT? If that doesn't sound appealing, I'll go the connetion_mutex and
drm_connector_state way.

-- 
With best wishes
Dmitry
