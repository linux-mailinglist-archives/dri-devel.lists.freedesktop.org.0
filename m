Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D468A3CB8
	for <lists+dri-devel@lfdr.de>; Sat, 13 Apr 2024 14:36:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B34E610E49B;
	Sat, 13 Apr 2024 12:36:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="UPNMQpXN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2750 seconds by postgrey-1.36 at gabe;
 Sat, 13 Apr 2024 12:36:19 UTC
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2A2EF10E49B
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Apr 2024 12:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=C/i+R
 Nq5Pzo3i3TYLnj/DsICAobD6rQqS8xqCwClBB8=; b=UPNMQpXNGkCqNPfm/uiqr
 2JLtqx5FZ36szmAX/TW6XXOB3u/8XlO7c1ZjCSGYrO542eBkWiM9MfDktyvIqC9w
 NfF9P5APJbRxV5gLjeh2MHduBSbPEPpeQOolaVPxVYgvglUD9sO0rfvbCpsIBf+9
 NBiH31uQOjv+9dDiQgAofE=
Received: from ProDesk.. (unknown [58.22.7.114])
 by gzga-smtp-mta-g3-5 (Coremail) with SMTP id _____wD3n+hVcRpmDvQVBA--.50814S2;
 Sat, 13 Apr 2024 19:49:45 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: boris.brezillon@collabora.com
Cc: daniel@ffwll.ch, airlied@gmail.com, liviu.dudau@arm.com,
 maarten.lankhorst@linux.intel.com, steven.price@arm.com,
 tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH] drm/panthor: Add defer probe for firmware load
Date: Sat, 13 Apr 2024 19:49:38 +0800
Message-Id: <20240413114938.740631-1-andyshrk@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3n+hVcRpmDvQVBA--.50814S2
X-Coremail-Antispam: 1Uf129KBjvdXoWruryxWryrCr4fKF1rKw1kuFg_yoWDtwc_CF
 4jyr1fXw48Ga4qqF1vka129Fy2kF4rZF1kZanYq34fCrnrGasrt39Fqry3W3y5WF10vasr
 ua4UXr40krW7CjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU84v3UUUUUU==
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBEBu-XmVODWy+XAABsD
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

From: Andy Yan <andy.yan@rock-chips.com>

The firmware in the rootfs will not be accessible until we
are in the SYSTEM_RUNNING state, so return EPROBE_DEFER until
that point.
This let the driver can load firmware when it is builtin.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

 drivers/gpu/drm/panthor/panthor_fw.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index 33c87a59834e..25e375f8333c 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -1336,8 +1336,17 @@ int panthor_fw_init(struct panthor_device *ptdev)
 	}
 
 	ret = panthor_fw_load(ptdev);
-	if (ret)
+	if (ret) {
+		/*
+		 * The firmware in the rootfs will not be accessible until we
+		 * are in the SYSTEM_RUNNING state, so return EPROBE_DEFER until
+		 * that point.
+		 */
+		if (system_state < SYSTEM_RUNNING)
+			ret = -EPROBE_DEFER;
+
 		goto err_unplug_fw;
+	}
 
 	ret = panthor_vm_active(fw->vm);
 	if (ret)
-- 
2.34.1

