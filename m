Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD936A6313
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 23:59:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8BE210E154;
	Tue, 28 Feb 2023 22:59:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 248CC10E12E;
 Tue, 28 Feb 2023 22:58:51 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 h17-20020a17090aea9100b0023739b10792so11156343pjz.1; 
 Tue, 28 Feb 2023 14:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677625130;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gs2AYZBiyJOWo2bwEtPyAED3FFjm3LWbSVDHsOlHbbQ=;
 b=muUcV42OpNmDtSH3eB+39vnSACqove5RL9oED345x5ztYt6mH/n6Remh2hRwDIf7jo
 0B86CLgfkW4Q9EynJL/rwqmWjx/4/bg6gnJqwCu++hmY11VijaNK/HdjK41NVhERiPV1
 ltYWNp9Nf0QLrKr1Nm3fexykYZ8GtnNRf6KR/CvYi2xsi497c4RxPpDhe4qnrfKQ9j57
 HShNzPLBQzkmpLXT/L7OC+zlmkhl5ArsL5hFn9luAPMcPL2QDvZw+9noVR6Fp4oAGjzr
 +fT387OP336WvE4nRuHQwWuItFKYNFSAzFRExIYvZtM2ZktqbA3Wt+N1r0/7K1Xr+HqW
 /6yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677625130;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gs2AYZBiyJOWo2bwEtPyAED3FFjm3LWbSVDHsOlHbbQ=;
 b=kLUovvz1W9kc6AK2bt3ZCsHupOzJ8G85r1sqJEp1HIk3/0s9NXXxQMtwaA9QhPJQWN
 K4zOplaKzaUZ7ySsUBp6XWx8yWcn5PbUUYv/neJh0BTFDQ+cwqcb8tQZXeLxGViElZTN
 koiGEqqHujD5cx+WRsO9LDvKevSnhTIf/Nenolzmwq3+WUlQt6obYIzgiZTxR/PuBq/8
 yUg6OCpX2fOsKCNFO0OT8aE/FtNWNT1bZ5UKit+maSbb2Vo4MOFRCE8MZnj6AFRRYXbE
 E35hLrLntSXoDUCyHDeAtbbvO8+FAYf07bgf0Mu+zgfolOCrn7DIcUyWOyI5DIHgon/5
 yjGA==
X-Gm-Message-State: AO0yUKUc9gYiFG98uMrDyui3abp4oQVb4ybsmOt8MXoEqnyxZ3MCNRHJ
 MrRymTgh8S5NKII3rYIsikxcykopjvE=
X-Google-Smtp-Source: AK7set/1+Xx8fpKwOaHOBR+49MN2QSzoZfSa3YaQZ7k/0ymgy+GqKeTLwmHuCADWYRyXhryjChCCDA==
X-Received: by 2002:a05:6a20:3d92:b0:cc:606a:4330 with SMTP id
 s18-20020a056a203d9200b000cc606a4330mr5567041pzi.55.1677625130191; 
 Tue, 28 Feb 2023 14:58:50 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 s23-20020aa78d57000000b00593c1c5bd0esm6492665pfe.164.2023.02.28.14.58.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 14:58:49 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v8 06/16] dma-buf/sync_file: Add SET_DEADLINE ioctl
Date: Tue, 28 Feb 2023 14:58:10 -0800
Message-Id: <20230228225833.2920879-7-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230228225833.2920879-1-robdclark@gmail.com>
References: <20230228225833.2920879-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Gustavo Padovan <gustavo@padovan.org>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>,
 open list <linux-kernel@vger.kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Pekka Paalanen <ppaalanen@gmail.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

The initial purpose is for igt tests, but this would also be useful for
compositors that wait until close to vblank deadline to make decisions
about which frame to show.

The igt tests can be found at:

https://gitlab.freedesktop.org/robclark/igt-gpu-tools/-/commits/fence-deadline

v2: Clarify the timebase, add link to igt tests
v3: Use u64 value in ns to express deadline.
v4: More doc

