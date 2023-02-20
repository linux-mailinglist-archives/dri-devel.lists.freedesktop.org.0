Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F9769D4B8
	for <lists+dri-devel@lfdr.de>; Mon, 20 Feb 2023 21:19:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C4D310E7A3;
	Mon, 20 Feb 2023 20:19:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F133D10E797;
 Mon, 20 Feb 2023 20:19:26 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 ei9-20020a17090ae54900b002349a303ca5so2508058pjb.4; 
 Mon, 20 Feb 2023 12:19:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UQ+HtpBiPCHT5rgzWcpe+Ijn6L9dvBBGUTrq3sDHFpM=;
 b=aBPYkWOPEw5s/QxVkQ4uEzGBQrGpC11xe6a0TdCQnHUz9Lg4Jg4ZFMMUitrcoAklRP
 uZ25ZVI2ki1L7kvXW8ZHCeL3XRW8vIrmTcvbmLNHTfQfuIhwhq/6KRI51xwTivD8Nwt9
 2i8h8Qu/SbG3uQ6z4j5SZbuDmaK23k7eYe2hsQJ2z9WkrYBUlKO5wNm06Ea+NGA6WSEK
 G765LgG9J/cCilXYb00n6OQwBOVe3BQn33mPy5GrrVirflLyYKBApVrnCE2uGEZz/I22
 g1XT4G+hunwHY8lhml2zoNS95+KJAjftv3pBbWw6tX4TsyTFo5pQJjR0y7jExqOC4+RB
 pkxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UQ+HtpBiPCHT5rgzWcpe+Ijn6L9dvBBGUTrq3sDHFpM=;
 b=Sv4A3YCbfsUbZCylHJ2vAwMS7Kf+0RE9ENioLBI4idolSzrBY3jU+ZddrbpLZYxUwn
 42PLJteTgw4Edc9syGdnMggQuyqwdnGc2Jh03SLUMn/Zn4AQpx0zHBsjPqCyCVsHw1V6
 P+iqB7h2RECUs2v9YoYfe6vs1qxyyACe3lSaAFhmd8Ax09tQYSB0KBArK6E1qGoibGkh
 NcJdrlpnKwaQRgAjfRopAt8VzDq/uHfedX32Xu2bCR2grD4Eo0w08djZFvlbI99adboy
 cqXeLFTtNZboxv4jMy0tSBmZJzhEXSidJBFUxh+pOdUozDPOSVX7uqbhj0mY7j4Nk7mM
 tDLQ==
X-Gm-Message-State: AO0yUKX+sDbE+XgWLZdDNCZKArkWwtu/bt2oHH/DYZU/tW26uKonE55u
 OCt/13fmK4KCsPBk4aDPj/Fu+TwiEXE=
X-Google-Smtp-Source: AK7set9EVO1gQGiG3KVtMCHENF5SPFZEN0nVUMY1XWm3OJSiYEagViseS4VaLvzQ2HdMN0PH+F+rPg==
X-Received: by 2002:a17:902:d484:b0:19c:1904:4490 with SMTP id
 c4-20020a170902d48400b0019c19044490mr6008782plg.63.1676924366311; 
 Mon, 20 Feb 2023 12:19:26 -0800 (PST)
Received: from localhost (c-73-67-135-195.hsd1.or.comcast.net. [73.67.135.195])
 by smtp.gmail.com with ESMTPSA id
 17-20020a170902c11100b0019945535973sm8350579pli.63.2023.02.20.12.19.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 12:19:25 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 05/14] dma-buf/sync_file: Add SET_DEADLINE ioctl
Date: Mon, 20 Feb 2023 12:18:52 -0800
Message-Id: <20230220201916.1822214-6-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230220201916.1822214-1-robdclark@gmail.com>
References: <20230220201916.1822214-1-robdclark@gmail.com>
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
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>,
 open list <linux-kernel@vger.kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Pekka Paalanen <ppaalanen@gmail.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
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

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/dma-buf/sync_file.c    | 19 +++++++++++++++++++
 include/uapi/linux/sync_file.h | 23 +++++++++++++++++++++++
 2 files changed, 42 insertions(+)

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
index ee2dcfb3d660..6d2ad4addf1b 100644
--- a/include/uapi/linux/sync_file.h
+++ b/include/uapi/linux/sync_file.h
@@ -67,6 +67,21 @@ struct sync_file_info {
 	__u64	sync_fence_info;
 };
 
+/**
+ * struct sync_set_deadline - set a deadline hint on a fence
+ * @deadline_ns: absolute time of the deadline
+ * @pad:	must be zero
+ *
+ * The timebase for the deadline is CLOCK_MONOTONIC (same as vblank)
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
@@ -95,4 +110,12 @@ struct sync_file_info {
  */
 #define SYNC_IOC_FILE_INFO	_IOWR(SYNC_IOC_MAGIC, 4, struct sync_file_info)
 
+
+/**
+ * DOC: SYNC_IOC_SET_DEADLINE - set a deadline on a fence
+ *
+ * Allows userspace to set a deadline on a fence, see dma_fence_set_deadline()
+ */
+#define SYNC_IOC_SET_DEADLINE	_IOW(SYNC_IOC_MAGIC, 5, struct sync_set_deadline)
+
 #endif /* _UAPI_LINUX_SYNC_H */
-- 
2.39.1

