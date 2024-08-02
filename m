Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 030E2945A1E
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2024 10:39:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79AED10E9B5;
	Fri,  2 Aug 2024 08:39:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eXy7+LHB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9448010E9B5;
 Fri,  2 Aug 2024 08:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722587957; x=1754123957;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XlA9AQuyIFlsx08RNDemAZUvhNjUTOWHkgwUwhktJEk=;
 b=eXy7+LHB+sIoa5cBet0umEk3nMTKApfKo/t54aD4lNlrONv2pE1cbwX/
 x7Gz2LZWUsIoZibYmej5ioenZvUPapTaPjfgFjBPOx1JOj4J8AhzOqwdq
 NWYTpAvxoMlMQV0lnwMhCQ/+ixlgmmVEJQLZcNEXrHV/A11xGLLKpqGeC
 GrvAxCOW5YBJ4nYNyoBFKJ0bd+j1A+Q6fHAbCDFiSgy/7ZiuhIJ0f1+Sj
 bQMnVm74xlMEt3Wv0ESxyR3aubPq2/GZaNwCxMkVSdMR4HyrDmwfKU1Qo
 sjRliJH7NwbC9NqtllyAUsROPSK1tU+6bclYgEFBq51f9SMC4F2rA7DVU g==;
X-CSE-ConnectionGUID: eLRMLslMRq+Du/5hrfpwjA==
X-CSE-MsgGUID: u04LN7y3QlWH99zEPxJxtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="23513483"
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800"; d="scan'208";a="23513483"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2024 01:39:16 -0700
X-CSE-ConnectionGUID: EGRSb4qUT5KR3EXcAf439g==
X-CSE-MsgGUID: uWqXoWjOQJ2ScZLinufYwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800"; d="scan'208";a="59443592"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO intel.com)
 ([10.245.245.86])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2024 01:39:13 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Jann Horn <jannh@chromium.org>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Jann Horn <jannh@google.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Andi Shyti <andi.shyti@kernel.org>, Matthew Auld <matthew.auld@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH 0/2] Fix mmap memory boundary calculation
Date: Fri,  2 Aug 2024 10:38:48 +0200
Message-ID: <20240802083850.103694-1-andi.shyti@linux.intel.com>
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

Jann, Rodrigo, could you please restate your review tag?

Thanks,
Andi

Andi Shyti (2):
  drm/i915/gem: Adjust vma offset for framebuffer mmap offset
  drm/i915/gem: Fix Virtual Memory mapping boundaries calculation

 drivers/gpu/drm/i915/gem/i915_gem_mman.c | 55 +++++++++++++++++++++---
 1 file changed, 49 insertions(+), 6 deletions(-)

-- 
2.45.2

