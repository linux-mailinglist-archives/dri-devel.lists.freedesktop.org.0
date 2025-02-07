Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D03A2C8B3
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 17:26:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B260010EB74;
	Fri,  7 Feb 2025 16:26:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="MPlDx1D4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com
 [95.215.58.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C3B410EB71
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 16:25:57 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1738945555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=tLZO5TvQipH7o3nT35LlHz7fY3vZ+oh2KE+7W4p1NmY=;
 b=MPlDx1D4hKyZxpnkM7gWL7ClY+G8TgNEpPFVZ9dHBoRPNNqY0lsJTo0L2t2KRFSFJhjrpI
 AutxiuNzupGNlBYhWN2vOeA7/XDFPsiDlWAbgeTLqrurZv4sDFVTjYdCn74G7IUrPPKK00
 U0h9RTa4AxqiMP3YJsh11wRVligoW+Y=
From: Sean Anderson <sean.anderson@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR XILINX)
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Michal Simek <michal.simek@amd.com>, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org (open list),
 Thomas Zimmermann <tzimmermann@suse.de>,
 Bart Van Assche <bvanassche@acm.org>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/ZYNQ ARCHITECTURE),
 Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH v2 0/2] drm: zynqmp_dp: Use scope-based mutex helpers
Date: Fri,  7 Feb 2025 11:25:26 -0500
Message-Id: <20250207162528.1651426-1-sean.anderson@linux.dev>
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

Changes in v2:
- Convert some conditional return statements to returns of ternary
  expressions.
- Remove unnecessary whitespace change

Bart Van Assche (1):
  drm: zynqmp_dp: Fix a deadlock in zynqmp_dp_ignore_hpd_set()

Sean Anderson (1):
  drm: zynqmp_dp: Use scope-based mutex helpers

 drivers/gpu/drm/xlnx/zynqmp_dp.c | 147 +++++++++++--------------------
 1 file changed, 50 insertions(+), 97 deletions(-)

-- 
2.35.1.1320.gc452695387.dirty

