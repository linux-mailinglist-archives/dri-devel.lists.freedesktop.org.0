Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51268A2B275
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 20:42:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07B5010E0B1;
	Thu,  6 Feb 2025 19:41:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="wT6+1JkQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com
 [91.218.175.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D3CB10E0B1
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 19:41:56 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1738870908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=H3ERdyORHyhsdzYOMftryM/Ef5Li3AJl8m+M0gEaqgk=;
 b=wT6+1JkQUkGc+yfPr+1grUe8rHdlRqzGZfWVntt+KINN1QflyxK2Sk/VTtvH9aRDE5hdEx
 6DP7q/LhK49EUDCqPRe/EivkxM3mP4HA3O38lYtmpkg5ESXJZQ54EpPI2xj+Gakq9XbLxe
 0nlAoEUC5U8wdTd56AWzk4B3BpWXZu8=
From: Sean Anderson <sean.anderson@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR XILINX)
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/ZYNQ ARCHITECTURE),
 linux-kernel@vger.kernel.org (open list), David Airlie <airlied@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Michal Simek <michal.simek@amd.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Bart Van Assche <bvanassche@acm.org>,
 Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH 0/2] drm: zynqmp_dp: Use scope-based mutex helpers
Date: Thu,  6 Feb 2025 14:41:16 -0500
Message-Id: <20250206194117.1496245-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

Fix a mutex bug and convert most of the explicit mutex_(un)locks to
guards.


Bart Van Assche (1):
  drm: zynqmp_dp: Fix a deadlock in zynqmp_dp_ignore_hpd_set()

Sean Anderson (1):
  drm: zynqmp_dp: Use scope-based mutex helpers

 drivers/gpu/drm/xlnx/zynqmp_dp.c | 151 ++++++++++++-------------------
 1 file changed, 58 insertions(+), 93 deletions(-)

-- 
2.35.1.1320.gc452695387.dirty

