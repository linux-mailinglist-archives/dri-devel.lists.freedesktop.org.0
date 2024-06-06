Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 508DF8FE7AB
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 15:24:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD83F10E095;
	Thu,  6 Jun 2024 13:24:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EELUpv4o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4628910E095
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2024 13:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717680239; x=1749216239;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=OUirJH9m/6tcZaAOQty/HDPKC7udy2XO/0oSxAMzLCw=;
 b=EELUpv4o+VX+atuBDwQ7ELv6JeuEm5HRUft5qU3JhlIelzY/HBaH4+bg
 ze/vqgx8WV3E7p/fOLNQb2zDYIi4o6qPS0ccCsusUMbLVo31jym3SNF5H
 4Q71xuVZsloLk9UIvcwvEC2HdfWJ72Myz/uTZ4oB2R55rPHmZPKaqiw2Q
 NK4tHZzZEKPiBO0Ik7/DD6zdCR7cEUKLPXahPswziEnTvTX7OlEot0kZh
 D+vxU4Fmuwh19CS6dVJdbEBcxoj6l2bEeBPiE5tIaVP/38SVSxelL6qzD
 3BcdZsCgAp0Y0lfWFeJ6ORBMRXLJoAonoujv/UnBPTPtgVVAeo8VWNMKV g==;
X-CSE-ConnectionGUID: UJdxIHpKTlO++7d+JPJXvA==
X-CSE-MsgGUID: S025LWFeTHCAU3dj1BNkuQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="18138812"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="18138812"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 06:23:59 -0700
X-CSE-ConnectionGUID: CFjqFbKQTBiJRlKP8Yvw1A==
X-CSE-MsgGUID: cWN/q1n/QGG3PpMRUTKVxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="37970680"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 06 Jun 2024 06:23:54 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 06 Jun 2024 16:23:53 +0300
Date: Thu, 6 Jun 2024 16:23:53 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 alexander.deucher@amd.com, ltuikov89@gmail.com,
 matthew.brost@intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org, rostedt@goodmis.org
Subject: Re: [PATCH v3 1/4] drm/sched: store the drm_device instead of the
 device
Message-ID: <ZmG4aVhpPgTXI-wG@intel.com>
References: <20240606130629.214827-1-pierre-eric.pelloux-prayer@amd.com>
 <20240606130629.214827-2-pierre-eric.pelloux-prayer@amd.com>
 <6f4e7b5f-7af8-4245-a927-37ebc2789868@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6f4e7b5f-7af8-4245-a927-37ebc2789868@amd.com>
X-Patchwork-Hint: comment
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

On Thu, Jun 06, 2024 at 03:18:14PM +0200, Christian König wrote:
> Am 06.06.24 um 15:06 schrieb Pierre-Eric Pelloux-Prayer:
> > When tracing is enabled, being able to identify which device is sending
> > events is useful; for this the next commit will extend events to include
> > drm_device::primary::index.
> 
> That sounds like a rather bad idea since the primary index is really 
> just an arbitrary number and not defined for all devices.
> 
> Why not use the device name instead? This way you don't need this change 
> in the first place.

FWIW dev_name() is what I added to all i915 display tracepoints.

-- 
Ville Syrjälä
Intel
