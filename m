Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2DE69F0459
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 06:47:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C19C10EEF5;
	Fri, 13 Dec 2024 05:47:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iScZozK8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BE3610EEF5;
 Fri, 13 Dec 2024 05:47:30 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-216426b0865so12495435ad.0; 
 Thu, 12 Dec 2024 21:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734068850; x=1734673650; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WABVozVaGAUeC6WVv6dNDEWCXVmF+XIaxOqP2xXRnSs=;
 b=iScZozK8ZnFr0iSryj/biErGBGEAo/fKu//a/wd+SURkfFBMeDCDtZn66YsGGvWcHF
 IawR0pySgKgS46tFofoFtDUQtfbNJm5dtv8xFjvFC2tc4kEgp9yePdL1U9+MT1XRjQVM
 46m/kipTOasy1lfV80E9fTFqR+4jmTTXHV/HgtZKb9khMo+7CGL+lu7izWPq9Cxhp8C6
 eREBxVWIT5/gzyXfM9iVZ2fch6DflVA3ctpehqlwkVjdINPm4XM25nemS9ncuO6lYLAJ
 kmTbAWWzl83ZSCrKzYIvqAmoaBSmY5ZYWWz6paQ6vr15937rfLmH5qN5rhb1zLzqij96
 W05Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734068850; x=1734673650;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WABVozVaGAUeC6WVv6dNDEWCXVmF+XIaxOqP2xXRnSs=;
 b=oG6a5yhJe/zaBJJQ1BE9AdVtAOgTIY3BpdRB/loNcJfH0XUxx/kQnpnsLoaTlxoOyQ
 zXTwAeygVIn4aHIXMOxjzxb+7vNS24onwV/5n+Zkww0ABC/jwVz1tG6HlcNZTwJvxWcL
 hTjGjOdDRDKxpZ+6qVyfoAmQEs+H37QE+lJ3A4EBKuIAVzPMImO9aOAcjaj+DAjbrM4H
 8NjPsLwzLEh3eeJfkjSOobiHOtJTOYhaZlUilfg5oXlGUzRO13Xx7eTtAFBxAmbmph9s
 jdi7LKZoxr6n5zoIyhY+xKKzQ7J4AUCSy7moolnDStc/uHRtNHPzPgyp+2PDertInVFQ
 da1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0V/hdVkOXikA5lqtQS/qkWhTtMl0e4P7TfUe7fn4AnHlOv1AcGIjdnjMDe1E2JOgXgLsnD5nukAM=@lists.freedesktop.org,
 AJvYcCVUDuiA2tWZQBXHdE+N6smQQdGeni3T/9JHPp7zcexut3u4qMsMQa1ORVx6dLdH0iFdiHO4vmqjsw==@lists.freedesktop.org,
 AJvYcCW1gquKJdaex67jF9QsDBaTq9Fu5MSSoThtUSP/ufG7TAwrPhtSRVBAfGFS1bNAerfqCypc9VGISaNF@lists.freedesktop.org,
 AJvYcCXS2X2Cv0GXVRuE58zpKt4wH13okBiqIJ7Ev05o8Cf0RZL0ddmcg2T940zl9t35dNxrEcXiDGEmc5M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxvblv/e5jmEfbu8SaME7xeQYKMz9bZFskUUa88YS1+X71mBRni
 Gskh/dqN8JCYBpIRqWhllt9cuUzpVF4ZGRUp0aexwvssMSdq+bHw
X-Gm-Gg: ASbGncsoAwQeyjGoq3Q5g51wmZp2EuazS0X7sdkw/Cu3HIWE6gOfZrdwNuaznCZh8Rn
 7G7/ybWwC6R2LRt7YcBQYNg/wxIyVy5ctLQFYOO6LjSq0ruY6/8dR8ButGqhLkdMkN+j3IG1KZ6
 c+YoTcMUg0zXt3jdYImbJKKPln5ueJ412ethV+GZHuhutoxRnn5QvYU4grl1XYT1vJMmpa/s3Rf
 aPN9MBn3RjcJBONLeJFXm4ARgBTcork+daT5uBVlzl+3CrnH+8tXwqsvQaiceJr5HWNcaqowxAY
 HdgMYUQ=
X-Google-Smtp-Source: AGHT+IGFE1mRmyM5NL2PUAWpAoscqFHXvU8vwTTuUZkYB6i9lL3x0jZgiaefTaKhcRetCPxuiJ6lzw==
X-Received: by 2002:a17:90b:3889:b0:2ee:aa28:79aa with SMTP id
 98e67ed59e1d1-2f28fa55d20mr2136406a91.6.1734068850070; 
 Thu, 12 Dec 2024 21:47:30 -0800 (PST)
