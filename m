Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9521621CB
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2020 08:56:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 546C66E16F;
	Tue, 18 Feb 2020 07:56:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE11589B0D
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2020 15:41:15 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id a9so18954420wmj.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2020 07:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=556jZPK8Ln3qyMHoFnra5q+K0qfU/YwU5Nw6Aae+qSY=;
 b=ebSOobPAYTfm2SFuYNP5SBLHSOZxKMF0XUXrOnV6s6UX7fzQNW7s1ZFIPs/qhlDMKA
 aPLGSHIUH0720Ztqotj6iPs6Yme49UDIXnaup04lUoweD4a24uE2garU5w5KE1CS1DA4
 MZxD3AjAENeWCdA9LtpaNTtSrkwHpNspFMPQdEfZolIw6WD8MvM5qMltMrTFg4CwTAAa
 aP4JZjwnJqu0hFALewUWR2bCfDoGr69gP4UYaLe80B5CYgLcNxb0acndzHMcMm6phCSZ
 gBVWlzhHWdoH3FFmhmPXqzG/25RPG3awBC7oyA7Ga66em9xIsonwI5MfVZo86I70CnGd
 anAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=556jZPK8Ln3qyMHoFnra5q+K0qfU/YwU5Nw6Aae+qSY=;
 b=KBfkmLeHiEUFoNUueTJcddZToHQg5y/gcOGuAOGqiPhNotUC4VPk9UfDEHXT3qiYAO
 JNBuD/FTOXZzp9dxVa2YG8ZrPQkIDRvLk/NRmVQv+9M1I6g6R8nHeScV+AtnhVI32eSA
 +lm4iNoI2eyV0AczycxfphsupDfKG5J3ndP/AQssQgsxc6QlUimy3zRVtkhG0l7XibzT
 Wmv5DNCU+6maQvkuPFNtRxJAB2GTj2w3FxGS9P6wTj3ZMdsi26M/xBKTsooErlIn7kD2
 Un5ZSWzblZLxueJEVlTd4qdWimGkSiEDA+zrD++8zS4SEMo7+sBNzo4UpuYDBXBJ3bMc
 OVSw==
X-Gm-Message-State: APjAAAWHiQwYXQSPB/LyWmDtEDlj2ZJL8ObWuCVhNSJr76+Dw0mOiiAp
 LjVJPfM61GzkgAm+ys22pmNfwA==
X-Google-Smtp-Source: APXvYqwp9OHTWaAU+Fqq1Q9B0XP8Yhr13ODlIppYq+8Cyk59QWRoG10yzWaBn5eWZeCNm23S6aj0iA==
X-Received: by 2002:a7b:c5cd:: with SMTP id n13mr22849920wmk.172.1581954074099; 
 Mon, 17 Feb 2020 07:41:14 -0800 (PST)
Received: from jamesh-VirtualBox.pitowers.org
 ([2a00:1098:3142:14:9260:684f:13fd:35ee])
 by smtp.gmail.com with ESMTPSA id h2sm1546370wrt.45.2020.02.17.07.41.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2020 07:41:13 -0800 (PST)
From: James Hughes <james.hughes@raspberrypi.com>
To: eric@anholt.net, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] GPU: DRM: VC4/V3D Replace wait_for macros in to remove use of
 msleep
Date: Mon, 17 Feb 2020 15:31:45 +0000
Message-Id: <20200217153145.13780-1-james.hughes@raspberrypi.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Tue, 18 Feb 2020 07:55:25 +0000
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
Cc: James Hughes <james.hughes@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The wait_for macro's for Broadcom VC4 and V3D drivers used msleep
which is inappropriate due to its inaccuracy at low values (minimum
wait time is about 30ms on the Raspberry Pi).

This patch replaces the macro with the one from the Intel i915 version
which uses usleep_range to provide more accurate waits.

Signed-off-by: James Hughes <james.hughes@raspberrypi.com>
---
 drivers/gpu/drm/v3d/v3d_drv.h | 41 ++++++++++++++++++++++-----------
 drivers/gpu/drm/vc4/vc4_drv.h | 43 +++++++++++++++++++++--------------
 2 files changed, 54 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index 7b4f3b5a086e..069fefe16d28 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -267,27 +267,42 @@ struct v3d_csd_job {
 };
 
 /**
- * _wait_for - magic (register) wait macro
+ * __wait_for - magic wait macro
  *
- * Does the right thing for modeset paths when run under kdgb or similar atomic
- * contexts. Note that it's important that we check the condition again after
- * having timed out, since the timeout could be due to preemption or similar and
- * we've never had a chance to check the condition before the timeout.
+ * Macro to help avoid open coding check/wait/timeout patterns. Note that it's
+ * important that we check the condition again after having timed out, since the
+ * timeout could be due to preemption or similar and we've never had a chance to
+ * check the condition before the timeout.
  */
