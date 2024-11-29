Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 473169DEA07
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2024 16:59:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F24610E2BA;
	Fri, 29 Nov 2024 15:59:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cu75vzhv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5897A10E2BA;
 Fri, 29 Nov 2024 15:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732895946; x=1764431946;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=qAbwK8/n6u5UfBdj8ebZv3rn7qMfCL5xmvPF0x5zuSQ=;
 b=cu75vzhvzzvRNN4G0Swi4PopLSQ2fPsIzxQItchHEiH9iUyc01nJ5O75
 NLjdbuE0ikw59yNAKgNC/uGfV0LpC1yxXpEchgovBA8G8sTv1S1gMyuor
 MJYJK99zTDdikCThHpc+xxsaH7+pammpMxele5k5rs+gmpJPaW0krZvkl
 BWRyzCqTPgaj09a7/J4njAyVJ7PoHGc8jGGV5kyXsdoxkwq0+Xj+7hdpX
 5dYdT0uGUuicEAf91QVi4tTZ78EyLcrk23VixnatfbmfjmNkFo3vDwVlQ
 FACGAG82bw1gnf/WBmA/V95uQbNY+BxJYkrfQYOpXmUtVyqIlHCBEGyDO Q==;
X-CSE-ConnectionGUID: wUWgDBzUQOaLJ750QOU2Wg==
X-CSE-MsgGUID: qIuHuTTXT/m1+B9waUj73Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="32501164"
X-IronPort-AV: E=Sophos;i="6.12,196,1728975600"; d="scan'208";a="32501164"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2024 07:59:06 -0800
X-CSE-ConnectionGUID: 23y2AL7CTLyoATWlAN7a5Q==
X-CSE-MsgGUID: Jo972WV3QCGC4JLByhRgAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,196,1728975600"; d="scan'208";a="97482657"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.241])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2024 07:59:02 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Maxime Ripard <mripard@kernel.org>, Imre Deak <imre.deak@intel.com>
Cc: intel-gfx@lists.freedesktop.org, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Dave Airlie <airlied@redhat.com>, Daniel Vetter
 <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2 1/4] drm/dp: Add a way to init/add a connector in
 separate steps
In-Reply-To: <20241129-wild-cobra-of-thunder-829d1f@houat>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241126161859.1858058-1-imre.deak@intel.com>
 <20241126161859.1858058-2-imre.deak@intel.com>
 <Z0nO-bwpbWPVryd6@ideak-desk.fi.intel.com>
 <20241129-wild-cobra-of-thunder-829d1f@houat>
Date: Fri, 29 Nov 2024 17:58:56 +0200
Message-ID: <874j3q6ngf.fsf@intel.com>
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

On Fri, 29 Nov 2024, Maxime Ripard <mripard@kernel.org> wrote:
> On Fri, Nov 29, 2024 at 04:26:01PM +0200, Imre Deak wrote:
>> Adding more people from DRM core domain. Any comment, objection to this
>> change?
>> 
>> On Tue, Nov 26, 2024 at 06:18:56PM +0200, Imre Deak wrote:
>> > Atm when the connector is added to the drm_mode_config::connector_list,
>> > the connector may not be fully initialized yet. This is not a problem
>> > for user space, which will see the connector only after it's registered
>> > later, it could be a problem for in-kernel users looking up connectors
>> > via the above list.
>
> It could be, or it actually is a problem? If so, in what situation?

It's an actual problem.

While in most cases connectors are created at probe, for DP MST they're
created at runtime via the ->add_connector hook. We want to call
drm_connector_init() on them soon in that hook, so we can pass the
connector around and expect it to have connector->dev etc. initialized
while we continue its initialization.

But there's a race. As soon as we call drm_connector_init(), the
connector gets added to dev->mode_config.connector_list, and any drm
code may discover it. For example connector polling. And we might not be
done with the initialization yet.

>> > To resolve the above issue, add a way to separately initialize the DRM
>> > core specific parts of the connector and add it to the above list. This
>> > will move adding the connector to the list after the properties on the
>> > connector have been added, this is ok since these steps don't have a
>> > dependency.
>> >
>> > v2: (Jani)
>> > - Let initing DDC as well via drm_connector_init_core().
>> > - Rename __drm_connector_init to drm_connector_init_core_and_add().
>> > 
>> > Cc: Jani Nikula <jani.nikula@intel.com>
>> > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com> (v1)
>> > Signed-off-by: Imre Deak <imre.deak@intel.com>
>
> If we do have an actual problem to solve, we'll need kunit tests too.

That's not an unreasonable request, per se, but what exactly should they
test? That the new init core didn't add stuff to the list, and the new
add connector did?


BR,
Jani.


-- 
Jani Nikula, Intel
