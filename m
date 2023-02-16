Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA6F6989B6
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 02:11:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 210BA10E185;
	Thu, 16 Feb 2023 01:11:47 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A759E10E0C6;
 Thu, 16 Feb 2023 01:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676509905; x=1708045905;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SNhByuOeoAiHGlo4VH8zFgUa6rswrKwHm4jH04lkieI=;
 b=KjVe4eTM+uTAJR0VkxIrqOHo5kLJfwpsg7mw+/SLpzVp34qDbS2kVsR1
 81QKUAzdiIV4gug06a7xU1lPcY/n9f4u9d8qxoM6YhWxkYEaWIxXzlm/X
 D2J13q4jL3OFAGtkL1d6CB5SH1RO+07VNO2f16jJ9jqMbdkH3n3nFdwzk
 FiP+NRP7NCHnv4eV8MrJDTrruXbQWkLPWX00WH40Eeu1icXEfi8yvU03L
 V3OtKO/AKen1DI1HTEu6qYm5CIIrG6wmcqd5Abd8d3s9VNbiSfigkqZsJ
 xUKLstu786Qwuho7g+cQQlALxQNCGd24yq1289KzBH9T++eHGmlwzFLuh A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="311218989"
X-IronPort-AV: E=Sophos;i="5.97,301,1669104000"; d="scan'208";a="311218989"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2023 17:11:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="733674525"
X-IronPort-AV: E=Sophos;i="5.97,301,1669104000"; d="scan'208";a="733674525"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmsmga008.fm.intel.com with ESMTP; 15 Feb 2023 17:11:45 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v3 0/2] Don't use stolen memory or BAR mappings for ring
 buffers
Date: Wed, 15 Feb 2023 17:10:59 -0800
Message-Id: <20230216011101.1909009-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

Instruction from hardware arch is that stolen memory and BAR mappings
are unsafe for use as ring buffers. There can be issues with cache
aliasing due to the CPU access going to memory via the BAR. So, don't
do it.

v2: Dont use BAR mappings either.
Make conditional on LLC so as not to change platforms that don't need
to change (Daniele).
Add 'Fixes' tags (Tvrtko).
v3: Fix dumb typo.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (2):
  drm/i915: Don't use stolen memory for ring buffers with LLC
  drm/i915: Don't use BAR mappings for ring buffers with LLC

 drivers/gpu/drm/i915/gt/intel_ring.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
2.39.1

