Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84515A44A21
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 19:22:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77F6510E725;
	Tue, 25 Feb 2025 18:22:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IF2l1iyR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A73410E725
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 18:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740507721; x=1772043721;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=vYdkX9GxcFnfRU02AZWzqGQOqGZSkjK3KMEH4qzF4tE=;
 b=IF2l1iyRwfKEkbBugAJ0EUhYEajaJCrJ9aJ2DC99G4NejcZZpmXVT+WI
 0DVz3qw/AtFd0loK/grgyWe4yY0SPwCCcs155Agvp9sWYstIdKtHIF5EH
 kZXHitZy+6n0eMQrHJ9jyBykltvN8JKi9Vt2QkUuRWKNseyGkCJ29izH7
 vtNyuuBxeXP4xY8GKcLvg/MusT4s5gkhdoP7DyhHvQicjePijSpSAoxB2
 bZlD1/ZRRK7ZmIWI+1s9DGYNAAmehNk99vnBis8Fo64oWIZ5DLWvm4/Ax
 q7IJROxR8eub/oqx2Pcd0BAjGyg3+pFj7UXSl9NGlP9slsLVpy0wcwfbI g==;
X-CSE-ConnectionGUID: mp0F4AbBSzW9E+nE7MwFMQ==
X-CSE-MsgGUID: ewPg5JqFS5ii5fLhQv76VA==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="41210438"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="41210438"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 10:22:00 -0800
X-CSE-ConnectionGUID: SN88Ybl6SQqNfCnQ57GTEQ==
X-CSE-MsgGUID: DOD2JSqtSUC+4u8c4m5SNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="116958861"
Received: from monicael-mobl3 (HELO localhost) ([10.245.246.246])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 10:21:54 -0800
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
In-Reply-To: <20250225183621.6b33684b@booty>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250225-drm-debugfs-show-all-bridges-v7-0-8826037ada37@bootlin.com>
 <20250225-drm-debugfs-show-all-bridges-v7-1-8826037ada37@bootlin.com>
 <878qpu56cm.fsf@intel.com> <20250225183621.6b33684b@booty>
Date: Tue, 25 Feb 2025 20:21:50 +0200
Message-ID: <871pvl6g1t.fsf@intel.com>
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

On Tue, 25 Feb 2025, Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
> Hello Jani,
>
> On Tue, 25 Feb 2025 18:36:41 +0200
> Jani Nikula <jani.nikula@linux.intel.com> wrote:
>
>> On Tue, 25 Feb 2025, Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
>> > In preparation to expose more info about bridges in debugfs, which will
>> > require more insight into drm_bridge data structures, move the bridges_show
>> > code to drm_bridge.c.
>> >
>> > Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>  
>> 
>> I hate myself for doing this on a patch that's at v7... but here goes.
>
> Please don't! :-) This patch is new in v7, and a different (and
> definitely worse) approach was present in v6, but there was nothing
> before.
>
>> Perhaps consider moving the bridges debugfs creation and fops to
>> drm_bridge.c instead of just adding
>> drm_bridge_debugfs_show_encoder_bridges().
>> 
>> For example, add drm_bridge_debugfs_add(struct drm_encoder *encoder),
>> which then contains the debugfs_create_file() call.
>
> I think it should go in drm_encoder.c, not drm_bridge.c, right? Here we
> are showing the bridges attached to an encoder, so the entry point is
> each encoder.

I'm still thinking drm_bridge.c, because it's about bridges and their
details. The encoder shouldn't care about bridge implementation details.

> On the other hand in patch 2 we should move the
> drm_debugfs_global_add() code to drm_bridge.c, as it's showing bridges
> ina encoder-independent way.

Agreed on that.

> And finally drm_bridge should export the common
> drm_bridge_debugfs_show_bridge() function to drm_encoder.c.

Disagree. That will still require the EXPORT and #ifdefs around
CONFIG_DEBUG_FS.

> Do you think this is correct?
>
>> Interestingly, this lets you drop a lot of #ifdef CONFIG_DEBUG_FS. The
>> compiler optimizes the fops struct and the functions away when
>> debugfs_create_file() becomes a stub for CONFIG_DEBUG_FS=n. It becomes
>> all around cleaner.
>
> This surely makes the idea interesting. Cleaner code is always welcome.

You might find drivers/gpu/drm/i915/display/intel_display_debugfs.c
helpful (and/or confusing...). It's in a long-term flux towards the
approach of having the debugfs stuff next to the implementation.

You have intel_display_debugfs_register() for global stuff, which then
does the same for various functional blocks.

Similarly intel_connector_debugfs_add() and intel_crtc_debugfs_add() for
connector and crtc specific debugfs files.

The individual functionality specific *_register() and *_add() functions
don't have conditional compilation. But they become empty functions as
the debugfs functions become empty stubs with CONFIG_DEBUG_FS=n, and
lots of stuff just gets optimized away.

Moreover, having the debugfs next to the implementation has helped us
abstract implementation details better, and reduce exposed functions
from compilation units.

In this case, you'd be able to add more bridge specific debugfs files
later on without touching anything else than drm_bridge.c.


BR,
Jani.



-- 
Jani Nikula, Intel
