Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BAF6E5D9A
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 11:39:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C01810E12A;
	Tue, 18 Apr 2023 09:39:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBF4B10E12A
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 09:39:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E3C71623D5;
 Tue, 18 Apr 2023 09:39:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E2B9C433D2;
 Tue, 18 Apr 2023 09:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681810761;
 bh=xaI3K7MCLkZy3+e+eR2kUIl4q3HzkDongRje4wLA4cc=;
 h=From:To:Cc:Subject:Date:From;
 b=luvGJhGM+my6xXjjXwd0KmpLLyjxhK9IulUz5xhuSF4mCjdM45f28B0IiUmYyKFEG
 UR88LSRSptDFPwo3ursW3gf2Fz3qUYmuTMfPKjtg9+nfcuwfeAz16/COsUekRWz6gm
 j5tJdIjkvGIUK4u66lg3H+oorRAddnJIbA7NBJdzP3kloG31UtkHFT2YRKYnhjsUHx
 4H6OZlWZrbPQ2tmfauRlQzXHapxNnK/BCmYpxNBs865IwSIt7A4LSm5/UCoF3TeYmt
 KUx3qN9T8LLD+JztfK3HzRM4B+gsVtqXYcrb9OJYXNVmqmUc70WNHFsbSHuIirjOK5
 z0eeqHOXzeEiQ==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 01/10] accel/habanalabs: add helper to extract the FW
 major/minor
Date: Tue, 18 Apr 2023 12:39:07 +0300
Message-Id: <20230418093916.2979728-1-ogabbay@kernel.org>
X-Mailer: git-send-email 2.40.0
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

the helper is extract_u32_until_given_char and can later be used to
also get the major/minor of the sw version.

Signed-off-by: Dafna Hirschfeld <dhirschfeld@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/firmware_if.c | 69 ++++++++++++-------
 1 file changed, 45 insertions(+), 24 deletions(-)

diff --git a/drivers/accel/habanalabs/common/firmware_if.c b/drivers/accel/habanalabs/common/firmware_if.c
index 59f61ec66445..1400a4430045 100644
--- a/drivers/accel/habanalabs/common/firmware_if.c
+++ b/drivers/accel/habanalabs/common/firmware_if.c
@@ -71,38 +71,59 @@ static char *extract_fw_ver_from_str(const char *fw_str)
 	return NULL;
 }
 
-static int hl_get_preboot_major_minor(struct hl_device *hdev, char *preboot_ver)
+/**
+ * extract_u32_until_given_char() - given a string of the format "<u32><char>*", extract the u32.
+ * @str: the given string
+ * @ver_num: the pointer to the extracted u32 to be returned to the caller.
+ * @given_char: the given char at the end of the u32 in the string
+ *
+ * Return: Upon success, return a pointer to the given_char in the string. Upon failure, return NULL
+ */
+static char *extract_u32_until_given_char(char *str, u32 *ver_num, char given_char)
 {
-	char major[8], minor[8], *first_dot, *second_dot;
-	int rc;
+	char num_str[8] = {}, *ch;
 
-	first_dot = strnstr(preboot_ver, ".", 10);
-	if (first_dot) {
-		strscpy(major, preboot_ver, first_dot - preboot_ver + 1);
-		rc = kstrtou32(major, 10, &hdev->fw_major_version);
-	} else {
-		rc = -EINVAL;
-	}
+	ch = strchrnul(str, given_char);
+	if (*ch == '\0' || ch == str || ch - str >= sizeof(num_str))
+		return NULL;
 
-	if (rc) {
-		dev_err(hdev->dev, "Error %d parsing preboot major version\n", rc);
-		return rc;
+	memcpy(num_str, str, ch - str);
+	if (kstrtou32(num_str, 10, ver_num))
+		return NULL;
+	return ch;
+}
+
+/**
+ * hl_get_preboot_major_minor() - extract the FW's version major, minor from the version string.
+ * @hdev: pointer to the hl_device
+ * @preboot_ver: the FW's version string
+ *
+ * preboot_ver is expected to be the format of <major>.<minor>.<sub minor>*, e.g: 42.0.1-sec-3
+ * The extracted version is set in the hdev fields: fw_inner_{major/minor}_ver.
+ *
+ * Return: 0 on success, negative error code for failure.
+ */
+static int hl_get_preboot_major_minor(struct hl_device *hdev, char *preboot_ver)
+{
+	preboot_ver = extract_u32_until_given_char(preboot_ver, &hdev->fw_major_version, '.');
+	if (!preboot_ver) {
+		dev_err(hdev->dev, "Error parsing preboot major version\n");
+		goto err_zero_ver;
 	}
 
-	/* skip the first dot */
-	first_dot++;
+	preboot_ver++;
 
-	second_dot = strnstr(first_dot, ".", 10);
-	if (second_dot) {
-		strscpy(minor, first_dot, second_dot - first_dot + 1);
-		rc = kstrtou32(minor, 10, &hdev->fw_minor_version);
-	} else {
-		rc = -EINVAL;
+	preboot_ver = extract_u32_until_given_char(preboot_ver, &hdev->fw_minor_version, '.');
+	if (!preboot_ver) {
+		dev_err(hdev->dev, "Error parsing preboot minor version\n");
+		goto err_zero_ver;
 	}
+	return 0;
 
-	if (rc)
-		dev_err(hdev->dev, "Error %d parsing preboot minor version\n", rc);
-	return rc;
+err_zero_ver:
+	hdev->fw_major_version = 0;
+	hdev->fw_minor_version = 0;
+	return -EINVAL;
 }
 
 static int hl_request_fw(struct hl_device *hdev,
-- 
2.40.0

