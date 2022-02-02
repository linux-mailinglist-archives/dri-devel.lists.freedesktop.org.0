Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9CC4A74D1
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 16:42:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3811910E2B2;
	Wed,  2 Feb 2022 15:42:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7968E10E2B2;
 Wed,  2 Feb 2022 15:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643816521; x=1675352521;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=RRxuGMyhQezsIkddpgdMjoLa5KpXNjNzTvpn8stusQ0=;
 b=MM58rbk0XNHwxDfTRRK6MTlUODmHacDCNltHpgE0rZw1Pj9Qv7RU29dm
 YbfPIHceXYsI13z86w7WODMa0lBPJa66wZYp/RCkn/bGQdbYyqbEh7xJZ
 ptchvgj20onjKO6sihb25FsmA0QHsuY0DkuYjwOo3CLY1XIQl4IWauObp
 o24vSQAe5V/sqnkIuMQQYbgwatDDmsVQvLdPAhaaelXQvBuO7ljrX93AY
 3fZbBPxtza1czqL5UzId1EsbrZueX0dM+Y70r4m0IRpmbRGEERDvCDkAp
 kjoEqcYPAoMdWQ9y2RBP3im0PNRJX2sBHobKWXNjQlXlrxJOG1poGogmz Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10245"; a="334302015"
X-IronPort-AV: E=Sophos;i="5.88,337,1635231600"; d="scan'208";a="334302015"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2022 07:38:07 -0800
X-IronPort-AV: E=Sophos;i="5.88,337,1635231600"; d="scan'208";a="599593021"
Received: from markeyp-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.6.210])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2022 07:38:03 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 5/6] drm/rcar_du: changes to rcar-du driver resulting
 from drm_writeback_connector structure changes
In-Reply-To: <YfqGbqQQz5vrDaLI@pendragon.ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220202085429.22261-1-suraj.kandpal@intel.com>
 <20220202085429.22261-6-suraj.kandpal@intel.com>
 <Yfp8Q6OFqTAvESOi@pendragon.ideasonboard.com> <87y22ts948.fsf@intel.com>
 <YfqGbqQQz5vrDaLI@pendragon.ideasonboard.com>
Date: Wed, 02 Feb 2022 17:38:00 +0200
Message-ID: <87v8xxs2hz.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Kandpal Suraj <suraj.kandpal@intel.com>, carsten.haitzler@arm.com,
 intel-gfx@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, dmitry.baryshkov@linaro.org,
 arun.r.murthy@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 02 Feb 2022, Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
