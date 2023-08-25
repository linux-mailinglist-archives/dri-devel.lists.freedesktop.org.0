Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D65DA787FD0
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 08:27:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC73910E606;
	Fri, 25 Aug 2023 06:27:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-44.mta1.migadu.com (out-44.mta1.migadu.com [95.215.58.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5065C10E602
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 06:27:33 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1692944851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wd9rzcQO4o5TkX49UxGyU1jqO6hsnMsbjt9qVYaR0vo=;
 b=Un86inUGQHAzbv/iop1ydVXq6y358z4C6QQREMzovcbDvertp4NuWGO+x9UM8QENAavwJh
 1qy8vCrJISPWmY15TX2UFkBfE0qXG1HlAK6MWIDepmQq1aE/XDm9bbyCMocMyg6tUr2Zzs
 MONL/1/8GYuXjhUnJ2SVp70cZvgnsgI=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH 2/5] ALSA: hda/intel: Use pci_get_base_class() to reduce
 duplicated code
Date: Fri, 25 Aug 2023 14:27:11 +0800
Message-Id: <20230825062714.6325-3-sui.jingfeng@linux.dev>
In-Reply-To: <20230825062714.6325-1-sui.jingfeng@linux.dev>
References: <20230825062714.6325-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Sui Jingfeng <suijingfeng@loongson.cn>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, nouveau@lists.freedesktop.org,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
 Fred Oh <fred.oh@linux.intel.com>, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sui Jingfeng <suijingfeng@loongson.cn>

Should be no functional change

Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Fred Oh <fred.oh@linux.intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 sound/pci/hda/hda_intel.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index a21b61ad08d1..811a149584f2 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -1429,17 +1429,11 @@ static bool atpx_present(void)
 	acpi_handle dhandle, atpx_handle;
 	acpi_status status;
 
-	while ((pdev = pci_get_class(PCI_CLASS_DISPLAY_VGA << 8, pdev)) != NULL) {
-		dhandle = ACPI_HANDLE(&pdev->dev);
-		if (dhandle) {
-			status = acpi_get_handle(dhandle, "ATPX", &atpx_handle);
-			if (ACPI_SUCCESS(status)) {
-				pci_dev_put(pdev);
-				return true;
-			}
-		}
-	}
-	while ((pdev = pci_get_class(PCI_CLASS_DISPLAY_OTHER << 8, pdev)) != NULL) {
+	while ((pdev = pci_get_base_class(PCI_BASE_CLASS_DISPLAY, pdev))) {
+		if ((pdev->class != PCI_CLASS_DISPLAY_VGA << 8) &&
+		    (pdev->class != PCI_CLASS_DISPLAY_OTHER << 8))
+			continue;
+
 		dhandle = ACPI_HANDLE(&pdev->dev);
 		if (dhandle) {
 			status = acpi_get_handle(dhandle, "ATPX", &atpx_handle);
-- 
2.34.1

