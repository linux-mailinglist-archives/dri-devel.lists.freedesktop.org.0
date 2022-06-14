Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 471D754B8E0
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 20:42:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD75B10E2E1;
	Tue, 14 Jun 2022 18:42:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A055910E2E1;
 Tue, 14 Jun 2022 18:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655232139; x=1686768139;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UZlbeoSxpAp/5XwDP4Hz2JX1/02hBNoVQ9fDD24zb1Y=;
 b=d2Rny8SdpAzyGj317tx4ZaW4AP4hyrvQo0D3PxmmSNvffDR5dnQjV0LM
 6PB729zTbC0WNk+TuSPcembBv9StV6AEp/S6Q42RJhXeWSkB7PJYrnsRv
 0oq0OUIzWRCQO/WdMr1kWxKNC/vmpa/JXBxCyvwxTpp4sdPpzhJAMl0KV
 5DYmGDI5fFh8RBUPyx/hUGR5ChMWD+7YgewdtFM25hGNVNfwdfl3eXuh5
 R/08LxcGPoXC+7HOr3Hh5GISDHa4V8YPTw01GtBo7FvFsJQBumcLZtDvP
 TBxbIBFEWDcSZYHKlvLImyU0qFvcszqspM2zem5ZdNmbbbLZOjBXN7E2j g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10378"; a="279426405"
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; d="scan'208";a="279426405"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2022 11:42:19 -0700
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; d="scan'208";a="588627286"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2022 11:42:16 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/3] Break VM to rq reference loop
Date: Wed, 15 Jun 2022 00:13:45 +0530
Message-Id: <20220614184348.23746-1-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
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
Cc: Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The i915_request holds a reference to intel_context, which in
turn holds a reference on the VM. But the dma-resv update for
VM_BIND feature would require VM hold a reference to the
i915_request through dma-resv fences of VM_PRIVATE objects
(which share a per VM dma-resv object).

Thus, we have a circular reference pattern causing the VM
reference to never reach 0, hence VM is not destroyed.

Break this by reverting the below patch which is making the
i915_request to hold a reference on intel_context.
"drm/i915: Hold reference to intel_context over life of i915_request"

This means we can't access rq->engine in i915_fence_get_driver_name()
as user do not hold a reference on rq->engine here. So, instead
store required device private pointer in 'rq->i915' and use it.

Niranjana Vishwanathapura (2):
  drm/i915: Do not access rq->engine without a reference
  Revert "drm/i915: Hold reference to intel_context over life of
    i915_request"

Ramalingam C (1):
  drm/i915: Do not use reserved requests for virtual engines

 drivers/gpu/drm/i915/i915_request.c | 55 ++++++++++++++++++-----------
 drivers/gpu/drm/i915/i915_request.h |  2 ++
 2 files changed, 36 insertions(+), 21 deletions(-)

-- 
2.20.1