Signed-off-by: Rob Clark <robdclark@chromium.org>
Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
---
 drivers/dma-buf/dma-fence.c    |  3 ++-
 drivers/dma-buf/sync_file.c    | 19 +++++++++++++++++++
 include/uapi/linux/sync_file.h | 22 ++++++++++++++++++++++
 3 files changed, 43 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index f177c56269bb..74e36f6d05b0 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -933,7 +933,8 @@ EXPORT_SYMBOL(dma_fence_wait_any_timeout);
  *   the GPU's devfreq to reduce frequency, when in fact the opposite is what is
  *   needed.
  *
- * To this end, deadline hint(s) can be set on a &dma_fence via &dma_fence_set_deadline.
+ * To this end, deadline hint(s) can be set on a &dma_fence via &dma_fence_set_deadline
+ * (or indirectly via userspace facing ioctls like &sync_set_deadline).
  * The deadline hint provides a way for the waiting driver, or userspace, to
  * convey an appropriate sense of urgency to the signaling driver.
  *
diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
index af57799c86ce..418021cfb87c 100644
--- a/drivers/dma-buf/sync_file.c
+++ b/drivers/dma-buf/sync_file.c
@@ -350,6 +350,22 @@ static long sync_file_ioctl_fence_info(struct sync_file *sync_file,
 	return ret;
 }
 
+static int sync_file_ioctl_set_deadline(struct sync_file *sync_file,
+					unsigned long arg)
+{
+	struct sync_set_deadline ts;
+
+	if (copy_from_user(&ts, (void __user *)arg, sizeof(ts)))
+		return -EFAULT;
+
+	if (ts.pad)
+		return -EINVAL;
+
+	dma_fence_set_deadline(sync_file->fence, ns_to_ktime(ts.deadline_ns));
+
+	return 0;
+}
+
 static long sync_file_ioctl(struct file *file, unsigned int cmd,
 			    unsigned long arg)
 {
@@ -362,6 +378,9 @@ static long sync_file_ioctl(struct file *file, unsigned int cmd,
 	case SYNC_IOC_FILE_INFO:
 		return sync_file_ioctl_fence_info(sync_file, arg);
 
+	case SYNC_IOC_SET_DEADLINE:
+		return sync_file_ioctl_set_deadline(sync_file, arg);
+
 	default:
 		return -ENOTTY;
 	}
diff --git a/include/uapi/linux/sync_file.h b/include/uapi/linux/sync_file.h
index eced40c204d7..594b8bba7948 100644
--- a/include/uapi/linux/sync_file.h
+++ b/include/uapi/linux/sync_file.h
@@ -76,6 +76,27 @@ struct sync_file_info {
 	__u64	sync_fence_info;
 };
 
+/**
+ * struct sync_set_deadline - SYNC_IOC_SET_DEADLINE - set a deadline hint on a fence
+ * @deadline_ns: absolute time of the deadline
+ * @pad:	must be zero
+ *
+ * Allows userspace to set a deadline on a fence, see &dma_fence_set_deadline
+ *
+ * The timebase for the deadline is CLOCK_MONOTONIC (same as vblank).  For
+ * example
+ *
+ *     clock_gettime(CLOCK_MONOTONIC, &t);
+ *     deadline_ns = (t.tv_sec * 1000000000L) + t.tv_nsec + ns_until_deadline
+ */
+struct sync_set_deadline {
+	__u64	deadline_ns;
+	/* Not strictly needed for alignment but gives some possibility
+	 * for future extension:
+	 */
+	__u64	pad;
+};
+
 #define SYNC_IOC_MAGIC		'>'
 
 /**
@@ -87,5 +108,6 @@ struct sync_file_info {
 
 #define SYNC_IOC_MERGE		_IOWR(SYNC_IOC_MAGIC, 3, struct sync_merge_data)
 #define SYNC_IOC_FILE_INFO	_IOWR(SYNC_IOC_MAGIC, 4, struct sync_file_info)
+#define SYNC_IOC_SET_DEADLINE	_IOW(SYNC_IOC_MAGIC, 5, struct sync_set_deadline)
 
 #endif /* _UAPI_LINUX_SYNC_H */
-- 
2.39.1

