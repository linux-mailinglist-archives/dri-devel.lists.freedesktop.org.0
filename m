Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0466EACFEE5
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 11:11:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED83D10E279;
	Fri,  6 Jun 2025 09:11:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OcBwctdI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EA9E10E279
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jun 2025 09:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749201094; x=1780737094;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=5MdIQVI8FLkz4uPQ2nEO3DWQJIyA/2G/IKcgBv4oc/o=;
 b=OcBwctdI4vVCPR3vK7dXzUTN/jcvnhOARl8nwgMaZV8W1318OpxzUvTD
 NUQmJ4n5qHtlFxSYgDdeCjB23/ChzYgowTtv4M/J+EQCaLJfT1yey97jJ
 Ntb+R8aQ351cqffxvPKiDBgSMawX6a/bwop/jH5AG7RQK0HF70HSkBo1c
 QF1We44xUtF4MMMBk8zMqg29iwRiE8mw3NJ3HfQrscBcCivDHoFjlvqDU
 WDzf8g3XmTQYo3bW5tkfch/STaU6C2bYUp8VyIenXNGxavRUO5frMIlV+
 Xb3Ta99vvHJ2pj8WuPE7D7eUOapYAlwbuivVZFA7rH4/bONHR1bVTMMdu Q==;
X-CSE-ConnectionGUID: u5tXc0iHSTSVVgaR3MjLMw==
X-CSE-MsgGUID: DgVsa8k4RWikJGaldBUMFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="51048593"
X-IronPort-AV: E=Sophos;i="6.16,214,1744095600"; d="scan'208";a="51048593"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 02:11:34 -0700
X-CSE-ConnectionGUID: IgnUupqwRLudpdbQoYyDlw==
X-CSE-MsgGUID: UYpnkVZCTAWtZd/KTG2NlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,214,1744095600"; d="scan'208";a="146731361"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.33])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 02:11:30 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Anusha Srivatsa <asrivats@redhat.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v4 2/4] drm/panel: Add refcount support
In-Reply-To: <20250606-pompous-mellow-guan-1d9ea4@houat>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <CAN9Xe3RLazpAXdxxJmyF2QAShDtMSgdoxMdo6ecdYd7aZiP9kA@mail.gmail.com>
 <874ixvtbxy.fsf@intel.com>
 <20250509-rapid-flounder-of-devotion-6b26bb@houat>
 <87r00yj6kv.fsf@intel.com>
 <molexnyjkiryvhetfdc66gmzecrf6f7kxl656qn46djdkixrkb@fdgnp5hispbf>
 <875xi3im1r.fsf@intel.com> <20250519-singing-silent-stingray-fe5c9b@houat>
 <87sekztwyc.fsf@intel.com>
 <20250527-winged-prawn-of-virtuosity-d11a47@houat>
 <4a1c28b2ad4f701b9b2fe363ebf6acbab504e6ad@intel.com>
 <20250606-pompous-mellow-guan-1d9ea4@houat>
Date: Fri, 06 Jun 2025 12:11:28 +0300
Message-ID: <3016c9e72f1abda5368399eb1c0e42921da2e017@intel.com>
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

On Fri, 06 Jun 2025, Maxime Ripard <mripard@kernel.org> wrote:
> Thanks for working on that. Your two patches (the one you sent here, and
> the one in the other subthread) look good to me. So if that works, it
> looks like we have a way forward.

Coincidentally, I just posted the first non-draft patches [1]. Thanks
for your feedback, and for bearing with me.


BR,
Jani.


[1] https://lore.kernel.org/r/cover.1749199013.git.jani.nikula@intel.com


-- 
Jani Nikula, Intel
