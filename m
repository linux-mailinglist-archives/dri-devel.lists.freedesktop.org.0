Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0E6CF96BF
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 17:43:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74AE810E0BD;
	Tue,  6 Jan 2026 16:43:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="eversUs4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com
 [91.218.175.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC98610E0BD
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 16:43:07 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1767717785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=hLJ5TSFgVxNb97ViY0bF75+yIlZ7EweJuk9FX1+8Rs8=;
 b=eversUs4uq7J0CoDWipujPj+7P8CGr5Ig60nfSJn2W1JXdDo0egx9IDjsqZfW/c06CTFVW
 sGpdkXyGeFavWav8XbSXYLpHMOzp5+Vlr6Yq6DekMzXAaPtyaIxJr/h2Nj5ZO4PBz55uMk
 DvmORhgPPjoA7X4/D3Lej6NaIMNtNi0=
From: Sean Anderson <sean.anderson@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Cc: Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Michal Simek <michal.simek@amd.com>,
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mike Looijmans <mike.looijmans@topic.nl>,
 Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH v2 0/4] drm: zynqmp: Make the video plane primary
Date: Tue,  6 Jan 2026 11:42:43 -0500
Message-Id: <20260106164247.472544-1-sean.anderson@linux.dev>
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

Changes in v2:
- Allow specifying blend mode default
- Advertise coverage instead of premulti, since that's what the hardware
  supports.
- Set default blend mode to none since that's what the default was
  before this series.

Sean Anderson (4):
  drm/drm_blend: Allow specifying blend mode default
  drm: zynqmp: Check property creation status
  drm: zynqmp: Make the video plane primary
  drm: zynqmp: Add blend mode property to graphics plane

 drivers/gpu/drm/drm_blend.c       | 22 ++++++-------
 drivers/gpu/drm/xlnx/zynqmp_kms.c | 53 +++++++++++++++++++++++++------
 include/drm/drm_blend.h           | 26 +++++++++++++--
 3 files changed, 78 insertions(+), 23 deletions(-)

-- 
2.35.1.1320.gc452695387.dirty