-#define wait_for(COND, MS) ({ \
-	unsigned long timeout__ = jiffies + msecs_to_jiffies(MS) + 1;	\
-	int ret__ = 0;							\
-	while (!(COND)) {						\
-		if (time_after(jiffies, timeout__)) {			\
-			if (!(COND))					\
-				ret__ = -ETIMEDOUT;			\
+#define __wait_for(OP, COND, US, Wmin, Wmax) ({ \
+	const ktime_t end__ = ktime_add_ns(ktime_get_raw(), 1000ll * (US)); \
+	long wait__ = (Wmin); /* recommended min for usleep is 10 us */	\
+	int ret__;							\
+	might_sleep();							\
+	for (;;) {							\
+		const bool expired__ = ktime_after(ktime_get_raw(), end__); \
+		OP;							\
+		/* Guarantee COND check prior to timeout */		\
+		barrier();						\
+		if (COND) {						\
+			ret__ = 0;					\
 			break;						\
 		}							\
-		msleep(1);					\
+		if (expired__) {					\
+			ret__ = -ETIMEDOUT;				\
+			break;						\
+		}							\
+		usleep_range(wait__, wait__ * 2);			\
+		if (wait__ < (Wmax))					\
+			wait__ <<= 1;					\
 	}								\
 	ret__;								\
 })
 
+#define _wait_for(COND, US, Wmin, Wmax)	__wait_for(, (COND), (US), (Wmin), \
+						   (Wmax))
+#define wait_for(COND, MS)		_wait_for((COND), (MS) * 1000, 10, 1000)
+
 static inline unsigned long nsecs_to_jiffies_timeout(const u64 n)
 {
 	/* nsecs_to_jiffies64() does not guard against overflow */
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 7956f6ed9b6a..c59be5e1d52b 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -629,32 +629,41 @@ struct vc4_validated_shader_info {
 };
 
 /**
- * _wait_for - magic (register) wait macro
+ * __wait_for - magic wait macro
  *
- * Does the right thing for modeset paths when run under kdgb or similar atomic
- * contexts. Note that it's important that we check the condition again after
- * having timed out, since the timeout could be due to preemption or similar and
- * we've never had a chance to check the condition before the timeout.
+ * Macro to help avoid open coding check/wait/timeout patterns. Note that it's
+ * important that we check the condition again after having timed out, since the
+ * timeout could be due to preemption or similar and we've never had a chance to
+ * check the condition before the timeout.
  */
-#define _wait_for(COND, MS, W) ({ \
-	unsigned long timeout__ = jiffies + msecs_to_jiffies(MS) + 1;	\
-	int ret__ = 0;							\
-	while (!(COND)) {						\
-		if (time_after(jiffies, timeout__)) {			\
-			if (!(COND))					\
-				ret__ = -ETIMEDOUT;			\
+#define __wait_for(OP, COND, US, Wmin, Wmax) ({ \
+	const ktime_t end__ = ktime_add_ns(ktime_get_raw(), 1000ll * (US)); \
+	long wait__ = (Wmin); /* recommended min for usleep is 10 us */	\
+	int ret__;							\
+	might_sleep();							\
+	for (;;) {							\
+		const bool expired__ = ktime_after(ktime_get_raw(), end__); \
+		OP;							\
+		/* Guarantee COND check prior to timeout */		\
+		barrier();						\
+		if (COND) {						\
+			ret__ = 0;					\
 			break;						\
 		}							\
-		if (W && drm_can_sleep())  {				\
-			msleep(W);					\
-		} else {						\
-			cpu_relax();					\
+		if (expired__) {					\
+			ret__ = -ETIMEDOUT;				\
+			break;						\
 		}							\
+		usleep_range(wait__, wait__ * 2);			\
+		if (wait__ < (Wmax))					\
+			wait__ <<= 1;					\
 	}								\
 	ret__;								\
 })
 
-#define wait_for(COND, MS) _wait_for(COND, MS, 1)
+#define _wait_for(COND, US, Wmin, Wmax)	__wait_for(, (COND), (US), (Wmin), \
+						   (Wmax))
+#define wait_for(COND, MS)		_wait_for((COND), (MS) * 1000, 10, 1000)
 
 /* vc4_bo.c */
 struct drm_gem_object *vc4_create_object(struct drm_device *dev, size_t size);
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
