Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEE0C589AC
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 17:10:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5540310E891;
	Thu, 13 Nov 2025 16:10:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EjtR4Mo6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 528B710E88F;
 Thu, 13 Nov 2025 16:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763050222; x=1794586222;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=gGxMW0ne1K82OqNdTElWez/C9rruj92jfffY6GL6lw4=;
 b=EjtR4Mo6L6UQhS3wVmYD0imMpZj54AIri9pNMTwavlmqavkbz2HzY3bt
 BAs1AkNaPaMP2r9+8ZiVEfiVEx5qjv5y8M/nj/Lxn8Vbv2N8Io3l9fpmT
 8GIy9smuvQgg1Xk/0/6TMpARnM7S7qWYIlJvrnxL/GVhNf+lhWCDV4qx1
 BxNwx0H+fs8jjmK6HvBBvzu62r+rKwdEnYHb6HAqwrbWRszvWvrGhPvd2
 RUpQcRsSfT/Jwb83rrbKD2K5iYHE0SvFIuApjLWsCn2C7mJppM/2nFYTa
 Bc/oBbC0RZsoIq3WCPjAPwQeA4GQQXuPpLmiBEn1pkx917pRHLZozZz7O g==;
X-CSE-ConnectionGUID: JX2qCz34TPO2IzT3JYZnqQ==
X-CSE-MsgGUID: HRqcLnaWSNCJKyykFLMXnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65071567"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="65071567"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 08:10:21 -0800
X-CSE-ConnectionGUID: v9QzH/c0SVixOxmSh2ssLA==
X-CSE-MsgGUID: vklF9oYoSAiW2bTAriUORQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="226853873"
Received: from aotchere-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.135])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 08:10:18 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Cc: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>, "Deak, Imre" <imre.deak@intel.com>
Subject: RE: [PATCH] drm/display/dp_mst: Add protection against 0 vcpi
In-Reply-To: <b2b7c5cbec76955ffdcc0a7ebf6cd83ad67e8b04@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251113043918.716367-1-suraj.kandpal@intel.com>
 <c47f1221281e998f53169ffd0a2e06b301bb1605@intel.com>
 <DM3PPF208195D8D7C8C263E115ABED5A500E3CDA@DM3PPF208195D8D.namprd11.prod.outlook.com>
 <b2b7c5cbec76955ffdcc0a7ebf6cd83ad67e8b04@intel.com>
Date: Thu, 13 Nov 2025 18:10:15 +0200
Message-ID: <33b509a4c9357933291e274f0456707c1808f6d0@intel.com>
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

On Thu, 13 Nov 2025, Jani Nikula <jani.nikula@linux.intel.com> wrote:
>> Refer to gitlab xe issue:  6303

Also, please don't make everyone figure out the URL.

https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6303


-- 
Jani Nikula, Intel
