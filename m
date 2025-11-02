Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2D9C28F24
	for <lists+dri-devel@lfdr.de>; Sun, 02 Nov 2025 13:25:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 945B610E16F;
	Sun,  2 Nov 2025 12:25:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="f18H25qr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CC0810E16F
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Nov 2025 12:25:26 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-b991ddb06a9so365015a12.3
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Nov 2025 04:25:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762086325; x=1762691125; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HPAITQnPT8f3NoA/GWdr7roKgAtVZtrGCy1Wj82OPuM=;
 b=f18H25qr5yIXMtmh85cfBRN6DBTQ39LIt+WPTEq8wTdyIHnhcMyMt8eyY7gUzfvOzd
 C7xBPOqjLVcwZ5D2PtY4ACOV9T7Okl7YMY9V2LBqVsnDZudPHkDrypIKNXsv01teKIDD
 78gdgbh2EIJv+RBJ0evy6G9OobbU4j2UgCVUj3te/ZIgjlYSZ3gRd9bRLTfHHPn573Fq
 xEa6i3pFgb77cW8WREvcK7QxGUx6gWiBBZ2PbMYG6OIuAUjB7FThq2wEmksYB3EFuSVG
 tASimgVaO7SAEDfPh7FbQHzfxK6AIx+U7xZnfS/rA5Tgz4okAr22WDJKjeHXyRJ1N2s0
 TOuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762086325; x=1762691125;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HPAITQnPT8f3NoA/GWdr7roKgAtVZtrGCy1Wj82OPuM=;
 b=hJf/tfrWx3FVaNeFgGNofKUb/h4CjCqvvY+KwThBkgDkK6y2HULezU6rRaE6cTOW6v
 sq9n5zspeug/J8f5zj62VBoCDzhJfuvB9IxwhbAu8aNfJdJWsYCQUBNTCblYVteAYBAB
 g00cSpeapycCIVZGPfP7B1JGhKbdXe/NR7WgRVVRhZ2/+Qk3K0NneIx81AN7zsf/C3qM
 PGu8wv8tIjaQPcscf/8Nr9ti48TulCN7xVK7gIgr6G7wLkTrMErS2wFpLte0vP6rnnuG
 GkXBdmRStG2RLhNtXfcD2mHARF2886aLEAHCXsS9Lov+Yn9a6WGAaA9PPLoxStefxe7p
 SJug==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+Eba7Bejj50LZVAdHZGe9K+4lNBnWCrCFIbOl8qAF5deeql2RH715/qVwHHmgP09yksDfgkkCuoI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQS6ue3hjDvOJJC7Gl7Na6YGVd2d95KjRxtg9nWMVfPqCFvZoe
 zA5J7e46WN1YYJgdLpvY5+YjEhLOkT+8oYNfdsq48+fjKi7EOmUlYkx6
X-Gm-Gg: ASbGncvlATkusLmZTU51k7uxvYauhGk9R8E/ZA3XPg07h3ciVkL4c/Piev2kAKQhHlU
 ND/w38OxmRAlNUS2zwsCXQBD4qriPCpXE6gtdW+rwfBZJJfFSfhfqFQF1mH5t+dvcIoUohrzLqL
 gM2npHhopByapE2yeZC2Gh00gYu4oqubtHq9b4faZUmOiHL+ODKnTe/MZxARj3cGF+o2h67+pC2
 yUpQBkQZ9iQ6l+oAa7+Ag3yv++tCrL/T804DbEw66rvkOmgIdDh4i+EiT1C/2mZnW3WWj87Fv+i
 C411NrgsdqVctbPxgGdSusnTkL/B8nN62LQH7bpjI5ShnhdEUvpIwVuO9FoCNGttkJkuZHQFq53
 rtLJ9JXopc/1IdAa+26ycZFh/HvFVOoOG1dsSuRv+uhLdfP1Q27h88uCPEpHapwjEcPReTbKoTG
 gvh0jelL9YfFKZ
X-Google-Smtp-Source: AGHT+IFUI2gNHERa8lGBYVJ/VPD+f7hRdUsFXFRALpACNDsX30CRFcgPNcaVtF1ojHFvmr9u62IrKQ==
X-Received: by 2002:a17:903:41d0:b0:295:5116:6a7d with SMTP id
 d9443c01a7336-29551166bf6mr61961075ad.4.1762086325495; 
 Sun, 02 Nov 2025 04:25:25 -0800 (PST)
Received: from fedora ([2401:4900:1c6a:b269:720c:17be:423d:a240])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2959e4e598csm14094225ad.36.2025.11.02.04.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Nov 2025 04:25:25 -0800 (PST)
From: Shi Hao <i.shihao.999@gmail.com>
To: koby.elbaz@intel.com
Cc: konstantin.sinyuk@intel.com, ogabbay@kernel.org,
 gregkh@linuxfoundation.org, linux@weissschuh.net,
 akpm@linux-foundation.org, tomer.tayar@intel.com,
 easwar.hariharan@linux.microsoft.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, i.shihao.999@gmail.com
Subject: [PATCH] accel: habanalabs: use alloc_ordered_workqueue()
Date: Sun,  2 Nov 2025 17:55:11 +0530
Message-ID: <20251102122511.21141-1-i.shihao.999@gmail.com>
X-Mailer: git-send-email 2.51.0
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

Replace the deprecated create_singlethread_workqueue() functions with
alloc_ordered_workqueue() since it aligns with current workqueue API
modernization efforts. The conversion is safe since destroy_workqueue()
is used for cleanup in both cases.

No functional changes intended.

Signed-off-by: Shi Hao <i.shihao.999@gmail.com>
---
 drivers/accel/habanalabs/common/device.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
index 999c92d7036e..d100a59c31fb 100644
--- a/drivers/accel/habanalabs/common/device.c
+++ b/drivers/accel/habanalabs/common/device.c
@@ -903,7 +903,7 @@ static int device_early_init(struct hl_device *hdev)

 	for (i = 0 ; i < hdev->asic_prop.completion_queues_count ; i++) {
 		snprintf(workq_name, 32, "hl%u-free-jobs-%u", hdev->cdev_idx, (u32) i);
-		hdev->cq_wq[i] = create_singlethread_workqueue(workq_name);
+		hdev->cq_wq[i] = alloc_ordered_workqueue(workq_name, 0);
 		if (hdev->cq_wq[i] == NULL) {
 			dev_err(hdev->dev, "Failed to allocate CQ workqueue\n");
 			rc = -ENOMEM;
@@ -912,7 +912,7 @@ static int device_early_init(struct hl_device *hdev)
 	}

 	snprintf(workq_name, 32, "hl%u-events", hdev->cdev_idx);
-	hdev->eq_wq = create_singlethread_workqueue(workq_name);
+	hdev->eq_wq = alloc_ordered_workqueue(workq_name, 0);
 	if (hdev->eq_wq == NULL) {
 		dev_err(hdev->dev, "Failed to allocate EQ workqueue\n");
 		rc = -ENOMEM;
@@ -958,7 +958,7 @@ static int device_early_init(struct hl_device *hdev)
 	hl_mem_mgr_init(hdev->dev, &hdev->kernel_mem_mgr);

 	snprintf(workq_name, 32, "hl%u_device_reset", hdev->cdev_idx);
-	hdev->reset_wq = create_singlethread_workqueue(workq_name);
+	hdev->reset_wq = alloc_ordered_workqueue(workq_name, 0);
 	if (!hdev->reset_wq) {
 		rc = -ENOMEM;
 		dev_err(hdev->dev, "Failed to create device reset WQ\n");
--
2.51.0

