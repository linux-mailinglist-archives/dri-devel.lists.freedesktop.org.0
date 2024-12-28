Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 485B59FDE34
	for <lists+dri-devel@lfdr.de>; Sun, 29 Dec 2024 10:27:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADE7810E040;
	Sun, 29 Dec 2024 09:27:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="bI0HTPaM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 302 seconds by postgrey-1.36 at gabe;
 Sat, 28 Dec 2024 06:37:52 UTC
Received: from out30-132.freemail.mail.aliyun.com
 (out30-132.freemail.mail.aliyun.com [115.124.30.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F286210E0BA;
 Sat, 28 Dec 2024 06:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1735367871; h=From:To:Subject:Date:Message-ID:MIME-Version;
 bh=MGGvG2Fzj1nmQzeJtG/D+iwRccsq+ANs4YuzTX7jMpU=;
 b=bI0HTPaMwR6Qd3MW/2vcvVbet7QZg3ocUjHgxhjq5UvvLskf9P9ytREKbC5BjbyKjU0fpm1TPK9U3s6Hebz4ZmAq1lL/kyLj4VNLUJCMVm2bGVT+44oq/Y1pL29OCArRucS8/M5JpeQHPw57RxTbYi/b9HiEcZKsy9SuN7clZVE=
Received: from localhost.localdomain(mailfrom:xueshuai@linux.alibaba.com
 fp:SMTPD_---0WMN3RGm_1735367565 cluster:ay36) by smtp.aliyun-inc.com;
 Sat, 28 Dec 2024 14:32:47 +0800
From: Shuai Xue <xueshuai@linux.alibaba.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, simona@ffwll.ch, lijo.lazar@amd.com, le.ma@amd.com,
 hamza.mahfooz@amd.com, tzimmermann@suse.de, shaoyun.liu@amd.com,
 Jun.Ma2@amd.com
Cc: xueshuai@linux.alibaba.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amdgpu: Enable runtime modification of gpu_recovery
 parameter with validation
Date: Sat, 28 Dec 2024 14:32:45 +0800
Message-ID: <20241228063245.61874-1-xueshuai@linux.alibaba.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 29 Dec 2024 09:27:47 +0000
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

It's observed that most GPU jobs utilize less than one server, typically
with each GPU being used by an independent job. If a job consumed poisoned
data, a SIGBUS signal will be sent to terminate it. Meanwhile, the
gpu_recovery parameter is set to -1 by default, the amdgpu driver resets
all GPUs on the server. As a result, all jobs are terminated. Setting
gpu_recovery to 0 provides an opportunity to preemptively evacuate other
jobs and subsequently manually reset all GPUs. However, this parameter is
read-only, necessitating correct settings at driver load. And reloading the
GPU driver in a production environment can be challenging due to reference
counts maintained by various monitoring services.

Set the gpu_recovery parameter with read-write permission to enable runtime
modification. It will enables users to dynamically manage GPU recovery
mechanisms based on real-time requirements or conditions.

Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 26 ++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 38686203bea6..03dd902e1cec 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -563,12 +563,36 @@ module_param_named(lbpw, amdgpu_lbpw, int, 0444);
 MODULE_PARM_DESC(compute_multipipe, "Force compute queues to be spread across pipes (1 = enable, 0 = disable, -1 = auto)");
 module_param_named(compute_multipipe, amdgpu_compute_multipipe, int, 0444);
 
+static int amdgpu_set_gpu_recovery(const char *buf,
+				   const struct kernel_param *kp)
+{
+	unsigned long val;
+	int ret;
+
+	ret = kstrtol(buf, 10, &val);
+	if (ret < 0)
+		return ret;
+
+	if (val != 1 && val != 0 && val != -1) {
+		pr_err("Invalid value for gpu_recovery: %ld, excepted 0,1,-1\n",
+		       val);
+		return -EINVAL;
+	}
+
+	return param_set_int(buf, kp);
+}
+
+static const struct kernel_param_ops amdgpu_gpu_recovery_ops = {
+	.set = amdgpu_set_gpu_recovery,
+	.get = param_get_int,
+};
+
 /**
  * DOC: gpu_recovery (int)
  * Set to enable GPU recovery mechanism (1 = enable, 0 = disable). The default is -1 (auto, disabled except SRIOV).
  */
 MODULE_PARM_DESC(gpu_recovery, "Enable GPU recovery mechanism, (1 = enable, 0 = disable, -1 = auto)");
-module_param_named(gpu_recovery, amdgpu_gpu_recovery, int, 0444);
+module_param_cb(gpu_recovery, &amdgpu_gpu_recovery_ops, &amdgpu_gpu_recovery, 0644);
 
 /**
  * DOC: emu_mode (int)
-- 
2.39.3

