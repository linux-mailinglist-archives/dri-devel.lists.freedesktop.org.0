Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 229D287D728
	for <lists+dri-devel@lfdr.de>; Sat, 16 Mar 2024 00:09:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFABF112694;
	Fri, 15 Mar 2024 23:09:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="GdPBPgVK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com
 [95.215.58.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF8D4112694
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Mar 2024 23:09:26 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1710544164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=g0CAM95i80n59VZGkwHqlea1rQUP9k4U2WVriSCIsYE=;
 b=GdPBPgVKp+x3BhgDmR3jO4bwbIRmvCGlyyZr3/ONV9Yk16p2IrhiTrrEcEQjyZno0rr1Es
 MM3yszbKjMYbzVV9T6Yx74OenfVDXqMlAKUkFiKIZMVk0QKT88zOxpWA6y5c0Mw6/zU4Vw
 TFFQeQp++/hYVeO110XQY1B3TYLav/c=
From: Sean Anderson <sean.anderson@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org,
 Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH 0/6] drm: zynqmp_dp: Misc. patches and debugfs support
Date: Fri, 15 Mar 2024 19:09:10 -0400
Message-Id: <20240315230916.1759060-1-sean.anderson@linux.dev>
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

This series adds debugfs support for the zynqmp_dp driver. The intent is
to enable compliance testing or to help debug signal-integrity issues.

The first three patches are general improvements (and could be applied
independently), while the last three add debugfs support.


Sean Anderson (6):
  drm: zynqmp_dp: Downgrade log level for aux retries message
  drm: zynqmp_dp: Adjust training values per-lane
  drm: zynqmp_dp: Add locking
  drm: zynqmp_dp: Split off several helper functions
  drm: zynqmp_dp: Optionally ignore DPCD errors
  drm: zynqmp_dp: Add debugfs interface for compliance testing

 drivers/gpu/drm/xlnx/zynqmp_dp.c | 749 ++++++++++++++++++++++++++++---
 1 file changed, 691 insertions(+), 58 deletions(-)

-- 
2.35.1.1320.gc452695387.dirty

