Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9B879A1C1
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 05:21:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F1D410E0DE;
	Mon, 11 Sep 2023 03:21:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1565610E0D5;
 Mon, 11 Sep 2023 03:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jn/ADaH2GE8nN3Gtj0adGdRRXafHh9dbZUhl7F1IK3g=; b=hQDKvT0loWthjSogwQNKp2NeX6
 q3kz5YV340aEnb61QpdyLhVqFgnu5pY5/yeHH9xbmWtdrTkEUXzcDHUv5x4OY0iGGDhhW/9Gy38PZ
 hlmAuywccKLUUvEPqARKr/pYR+Ypr7ICNQN08lz9DRcvLMgLr9myFkVcuTn6qpmnEAwwPBI+O5H3f
 wtB7W4GTfxAG/Iv3+/J9bdZCXK7I0nY8+NcrKh1bYMd8l9iPgieKo43AZhXC6KzorwPfjNzpc+6RY
 5VAEUj7m6EOhu8v6LGGGqsfT5BrwEK9aXd0lrgSTDfLVcgjdVJ6p4EtcSq3x0BrtJqB7jvV6OLB5p
 34xJQZAQ==;
Received: from [187.10.204.7] (helo=steammachine.lan)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qfXAC-002C6C-H9; Mon, 11 Sep 2023 05:00:36 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 5/5] drm/amdgpu: Create version number for coredumps
Date: Mon, 11 Sep 2023 00:00:18 -0300
Message-ID: <20230911030018.73540-6-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230911030018.73540-1-andrealmeid@igalia.com>
References: <20230911030018.73540-1-andrealmeid@igalia.com>
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
 Shashank Sharma <shashank.sharma@amd.com>, kernel-dev@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Even if there's nothing currently parsing amdgpu's coredump files, if
we eventually have such tools they will be glad to find a version field
to properly read the file.

Create a version number to be displayed on top of coredump file, to be
incremented when the file format or content get changed.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
Reviewed-by: Shashank Sharma <shashank.sharma@amd.com>
---
v6: no change
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c | 1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
index 579b70a3cdab..e92c81ff27be 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
@@ -192,6 +192,7 @@ static ssize_t amdgpu_devcoredump_read(char *buffer, loff_t offset,
 	p = drm_coredump_printer(&iter);
 
 	drm_printf(&p, "**** AMDGPU Device Coredump ****\n");
+	drm_printf(&p, "version: " AMDGPU_COREDUMP_VERSION "\n");
 	drm_printf(&p, "kernel: " UTS_RELEASE "\n");
 	drm_printf(&p, "module: " KBUILD_MODNAME "\n");
 	drm_printf(&p, "time: %lld.%09ld\n", coredump->reset_time.tv_sec, coredump->reset_time.tv_nsec);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
index 01e8183ade4b..ec3a409ec509 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
@@ -88,6 +88,9 @@ struct amdgpu_reset_domain {
 };
 
 #ifdef CONFIG_DEV_COREDUMP
+
+#define AMDGPU_COREDUMP_VERSION "1"
+
 struct amdgpu_coredump_info {
 	struct amdgpu_device		*adev;
 	struct amdgpu_task_info         reset_task_info;
-- 
2.42.0

