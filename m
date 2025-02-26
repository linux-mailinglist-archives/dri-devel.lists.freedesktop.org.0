Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E713AA45EDF
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 13:26:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A72B310E11C;
	Wed, 26 Feb 2025 12:26:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LcmxGhq2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81ABF10E11C
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 12:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740572785; x=1772108785;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=nHWvsrHzl0E3PKpKoxyFzPuy69gPj6TL5GxMEdtgmYE=;
 b=LcmxGhq2aVyFGNGma4Q5u5pVTk1vKzHBtMrZnX9i3SoTPmG5poyDGpaO
 OsU5fvau7d9lRhIpYUXThxRgI7d7L6Uxk0qhg4G5mzTH9HVdP7aCZasst
 vQghgfQTvTyP23gRqnX7K0Pcc4ufuNN9YVt+GV4t54TiGhS9kcaIRGtji
 PVeOwo8jY3Uh2hrywTNIoHO6jnTaoFtP43j3xty6CvabKx8KDhpyXW2nc
 jvuFLkncniklwl7sAx3RI0NZ2QhGp1K9hdf/QpE0wMKoNdJx7WJw1cFRM
 4x3MXnQwfcHdvEott2q2MCrMtHOjjP6y1coX8LhucEw1mUyqXCS1OgSYU g==;
X-CSE-ConnectionGUID: /FR/WPGfR2a/nnE84q6FwA==
X-CSE-MsgGUID: OthSaA3ST8eqH8AbXX2U9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="29007912"
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; d="scan'208";a="29007912"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 04:26:20 -0800
X-CSE-ConnectionGUID: yDO3I0TZTc+YJydC1eF25A==
X-CSE-MsgGUID: oz93/ECPRmWpqDFJr7jZLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; d="scan'208";a="147507690"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.123])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 04:26:12 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/2] drm/bridge: move bridges_show logic from
 drm_debugfs.c
In-Reply-To: <20250226123208.272e7766@booty>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250225-drm-debugfs-show-all-bridges-v7-0-8826037ada37@bootlin.com>
 <20250225-drm-debugfs-show-all-bridges-v7-1-8826037ada37@bootlin.com>
 <878qpu56cm.fsf@intel.com> <20250225183621.6b33684b@booty>
 <871pvl6g1t.fsf@intel.com> <20250226123208.272e7766@booty>
Date: Wed, 26 Feb 2025 14:26:09 +0200
Message-ID: <87mse851um.fsf@intel.com>
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

On Wed, 26 Feb 2025, Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
> Hello Jani,
>
> On Tue, 25 Feb 2025 20:21:50 +0200
> Jani Nikula <jani.nikula@linux.intel.com> wrote:
>
>> On Tue, 25 Feb 2025, Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
>> > Hello Jani,
>> >
>> > On Tue, 25 Feb 2025 18:36:41 +0200
>> > Jani Nikula <jani.nikula@linux.intel.com> wrote:
>> >  
>> >> On Tue, 25 Feb 2025, Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:  
>> >> > In preparation to expose more info about bridges in debugfs, which will
>> >> > require more insight into drm_bridge data structures, move the bridges_show
>> >> > code to drm_bridge.c.
>> >> >
>> >> > Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> >> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>    
>> >> 
>> >> I hate myself for doing this on a patch that's at v7... but here goes.  
>> >
>> > Please don't! :-) This patch is new in v7, and a different (and
>> > definitely worse) approach was present in v6, but there was nothing
>> > before.
>> >  
>> >> Perhaps consider moving the bridges debugfs creation and fops to
>> >> drm_bridge.c instead of just adding
>> >> drm_bridge_debugfs_show_encoder_bridges().
>> >> 
>> >> For example, add drm_bridge_debugfs_add(struct drm_encoder *encoder),
>> >> which then contains the debugfs_create_file() call.  
>> >
>> > I think it should go in drm_encoder.c, not drm_bridge.c, right? Here we
>> > are showing the bridges attached to an encoder, so the entry point is
>> > each encoder.  
>> 
>> I'm still thinking drm_bridge.c, because it's about bridges and their
>> details. The encoder shouldn't care about bridge implementation details.
>
> Ah, I think I now get what you mean.
>
> Current code is:
>
> drm_encoder_register_all()                             [drm_encoder.c]
>  -> drm_debugfs_encoder_add                            [drm_debugfs.c]
>    -> debugfs_create_file("bridges"...  &bridges_fops) [drm_debugfs.c]
>                                     [bridges_fops is in drm_debugfs.c]
>
> Moving the last 2 lines to drm_bridge.c and into a new function we'd
> have:
>
> drm_encoder_register_all()                             [drm_encoder.c]
>  -> drm_debugfs_encoder_add [*]                        [drm_debugfs.c]
>   -> drm_bridge_debugfs_add_encoder_bridges_file (NEW) [drm_bridge.c]
>    -> debugfs_create_file("bridges"...  &bridges_fops) [drm_bridge.c]
>                                     [bridges_fops is in drm_bridge.c]
>
> Potentially [*] could be moved to drm_encoder.c, but that is not bridge
> related and can be done as a future step.
>
> Is this what you had in mind?

Yes!

(Though I'd give drm_bridge_debugfs_add_encoder_bridges_file() a shorter
and more generic name.)

BR,
Jani.


>
>> > On the other hand in patch 2 we should move the
>> > drm_debugfs_global_add() code to drm_bridge.c, as it's showing bridges
>> > ina encoder-independent way.  
>> 
>> Agreed on that.
>> 
>> > And finally drm_bridge should export the common
>> > drm_bridge_debugfs_show_bridge() function to drm_encoder.c.  
>> 
>> Disagree. That will still require the EXPORT and #ifdefs around
>> CONFIG_DEBUG_FS.
>
> With the above-sketched idea I agree we wouldn't need to export
> drm_bridge_debugfs_show_bridge().
>
> Luca

-- 
Jani Nikula, Intel
