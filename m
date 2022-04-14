Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51266501AD0
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 20:10:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF9A210E1D1;
	Thu, 14 Apr 2022 18:10:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F85310E18B;
 Thu, 14 Apr 2022 18:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649959823; x=1681495823;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AL+4Pt5cxytp/6zr9clcWFJXM2urnsyIRrUa1XMWdzw=;
 b=PHLsIEwXKPKtU39gvtCAl823jHUGtmC5bvvhetWKIDBtHCjJIFRWqtKZ
 Qbg3BaVkCcYgOTqypmGfWSdthAGclIF3rUvAGRjzEiNLWKTj0TgBkYAZo
 iaJlcXhItGPhCyALQWZk4zpXZwmOdVWf96TV1NC/L/TFl2vfmzsIY9mkP
 a5CU1+k6daAUQ6cjzdJy3f1Y2ry2LH12Har/XJMPR88wjqroKlQOT8jEU
 A/9g5bGTNmD+tAn4G1zCOtJVExYMvnVxDQek8xCUzULUsBmKi3dC1xOaM
 O/4h49KGcTNw1QrgM+j88VIQu8lvFU2cXc8bqJiNaqir5MezuEecdBspt g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10317"; a="288056645"
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="288056645"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 11:10:22 -0700
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="725467853"
Received: from vijayve-mobl1.amr.corp.intel.com (HELO mvcheng-desk2.intel.com)
 ([10.212.162.57])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 11:10:22 -0700
From: Michael Cheng <michael.cheng@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 0/1]
Date: Thu, 14 Apr 2022 11:10:18 -0700
Message-Id: <20220414181019.24701-1-michael.cheng@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: thomas.hellstrom@linux.intel.com, michael.cheng@intel.com,
 wayne.boyer@intel.com, casey.g.bowman@intel.com, lucas.demarchi@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To align with the discussion in [1][2], this patch series drops all usage of    
wbvind_on_all_cpus within i915 by either replacing the call with certain        
drm clflush helpers, or reverting to a previous logic.                          
                                                                                 
[1]. https://lists.freedesktop.org/archives/dri-devel/2021-November/330928.html 
[2]. https://patchwork.freedesktop.org/patch/475752/?series=99991&rev=5 

v2 (Michael Cheng) : Per feedback from Thomas and Tvrtko, this series should be
split into two parts; First part is to unblock i915 from build errors and 
second part will focus on implementing range flushes on the propose reverts.


Michael Cheng (1):
  i915/gem: drop wbinvd_on_all_cpus usage

 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

-- 
2.25.1

