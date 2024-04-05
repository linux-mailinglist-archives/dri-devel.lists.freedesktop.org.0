Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E9A899A11
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 11:57:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E02DD113AAC;
	Fri,  5 Apr 2024 09:57:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XKR+80dI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2978113AAC;
 Fri,  5 Apr 2024 09:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712311041; x=1743847041;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=AXT2Q9M99bj6l9zBM4PlkDwJeIYs6jvaObNletSS+3Y=;
 b=XKR+80dIRelSzAP+2X05l4aORmNoOP5gCgyem1PY4sNoUkm48Eq0i4Sy
 9ZkCdlPaQmkLUFDXaISACC7OqiJIyXlET9xoo5E0eEuY+UPMQBJrrQPz3
 uYWcplaXXTsQsJrhI2ifFNO6U3A2ZgUIdQ1ris0uno1NcU1NHn14s7+LN
 akfsYKaseyOZLMgpTIZK2TjqBTTEnzCNtni9/1F53wo7pPe2+X0pcBuEs
 nrjTiH/d8Sy6mbFPDF+TcvmZSAi4+6sO2LHYOlMHg41N1L4Xgz2z5zfvT
 Gc7vnaqSJSGflwB9u0p0Z0y8wk4rezbXdNLa0ttf3iVqHGN1wX7p7mH6K A==;
X-CSE-ConnectionGUID: 65gQMHp6ReiHAmXcOiX6FA==
X-CSE-MsgGUID: Ae91GIyGTGWo34ayspzDAA==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="33029939"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="33029939"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 02:57:21 -0700
X-CSE-ConnectionGUID: UFJi6+rfQO2FFXwsBPq3Vg==
X-CSE-MsgGUID: mZmLysmtTEqLdTgLXtfm/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="19557548"
Received: from dtorrice-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.41.202])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 02:57:19 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Aishwarya TCV <aishwarya.tcv@arm.com>
Cc: intel-gfx@lists.freedesktop.org, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 0/6] drm: enable W=1 warnings by default across the
 subsystem
In-Reply-To: <2ac758ce-a196-4e89-a397-488ba31014c4@arm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1704908087.git.jani.nikula@intel.com>
 <2ac758ce-a196-4e89-a397-488ba31014c4@arm.com>
Date: Fri, 05 Apr 2024 12:57:17 +0300
Message-ID: <871q7kcete.fsf@intel.com>
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

On Thu, 04 Apr 2024, Aishwarya TCV <aishwarya.tcv@arm.com> wrote:
> Observed warning "include/drm/drm_print.h:536:35: warning: '%4.4s'
> directive argument is null [-Wformat-overflow=]" when building the
> modules with "defconfig+kselftest-ftrace"(
> https://github.com/torvalds/linux/blob/master/tools/testing/selftests/ftrace/config
> ) against next-master(next-20240404) kernel with Arm64 in our CI.
>
> A bisect identified a61ddb4393ad1be61d2ffd92576d42707b05be17 as the
> first bad commit. Bisected it on the tag "next-20240326" at repo
> "https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git".
>
> I understand that you are turning on the warning here, thought worth
> mentioning about the observation.

Thanks for the report. I can't reproduce this myself, but please see if
[1] fixes the issue.


BR,
Jani.

[1] https://lore.kernel.org/dri-devel/20240405092907.2334007-1-jani.nikula@intel.com


-- 
Jani Nikula, Intel
