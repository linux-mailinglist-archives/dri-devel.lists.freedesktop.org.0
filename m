Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CE01A0E5F
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 15:30:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 812C56E876;
	Tue,  7 Apr 2020 13:30:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E92D6E876
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Apr 2020 13:30:09 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id t203so1748364wmt.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Apr 2020 06:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UOi57oHr5s/5E0FnEyTsvZU+8lzzIWA8Vs7n3i5sOy8=;
 b=lqs5NYs1YiLhL8UYGIe9i385jAjKdLyTNCC0mcSp8NXYVc3B3fKruAFL7KGE5997nk
 AU0NOF6D1n0vf9dPE/x6VuROP+Kk/iTWwRUXo7Z7h38U6gNJLzwFX7IHoiTG1s18TFcw
 z0AOpuGJ1dDsRgYdXKmlWbNw4BQQf3H5w4pXk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UOi57oHr5s/5E0FnEyTsvZU+8lzzIWA8Vs7n3i5sOy8=;
 b=HtviLHA+8MIp52CiyAe6jc8Lo9PtKGMbQMFxpDb0h9sOi0tV2CylOv06Fptowx1Jsi
 K3gsq2xGlfdZOmG/TVOjZ/40p/HwHz/dSn5AV7i1NiJmskhEgNt1LRpeA5W2ROHo2nV1
 olziOzU1gsDObrAnjIp4myi5rd+lvcMZxJh2MsgjuLIt2HWK8O/gSYol2Qlj7i5FC5LO
 CHUM1/ryRo9Q1Ryi7aHJz+afC2BUGXKJbe+DcqbNSksqHvqtdZEdYy+KYSdzQB8IZAkX
 x08FD2wYlCEGUGkcRS2a8F7nFe99kJkGwAYTQe8vAn+TRQE6wwwjnf+CN2Wkx4EZlDvy
 z0iA==
X-Gm-Message-State: AGi0Pua4MmsLnTKbVRitnbdvc6ulktk+8blaADYXydyGUvr5azya7+K6
 j0fSuyBLY2r7l4SeSVpYXCmrZ9CwAVI=
X-Google-Smtp-Source: APiQypLvHOdwXjsCrF5+Tv9IInpboZOwQ/KzmNwLIRILJMk/8AWfgULjQ2vlsEce0SADJExSiixc9g==
X-Received: by 2002:a1c:e1c1:: with SMTP id y184mr2451445wmg.143.1586266207750; 
 Tue, 07 Apr 2020 06:30:07 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j11sm2446877wmi.33.2020.04.07.06.30.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Apr 2020 06:30:07 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] dma-buf: Fix SET_NAME ioctl uapi
Date: Tue,  7 Apr 2020 15:30:02 +0200
Message-Id: <20200407133002.3486387-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Chenbo Feng <fengc@google.com>,
 Greg Hackmann <ghackmann@google.com>, linaro-mm-sig@lists.linaro.org,
 minchan@kernel.org, jenhaochen@google.com,
 Daniel Vetter <daniel.vetter@intel.com>, Martin Liu <liumartin@google.com>,
 surenb@google.com, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The uapi is the same on 32 and 64 bit, but the number isnt. Everyone
who botched this please re-read:

https://www.kernel.org/doc/html/v5.4-preprc-cpu/ioctl/botching-up-ioctls.html

Also, the type argument for the ioctl macros is for the type the void
__user *arg pointer points at, which in this case would be the
variable-sized char[] of a 0 terminated string. So this was botched in
more than just the usual ways.

Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Chenbo Feng <fengc@google.com>
Cc: Greg Hackmann <ghackmann@google.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Cc: minchan@kernel.org
Cc: surenb@google.com
Cc: jenhaochen@google.com
Cc: Martin Liu <liumartin@google.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/dma-buf/dma-buf.c    | 3 ++-
 include/uapi/linux/dma-buf.h | 4 ++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 570c923023e6..1d923b8e4c59 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -388,7 +388,8 @@ static long dma_buf_ioctl(struct file *file,
 
 		return ret;
 
-	case DMA_BUF_SET_NAME:
+	case DMA_BUF_SET_NAME_A:
+	case DMA_BUF_SET_NAME_B:
 		return dma_buf_set_name(dmabuf, (const char __user *)arg);
 
 	default:
diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
index dbc7092e04b5..21dfac815dc0 100644
--- a/include/uapi/linux/dma-buf.h
+++ b/include/uapi/linux/dma-buf.h
@@ -39,6 +39,10 @@ struct dma_buf_sync {
 
 #define DMA_BUF_BASE		'b'
 #define DMA_BUF_IOCTL_SYNC	_IOW(DMA_BUF_BASE, 0, struct dma_buf_sync)
+/* 32/64bitness of this uapi was botched in android, there's no difference
+ * between them in actual uapi, they're just different numbers. */
 #define DMA_BUF_SET_NAME	_IOW(DMA_BUF_BASE, 1, const char *)
+#define DMA_BUF_SET_NAME_A	_IOW(DMA_BUF_BASE, 1, u32)
+#define DMA_BUF_SET_NAME_B	_IOW(DMA_BUF_BASE, 1, u64)
 
 #endif
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
