Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3486B54C43
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 14:04:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 516FB10EC2E;
	Fri, 12 Sep 2025 12:04:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=astralinux.ru header.i=@astralinux.ru header.b="gfHV1WBQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-gw02.astralinux.ru (mail-gw02.astralinux.ru
 [93.188.205.243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A9B810EC2E;
 Fri, 12 Sep 2025 12:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=astralinux.ru;
 s=mail; t=1757678631;
 bh=Vl0rIhp9sKRA8jG8SKikvBPaeIGGXcTgtzw0C36iPxg=;
 h=From:To:Cc:Subject:Date:From;
 b=gfHV1WBQahPia/jamv6MnG3iWzPa6LuhUIkTFVPMREL3VneFzZFl0tFb3R970jXOR
 QmBDnaH84AsYY1McHqq5n3cvaEFz0atmLh5NlPsJsdufxG1Z60cKspEbEJAxEGhZru
 sIMoBmN7DkpYAXdXqKfawljDZdSiDK432fzKx46Hz2DOg4LWWRZARPVp83TAzvGX9d
 oF1jq8yggZUxxTeagWK/dOL3j1ZWWW1Cumrc7gr/mU2QBwYYDMN1lBOJQ7NCQ6ctoC
 1oVDXW4524v5LxLbd6qDan9E9JtamR794apUI/Diq9ycCjRG8H74KMceea4VzSXlO0
 EdCC7Jx/Zu+jg==
Received: from gca-msk-a-srv-ksmg01.astralinux.ru (localhost [127.0.0.1])
 by mail-gw02.astralinux.ru (Postfix) with ESMTP id DC9F31FA00;
 Fri, 12 Sep 2025 15:03:51 +0300 (MSK)
Received: from new-mail.astralinux.ru (unknown [10.177.185.199])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail-gw02.astralinux.ru (Postfix) with ESMTPS;
 Fri, 12 Sep 2025 15:03:50 +0300 (MSK)
Received: from rbta-msk-lt-169874.astralinux.site (unknown [10.198.57.215])
 by new-mail.astralinux.ru (Postfix) with ESMTPA id 4cNY3S5GmNz2xBx;
 Fri, 12 Sep 2025 15:03:16 +0300 (MSK)
From: Mikhail Dmitrichenko <mdmitrichenko@astralinux.ru>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mikhail Dmitrichenko <mdmitrichenko@astralinux.ru>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Francois Dugast <francois.dugast@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org,
 Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH v2 6.12 1/3] drm/managed: Add DRM-managed
 alloc_ordered_workqueue
Date: Fri, 12 Sep 2025 15:01:59 +0300
Message-Id: <20250912120202.240305-1-mdmitrichenko@astralinux.ru>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-KSMG-AntiPhishing: NotDetected, bases: 2025/09/12 10:31:00
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Envelope-From: mdmitrichenko@astralinux.ru
X-KSMG-AntiSpam-Info: LuaCore: 66 0.3.66
 fc5dda3b6b70d34b3701db39319eece2aeb510fb, {Tracking_uf_ne_domains},
 {Tracking_from_domain_doesnt_match_to}, astralinux.ru:7.1.1;
 patchwork.freedesktop.org:7.1.1; new-mail.astralinux.ru:7.1.1;
 127.0.0.199:7.1.2;
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1, FromAlignment: s
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiSpam-Lua-Profiles: 196220 [Sep 12 2025]
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Version: 6.1.1.11
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.0.7854,
 bases: 2025/09/12 09:49:00 #27811571
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-LinksScanning: NotDetected, bases: 2025/09/12 11:18:00
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 1
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

From: Louis Chauvet <louis.chauvet@bootlin.com>

commit c367b772e6d89d8c7b560c7df7e3803ce6b8bcea upstream.

Add drmm_alloc_ordered_workqueue(), a helper that provides managed ordered
workqueue cleanup. The workqueue will be destroyed with the final
reference of the DRM device.

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20250116-google-vkms-managed-v9-3-3e4ae1bd05a0@bootlin.com
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Mikhail Dmitrichenko <mdmitrichenko@astralinux.ru>
---
 drivers/gpu/drm/drm_managed.c |  8 ++++++++
 include/drm/drm_managed.h     | 12 ++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/drm_managed.c b/drivers/gpu/drm/drm_managed.c
index 79ce86a5bd67..cc4c463daae7 100644
--- a/drivers/gpu/drm/drm_managed.c
+++ b/drivers/gpu/drm/drm_managed.c
@@ -310,3 +310,11 @@ void __drmm_mutex_release(struct drm_device *dev, void *res)
 	mutex_destroy(lock);
 }
 EXPORT_SYMBOL(__drmm_mutex_release);
+
+void __drmm_workqueue_release(struct drm_device *device, void *res)
+{
+	struct workqueue_struct *wq = res;
+
+	destroy_workqueue(wq);
+}
+EXPORT_SYMBOL(__drmm_workqueue_release);
diff --git a/include/drm/drm_managed.h b/include/drm/drm_managed.h
index f547b09ca023..53017cc609ac 100644
--- a/include/drm/drm_managed.h
+++ b/include/drm/drm_managed.h
@@ -127,4 +127,16 @@ void __drmm_mutex_release(struct drm_device *dev, void *res);
 	drmm_add_action_or_reset(dev, __drmm_mutex_release, lock);	     \
 })									     \
 
+void __drmm_workqueue_release(struct drm_device *device, void *wq);
+
+#define drmm_alloc_ordered_workqueue(dev, fmt, flags, args...)					\
+	({											\
+		struct workqueue_struct *wq = alloc_ordered_workqueue(fmt, flags, ##args);	\
+		wq ? ({										\
+			int ret = drmm_add_action_or_reset(dev, __drmm_workqueue_release, wq);	\
+			ret ? ERR_PTR(ret) : wq;						\
+		}) :										\
+			wq;									\
+	})
+
 #endif
-- 
2.39.2

