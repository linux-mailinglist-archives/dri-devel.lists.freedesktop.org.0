Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E76D1CACDC4
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 11:27:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A98C10E1B0;
	Mon,  8 Dec 2025 10:27:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cq/isHgo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 421B310E1B0;
 Mon,  8 Dec 2025 10:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765189640; x=1796725640;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Y8Dmpvd+UQSO5SlTFf78YLSdntxFFao/JQ5Vvv+HRu8=;
 b=cq/isHgoPnRvNcnEYNVKDrZuj2JRrxtR1JM65Ipul+n5+GhiH5p4+wd4
 yJDl3MGjMdMDN4gmUSEa1PyaXyEDHssYAFDTomHnEyhV6Ng6yYIcYru74
 nZ+Fx1PTHp8fv7hj+f6afeeIuv08TqcYGxJtUce6cL5tVh8PykJKkWkM1
 ISNMH43swbRdiFOwvM2azOSSCX+0P5bKJCqSRIXWHNbU/UYui5nw6KpHU
 ++veU1L/11rZ3ux05msVr8I3ffl192AlDT8B/mzURWEfvac/1ljm6jejp
 qZs7d0Q2+MOsHVlWvHno80yOzRkQcPktahbsV4fsrossoMiPEraT7v9v8 w==;
X-CSE-ConnectionGUID: sm7XJkByTwWK4oWAXHPRHA==
X-CSE-MsgGUID: MNk5VShES+27+EgRSuTlDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="78593847"
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; d="scan'208";a="78593847"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 02:27:19 -0800
X-CSE-ConnectionGUID: Vi1PD8fGQrShcGkV7GTX/Q==
X-CSE-MsgGUID: f73XGVgXSgmzzPSzbInqsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; d="scan'208";a="194956180"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by orviesa006.jf.intel.com with ESMTP; 08 Dec 2025 02:27:18 -0800
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [RESEND 0/1] drm/buddy: release free_trees array on buddy mm teardown
Date: Mon,  8 Dec 2025 11:27:13 +0100
Message-ID: <20251208102714.4008260-1-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

Rebase and resend of [1]. Fixes: tag has been corrected to point at the
valid commit. Previous CI issues were inspected with a delay, hence
the resend to re-trigger CI run.

BR,
Michał

[1] https://lore.kernel.org/intel-xe/20251129214740.3305249-1-michal.grzelak@intel.com

Michał Grzelak (1):
  drm/buddy: release free_trees array on buddy mm teardown

 drivers/gpu/drm/drm_buddy.c | 1 +
 1 file changed, 1 insertion(+)

-- 
2.45.2

