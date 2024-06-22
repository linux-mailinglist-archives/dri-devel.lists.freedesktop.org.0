Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5371F913133
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jun 2024 02:46:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C49010EC03;
	Sat, 22 Jun 2024 00:46:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kbkdrI7H";
	dkim-atps=neutral
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2BAC10EBB9;
 Sat, 22 Jun 2024 00:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719017197; x=1750553197;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xXtVzfJ1/+5bdh7buG6wNVFa71PuzxcqgZUPEEpMaHk=;
 b=kbkdrI7Hd7lgmVFMMrfc51GqH88kNjuNNeWMKYSlV9rgK7Gy10J9M3QW
 jKQ3l1yDYRXJsQW4A+7a5sPMNCnUkoxcWErDgDh7te00Rf2Gj4l06SsQM
 p1aKisGZmd+dWRsEO2ePGNBfvkMv+YjNZwWVLTP+b3uEkv6jaVEnZLCOL
 JnLd00HSJ9PSoZH+/awGXM5l3647myF0BHwTaNjrj5ryUBvAh+FfbkEu9
 dLtx4VJprPm+WhKPE1osPo7U24qoGETAiBG6ywBHj/Lbh99b67QQxSUct
 yE08cIVyE7Pb4YLhrBVPhfIEGOGqoSufjRglb9LzoqT0ZADqhIkqybaZj g==;
X-CSE-ConnectionGUID: 491lDm6tQSeu6mX9aUcSGw==
X-CSE-MsgGUID: EBVm9MwvQsCaMFMl6JHdtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="26657904"
X-IronPort-AV: E=Sophos;i="6.08,256,1712646000"; d="scan'208";a="26657904"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 17:46:36 -0700
X-CSE-ConnectionGUID: 8Yq0PkBxRz+QiKsaQ8RmtQ==
X-CSE-MsgGUID: jfGEHN9vRDuBQC4q0s9sKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,256,1712646000"; d="scan'208";a="43182336"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa006.jf.intel.com with ESMTP; 21 Jun 2024 17:46:37 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Cc: DRI-Devel@Lists.FreeDesktop.Org, John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH 0/2] Extend Wa14019159160 and enable for ARL
Date: Fri, 21 Jun 2024 17:46:34 -0700
Message-ID: <20240622004636.662081-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.43.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

The context switch out workaround requires an extra piece on top.
Also, it applies to more platforms.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (2):
  drm/i915/arl: Enable Wa_14019159160 for ARL
  drm/i915/guc: Extend w/a 14019159160

 drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h |  1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.c        |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    | 18 +++++++++---------
 3 files changed, 11 insertions(+), 10 deletions(-)

-- 
2.43.2

