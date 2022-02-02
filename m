Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 862274A7508
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 16:57:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8EC910E29E;
	Wed,  2 Feb 2022 15:57:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9921A10E28D;
 Wed,  2 Feb 2022 15:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643817433; x=1675353433;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=jAXhg14qnw81vPdm3O9bsJwxg2CEblQcNAg2SR23+Pk=;
 b=Fl/kCu/RIqYPJx21+kM3aPVKwy5MnKvg9cfI+L0AvC3KETluTFYEB4ST
 NdaXRmu9KMWVU3VdfS4aaiCB60rYb5cIkhLy6F0lZXceyasqxUiwKo+vV
 2dCufhBINg33zfJntKIG/zo91qWfBOOmSkB9/SOAul6YFmVEzgaD757dv
 rqkH1Ln5/Lxxdu76n327GSrQpnrNY+0PnRKe7UvcTOiG//gG3m8ewmN/A
 gH+Am4HYCMMiAvG5bDlAIc+X1scCDNqLoWiUeYx+ufRGnIpIZ5XGoK+zE
 xuKB9CJ/yJOYnPA2a0K8sUzSVqjwLW9aeNYVU/IsJTne3W9PDYf6WXus7 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10245"; a="334305865"
X-IronPort-AV: E=Sophos;i="5.88,337,1635231600"; d="scan'208";a="334305865"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2022 07:57:13 -0800
X-IronPort-AV: E=Sophos;i="5.88,337,1635231600"; d="scan'208";a="482868426"
Received: from markeyp-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.6.210])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2022 07:57:09 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 5/6] drm/rcar_du: changes to rcar-du driver resulting
 from drm_writeback_connector structure changes
In-Reply-To: <CAA8EJprrhPtDkWRk8+6Wf+OoQi4u8m_t7G5guJQW+SNuttOSgQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220202085429.22261-1-suraj.kandpal@intel.com>
 <20220202085429.22261-6-suraj.kandpal@intel.com>
 <Yfp8Q6OFqTAvESOi@pendragon.ideasonboard.com> <87y22ts948.fsf@intel.com>
 <CAA8EJprrhPtDkWRk8+6Wf+OoQi4u8m_t7G5guJQW+SNuttOSgQ@mail.gmail.com>
Date: Wed, 02 Feb 2022 17:57:06 +0200
Message-ID: <87sft1s1m5.fsf@intel.com>
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
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, arun.r.murthy@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 02 Feb 2022, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> On Wed, 2 Feb 2022 at 16:15, Jani Nikula <jani.nikula@intel.com> wrote:
>>
>> On Wed, 02 Feb 2022, Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
>> > Hi Kandpal,
>> >
>> > Thank you for the patch.
>> >
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
>> >>      const char *const *sources;
>> >>      unsigned int sources_count;
>> >>
>> >> +    struct drm_connector connector;
>> >> +    struct drm_encoder encoder;
>> >
>> > Those fields are, at best, poorly named. Furthermore, there's no need in
>> > this driver or in other drivers using drm_writeback_connector to create
>> > an encoder or connector manually. Let's not polute all drivers because
>> > i915 doesn't have its abstractions right.
>>
>> i915 uses the quite common model for struct inheritance:
>>
>>         struct intel_connector {
>>                 struct drm_connector base;
>>                 /* ... */
>>         }
>>
>> Same with at least amd, ast, fsl-dcu, hisilicon, mga200, msm, nouveau,
>> radeon, tilcdc, and vboxvideo.
>
> For the reference. msm does not wrap drm_connector into any _common_
> structure, which is used internally.
>
>> We could argue about the relative merits of that abstraction, but I
>> think the bottom line is that it's popular and the drivers using it are
>> not going to be persuaded to move away from it.
>
> As I wrote earlier, I am not sure if these drivers would try using
> their drm_connector subclass for writeback.
> ast: ast_connector = drm_connector + respective i2c adapter for EDID,
> not needed for WB
> fsl-dcu: fsl_dcu_drm_connector = drm_connector + drm_encoder pointer +
> drm_panel. Not needed for WB
> hisilicon, mgag200: same as ast
> tilcdc: same as fsl-dcu
> vboxdrv: the only driver that may possibly benefit from using
> vbox_connector in the writeback support, as the connector is bare
> drm_connector + crtc pointer + hints (width, height, disconnected).
>
> I have left amd, nouveau and radeon out of this list, too complex to
> analyze in several minutes.
>
> I'd second the proposal of supporting optional drm_encoder for
> drm_writeback_connector (as the crtc/encoder split can be vague), but
> I do not see the benefit for the drivers to use their own
> drm_connector subclass for drm_writeback.

If a driver uses inheritance throughout the driver, and a *different*
subclass gets introduced into the mix, you need to add a ton of checks
all over the place when you cast the superclass pointer to the subclass.

The connector/encoder funcs you do have to pass to
drm_writeback_connector_init() can't use any of the shared driver
infrastructure that assume a certain inheritance.

See also my reply to Laurent [1].

> It well might be that we all misunderstand your design. Do you have a
> complete intel drm_writeback implementation based on this patchset? It
> would be easier to judge if the approach is correct seeing your
> target.

That would be up to Suraj Kandpal.

BR,
Jani.


[1] https://lore.kernel.org/r/87v8xxs2hz.fsf@intel.com


>
>>
>> It's no coincidence that the drivers who've implemented writeback so far
>> (komeda, mali, rcar-du, vc4, and vkms) do not use the abstraction,
>> because the drm_writeback_connector midlayer does, forcing the issue.
>>
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

-- 
Jani Nikula, Intel Open Source Graphics Center
