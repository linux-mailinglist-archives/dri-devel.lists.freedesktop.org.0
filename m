Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E24AB5495
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 14:19:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD65010E595;
	Tue, 13 May 2025 12:19:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O0s1/nYd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E52F210E595
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 12:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747138788; x=1778674788;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=PvFrR2MAq2o+yd9APHGuH71FjKQ9+0afcA1dVCja6iA=;
 b=O0s1/nYdcdlOitVX/COgnXEibxp+uai9j6giJaSzj3rq8NAk6tOeLERp
 iEp841F9+dcKvs0Kc3GesOyxxb81w9gkNItU+EMDdDBdbu1GqftQfaZK+
 bNy6Evg3Y2IKM5gvo0PJexNd4mJgCVIHrzwrMCS/lNyutR7JoAowuqW2p
 h3PX+Uldj2uTmIrduK+Oi/FwKefE4KwqiqBS5KPm47TciFIoVyhEo7gv+
 uGDOqlKPnacmkJQHoMA5RE3/+qj0HrKZwzHM7mk4Nm8PZTWurTByeEKIV
 3VQgn8t2xxnMhMNHflOwVKdOQ5Zp9+Yf4moFBQCzVaGblY+TNW632U4Dg w==;
X-CSE-ConnectionGUID: T1Jr5hpgQ0iuwXDbL6oeXw==
X-CSE-MsgGUID: z83V0AXLRvil902qdZMUlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="52788525"
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; d="scan'208";a="52788525"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 05:19:47 -0700
X-CSE-ConnectionGUID: 3NPLvGBRRAK/n33hhJDhew==
X-CSE-MsgGUID: GJHOJSAyTsOFFP5L/Qaxww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; d="scan'208";a="138618720"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.175])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 05:19:44 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Maxime Ripard <mripard@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v4 2/4] drm/panel: Add refcount support
In-Reply-To: <CAN9Xe3R87TmEzeTEFnhxAZyqdRYNSnPLcGqWATpyt4CHeYdGkg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250331-b4-panel-refcounting-v4-0-dad50c60c6c9@redhat.com>
 <20250331-b4-panel-refcounting-v4-2-dad50c60c6c9@redhat.com>
 <87y0vkw8ll.fsf@intel.com>
 <20250429-benign-sidewinder-of-defense-6dd4d8@houat>
 <87o6wfwcef.fsf@intel.com> <20250505-slim-bizarre-marten-a674ac@houat>
 <CAN9Xe3RLazpAXdxxJmyF2QAShDtMSgdoxMdo6ecdYd7aZiP9kA@mail.gmail.com>
 <874ixvtbxy.fsf@intel.com>
 <20250509-rapid-flounder-of-devotion-6b26bb@houat>
 <87r00yj6kv.fsf@intel.com>
 <CAN9Xe3R87TmEzeTEFnhxAZyqdRYNSnPLcGqWATpyt4CHeYdGkg@mail.gmail.com>
Date: Tue, 13 May 2025 15:19:41 +0300
Message-ID: <87msbgitya.fsf@intel.com>
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

On Mon, 12 May 2025, Anusha Srivatsa <asrivats@redhat.com> wrote:
> I get that embedding drm_panel within intel_panel which is embedded
> within intel_connector, which also embeds drm_connector and so on can
> get confusing to use. But Jani,
> about drm_panel_follower , which is the panel that is following the
> intel_panel? Is it the associated
> touchscreen if any or some other device?

Touchscreen, it's stuff under investigation, WIP. Needs a bunch more
stuff, but just trying to ensure drm_panel doesn't become a blocker
right off the bat.


BR,
Jani.


-- 
Jani Nikula, Intel
