Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBC4C2D85A
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 18:46:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97D4210E4B4;
	Mon,  3 Nov 2025 17:46:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="iMWDMPpQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FD0710E4B3
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 17:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1762191959;
 bh=pctSjfRkIU7QLP8KbiN3tqFcGbyWbIapS2i0ze4iemw=;
 h=From:To:Cc:Subject:Date:From;
 b=iMWDMPpQ/NHzE5gy06HDPUAzinkiUMxUjH3MgUxwTOdQgSRxEL+19t5Dgk9UgXP/5
 4dKxglnZG8a6NVNecgMjPSlkIrMABCHH7reHMqMJ+FufXAZJLEr1YOZjPkAAcyWcKw
 XK96c7r23XbTjfJ0fHsMMy1P4hTF4CLJS1Y89CQZOQ57/sMh8XFBsbVUV/JTx/Nnwu
 1yIPe6H948w1xHrYXTl9CJOWPSt5m1T7xFMT71ldizoXiJLW0lmZMfgMCxssNrWtyD
 ydVT1a80WaJ1BuAPgjKVlQ0ElwpZS3TiB/L2LGkfmsLqeE7MH3J79dznYQSnoH0hJ/
 PDhUfcjUlE1kA==
Received: from localhost.localdomain (unknown
 [IPv6:2a02:2f08:e41c:5800:b6c0:b468:93e5:9b17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: mvlad)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id A212C17E1305;
 Mon,  3 Nov 2025 18:45:58 +0100 (CET)
From: Marius Vlad <marius.vlad@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: dmitry.baryshkov@oss.qualcomm.com, tzimmermann@suse.de,
 simona.vetter@ffwll.ch, jani.nikula@linux.intel.com,
 ian.forbes@broadcom.com, louis.chauvet@bootlin.com,
 daniel.stone@collabora.com
Subject: [PATCH v4 0/3] Pass down hot plug CONNECTOR ID to user-space
Date: Mon,  3 Nov 2025 19:45:54 +0200
Message-ID: <20251103174558.7709-1-marius.vlad@collabora.com>
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

v4:

- removed the "This patch" bit - Dmitry
- added a short note when the flag is set and cleared - Dmitry
- address double dead-locking detected - kbot: https://lore.kernel.org/dri-devel/202509251410.fdfbcac3-lkp@intel.com/
- virtual connectors do not seem have any kind of hotplug - added
  polling in vkms - as noted by Ian

v3: Address comments from Dmitry

- guard connector status write with mode_config.mutex
- avoid setting up the connector status and immediately unset it. Do the
  unset in drm_kms_helper_hotplug_event/drm_kms_helper_connector_hotplug_event
- v3 is at https://lore.kernel.org/dri-devel/20250923083636.4749-1-marius.vlad@collabora.com/

v2: Address comments from Daniel

- split patch into 2, one that introduces a bool to track connector
  connection status change and a patch that uses that to be able to send
  hot plug events with the proper CONNECTOR ID to udev and further pass
  that down to user-space
- nuke out mutex when iterating connector list
- fix typo
- v2 is at https://lore.kernel.org/dri-devel/20250729165708.9947-1-marius.vlad@collabora.com/


Marius Vlad (3):
  drm: Introduce a new connector status
  drm: Propagate connector status change
  drm/vkms: Add polling for HPD

 drivers/gpu/drm/drm_connector.c    |  1 +
 drivers/gpu/drm/drm_probe_helper.c | 39 ++++++++++++++++++++++++++----
 drivers/gpu/drm/drm_sysfs.c        |  1 +
 drivers/gpu/drm/vkms/vkms_drv.c    |  4 +++
 include/drm/drm_connector.h        |  3 +++
 5 files changed, 43 insertions(+), 5 deletions(-)

-- 
2.47.2

