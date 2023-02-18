Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F2069BC44
	for <lists+dri-devel@lfdr.de>; Sat, 18 Feb 2023 22:16:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D738510E581;
	Sat, 18 Feb 2023 21:16:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 863EC10E2AD;
 Sat, 18 Feb 2023 21:15:55 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id m8so430382plg.3;
 Sat, 18 Feb 2023 13:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hI9qNsZmZouFqjT4Q7iKBhJP6Ch7PWCt+bcIXmzWxTA=;
 b=n8m0ik/8SEVtlt4tLy+1xKXcajLNDaoTcnObCr8qoX1kosoaMIoPX31NBzsj7seG30
 TaPhmBInQnPnfd0sbBYcu2Sjd2IA6FxDGaZmCXZoXtGjZW6hFd+e9Xciqw/mNaEUFrq1
 hjgq42bMdkekPwZy8PzTS6/Xq4JcoVNW50YdZjMsh/w+8uyRIy6w/+AWEK3pPnMvauwT
 wNnyWecM/dDofyumtFxiSCy6DM51SXQm97P8nGKVnoB2XUwupExO/xZ5cnsTPvxIDZIP
 qmCKeD3CtfUoaR56Ve0CFhe2vvZV/cLqVUjPQ858IZhTD5rfzOW9nQ9q1HUMtmg9/Zl0
 ZfYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hI9qNsZmZouFqjT4Q7iKBhJP6Ch7PWCt+bcIXmzWxTA=;
 b=MW+/aH/m03dNBkztO9oxpJvQE6SDW1GQ26PKDurj7BPP2p/QqGYbG67AK1ZeGu8GFw
 kGE0HPs73Qbid2/ALZyHaMF+ykEY5gkjh2F5M2ysDpguAOZsxUGsE4WPE1XIqtuWAxgn
 sv9igltorKK5n4a/uOO8MixR4iIDLgXVZe1tED9UNux3u9uLlY+xdzmljp7Hns8RQHoI
 86PLNr/+IkJqpxwLJ+bLiWOXuPRAAwrdApMcKRKxRWLcrDjHYvco9tZlCyqbFmbcOFdV
 IdXn3lluaX5dcD0ZIElf3a2DewORpmGpf6D3fmC4Gou9XIgaWClcrrcRfx53nEzOnxej
 iJ5A==
X-Gm-Message-State: AO0yUKUdwEOgEeT2mCNhGPkDxk6etZNUtIekvYpJfVDwRuJEccgkwXp0
 WX8pi+57vHTlEjqp13lgbhOb5mfai+0=
X-Google-Smtp-Source: AK7set9yuqIqkhJME2lpIvPyHaEjKyBB3ZOLwsVnLF62v/VV509uPfIKWgQ2ORuaU7W+EZTtXhgZJQ==
X-Received: by 2002:a17:902:f98d:b0:19a:a647:1881 with SMTP id
 ky13-20020a170902f98d00b0019aa6471881mr3492159plb.62.1676754955043; 
 Sat, 18 Feb 2023 13:15:55 -0800 (PST)
Received: from localhost (c-73-67-135-195.hsd1.or.comcast.net. [73.67.135.195])
 by smtp.gmail.com with ESMTPSA id
 a14-20020a170902ecce00b0019934030f46sm5057523plh.132.2023.02.18.13.15.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Feb 2023 13:15:54 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 05/14] dma-buf/sync_file: Add SET_DEADLINE ioctl
Date: Sat, 18 Feb 2023 13:15:48 -0800
Message-Id: <20230218211608.1630586-6-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230218211608.1630586-1-robdclark@gmail.com>
References: <20230218211608.1630586-1-robdclark@gmail.com>
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

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/dma-buf/sync_file.c    | 19 +++++++++++++++++++
 include/uapi/linux/sync_file.h | 22 ++++++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
index af57799c86ce..fb6ca1032885 100644
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
+	dma_fence_set_deadline(sync_file->fence, ktime_set(ts.tv_sec, ts.tv_nsec));
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
index ee2dcfb3d660..c8666580816f 100644
--- a/include/uapi/linux/sync_file.h
+++ b/include/uapi/linux/sync_file.h
@@ -67,6 +67,20 @@ struct sync_file_info {
 	__u64	sync_fence_info;
 };
 
+/**
+ * struct sync_set_deadline - set a deadline on a fence
+ * @tv_sec:	seconds elapsed since epoch
+ * @tv_nsec:	nanoseconds elapsed since the time given by the tv_sec
+ * @pad:	must be zero
+ *
+ * The timebase for the deadline is CLOCK_MONOTONIC (same as vblank)
+ */
+struct sync_set_deadline {
+	__s64	tv_sec;
+	__s32	tv_nsec;
+	__u32	pad;
+};
+
 #define SYNC_IOC_MAGIC		'>'
 
 /**
@@ -95,4 +109,12 @@ struct sync_file_info {
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

