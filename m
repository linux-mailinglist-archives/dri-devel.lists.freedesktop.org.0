Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD19B947995
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2024 12:26:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64A0310E0BE;
	Mon,  5 Aug 2024 10:26:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m6caedbM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6620510E0BE;
 Mon,  5 Aug 2024 10:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722853578; x=1754389578;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=r8KLsbH1fgpGIB2+Wk4Agu1Uz3m3K7S0p5fd2qDMXJg=;
 b=m6caedbMRLza/+UoKZ1lv2muYe45i6pKh6CyyUYpu+1sNzHPI9bqhLsC
 zUlFBe6HMlaGsftrIobInULLpMj3MpQ0yDy5uapf5vihYgUv8XH/Avcz6
 8u8X/IJArib+LFp7FlZoDMIWjxsaZPXhjSufW0mwph8yS5XVP+XksVfTf
 jhS6FO+h+Ss5MZOSCMFBoIgvGzQ0nIrjEhvHBCoaK7HcikEBfA0BJ8LVw
 ek0sYo5UWQMQGVdBCk9mFb3brBomMbcQqKphwNUWzZdC069mCDE8O3D8i
 +Ko0mYyPoYK7cPvlgn8C9JON0SUB8XqdMQ7dN1lcMAbMVHaVUfywbpwPD A==;
X-CSE-ConnectionGUID: gnikeHqzTWe8oVtPkUR2LA==
X-CSE-MsgGUID: SQ7nNDj1Tf26QZMuD6mJQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11154"; a="20948768"
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; d="scan'208";a="20948768"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 03:26:17 -0700
X-CSE-ConnectionGUID: gXg7PRuEQNKVmPlkJcQWFQ==
X-CSE-MsgGUID: 7/K7Kr4CSHSspOSuulfdkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; d="scan'208";a="93647523"
Received: from fpallare-mobl3.ger.corp.intel.com (HELO intel.com)
 ([10.245.245.249])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 03:26:13 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Jann Horn <jannh@google.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Andi Shyti <andi.shyti@kernel.org>, Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH v2 0/2] Fix mmap memory boundary calculation
Date: Mon,  5 Aug 2024 11:25:52 +0100
Message-ID: <20240805102554.154464-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi,

this series fixes the memory limits calculation (start, end), in
order to avoid access to addresses not belonging to the mapped
page.

This series has been reviewed in other communities but, because
it needs to go through drm-tip, I am proposing it again here in
the intel-gfx mailing list.

Thanks a lot Jann for your inputs and reviews.

Rodrigo, could you please restate your review tag? I'm just
waiting for your tag in patch 1 to get this series in.

Thanks,
Andi

Changelog from v1:
==================
 - Added Jonathan's and Jann's tags.
 - pfn is now calculated inside the set_address_limits() as
   suggested by Jonathan.

Andi Shyti (2):
  drm/i915/gem: Adjust vma offset for framebuffer mmap offset
  drm/i915/gem: Fix Virtual Memory mapping boundaries calculation

 drivers/gpu/drm/i915/gem/i915_gem_mman.c | 64 +++++++++++++++++++++---
 1 file changed, 58 insertions(+), 6 deletions(-)

-- 
2.45.2

