Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 289789EE112
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 09:18:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBAAC10ECF2;
	Thu, 12 Dec 2024 08:18:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N/QLTTsZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39E5F10E20A;
 Thu, 12 Dec 2024 08:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733991521; x=1765527521;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=dVHHLoWyfFDn4SykayA6jpY7XugJsCld6W0h27L/1oo=;
 b=N/QLTTsZ5sPUx3LVxIO4pLi5GS1T0ZyV9b9QThbJZvExwsLGtPQuYLNG
 N3nAeRBDZoHN5tWJnStvzToGV1uhGCPExQB04wg/VGYyHykkwoTnWh2qN
 yVQ/dcuSchgIfRnza9hGEwsS2Vua5j79yOerul/avUcIu3Fi/6yPZ1mWg
 lKyEiHR/48BvSE0dUEjdbZOoeiISH+JMKGzNEsZ+BJFzevuq0xvmPa/Wf
 XWKmEHuzKw3p1IkAcK4Mq4eB8jIl+UxBe1emO3YmquH+XHtlHLE5hE16u
 XfOQ96O+ewdk3CSafOpY6IRdLLVhg7JhMjp5j9ss7JWUQZQKi+I7+9U6X g==;
X-CSE-ConnectionGUID: pJ6q5DxpTtaSXM7CeVeNuQ==
X-CSE-MsgGUID: LPZ8zC+gTFGYKfoAl44vbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="38086245"
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; d="scan'208";a="38086245"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 00:18:41 -0800
X-CSE-ConnectionGUID: AIQA0pf8S+KINcKZiVC2wA==
X-CSE-MsgGUID: 5JT1BapkSSCqRnj0Cwzaiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; d="scan'208";a="96397015"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.101])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 00:18:33 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Johan Hovold
 <johan@kernel.org>
Cc: Abel Vesa <abel.vesa@linaro.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Karol Herbst <kherbst@redhat.com>, Lyude
 Paul <lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 1/4] drm/dp: Add helper to set LTTPRs in transparent
 mode
In-Reply-To: <3omcjrgfkdmw466ok7gej2jge25vtwzaiycwz2xgejwppyvkza@rhssgk7xz4hj>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-0-d5906ed38b28@linaro.org>
 <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-1-d5906ed38b28@linaro.org>
 <Z1mk08SHEd5_vc99@hovoldconsulting.com>
 <3omcjrgfkdmw466ok7gej2jge25vtwzaiycwz2xgejwppyvkza@rhssgk7xz4hj>
Date: Thu, 12 Dec 2024 10:18:30 +0200
Message-ID: <87pllxxqjt.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 11 Dec 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> On Wed, Dec 11, 2024 at 03:42:27PM +0100, Johan Hovold wrote:
>> On Wed, Dec 11, 2024 at 03:04:12PM +0200, Abel Vesa wrote:
>>  
>> > +/**
>> > + * drm_dp_lttpr_set_transparent_mode - set the LTTPR in transparent mode
>> > + * @aux: DisplayPort AUX channel
>> > + * @enable: Enable or disable transparent mode
>> > + *
>> > + * Returns 0 on success or a negative error code on failure.
>> > + */
>> > +int drm_dp_lttpr_set_transparent_mode(struct drm_dp_aux *aux, bool enable)
>> > +{
>> > +	u8 val = enable ? DP_PHY_REPEATER_MODE_TRANSPARENT :
>> > +			  DP_PHY_REPEATER_MODE_NON_TRANSPARENT;
>> > +	int ret = drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE, val);
>> > +
>> > +	return ret == 1 ? 0 : ret;
>> 
>> This looks correct, but I had to go look at drm_dp_dpcd_writeb() to make
>> sure it never returns 0 (for short transfers).
>> 
>> > +}
>> > +EXPORT_SYMBOL(drm_dp_lttpr_set_transparent_mode);
>> 
>> This appears to be what the driver currently uses, but why not
>> EXPORT_SYMBOL_GPL?
>
> $ git grep EXPORT_SYMBOL drivers/gpu/drm/*.c | wc -l
> 962
> $ git grep EXPORT_SYMBOL_GPL drivers/gpu/drm/*.c | wc -l
> 93

It's even more tilted under display/.

BR,
Jani.


-- 
Jani Nikula, Intel
