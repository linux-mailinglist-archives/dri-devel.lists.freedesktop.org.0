Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7066DB954
	for <lists+dri-devel@lfdr.de>; Sat,  8 Apr 2023 09:45:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E84710E11B;
	Sat,  8 Apr 2023 07:45:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FAA310E11B
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Apr 2023 07:45:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0AAFA60AB7;
 Sat,  8 Apr 2023 07:45:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87B24C4339B;
 Sat,  8 Apr 2023 07:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680939922;
 bh=AK74XR+UpvNqgv2uILfTqQFwyI1jrXLow0DFBNJfK7Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SRzQAmipYDgVkv2Zc484p+d0LdUANIcA5pFTQVdGY38Z6WSuX81vVcxX76ChT5lWJ
 306yMBTPg488DFsoQyk13ZVQhFdHTe5vuKo83ukKtrQBYOWd+z5tzv5Qus9qtVFIhR
 6RwNgi/lb+Bz0TMwtgzCEHa0i+0B3N7xC6ADN4wt/urQ7otfk6ZXo+4tphDbbHsLDF
 kr4uR3SVQsB3ng3hGbqh0UH2LqKlSQkNIlItyu0vipZOd6aO/7+l1baxNhYGhoGt6m
 HVMwbexNHLuXJ2+NN9JKHn4lLi4mQzckBxwl+R8NenqraOMmKOHnA+RuN0FYWtKgX9
 K30/3KWd7aSBw==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/4] accel/habanalabs: add missing error flow in
 hl_sysfs_init()
Date: Sat,  8 Apr 2023 10:45:12 +0300
Message-Id: <20230408074512.2277163-4-ogabbay@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230408074512.2277163-1-ogabbay@kernel.org>
References: <20230408074512.2277163-1-ogabbay@kernel.org>
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
Cc: Tomer Tayar <ttayar@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tomer Tayar <ttayar@habana.ai>

hl_sysfs_fini() is called only if hl_sysfs_init() completes
successfully. Therefore if hl_sysfs_init() fails, need to remove any
sysfs group that was added until that point.

Signed-off-by: Tomer Tayar <ttayar@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/sysfs.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/habanalabs/common/sysfs.c b/drivers/accel/habanalabs/common/sysfs.c
index 735d8bed0066..01f89f029355 100644
--- a/drivers/accel/habanalabs/common/sysfs.c
+++ b/drivers/accel/habanalabs/common/sysfs.c
@@ -497,10 +497,14 @@ int hl_sysfs_init(struct hl_device *hdev)
 	if (rc) {
 		dev_err(hdev->dev,
 			"Failed to add groups to device, error %d\n", rc);
-		return rc;
+		goto remove_groups;
 	}
 
 	return 0;
+
+remove_groups:
+	device_remove_groups(hdev->dev, hl_dev_attr_groups);
+	return rc;
 }
 
 void hl_sysfs_fini(struct hl_device *hdev)
-- 
2.40.0

