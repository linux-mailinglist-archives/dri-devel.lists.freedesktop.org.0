Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 611019A937E
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 00:43:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9614510E5BF;
	Mon, 21 Oct 2024 22:43:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qskf1m10";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8D8C10E112;
 Mon, 21 Oct 2024 22:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729550599; x=1761086599;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JR28UEzQgZRkSPMn4zXER/xKd4JgLndGP4iEnIVFpkU=;
 b=Qskf1m10GfOu/OkmL+qbUGLaKws12dfnfwlPgCQX9lR+n7s44BZopSdx
 HrFMatqpclLtLlcos4AxrT6bVxM82EeNxue5bev6V35V0xvL2BwdDehfN
 BQcB3lMggMnAdkWe2wwHgqB+ar8LjWrsTP9HQtlWAXS7c24NGNe1AXuCo
 LK58WwSFhX2ANP2MC7zJKJEhVTlj15ipRts8mXoyPT/G7gIgdRV00lnQ+
 dYFXr18VVfPVSSjElPXJ+PUifASlu4rV9/6qaquLzNKJQGW/E1bVoRxMe
 /DTwrFb+y7C5M4KZ4qALamCRzxhSkGYqQvWH3l2Wn2WO04fy3Lo15cQwT A==;
X-CSE-ConnectionGUID: D5T6+XDyTXy7OaEqgYUWkQ==
X-CSE-MsgGUID: Tib/fFEBRQGIhWKJuzLSEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="54464078"
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; d="scan'208";a="54464078"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 15:43:18 -0700
X-CSE-ConnectionGUID: 40Jg7XaaToWC0vXdmhLm9Q==
X-CSE-MsgGUID: VwMwfcjWQQmTD+CQdoQlqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; d="scan'208";a="79751014"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmviesa008.fm.intel.com with ESMTP; 21 Oct 2024 15:43:18 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v2 0/1] FOR-CI: drm/i915/guc: Move destroy context at end of
 reset prepare
Date: Mon, 21 Oct 2024 15:43:15 -0700
Message-Id: <20241021224316.293590-1-zhanjun.dong@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

During GuC reset prepare, interrupt disabled before hardware reset,
although interrupt disabled, the ct is still enabled, the host-GuC
communication is still active.
Move the destroy part to the end of reset preparation to avoid the
situation of host processing G2H messages about an context, but the
context already been destroyed.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>

Zhanjun Dong (1):
  drm/i915/guc: Move destroy context at end of reset prepare

 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
2.34.1

