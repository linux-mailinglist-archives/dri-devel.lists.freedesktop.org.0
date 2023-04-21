Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25EAC6EB1F6
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 21:02:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 180AF10E323;
	Fri, 21 Apr 2023 19:02:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F69C10E321;
 Fri, 21 Apr 2023 19:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682103722; x=1713639722;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SgjtE+DBu8OS3F+DrP7ZsszQfxkKGgixDlCcFbT/V+I=;
 b=J9Yu+De10iAyNe9xru+zfCDSAcp69AKlMK2Qu36V3GIBm6WSny5l227K
 Rr2uNgBAAJjoLDIMICfSIzF66bTCV2z5yAItweubXtHkSvEiGuJgI1+EV
 UqVOGlUUFGrWr8VoAG3HnKETZCvb2QoMWAkR8G1+CLVFWQJVHPQ5om+Kz
 9vqvJZxb0Zdp1dccd+6DfpD4ta8Lx0Be+7ipU+qtb8XrTpclCiMODe8L8
 T/h2kHRLKIreJFUHau7z7BYImJd9nCvEoF6Ap9jak7HymiJAsxFLL6xdj
 pjPK6psU0FP3JSYWGpiNFptIhK2PxBM6ioSe55i2w+qWPvulrPyoEFqNr Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="347966437"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; d="scan'208";a="347966437"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 12:00:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="781690466"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; d="scan'208";a="781690466"
Received: from ameghere-mobl2.ger.corp.intel.com (HELO intel.com)
 ([10.249.35.194])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 12:00:42 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 0/2] Use i915 instead of dev_priv
Date: Fri, 21 Apr 2023 21:00:24 +0200
Message-Id: <20230421190026.294208-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.40.0
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

just another "Friday patch". While reviewing some patches from
Tejas I found a bit confusing the use of dev_priv__ inside the
for_each_engine(), perhaps it should be moved inside the gt/?

As I was at it I made the /dev_priv/i915/ change which is still
harmless. Next in queue is to change the i915_irq.h, which is a
bit tricky (but not much) as the "dev_priv" is hardcoded inside
some defines.

Thank you Andrzej and Rodrigo for your reviews.

Andi

Changelog
=========
v1 -> v2
 - Fix double typo in the patch 1 commit:
   /for_each_gt/for_each_engine/
 - Phrase properly the commit of patch 2.

Andi Shyti (2):
  drm/i915/i915_drv: Use proper parameter naming in for_each_engine()
  drm/i915/i915_drv: Use i915 instead of dev_priv insied the file_priv
    structure

 drivers/gpu/drm/i915/i915_drv.h | 462 ++++++++++++++++----------------
 1 file changed, 231 insertions(+), 231 deletions(-)

-- 
2.40.0