> Hi Jani,
>
> On Wed, Feb 02, 2022 at 03:15:03PM +0200, Jani Nikula wrote:
>> On Wed, 02 Feb 2022, Laurent Pinchart wrote:
>> > On Wed, Feb 02, 2022 at 02:24:28PM +0530, Kandpal Suraj wrote:
>> >> Changing rcar_du driver to accomadate the change of
>> >> drm_writeback_connector.base and drm_writeback_connector.encoder
>> >> to a pointer the reason for which is explained in the
>> >> Patch(drm: add writeback pointers to drm_connector).
>> >> 
>> >> Signed-off-by: Kandpal Suraj <suraj.kandpal@intel.com>
>> >> ---
>> >>  drivers/gpu/drm/rcar-du/rcar_du_crtc.h      | 2 ++
>> >>  drivers/gpu/drm/rcar-du/rcar_du_writeback.c | 8 +++++---
>> >>  2 files changed, 7 insertions(+), 3 deletions(-)
>> >> 
>> >> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
>> >> index 66e8839db708..68f387a04502 100644
>> >> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
>> >> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
>> >> @@ -72,6 +72,8 @@ struct rcar_du_crtc {
>> >>  	const char *const *sources;
>> >>  	unsigned int sources_count;
>> >>  
>> >> +	struct drm_connector connector;
>> >> +	struct drm_encoder encoder;
>> >
>> > Those fields are, at best, poorly named. Furthermore, there's no need in
>> > this driver or in other drivers using drm_writeback_connector to create
>> > an encoder or connector manually. Let's not polute all drivers because
>> > i915 doesn't have its abstractions right.
>> 
>> i915 uses the quite common model for struct inheritance:
>> 
>> 	struct intel_connector {
>> 		struct drm_connector base;
>> 		/* ... */
>> 	}
>> 
>> Same with at least amd, ast, fsl-dcu, hisilicon, mga200, msm, nouveau,
>> radeon, tilcdc, and vboxvideo.
>> 
>> We could argue about the relative merits of that abstraction, but I
>> think the bottom line is that it's popular and the drivers using it are
>> not going to be persuaded to move away from it.
>
> Nobody said inheritance is bad.
>
>> It's no coincidence that the drivers who've implemented writeback so far
>> (komeda, mali, rcar-du, vc4, and vkms) do not use the abstraction,
>> because the drm_writeback_connector midlayer does, forcing the issue.
>
> Are you sure it's not a coincidence ? :-)
>
> The encoder and especially connector created by drm_writeback_connector
> are there only because KMS requires a drm_encoder and a drm_connector to
> be exposed to userspace (and I could argue that using a connector for
> writeback is a hack, but that won't change). The connector is "virtual",
> I still fail to see why i915 or any other driver would need to wrap it
> into something else. The whole point of the drm_writeback_connector
> abstraction is that drivers do not have to manage the writeback
> drm_connector manually, they shouldn't touch it at all.

The thing is, drm_writeback_connector_init() calling
drm_connector_init() on the drm_connector embedded in
drm_writeback_connector leads to that connector being added to the
drm_device's list of connectors. Ditto for the encoder.

All the driver code that handles drm_connectors would need to take into
account they might not be embedded in intel_connector. Throughout the
driver. Ditto for the encoders.

The point is, you can't initialize a connector or an encoder for a
drm_device in isolation of the rest of the driver, even if it were
supposed to be hidden away.

BR,
Jani.

>
>> So I think drm_writeback_connector should *not* use the inheritance
>> abstraction because it's a midlayer that should leave that option to the
>> drivers. I think drm_writeback_connector needs to be changed to
>> accommodate that, and, unfortunately, it means current writeback users
>> need to be changed as well.
>> 
>> I am not sure, however, if the series at hand is the right
>> approach. Perhaps writeback can be modified to allocate the stuff for
>> you if you prefer it that way, as long as the drm_connector is not
>> embedded in struct drm_writeback_connector.
>> 
>> > Nack.
>> >
>> >>  	struct drm_writeback_connector writeback;
>> >>  };
>> >>  
>> >> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_writeback.c b/drivers/gpu/drm/rcar-du/rcar_du_writeback.c
>> >> index c79d1259e49b..5b1e83380c47 100644
>> >> --- a/drivers/gpu/drm/rcar-du/rcar_du_writeback.c
>> >> +++ b/drivers/gpu/drm/rcar-du/rcar_du_writeback.c
>> >> @@ -200,8 +200,10 @@ int rcar_du_writeback_init(struct rcar_du_device *rcdu,
>> >>  {
>> >>  	struct drm_writeback_connector *wb_conn = &rcrtc->writeback;
>> >>  
>> >> -	wb_conn->encoder.possible_crtcs = 1 << drm_crtc_index(&rcrtc->crtc);
>> >> -	drm_connector_helper_add(&wb_conn->base,
>> >> +	wb_conn->base = &rcrtc->connector;
>> >> +	wb_conn->encoder = &rcrtc->encoder;
>> >> +	wb_conn->encoder->possible_crtcs = 1 << drm_crtc_index(&rcrtc->crtc);
>> >> +	drm_connector_helper_add(wb_conn->base,
>> >>  				 &rcar_du_wb_conn_helper_funcs);
>> >>  
>> >>  	return drm_writeback_connector_init(&rcdu->ddev, wb_conn,
>> >> @@ -220,7 +222,7 @@ void rcar_du_writeback_setup(struct rcar_du_crtc *rcrtc,
>> >>  	struct drm_framebuffer *fb;
>> >>  	unsigned int i;
>> >>  
>> >> -	state = rcrtc->writeback.base.state;
>> >> +	state = rcrtc->writeback.base->state;
>> >>  	if (!state || !state->writeback_job)
>> >>  		return;
>> >>  

-- 
Jani Nikula, Intel Open Source Graphics Center
