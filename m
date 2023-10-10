Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DC87BFAF6
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 14:16:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 784A210E1EB;
	Tue, 10 Oct 2023 12:16:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9E6A10E1E7;
 Tue, 10 Oct 2023 12:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696940188; x=1728476188;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TanU+TjJiGWDDPoccsVXHgSShJD0CZuV0MWwk4ETT3Y=;
 b=n54gQQYhnYDpweF/GsqxZt/RjxutChpXzQAX5sfGwdwKes8Dd/KrmZzf
 CKQtkW8NU7PKi2bbCuUk5X3KddZNOEogjOO208DLBRs3qysluVd+/r5Ps
 QCKyY7GqitBkZ9x7MmG0gRQ/VnxHzG9R23rq2x8+bPs2LTOybZXIOIbUn
 /ubLPbieAILqIZeJ/SOLQu2RehT+6yxDLVeNitLe6hEMAi5MT4ZGbvifK
 H2/IZ8f7ZjGzf2JKHwn4X6Op1xzxiw66sViB5WIBDUfOtmjk7VR1TyCiU
 yQGUSkpaPAwYR18ymYaDwBDaWG0llkJINIfbj6ypp62a8OJMG4d7zAjSZ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="364673913"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; d="scan'208";a="364673913"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2023 05:16:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="747055365"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; d="scan'208";a="747055365"
Received: from ppalanyk-mobl.gar.corp.intel.com (HELO intel.com)
 ([10.213.148.82])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2023 05:16:19 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH RESEND v2 0/2] Add drm_dbg_ratelimited()
Date: Tue, 10 Oct 2023 14:15:43 +0200
Message-Id: <20231010121545.1046793-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.40.1
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <mripard@kernel.org>, Matthew Auld <matthew.auld@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

I might have picked up the wrong series and missed some reviews
and the extra patch from Nirmoy with a real use of the
drm_dbg_ratelimited() that John was looking for.

Thanks,
Andi

v2:
pick the right patch with the following changes:
 - add more r-b's
 - add a patch 2 where the drm_dbg_ratelimited is actually used.

Nirmoy Das (2):
  drm/print: Add drm_dbg_ratelimited
  drm/i915: Ratelimit debug log in vm_fault_ttm

 drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 5 +++--
 include/drm/drm_print.h                 | 3 +++
 2 files changed, 6 insertions(+), 2 deletions(-)

-- 
2.40.1

