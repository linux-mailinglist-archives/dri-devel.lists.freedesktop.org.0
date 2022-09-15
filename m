Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 667935BA1E2
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 22:39:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1078810E2A7;
	Thu, 15 Sep 2022 20:39:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40A9B10E293;
 Thu, 15 Sep 2022 20:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663274381; x=1694810381;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8ZG6wv7aT37lm1frcPiDi4QX/Q1kU02OEc62jmO8U9g=;
 b=knrE1h1L3tR1GeJBkyedODAMiysJTHJcGxr54iHRktBRCGbgt/St1vPZ
 8JmpFklwngJf0AEeXbjASFW4k9oXLb31jtmYJE5AyQUoYPb5MXSOYN8FA
 3Py8d8mwRsF9IhJNDVqsWtIIAekugm6RcuE9jEDB0cT7WmOt2PY+hjGbe
 qBY5ZgF98KyUP38LBU1UuP/SwdGWKmBg2/GaeStpXUc0BBSI0RjOYDaS2
 6nDnLq0Z9D00ee6Dg2umlZacvXGbKLERADjrE3xOHxMDOTxaiYsriEcp1
 EmD+z1PfHZN4alEgRt47MFEOocZdqmOR8H2nYuUETVjvWsnGwt9SKXwOf w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10471"; a="300193622"
X-IronPort-AV: E=Sophos;i="5.93,319,1654585200"; d="scan'208";a="300193622"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2022 13:39:40 -0700
X-IronPort-AV: E=Sophos;i="5.93,319,1654585200"; d="scan'208";a="647991372"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.143])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2022 13:39:40 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v1 0/4] drm/i915: Improvements to stolen memory setup
Date: Thu, 15 Sep 2022 13:39:04 -0700
Message-Id: <20220915-stolen-v1-0-117c5f295bb2@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-bbe61
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
Cc: tejas.upadhyay@intel.com, aravind.iddamsetty@intel.com,
 dri-devel@lists.freedesktop.org, radhakrishna.sripada@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Better split, document, and make the code paths for integrated and discrete
more similar.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

---
Lucas De Marchi (4):
      drm/i915: Move dsm assignment to be after adjustment
      drm/i915: Add missing mask when reading GEN12_DSMBASE
      drm/i915: Split i915_gem_init_stolen()
      drm/i915/dgfx: Make failure to setup stolen non-fatal

 drivers/gpu/drm/i915/gem/i915_gem_stolen.c | 189 ++++++++++++++++-------------
 drivers/gpu/drm/i915/i915_reg.h            |   1 +
 2 files changed, 109 insertions(+), 81 deletions(-)
---
base-commit: bb4f6b2281b11b009210f62eecd291f7b75c1e85
change-id: 20220915-stolen-7aa0e407368f

Best regards,
-- 
Lucas De Marchi <lucas.demarchi@intel.com>
