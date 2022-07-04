Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC4C565BDA
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:23:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49A2010F7A7;
	Mon,  4 Jul 2022 16:16:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B22510E121;
 Mon,  4 Jul 2022 13:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0phgl7EvZ+68EkWmayGxcWn81UiJWGlHWdR6sc85jRE=; b=TgoWnxxuN1DhmlGUAQzX18SvQ4
 B66zPYwD1TxstxI+ZU5vHo9BJlQfiRw4fnAGb7IXPNiD35su9p6J9/ai8xSCuXG9QORMFHh1IRUzI
 Ld03p51UY0eAuFVdGswCohXAqpO8TwFXoPS4utONpYb6q07D10t5qUlqFLZ3ntYd1YSeJA0qle+dL
 uOMVjmxQNZbGHfV1OU1JhPp/Gfr/87UMjge+zhfk3MR2Ru0C3Re5pfjP1PckHy5KESIbgQmW6UIgm
 arJCM5qPOClJERlXoVdolYNgqdCncYwUEaE4Bi31xFR85AGiVr8lZxhY/r7i1SNTqULTxzTyEl1Ee
 WJr87gLw==;
Received: from 200-100-103-169.dial-up.telesp.net.br ([200.100.103.169]
 helo=localhost.localdomain) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1o8MPK-00H2Y2-C2; Mon, 04 Jul 2022 15:46:34 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?=27Christian=20K=C3=B6nig=27?= <christian.koenig@amd.com>,
 'Pan Xinhui' <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Tao Zhou <tao.zhou1@amd.com>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Jack Xiao <Jack.Xiao@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amdpgu/debugfs: Simplify some exit paths
Date: Mon,  4 Jul 2022 10:45:32 -0300
Message-Id: <20220704134532.103876-1-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.36.1
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
Cc: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 kernel-dev@igalia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To avoid code repetition, unify the function exit path when possible. No
functional changes.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 107 ++++++++------------
 1 file changed, 42 insertions(+), 65 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
