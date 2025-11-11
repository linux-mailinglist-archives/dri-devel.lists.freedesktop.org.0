Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA48C4F04F
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 17:23:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1D9B10E608;
	Tue, 11 Nov 2025 16:23:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="JT/dLMYk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B36A410E342
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 16:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1762878221;
 bh=+gV6tgldzopffgkHlKP8Io5WpmkzE5VPLhhSiCaTlaA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JT/dLMYkfzvtTgUXDl3rRW72JSIGC1FoVV9i85Wo602Sc6eb2IEB4rmPCM/H2ZLrZ
 tuI0gKPUgQKsAy2MsIHbNDDCig08mo1qnRG3Oj594rdTldDK9Rt2d4vyuX98/Udzee
 AZwg0eWAtvAJQzWjno/9m2L2b5gHYRMim/jg4R76Ookja5U0ED21lnJPOlEvIA2FNY
 IDMy+bXop9rC1Cp68nau0TiIKOjefQg8Braom+0QI39mLrxkxdJZZvey7YwOUQAwKP
 SAJOvXKNrcb/MImwg0H8csOPyVZYz74M2hBVu0Q43tXYmiFXFHzg8caMDuJKcnmpwk
 YVX+DOWzFnqLw==
Received: from localhost.localdomain (unknown
 [IPv6:2a02:2f08:eb0f:ad00:ce0:1b50:8618:f920])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: mvlad)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id F061717E13B5;
 Tue, 11 Nov 2025 17:23:40 +0100 (CET)
From: Marius Vlad <marius.vlad@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: dmitry.baryshkov@oss.qualcomm.com, tzimmermann@suse.de,
 simona.vetter@ffwll.ch, jani.nikula@linux.intel.com,
 ian.forbes@broadcom.com, louis.chauvet@bootlin.com,
 daniel.stone@collabora.com
Subject: [PATCH 3/4] vkms: Do not send hotplug events for same connector status
Date: Tue, 11 Nov 2025 18:23:37 +0200
Message-ID: <20251111162338.15141-4-marius.vlad@collabora.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251111162338.15141-1-marius.vlad@collabora.com>
References: <20251111162338.15141-1-marius.vlad@collabora.com>
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

Rather than sending the same hotplug events just do it when the new drm
connector status has been changed.

Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
---
 drivers/gpu/drm/vkms/vkms_configfs.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index 6d6dd1a2c3a6..2b0ca61da62e 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -555,9 +555,11 @@ static ssize_t connector_status_store(struct config_item *item,
 		return -EINVAL;
 
 	scoped_guard(mutex, &connector->dev->lock) {
+		enum drm_connector_status old_status =
+			vkms_config_connector_get_status(connector->config);
 		vkms_config_connector_set_status(connector->config, status);
 
-		if (connector->dev->enabled)
+		if (connector->dev->enabled && old_status != status)
 			vkms_trigger_connector_hotplug(connector->dev->config->dev);
 	}
 
-- 
2.47.2

