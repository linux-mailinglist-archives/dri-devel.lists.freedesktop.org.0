Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4857752C2C
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 23:33:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD18010E78B;
	Thu, 13 Jul 2023 21:33:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD52610E78B;
 Thu, 13 Jul 2023 21:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wefOQXZQwSDcp2ccRjthMbBFASOk2LxGNeKu9meJsro=; b=JWFiob9ERIYHygWAocTFwnHZf1
 +uazyGuftVZPQH5KKgq25teyGk168GsBKhcFBFqUi/obWJuO2LA37ryauNp4qC2eIlxd84PN/izne
 e6QqDRYAmmluEC6QASXQQt7jIrN2RSaFR6/IRd6V3RRjTTIa+4H5rBQrZPzEyUwvsrnXpR5NupxRd
 z24lAv18gtid3d33S7jgeUr4A1nlfoCsjQ+2zA9qXf6rZy4XCmj9kAoxhhdv0leDCa9NWHtnPZ8CO
 rsBnk0D1ke2t1Ow9GTFjoUPwe8JZoUoDdv3nQcm+qL6+GN6feKodxezlRUoti2Z3iMGwhrNXa0N+c
 K2eyVsdA==;
Received: from [187.74.70.209] (helo=steammachine.lan)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qK3wM-00EDEa-C8; Thu, 13 Jul 2023 23:33:34 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/6] drm/amdgpu: Create version number for coredumps
Date: Thu, 13 Jul 2023 18:32:42 -0300
Message-ID: <20230713213242.680944-7-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230713213242.680944-1-andrealmeid@igalia.com>
References: <20230713213242.680944-1-andrealmeid@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 =?UTF-8?q?=27Marek=20Ol=C5=A1=C3=A1k=27?= <maraeo@gmail.com>,
 =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>,
 michel.daenzer@mailbox.org, Samuel Pitoiset <samuel.pitoiset@gmail.com>,
 kernel-dev@igalia.com, alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Even if there's nothing currently parsing amdgpu's coredump files, if
we eventually have such tools they will be glad to find a version field
to properly read the file.

Create a version number to be displayed on top of coredump file, to be
incremented when the file format or content get changed.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h        | 3 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index cfeaf93934fd..905574acf3a0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1081,6 +1081,9 @@ struct amdgpu_device {
 };
 
 #ifdef CONFIG_DEV_COREDUMP
+
+#define AMDGPU_COREDUMP_VERSION "1"
+
 struct amdgpu_coredump_info {
 	struct amdgpu_device		*adev;
 	struct amdgpu_task_info         reset_task_info;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 431ccc3d7857..c83ea7aa135a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -4985,6 +4985,7 @@ static ssize_t amdgpu_devcoredump_read(char *buffer, loff_t offset,
 	p = drm_coredump_printer(&iter);
 
 	drm_printf(&p, "**** AMDGPU Device Coredump ****\n");
+	drm_printf(&p, "version: " AMDGPU_COREDUMP_VERSION "\n");
 	drm_printf(&p, "kernel: " UTS_RELEASE "\n");
 	drm_printf(&p, "module: " KBUILD_MODNAME "\n");
 	drm_printf(&p, "time: %lld.%09ld\n", coredump->reset_time.tv_sec, coredump->reset_time.tv_nsec);
-- 
2.41.0