index f3ac7912c29c..f3b3c688e4e7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
@@ -383,12 +383,8 @@ static ssize_t amdgpu_debugfs_regs_pcie_read(struct file *f, char __user *buf,
 
 		value = RREG32_PCIE(*pos);
 		r = put_user(value, (uint32_t *)buf);
-		if (r) {
-			pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
-			pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
-			amdgpu_virt_disable_access_debugfs(adev);
-			return r;
-		}
+		if (r)
+			goto out;
 
 		result += 4;
 		buf += 4;
@@ -396,11 +392,12 @@ static ssize_t amdgpu_debugfs_regs_pcie_read(struct file *f, char __user *buf,
 		size -= 4;
 	}
 
+	r = result;
+out:
 	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
 	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
-
 	amdgpu_virt_disable_access_debugfs(adev);
-	return result;
+	return r;
 }
 
 /**
@@ -441,12 +438,8 @@ static ssize_t amdgpu_debugfs_regs_pcie_write(struct file *f, const char __user
 		uint32_t value;
 
 		r = get_user(value, (uint32_t *)buf);
-		if (r) {
-			pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
-			pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
-			amdgpu_virt_disable_access_debugfs(adev);
-			return r;
-		}
+		if (r)
+			goto out;
 
 		WREG32_PCIE(*pos, value);
 
@@ -456,11 +449,12 @@ static ssize_t amdgpu_debugfs_regs_pcie_write(struct file *f, const char __user
 		size -= 4;
 	}
 
+	r = result;
+out:
 	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
 	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
-
 	amdgpu_virt_disable_access_debugfs(adev);
-	return result;
+	return r;
 }
 
 /**
@@ -502,12 +496,8 @@ static ssize_t amdgpu_debugfs_regs_didt_read(struct file *f, char __user *buf,
 
 		value = RREG32_DIDT(*pos >> 2);
 		r = put_user(value, (uint32_t *)buf);
-		if (r) {
-			pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
-			pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
-			amdgpu_virt_disable_access_debugfs(adev);
-			return r;
-		}
+		if (r)
+			goto out;
 
 		result += 4;
 		buf += 4;
@@ -515,11 +505,12 @@ static ssize_t amdgpu_debugfs_regs_didt_read(struct file *f, char __user *buf,
 		size -= 4;
 	}
 
+	r = result;
+out:
 	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
 	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
-
 	amdgpu_virt_disable_access_debugfs(adev);
-	return result;
+	return r;
 }
 
 /**
@@ -560,12 +551,8 @@ static ssize_t amdgpu_debugfs_regs_didt_write(struct file *f, const char __user
 		uint32_t value;
 
 		r = get_user(value, (uint32_t *)buf);
-		if (r) {
-			pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
-			pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
-			amdgpu_virt_disable_access_debugfs(adev);
-			return r;
-		}
+		if (r)
+			goto out;
 
 		WREG32_DIDT(*pos >> 2, value);
 
@@ -575,11 +562,12 @@ static ssize_t amdgpu_debugfs_regs_didt_write(struct file *f, const char __user
 		size -= 4;
 	}
 
+	r = result;
+out:
 	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
 	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
-
 	amdgpu_virt_disable_access_debugfs(adev);
-	return result;
+	return r;
 }
 
 /**
@@ -621,12 +609,8 @@ static ssize_t amdgpu_debugfs_regs_smc_read(struct file *f, char __user *buf,
 
 		value = RREG32_SMC(*pos);
 		r = put_user(value, (uint32_t *)buf);
-		if (r) {
-			pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
-			pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
-			amdgpu_virt_disable_access_debugfs(adev);
-			return r;
-		}
+		if (r)
+			goto out;
 
 		result += 4;
 		buf += 4;
@@ -634,11 +618,12 @@ static ssize_t amdgpu_debugfs_regs_smc_read(struct file *f, char __user *buf,
 		size -= 4;
 	}
 
+	r = result;
+out:
 	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
 	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
-
 	amdgpu_virt_disable_access_debugfs(adev);
-	return result;
+	return r;
 }
 
 /**
@@ -679,12 +664,8 @@ static ssize_t amdgpu_debugfs_regs_smc_write(struct file *f, const char __user *
 		uint32_t value;
 
 		r = get_user(value, (uint32_t *)buf);
-		if (r) {
-			pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
-			pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
-			amdgpu_virt_disable_access_debugfs(adev);
-			return r;
-		}
+		if (r)
+			goto out;
 
 		WREG32_SMC(*pos, value);
 
@@ -694,11 +675,12 @@ static ssize_t amdgpu_debugfs_regs_smc_write(struct file *f, const char __user *
 		size -= 4;
 	}
 
+	r = result;
+out:
 	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
 	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
-
 	amdgpu_virt_disable_access_debugfs(adev);
-	return result;
+	return r;
 }
 
 /**
@@ -1090,11 +1072,8 @@ static ssize_t amdgpu_debugfs_gfxoff_write(struct file *f, const char __user *bu
 		uint32_t value;
 
 		r = get_user(value, (uint32_t *)buf);
-		if (r) {
-			pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
-			pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
-			return r;
-		}
+		if (r)
+			goto out;
 
 		amdgpu_gfx_off_ctrl(adev, value ? true : false);
 
@@ -1104,10 +1083,12 @@ static ssize_t amdgpu_debugfs_gfxoff_write(struct file *f, const char __user *bu
 		size -= 4;
 	}
 
+	r = result;
+out:
 	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
 	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
-	return result;
+	return r;
 }
 
 
@@ -1139,18 +1120,12 @@ static ssize_t amdgpu_debugfs_gfxoff_read(struct file *f, char __user *buf,
 		uint32_t value;
 
 		r = amdgpu_get_gfx_off_status(adev, &value);
-		if (r) {
-			pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
-			pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
-			return r;
-		}
+		if (r)
+			goto out;
 
 		r = put_user(value, (uint32_t *)buf);
-		if (r) {
-			pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
-			pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
-			return r;
-		}
+		if (r)
+			goto out;
 
 		result += 4;
 		buf += 4;
@@ -1158,10 +1133,12 @@ static ssize_t amdgpu_debugfs_gfxoff_read(struct file *f, char __user *buf,
 		size -= 4;
 	}
 
+	r = result;
+out:
 	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
 	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
-	return result;
+	return r;
 }
 
 static const struct file_operations amdgpu_debugfs_regs2_fops = {
-- 
2.36.1

