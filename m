Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 111306B1435
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 22:37:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48A5110E71E;
	Wed,  8 Mar 2023 21:37:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E474110E71E;
 Wed,  8 Mar 2023 21:37:35 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id p20so18962305plw.13;
 Wed, 08 Mar 2023 13:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678311455;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zV+om0NR+cnzqVQPHGOta3zbRdhEgtVU/fLMzwYN8as=;
 b=HsSBs0dJvWceXh5LSp0xnmwmEIPus+4IAVNqxtCvnlYpMiaI5Htyx/EN2gHnm+3ovs
 Ao/ax8gNdbDYlfcjbFZYC5oPKd0QvT9zsadpIs2xlFtoi7rDldSE02ylVJYzh283EQBu
 ltmTRgfU/qThsfu7JSxlPzvNsbPys8ygoOSD4eTxJyZmCsYiol2iCD4CIes8oEQfNccx
 bAeGvGa8/eJ3x/UngESYq19f3J17U1FJd+NC/qIgNWTmCgIc/XV/6ySSXkRuq31sFPrT
 4gUu6hk7DSk8gdXzn3SPJv+RBaZXzQEz6rqtdWmSX+1gts1F30/S+R5X275zn6Vq7A0B
 dxHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678311455;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zV+om0NR+cnzqVQPHGOta3zbRdhEgtVU/fLMzwYN8as=;
 b=RjxlJ39gamhEf0aE0UpAVbOpzTavIfivq5qtQjfGBbC49qYr3FNVNVTIZYcRAOHu51
 rf7dyhcmObl4ygmPCG2kNDsm6JLyiE0eg8TDY7DHkjwG0n2eDSG73qEtOWlRodeP9sOy
 IXmWhWx/QNtW/19+vBi1R7P+bjdGxv7eQeK30SS77wQ+uUf5+vLMbKh8aAI0jPJ5LqTk
 xvQvXubqw+w28rxL4jMbfVSk5nw0nos22mWiMPQNMBkMP+ct+HPQOOOpUmfXE3qRiRih
 PPjt618pvf24PUhGqc79GpaazCp/XmvggpuU5MuYeRao/mpNO67rtwH+7PAOqGs2sV9J
 lcFw==
X-Gm-Message-State: AO0yUKWjPBDf6/kBCj9H5dIuodaIHP76e9gwrKGpkCD1MyyAVjOWoHb4
 n9ukRniBKskr4mjNfR5Etpbg+tFqGkI=
X-Google-Smtp-Source: AK7set/9NpYoFpvd2vl0jKgvL9WPaSnHj9b5Kb4Pnus9IHEFb47PDh0N0Xkxv8nFi1QYKc6kzQFsyQ==
X-Received: by 2002:a17:903:2307:b0:19a:7060:948 with SMTP id
 d7-20020a170903230700b0019a70600948mr21142631plh.1.1678311454942; 
 Wed, 08 Mar 2023 13:37:34 -0800 (PST)
Received: from olv-ct-22.c.googlers.com.com
 (132.111.125.34.bc.googleusercontent.com. [34.125.111.132])
 by smtp.gmail.com with ESMTPSA id
 iw3-20020a170903044300b0019ca68ef7c3sm10285073plb.74.2023.03.08.13.37.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 13:37:34 -0800 (PST)
From: Chia-I Wu <olvaffe@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/amdkfd: fix potential kgd_mem UAFs
Date: Wed,  8 Mar 2023 13:37:24 -0800
Message-Id: <20230308213724.3396058-1-olvaffe@gmail.com>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
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
Cc: Felix Kuehling <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

kgd_mem should be accessed with p->mutex locked, or it could have been
freed by kfd_ioctl_free_memory_of_gpu.

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 6d291aa6386bd..3c630114210d6 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -1293,14 +1293,14 @@ static int kfd_ioctl_map_memory_to_gpu(struct file *filep,
 		args->n_success = i+1;
 	}
 
-	mutex_unlock(&p->mutex);
-
 	err = amdgpu_amdkfd_gpuvm_sync_memory(dev->adev, (struct kgd_mem *) mem, true);
 	if (err) {
 		pr_debug("Sync memory failed, wait interrupted by user signal\n");
 		goto sync_memory_failed;
 	}
 
+	mutex_unlock(&p->mutex);
+
 	/* Flush TLBs after waiting for the page table updates to complete */
 	for (i = 0; i < args->n_devices; i++) {
 		peer_pdd = kfd_process_device_data_by_id(p, devices_arr[i]);
@@ -1316,9 +1316,9 @@ static int kfd_ioctl_map_memory_to_gpu(struct file *filep,
 bind_process_to_device_failed:
 get_mem_obj_from_handle_failed:
 map_memory_to_gpu_failed:
+sync_memory_failed:
 	mutex_unlock(&p->mutex);
 copy_from_user_failed:
-sync_memory_failed:
 	kfree(devices_arr);
 
 	return err;
@@ -1332,6 +1332,7 @@ static int kfd_ioctl_unmap_memory_from_gpu(struct file *filep,
 	void *mem;
 	long err = 0;
 	uint32_t *devices_arr = NULL, i;
+	bool flush_tlb;
 
 	if (!args->n_devices) {
 		pr_debug("Device IDs array empty\n");
@@ -1384,16 +1385,19 @@ static int kfd_ioctl_unmap_memory_from_gpu(struct file *filep,
 		}
 		args->n_success = i+1;
 	}
-	mutex_unlock(&p->mutex);
 
-	if (kfd_flush_tlb_after_unmap(pdd->dev)) {
+	flush_tlb = kfd_flush_tlb_after_unmap(pdd->dev);
+	if (flush_tlb) {
 		err = amdgpu_amdkfd_gpuvm_sync_memory(pdd->dev->adev,
 				(struct kgd_mem *) mem, true);
 		if (err) {
 			pr_debug("Sync memory failed, wait interrupted by user signal\n");
 			goto sync_memory_failed;
 		}
+	}
+	mutex_unlock(&p->mutex);
 
+	if (flush_tlb) {
 		/* Flush TLBs after waiting for the page table updates to complete */
 		for (i = 0; i < args->n_devices; i++) {
 			peer_pdd = kfd_process_device_data_by_id(p, devices_arr[i]);
@@ -1409,9 +1413,9 @@ static int kfd_ioctl_unmap_memory_from_gpu(struct file *filep,
 bind_process_to_device_failed:
 get_mem_obj_from_handle_failed:
 unmap_memory_from_gpu_failed:
+sync_memory_failed:
 	mutex_unlock(&p->mutex);
 copy_from_user_failed:
-sync_memory_failed:
 	kfree(devices_arr);
 	return err;
 }
-- 
2.40.0.rc1.284.g88254d51c5-goog

