Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 978506509D8
	for <lists+dri-devel@lfdr.de>; Mon, 19 Dec 2022 11:13:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE36410E21C;
	Mon, 19 Dec 2022 10:13:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD7AC10E21B;
 Mon, 19 Dec 2022 10:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671444808; x=1702980808;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=y0xEbJ7n7nfQLUY0WVMQQFcbBR3/qNiDRBSrgZPdkTc=;
 b=kFMQpyyVYVoE7x30IuIAAXoQXit8Yejys8kOF2hoCAF6BRMbBLN7dX8f
 4bzrDp83H7HfELyS5Zeg88zp0jdV8cZ03n29Ud8YuTDEObyM2vO6E2n6y
 IM4WWjwK981dTpfDNR8ZydVh/LgEwBq0i4Hz01k/ct2vit+jJdhFQ4CrS
 kotiRyEYblBAxnayQE9d8yxkzoYFgxMMqmU5+WKqf+Ok0WAxyp00XDxDE
 ZuqSwa8vXxhqh2gFgvk0CMbIQYh1DLKyhWqZL00gDAfMbzz0/NynFCnpm
 hPJOTKyPvlw7S0rlXjC9FngoRysaVYJhbAKNIY9m4snXDxo1fg+mV6cez Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10565"; a="383661581"
X-IronPort-AV: E=Sophos;i="5.96,255,1665471600"; d="scan'208";a="383661581"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2022 02:13:27 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10565"; a="713970030"
X-IronPort-AV: E=Sophos;i="5.96,255,1665471600"; d="scan'208";a="713970030"
Received: from jacahill-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.235.153])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2022 02:13:26 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] TLB invalidation cleanup
Date: Mon, 19 Dec 2022 10:13:14 +0000
Message-Id: <20221219101316.168129-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

First patch to make the platform check not catch all due current lack of
automated testing.

Second patch to consolidate the code a bit and move invariant setup at engine
init time. Don't think I want to merge this one until some test coverage can be
had.

Tvrtko Ursulin (2):
  drm/i915: Do not cover all future platforms in TLB invalidation
  drm/i915: Consolidate TLB invalidation flow

 drivers/gpu/drm/i915/gt/intel_engine_cs.c    |  93 ++++++++++++++
 drivers/gpu/drm/i915/gt/intel_engine_types.h |  15 +++
 drivers/gpu/drm/i915/gt/intel_gt.c           | 124 +++----------------
 3 files changed, 128 insertions(+), 104 deletions(-)

-- 
2.34.1

