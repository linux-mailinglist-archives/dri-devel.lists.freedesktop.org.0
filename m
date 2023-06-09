Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F5E729908
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 14:06:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E71A310E68D;
	Fri,  9 Jun 2023 12:06:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AE0410E694
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 12:06:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6788061993;
 Fri,  9 Jun 2023 12:06:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02017C4339B;
 Fri,  9 Jun 2023 12:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686312401;
 bh=v6bBhjvR3wb5+zDe6fFJL1e6WRgLNxjq+2oxyd8st6Y=;
 h=From:To:Cc:Subject:Date:From;
 b=IaDDEPyDGRKU6NlO05JDn9LoTa7zqe31QHE4N8cTjytfZ25KdBh/JCOYo8W+8JUTu
 XelJjbZ7Ga6yJNqnlvkdggngIhSm9Co77MKLYBNNFwpO/DHqv9hkauc3yaCMLxIlr5
 jnr+RXKU9nb2TX95kNMpk74Rq80n3ZKrZMfyYRa63hKFq0oGOJc9o3d5DG+trcxBzr
 wV2ugJk8lKARDu7M0r1DKF4j6dQTJgc5IIuWHkcO9KARo+n70IyJ6uyNZnv3Qk9khR
 XmRirtNoSFKEHL+sMhWkW/6JhW0zgJDGQ1w9vWib7rLSAl0KFIA5DZtcSVMJYvDTas
 f+ESmY7ADgARw==
From: Arnd Bergmann <arnd@kernel.org>
To: Oded Gabbay <ogabbay@kernel.org>,
	Tomer Tayar <ttayar@habana.ai>
Subject: [PATCH] accel/habanalabs: add more debugfs stub helpers
Date: Fri,  9 Jun 2023 14:06:32 +0200
Message-Id: <20230609120636.3969045-1-arnd@kernel.org>
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
 Dafna Hirschfeld <dhirschfeld@habana.ai>, Ofir Bitton <obitton@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

Two functions got added with normal prototypes for debugfs, but not
alternative when building without it:

drivers/accel/habanalabs/common/device.c: In function 'hl_device_init':
drivers/accel/habanalabs/common/device.c:2177:14: error: implicit declaration of function 'hl_debugfs_device_init'; did you mean 'hl_debugfs_init'? [-Werror=implicit-function-declaration]
drivers/accel/habanalabs/common/device.c:2305:9: error: implicit declaration of function 'hl_debugfs_device_fini'; did you mean 'hl_debugfs_remove_file'? [-Werror=implicit-function-declaration]

Add stubs for these as well.

Fixes: 553311fc7b76e ("accel/habanalabs: expose debugfs files later")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/accel/habanalabs/common/habanalabs.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/accel/habanalabs/common/habanalabs.h b/drivers/accel/habanalabs/common/habanalabs.h
index d92ba2e30e310..2f027d5a82064 100644
--- a/drivers/accel/habanalabs/common/habanalabs.h
+++ b/drivers/accel/habanalabs/common/habanalabs.h
@@ -3980,6 +3980,15 @@ static inline void hl_debugfs_fini(void)
 {
 }
 
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

