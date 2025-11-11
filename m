Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15277C4F046
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 17:23:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82F4A10E342;
	Tue, 11 Nov 2025 16:23:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="AAB9tkAD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 705DE10E342
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 16:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1762878219;
 bh=cAJW4FhExWtTjTIkoi4c9dVWKg6JSjrBmuNCJuakvw4=;
 h=From:To:Cc:Subject:Date:From;
 b=AAB9tkADuCofi005O1MX8pFTY5tQz5P7nWOneoTtWStEwReomY4eaoxQKCPP5pKTM
 3NY4pFYJSukOqG81jJmbRVMPyrYv6/8e5bmdaVGLZvTDlqIAVkKYm2X1+OFao7ImcI
 n8OjBYhgc9zu7jIqVuSt6p5NVqeM+hot6uFy4eWqQrT+JB/ab6MIiXuWdxOxXG6BER
 tsKTzX0vP1zjr6rKqhg1n326vCTtZ4d/u2lrqWej/w8aykxki39Uap+3hdrNFKaaUe
 9RKEhKH/URuremdr7zeHWdFMEPZAwMzfxGlfOYF9t2VSk7HIDwL2JeG5wFXns9ogW2
 lonWy649ZiOnw==
Received: from localhost.localdomain (unknown
 [IPv6:2a02:2f08:eb0f:ad00:ce0:1b50:8618:f920])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: mvlad)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 6C0C617E1203;
 Tue, 11 Nov 2025 17:23:39 +0100 (CET)
From: Marius Vlad <marius.vlad@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: dmitry.baryshkov@oss.qualcomm.com, tzimmermann@suse.de,
 simona.vetter@ffwll.ch, jani.nikula@linux.intel.com,
 ian.forbes@broadcom.com, louis.chauvet@bootlin.com,
 daniel.stone@collabora.com
Subject: [PATCH v5 0/4] Pass down hot-plug CONNECTOR ID to user-space
Date: Tue, 11 Nov 2025 18:23:34 +0200
Message-ID: <20251111162338.15141-1-marius.vlad@collabora.com>
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
It also adds support for the vkms driver (using ConfigFS) for
propagating the CONNECTOR ID when changing the connector's status.

v5:

- vkms: add support for sending the CONNECTOR ID when hot-plugging through 
  ConfigFS - as reported by Louis, vkms can now make use of ConfigFS to 
  simulate connector status.
- vkms: add a small change to ignore previous/old drm connector status
  when sending out hot-plug uevent.

v4:

- removed the "This patch" bit - Dmitry
- added a short note when the flag is set and cleared - Dmitry
- address double dead-locking detected - kbot: https://lore.kernel.org/dri-devel/202509251410.fdfbcac3-lkp@intel.com/
- virtual connectors do not seem have any kind of hotplug - added
  polling in vkms - as noted by Ian
- v4 is at https://lore.kernel.org/dri-devel/20251103174558.7709-1-marius.vlad@collabora.com/

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


Marius Vlad (4):
  drm: Introduce a new connector status
  drm: Propagate connector status change
  vkms: Do not send hotplug events for same connector status
  vkms: Pass the vkms connector as opposed to the vkms device

 drivers/gpu/drm/drm_connector.c       |  1 +
 drivers/gpu/drm/drm_probe_helper.c    | 39 +++++++++++++++++++++++----
 drivers/gpu/drm/drm_sysfs.c           |  1 +
 drivers/gpu/drm/vkms/vkms_configfs.c  | 12 +++++++--
 drivers/gpu/drm/vkms/vkms_connector.c |  6 ++---
 drivers/gpu/drm/vkms/vkms_connector.h |  4 +--
 include/drm/drm_connector.h           |  3 +++
 7 files changed, 54 insertions(+), 12 deletions(-)

-- 
2.47.2

