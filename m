Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 054D06CA247
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 13:22:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2853010E370;
	Mon, 27 Mar 2023 11:22:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5AC610E370
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 11:22:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 10AF9B80ED0;
 Mon, 27 Mar 2023 11:22:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6130C4339B;
 Mon, 27 Mar 2023 11:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679916137;
 bh=vzlEepKDdCiToohMlBQ95g4dDfsTX/0Ak6UqP+gY0/E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Fbz4kKSOXDmYfxZKYd70i1gHBUDx9uIBuF4a3Q0tILfcUIA8222nwPx4TKcL6vd2Y
 ThDNABG9yPxFS5Zf4snm9dk7PkNlxbuTFD6KuBzujvkYJ29Av0oerg7ureGwueRbXn
 GO81eTpGLiqXTTmf2RaiYNhnwOLST0XVB4BvPdF7Al24ctNQ5XnBaRGK8gilfk+XYs
 KtTuPLI+SMAwcJsrHyyiwVQlc6uqXuidIOiY2h224BFFQYopvbCzqt33Np4dRiFTTn
 DcROnol7Ij7Y+SYkQ37f0M7rtOhpzIn7xJl56FOiUQNN7EJj9HNeUIye1HxRaJryQJ
 bkImhjs23Nafw==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] accel/habanalabs: improvements to FW ver extraction
Date: Mon, 27 Mar 2023 14:22:09 +0300
Message-Id: <20230327112210.1287876-2-ogabbay@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230327112210.1287876-1-ogabbay@kernel.org>
References: <20230327112210.1287876-1-ogabbay@kernel.org>
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
Cc: Dafna Hirschfeld <dhirschfeld@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dafna Hirschfeld <dhirschfeld@habana.ai>

1. Rename the func to hl_get_preboot_major_minor because we also set
   the extracted values in hdev fields.

2. Free the allocated string in the calling function which makes more
   sense

Signed-off-by: Dafna Hirschfeld <dhirschfeld@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/firmware_if.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/accel/habanalabs/common/firmware_if.c b/drivers/accel/habanalabs/common/firmware_if.c
index 96027a1c124d..781256dd49ad 100644
--- a/drivers/accel/habanalabs/common/firmware_if.c
+++ b/drivers/accel/habanalabs/common/firmware_if.c
@@ -71,7 +71,7 @@ static char *extract_fw_ver_from_str(const char *fw_str)
 	return NULL;
 }
 
-static int extract_fw_sub_versions(struct hl_device *hdev, char *preboot_ver)
+static int hl_get_preboot_major_minor(struct hl_device *hdev, char *preboot_ver)
 {
 	char major[8], minor[8], *first_dot, *second_dot;
 	int rc;
@@ -86,7 +86,7 @@ static int extract_fw_sub_versions(struct hl_device *hdev, char *preboot_ver)
 
 	if (rc) {
 		dev_err(hdev->dev, "Error %d parsing preboot major version\n", rc);
-		goto out;
+		return rc;
 	}
 
 	/* skip the first dot */
@@ -102,9 +102,6 @@ static int extract_fw_sub_versions(struct hl_device *hdev, char *preboot_ver)
 
 	if (rc)
 		dev_err(hdev->dev, "Error %d parsing preboot minor version\n", rc);
-
-out:
-	kfree(preboot_ver);
 	return rc;
 }
 
@@ -2181,8 +2178,8 @@ static int hl_fw_dynamic_read_device_fw_version(struct hl_device *hdev,
 
 			dev_info(hdev->dev, "preboot version %s\n", preboot_ver);
 
-			/* This function takes care of freeing preboot_ver */
-			rc = extract_fw_sub_versions(hdev, preboot_ver);
+			rc = hl_get_preboot_major_minor(hdev, preboot_ver);
+			kfree(preboot_ver);
 			if (rc)
 				return rc;
 		}
-- 
2.40.0

