Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A575C728189
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 15:39:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3702410E5C3;
	Thu,  8 Jun 2023 13:39:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B75210E5C3
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jun 2023 13:39:11 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 990E364DA5;
 Thu,  8 Jun 2023 13:39:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD758C433A4;
 Thu,  8 Jun 2023 13:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686231549;
 bh=Zpq/Y9o+eInggKNe8WO7TUg/6TozBHClv8sQmA9lFIg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RO8bTPCVN5s7yQf4Il5GoOb2rNzQyuZKpKA9lzvj1W7fIxAKBo3GbJYrrIMOdpyOF
 CUA/barHBnEDNx77TeW4jp1biYmXZ3mEF0jdjpUMe9kn+vLrrP1ENSuH7GVSB5HJQB
 lB3BE46GhbibX73kM4nouKd6y1wwYYflnwa795fPPvMRz9vLWpCfxlk6TSbcd7/34/
 NtQHYbpSYoywR01t8aYwJkLLbopv6DRTfVm4prhSjqqfe8/0x3ecS/Pp/3vEx2nWjN
 CbjfzJ5QMLpmivCQM1brS3fKt2j76rJwfmGsIpB3TjJlbLHk4uUZwL8Qr6zNOZUkst
 ZYqI3mkjOv6Kw==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 11/12] accel/habanalabs: call put_pid after hpriv list is
 updated
Date: Thu,  8 Jun 2023 16:38:48 +0300
Message-Id: <20230608133849.2739411-11-ogabbay@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230608133849.2739411-1-ogabbay@kernel.org>
References: <20230608133849.2739411-1-ogabbay@kernel.org>
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
Cc: Koby Elbaz <kelbaz@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Koby Elbaz <kelbaz@habana.ai>

Because we might still be using related resources, decrementing PID's
reference count should be done at later stages of the device release.
A good place is right after the representing private structure is
removed from LKD's list.

Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/device.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
index 764d40c0d666..c61a58a2e622 100644
--- a/drivers/accel/habanalabs/common/device.c
+++ b/drivers/accel/habanalabs/common/device.c
@@ -408,8 +408,6 @@ static void hpriv_release(struct kref *ref)
 
 	hdev->asic_funcs->send_device_activity(hdev, false);
 
-	put_pid(hpriv->taskpid);
-
 	hl_debugfs_remove_file(hpriv);
 
 	mutex_destroy(&hpriv->ctx_lock);
@@ -448,6 +446,8 @@ static void hpriv_release(struct kref *ref)
 	list_del(&hpriv->dev_node);
 	mutex_unlock(&hdev->fpriv_list_lock);
 
+	put_pid(hpriv->taskpid);
+
 	if (reset_device) {
 		hl_device_reset(hdev, HL_DRV_RESET_DEV_RELEASE);
 	} else {
-- 
2.40.1

