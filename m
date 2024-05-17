Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B196B8C859A
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 13:26:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B11F10E2DB;
	Fri, 17 May 2024 11:26:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BtJqhkj/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7607F10E2DB;
 Fri, 17 May 2024 11:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715945168; x=1747481168;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dXULl0+kN0ulegZdFVVt0LL3evErDsYmW2gbVFQY8bI=;
 b=BtJqhkj/hBL1GGl4a/TRSneOREE6GaIoHBp0D4o0d9L8bY9P2EfqH87/
 OizAFeUBhts53o3mfWK362XLzO1sktrc6Fsczuxa9shzQ54bb51h5XtxJ
 sFA1MS5a1xaPha0km+kUAfCgvrP0voihigyCOCDEgFCuA4Cj1fHkYV9KC
 8RbeaBUNl1KXpCtrV1Eq8E8MFz6AmAC0NacpZDixWwv6tlCyR04syv9Uw
 yLaPqsN0ya3VLf/ackKRo+vVfvXeE7ZUfHp9momJX82HCGdVMdNZRJHUW
 AYXC1OA+VL0iV8tLvtLOyUZ0qId8pBYj7ExR7wqCKrC0P63BQhdKwr7wF w==;
X-CSE-ConnectionGUID: 0W9jcqzCR1q1KkUmvToKLA==
X-CSE-MsgGUID: 58QKU9EbTnSzgc7ZUqqitg==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="11921326"
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="11921326"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 04:26:08 -0700
X-CSE-ConnectionGUID: j/UYkUWUQ5KX5GvOfXDV6A==
X-CSE-MsgGUID: ifsjrtzjSBaZ6sMM9gF92Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="31700755"
Received: from bvivekan-mobl2.gar.corp.intel.com (HELO intel.com)
 ([10.247.118.196])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 04:26:01 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH 0/2] Don't be alarmed at FLR timeouts
Date: Fri, 17 May 2024 13:25:48 +0200
Message-ID: <20240517112550.251955-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

Hi,

often, on new platforms or firmware updates, we receive reports
of FLR timeout expiration and we shift the timeout we wait for
the reset to complete.

Let's not be alarmed if we reach a timeout while waiting for FLR
resets and print debugs rather than errors. The function is
anyway a void fucntions without any effect.

While at it, increase the timeout.

Thanks,
Andi

Andi Shyti (2):
  drm/i915: Increase FLR timeout from 3s to 9s
  drm/i915: Don't treat FLR resets as errors

 drivers/gpu/drm/i915/intel_uncore.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

-- 
2.43.0

