Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5A5739E52
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 12:20:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4090610E533;
	Thu, 22 Jun 2023 10:19:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27D3210E52D;
 Thu, 22 Jun 2023 10:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687429196; x=1718965196;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9jam3CMoVZ6A/N5nfAjGK/fytBzu9GaWl/y16AysgMI=;
 b=Gy/z+/ZlUj6MHC5ATHyWD5pXGz/tmDNBcNpmLoYUGHOzko4rNOgdsxIN
 TGvkXgbTFoUXI/4ciPnPKFDhSRy/hoEHVDo4vTg3pnVyzd3I70ycrmkFQ
 P09T3/5kxIBWILgtglTAn0fk4kXg9jK2S7XIuJn2w5AF7RycoevD/Ii3f
 mFBcgb/DnuAYJagk1XCHd3ct80R8tyePh1hrnYa6b5bOLMc/K4hD4DOLI
 4et4+KiTkC6H8xu5AR3+QYRLFPiR/3Ttwc/J4fvOteZt5LOHNCpBDMMFG
 JofSoNHnNP57OOhmgIdBtFcKYNLMPZSgX+wsStD9RYV+943G/dCHeydku g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="345181952"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; d="scan'208";a="345181952"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 03:14:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="692193726"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; d="scan'208";a="692193726"
Received: from shari19x-mobl1.gar.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.173])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 03:14:29 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/4] drm/ttm: Fixes around resources and bulk moves
Date: Thu, 22 Jun 2023 12:14:08 +0200
Message-Id: <20230622101412.78426-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A couple of ttm fixes for issues that either were hit while developing the
xe driver or, for the resource leak patches, discovered during code
inspection.

Thomas Hellström (4):
  drm/ttm: Fix ttm_lru_bulk_move_pos_tail()
  drm/ttm: Don't shadow the operation context
  drm/ttm: Don't leak a resource on eviction error
  drm/ttm: Don't leak a resource on swapout move error

 drivers/gpu/drm/ttm/ttm_bo.c       | 20 ++++++++++----------
 drivers/gpu/drm/ttm/ttm_resource.c |  2 ++
 2 files changed, 12 insertions(+), 10 deletions(-)

-- 
2.40.1

