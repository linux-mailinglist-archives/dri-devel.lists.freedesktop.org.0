Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1B27AFBE5
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 09:22:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E4A910E1CD;
	Wed, 27 Sep 2023 07:22:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63AB610E1CD
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 07:22:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id A0A85CE184D;
 Wed, 27 Sep 2023 07:22:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADB79C433C7;
 Wed, 27 Sep 2023 07:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695799322;
 bh=m5nfXz80AWeNtcIS3xT2eMv/ZWCdRSi9WrXYqrxYqO8=;
 h=From:To:Cc:Subject:Date:From;
 b=h0xpiHy+ZovLsv2A6p13vmT/0h9gFwVFLq8EgBzJpTut0o8awrM7l08zbXFDqu90t
 Cro4MYvgyiv/X6qvHRpDmasv6bbfVEvFNjbP08ZdAn15c61yBC75Kip4qcRKwwbNM/
 bSmmOEpMucRdNp4AJ7iGKoZ79+3jsxkc5UqoMVUXlbX6VeDKU9klN8y8NAWCdkWVXl
 sBs27S64ZOi/BoGohFFsAH5Qbtv1lVZWDvSOPrYuj0Cdy/cDvlJMvQUxszNqgNoLhp
 vjTzyGmzJetND31JIX8VIQdXUzcy+eZce1ci7rRiVLJ3KDia2KUvvzRZlFA2Wxs1eV
 pW4G4OoH7m0dA==
From: Arnd Bergmann <arnd@kernel.org>
To: Oded Gabbay <ogabbay@kernel.org>,
	Tomer Tayar <ttayar@habana.ai>
Subject: [PATCH] accel/habanalabs: add missing debugfs function stubs
Date: Wed, 27 Sep 2023 09:21:53 +0200
Message-Id: <20230927072157.2544601-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
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
Cc: Ohad Sharabi <osharabi@habana.ai>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Dafna Hirschfeld <dhirschfeld@habana.ai>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Ofir Bitton <obitton@habana.ai>, farah kassabri <fkassabri@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

Two function stubs were removed in an earlier commit but are now needed
again:

drivers/accel/habanalabs/common/device.c: In function 'hl_device_init':
drivers/accel/habanalabs/common/device.c:2231:14: error: implicit declaration of function 'hl_debugfs_device_init'; did you mean 'drm_debugfs_dev_init'? [-Werror=implicit-function-declaration]
 2231 |         rc = hl_debugfs_device_init(hdev);
drivers/accel/habanalabs/common/device.c:2367:9: error: implicit declaration of function 'hl_debugfs_device_fini'; did you mean 'hl_debugfs_remove_file'? [-Werror=implicit-function-declaration]
 2367 |         hl_debugfs_device_fini(hdev);
      |         ^~~~~~~~~~~~~~~~~~~~~~

Fixes: 3b9abb4fa642e ("accel/habanalabs: expose debugfs files later")
Fixes: 09fe78d2e4421 ("accel/habanalabs: register compute device as an accel device")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/accel/habanalabs/common/habanalabs.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/accel/habanalabs/common/habanalabs.h b/drivers/accel/habanalabs/common/habanalabs.h
index 2a3acdbf91714..1655c101c7052 100644
--- a/drivers/accel/habanalabs/common/habanalabs.h
+++ b/drivers/accel/habanalabs/common/habanalabs.h
@@ -4041,6 +4041,15 @@ void hl_debugfs_set_state_dump(struct hl_device *hdev, char *data,
 
 #else
 
+static inline int hl_debugfs_device_init(struct hl_device *hdev)
+{
+	return 0;
+}
+
+static inline void hl_debugfs_device_fini(struct hl_device *hdev)
+{
+}
+
 static inline void hl_debugfs_add_device(struct hl_device *hdev)
 {
 }
-- 
2.39.2

