Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B979B95050
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 10:36:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5B5A10E598;
	Tue, 23 Sep 2025 08:36:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="QLr+VwpE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A92B210E597
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 08:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1758616598;
 bh=qXLGFJtWA0bcjUsV5e/5U8pdxtyjza/sg2DcO2RRSrk=;
 h=From:To:Cc:Subject:Date:From;
 b=QLr+VwpECld3UJOrRzeldNxkSsLgf/yb/J1WD/m7Wsj1lgkLVw1wwsbP0CydeSihd
 SuQtO7QmkH9323SojocMfc8Va9x69ppqReMEnP7N08JVzm5qSdqEzA9iMsOZ1q1z03
 7/SNZ8E8yP7zLZWuekyrMZguTma/82smMqmwasW5capqodTtZErlK7n4LwmrDPdNnU
 4keYA6dEJnETiH2pYhqqVaq+D513PyGd3HmDdJAF+p4aiJW0ycM89i0rGpRIP3H2jF
 HtrAbJwC+HZ1H4fBqXrL4WOeRykI4ywrQeEOCWYBkhSYaVQ2swO9Krd5a9Bpr0fStF
 uSn0ecMXEa1BA==
Received: from localhost.localdomain (unknown
 [IPv6:2a02:2f08:ed09:4100:c764:4bdb:9a32:9b45])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: mvlad)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id B06A317E0A2B;
 Tue, 23 Sep 2025 10:36:37 +0200 (CEST)
From: Marius Vlad <marius.vlad@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniel.stone@collabora.com, dmitry.baryshkov@oss.qualcomm.com,
 jani.nikula@linux.intel.com, tzimmermann@suse.de, simona.vetter@ffwll.ch,
 derek.foreman@collabora.com
Subject: [PATCH v3 0/2] Pass down hot plug CONNECTOR ID to user-space
Date: Tue, 23 Sep 2025 11:36:34 +0300
Message-ID: <20250923083636.4749-1-marius.vlad@collabora.com>
X-Mailer: git-send-email 2.47.2
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

Patch series addresses a shortcoming where we're sending a hot plug event
without passing the actual CONNECTOR that caused it. This takes into
consideration both the polling path and the HPD (Hot Plug Detect) path.

v3: Address comments from Dmitry

- guard connector status write with mode_config.mutex
- avoid setting up the connector status and immediately unset it. Do the
  unset in drm_kms_helper_hotplug_event/drm_kms_helper_connector_hotplug_event

v2: Address comments from Daniel

- split patch into 2, one that introduces a bool to track connector
  connection status change and a patch that uses that to be able to send
  hot plug events with the proper CONNECTOR ID to udev and further pass
  that down to user-space
- nuke out mutex when iterating connector list
- fix typo

v2 is at https://lore.kernel.org/dri-devel/20250729165708.9947-1-marius.vlad@collabora.com/

Marius Vlad (2):
  drm: Introduce a new connector status
  drm: Propagate connector status change

 drivers/gpu/drm/drm_connector.c    |  1 +
 drivers/gpu/drm/drm_probe_helper.c | 40 ++++++++++++++++++++++++++----
 drivers/gpu/drm/drm_sysfs.c        |  1 +
 include/drm/drm_connector.h        |  3 +++
 4 files changed, 40 insertions(+), 5 deletions(-)

-- 
2.47.2

