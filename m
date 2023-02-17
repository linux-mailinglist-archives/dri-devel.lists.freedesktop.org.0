Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 169AF69B681
	for <lists+dri-devel@lfdr.de>; Sat, 18 Feb 2023 00:48:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA8F010E05E;
	Fri, 17 Feb 2023 23:48:04 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B922610E473;
 Fri, 17 Feb 2023 23:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676677683; x=1708213683;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4wpgS6unnZT43kwEW+5oAyw6wRirKYs/iMsvEgYkGCQ=;
 b=O3ruuA/Xdz9CqT/ZZyrE2Ak45jTn4+LKX92Eq7ElUOUveQoz6Sxj/3ln
 gp20YxZHDreKC2eP0q+B/i4wwlkJOIiRjMrf25ImLT1+P8uD07mzsr1Yz
 ae2Z86N8frTpIJJhqyZrx0yICyMA7w3WOx48tfe4oUjbauNngdSwXwi8I
 j3xg25i4Fdl6Qt6oCro81F0QNif9RsEKfLjiQ4Wm+1VyBNZe5vDIRqdEP
 KgoA3XBIcdNRdIsvitViQ3exfH13KuQde4X6FdBxxke3/lNu1gmbNp3E/
 GkoaNHc0/0G/ev7ZULY8zywK7sVFPHWZMjsHt0bzUATY9E3cOZkoPBOTz g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="394600971"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="394600971"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 15:48:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="739427154"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="739427154"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmsmga004.fm.intel.com with ESMTP; 17 Feb 2023 15:47:56 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 0/2] Improvements to GuC load failure handling
Date: Fri, 17 Feb 2023 15:47:13 -0800
Message-Id: <20230217234715.3609670-1-John.C.Harrison@Intel.com>
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

Add more decoding of the GuC load failures. Also include information
about GT frequency to see if timeouts are due to a failure to boost
the clocks. Finally, increase the timeout to accommodate situations
where the clock boost does fail.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (2):
  drm/i915/guc: Improve GuC load error reporting
  drm/i915/guc: Allow for very slow GuC loading

 .../gpu/drm/i915/gt/uc/abi/guc_errors_abi.h   |  17 +++
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c     | 128 +++++++++++++++---
 drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h    |   4 +-
 3 files changed, 127 insertions(+), 22 deletions(-)

-- 
2.39.1

