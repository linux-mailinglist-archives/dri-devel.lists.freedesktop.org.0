Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F51501AF0
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 20:19:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D964D10E140;
	Thu, 14 Apr 2022 18:19:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB0DA10E140;
 Thu, 14 Apr 2022 18:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649960369; x=1681496369;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AL+4Pt5cxytp/6zr9clcWFJXM2urnsyIRrUa1XMWdzw=;
 b=U8cyCNXCRmR4afY4NUPV6rQKxSlezEiXC4PpKxwlnIVWJWU0zDcCLd0d
 Oo3gTFvpE0/d+dKnq94Wf1wyM7rGNWSSXz07HwCedKB4xPIKYbQoR4taO
 tGc3/WRRkLM5vg4e+xsAvLyVsgytndlTl1Aj4GxwXSkC1tj8saX1oEqcd
 wGB2f0YDUQJXtykrs5I5BKHFHX+ixtpJvX+cRQEeopjrJnbleQ7LGzICq
 +3WAfAw+KHoAMGRSHCNjDePYxJEYFDWElTnu2OKn7w1oikj12+cQvPJES
 11yAwvQDkOGeKO6nghM0enZptrimYpb49UwQs6fLznUWZU/pv0UtsmFua g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10317"; a="250298122"
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="250298122"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 11:19:29 -0700
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="527498390"
Received: from vijayve-mobl1.amr.corp.intel.com (HELO mvcheng-desk2.intel.com)
 ([10.212.162.57])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 11:19:28 -0700
From: Michael Cheng <michael.cheng@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 0/1] Drop wbinvd_on_all_cpus usage
Date: Thu, 14 Apr 2022 11:19:22 -0700
Message-Id: <20220414181923.25631-1-michael.cheng@intel.com>
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