Received: from localhost.localdomain ([180.159.118.224])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-216483dd292sm82564985ad.226.2024.12.12.21.47.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 12 Dec 2024 21:47:29 -0800 (PST)
From: Yafang Shao <laoar.shao@gmail.com>
To: torvalds@linux-foundation.org,
	akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 x86@kernel.org, linux-snps-arc@lists.infradead.org,
 linux-wireless@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, ocfs2-devel@lists.linux.dev,
 Yafang Shao <laoar.shao@gmail.com>, Ofir Bitton <obitton@habana.ai>,
 Oded Gabbay <ogabbay@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
Subject: [PATCH 6/7] drivers: Repace get_task_comm() with %pTN
Date: Fri, 13 Dec 2024 13:46:09 +0800
Message-Id: <20241213054610.55843-7-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20241213054610.55843-1-laoar.shao@gmail.com>
References: <20241213054610.55843-1-laoar.shao@gmail.com>
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

Since task->comm is guaranteed to be NUL-terminated, we can print it
directly without the need to copy it into a separate buffer. This
simplifies the code and avoids unnecessary operations.

Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
Cc: Ofir Bitton <obitton@habana.ai>
Cc: Oded Gabbay <ogabbay@kernel.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>
---
 drivers/accel/habanalabs/common/context.c         |  5 ++---
 .../accel/habanalabs/common/habanalabs_ioctl.c    | 15 +++++----------
 .../gpu/drm/i915/display/intel_display_driver.c   | 10 ++++------
 drivers/gpu/drm/nouveau/nouveau_chan.c            |  4 +---
 drivers/gpu/drm/nouveau/nouveau_drm.c             |  7 +++----
 drivers/tty/tty_io.c                              |  5 ++---
 6 files changed, 17 insertions(+), 29 deletions(-)

diff --git a/drivers/accel/habanalabs/common/context.c b/drivers/accel/habanalabs/common/context.c
index b83141f58319..e4026051b735 100644
--- a/drivers/accel/habanalabs/common/context.c
+++ b/drivers/accel/habanalabs/common/context.c
@@ -199,7 +199,6 @@ int hl_ctx_create(struct hl_device *hdev, struct hl_fpriv *hpriv)
 
 int hl_ctx_init(struct hl_device *hdev, struct hl_ctx *ctx, bool is_kernel_ctx)
 {
-	char task_comm[TASK_COMM_LEN];
 	int rc = 0, i;
 
 	ctx->hdev = hdev;
@@ -271,8 +270,8 @@ int hl_ctx_init(struct hl_device *hdev, struct hl_ctx *ctx, bool is_kernel_ctx)
 
 		mutex_init(&ctx->ts_reg_lock);
 
-		dev_dbg(hdev->dev, "create user context, comm=\"%s\", asid=%u\n",
-			get_task_comm(task_comm, current), ctx->asid);
+		dev_dbg(hdev->dev, "create user context, comm=\"%pTN\", asid=%u\n",
+			current, ctx->asid);
 	}
 
 	return 0;
diff --git a/drivers/accel/habanalabs/common/habanalabs_ioctl.c b/drivers/accel/habanalabs/common/habanalabs_ioctl.c
index 1dd6e23172ca..32678cd0775a 100644
--- a/drivers/accel/habanalabs/common/habanalabs_ioctl.c
+++ b/drivers/accel/habanalabs/common/habanalabs_ioctl.c
@@ -1279,13 +1279,10 @@ static long _hl_ioctl(struct hl_fpriv *hpriv, unsigned int cmd, unsigned long ar
 		retcode = -EFAULT;
 
 out_err:
-	if (retcode) {
-		char task_comm[TASK_COMM_LEN];
-
+	if (retcode)
 		dev_dbg_ratelimited(dev,
-				"error in ioctl: pid=%d, comm=\"%s\", cmd=%#010x, nr=%#04x\n",
-				task_pid_nr(current), get_task_comm(task_comm, current), cmd, nr);
-	}
+				"error in ioctl: pid=%d, comm=\"%pTN\", cmd=%#010x, nr=%#04x\n",
+				task_pid_nr(current), current, cmd, nr);
 
 	if (kdata != stack_kdata)
 		kfree(kdata);
@@ -1308,11 +1305,9 @@ long hl_ioctl_control(struct file *filep, unsigned int cmd, unsigned long arg)
 	if (nr == _IOC_NR(DRM_IOCTL_HL_INFO)) {
 		ioctl = &hl_ioctls_control[nr - HL_COMMAND_START];
 	} else {
-		char task_comm[TASK_COMM_LEN];
-
 		dev_dbg_ratelimited(hdev->dev_ctrl,
-				"invalid ioctl: pid=%d, comm=\"%s\", cmd=%#010x, nr=%#04x\n",
-				task_pid_nr(current), get_task_comm(task_comm, current), cmd, nr);
+				"invalid ioctl: pid=%d, comm=\"%pTN\", cmd=%#010x, nr=%#04x\n",
+				task_pid_nr(current), current, cmd, nr);
 		return -ENOTTY;
 	}
 
diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drivers/gpu/drm/i915/display/intel_display_driver.c
index 56b78cf6b854..416aff49ceb8 100644
--- a/drivers/gpu/drm/i915/display/intel_display_driver.c
+++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
@@ -391,7 +391,6 @@ void intel_display_driver_resume_access(struct drm_i915_private *i915)
  */
 bool intel_display_driver_check_access(struct drm_i915_private *i915)
 {
-	char comm[TASK_COMM_LEN];
 	char current_task[TASK_COMM_LEN + 16];
 	char allowed_task[TASK_COMM_LEN + 16] = "none";
 
@@ -399,13 +398,12 @@ bool intel_display_driver_check_access(struct drm_i915_private *i915)
 	    i915->display.access.allowed_task == current)
 		return true;
 
-	snprintf(current_task, sizeof(current_task), "%s[%d]",
-		 get_task_comm(comm, current),
-		 task_pid_vnr(current));
+	snprintf(current_task, sizeof(current_task), "%pTN[%d]",
+		 current, task_pid_vnr(current));
 
 	if (i915->display.access.allowed_task)
-		snprintf(allowed_task, sizeof(allowed_task), "%s[%d]",
-			 get_task_comm(comm, i915->display.access.allowed_task),
+		snprintf(allowed_task, sizeof(allowed_task), "%pTN[%d]",
+			 i915->display.access.allowed_task,
 			 task_pid_vnr(i915->display.access.allowed_task));
 
 	drm_dbg_kms(&i915->drm,
diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index 2cb2e5675807..5bcfda6ecafe 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
@@ -279,7 +279,6 @@ nouveau_channel_ctor(struct nouveau_cli *cli, bool priv, u64 runm,
 	const u64 plength = 0x10000;
 	const u64 ioffset = plength;
 	const u64 ilength = 0x02000;
-	char name[TASK_COMM_LEN];
 	int cid, ret;
 	u64 size;
 
@@ -338,8 +337,7 @@ nouveau_channel_ctor(struct nouveau_cli *cli, bool priv, u64 runm,
 		chan->userd = &chan->user;
 	}
 
-	get_task_comm(name, current);
-	snprintf(args.name, sizeof(args.name), "%s[%d]", name, task_pid_nr(current));
+	snprintf(args.name, sizeof(args.name), "%pTN[%d]", current, task_pid_nr(current));
 
 	ret = nvif_object_ctor(&device->object, "abi16ChanUser", 0, hosts[cid].oclass,
 			       &args, sizeof(args), &chan->user);
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 107f63f08bd9..3264465cded6 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -1159,7 +1159,7 @@ nouveau_drm_open(struct drm_device *dev, struct drm_file *fpriv)
 {
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nouveau_cli *cli;
-	char name[32], tmpname[TASK_COMM_LEN];
+	char name[32];
 	int ret;
 
 	/* need to bring up power immediately if opening device */
@@ -1169,10 +1169,9 @@ nouveau_drm_open(struct drm_device *dev, struct drm_file *fpriv)
 		return ret;
 	}
 
-	get_task_comm(tmpname, current);
 	rcu_read_lock();
-	snprintf(name, sizeof(name), "%s[%d]",
-		 tmpname, pid_nr(rcu_dereference(fpriv->pid)));
+	snprintf(name, sizeof(name), "%pTN[%d]",
+		 current, pid_nr(rcu_dereference(fpriv->pid)));
 	rcu_read_unlock();
 
 	if (!(cli = kzalloc(sizeof(*cli), GFP_KERNEL))) {
diff --git a/drivers/tty/tty_io.c b/drivers/tty/tty_io.c
index 9771072da177..bd39167d4234 100644
--- a/drivers/tty/tty_io.c
+++ b/drivers/tty/tty_io.c
@@ -2622,14 +2622,13 @@ static int tty_tiocgicount(struct tty_struct *tty, void __user *arg)
 
 static int tty_set_serial(struct tty_struct *tty, struct serial_struct *ss)
 {
-	char comm[TASK_COMM_LEN];
 	int flags;
 
 	flags = ss->flags & ASYNC_DEPRECATED;
 
 	if (flags)
-		pr_warn_ratelimited("%s: '%s' is using deprecated serial flags (with no effect): %.8x\n",
-				__func__, get_task_comm(comm, current), flags);
+		pr_warn_ratelimited("%s: '%pTN' is using deprecated serial flags (with no effect): %.8x\n",
+				__func__, current, flags);
 
 	if (!tty->ops->set_serial)
 		return -ENOTTY;
-- 
2.43.5

