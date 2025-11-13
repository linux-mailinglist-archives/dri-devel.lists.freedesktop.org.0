Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A60C59FC7
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 21:37:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18F6610E204;
	Thu, 13 Nov 2025 20:37:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="qw7RRXK8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com
 [95.215.58.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 400A510E1AB
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 20:37:38 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1763066256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=qHKb8nZ94N3WA1yikSZyZEzqqdJhxqdxLh9FZi2dFGc=;
 b=qw7RRXK8g7dVcOIwWFyBhCOGxeEyKGlPY8SCf8HGmQ/S+t9XSFbEdnsxIELPr1iMXa4xNS
 Q2kegdj1L07dkQfQs/qGKML2Xpuou3+4Q/uGz02UaYa/rD6lT23lP3llsAd9zTxdsAq60U
 PNRdQTnZk8GoxDN5SpE0mWDgA1qUTjM=
From: Sean Anderson <sean.anderson@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, Mike Looijmans <mike.looijmans@topic.nl>,
 David Airlie <airlied@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
 Maxime Ripard <mripard@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Simona Vetter <simona@ffwll.ch>, Michal Simek <michal.simek@amd.com>,
 Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH 0/3] drm: zynqmp: Make the video plane primary
Date: Thu, 13 Nov 2025 15:37:11 -0500
Message-Id: <20251113203715.2768107-1-sean.anderson@linux.dev>
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

The graphics plane does not support XRGB8888, which is the default mode
X uses for 24-bit color. Because of this, X must be set to use 16-bit
color, which has a measurable performance penalty. Make the video plane
the primary plane as it natively supports XRGB8888. An alternative
approach to add XRGB8888 to the graphics plane is discussed in [1], as
well as in patch 2.

[1] https://lore.kernel.org/dri-devel/20250627145058.6880-1-mike.looijmans@topic.nl/


Sean Anderson (3):
  drm: zynqmp: Check property creation status
  drm: zynqmp: Make the video plane primary
  drm: zynqmp: Add blend mode property to graphics plane

 drivers/gpu/drm/xlnx/zynqmp_kms.c | 42 +++++++++++++++++++++++++------
 1 file changed, 34 insertions(+), 8 deletions(-)

-- 
2.35.1.1320.gc452695387.dirty

