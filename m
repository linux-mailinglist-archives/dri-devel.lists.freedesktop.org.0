Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 827CC6A8D7C
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 00:54:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDE7F10E14C;
	Thu,  2 Mar 2023 23:54:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE9AC10E5A9;
 Thu,  2 Mar 2023 23:54:10 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id a2so1001307plm.4;
 Thu, 02 Mar 2023 15:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677801250;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8o/IEZdj8Cn2a3a2Ro5nT/fmWKdys9Z3WQ6bWICIcGU=;
 b=BTpenYirnz4B8q7/2hN50ThrX4yr6wisyKtR0dg+ykWdMMSjRplIQedNS07kRpwOvE
 oS5zaZMyezMv1QZS05SYGcbaZjUBoH0xKKwVx6GKehJY5YiZ8K2JH0+ndECFS/RUaG2r
 DHNjfNzYIe0eNltaGLpjDJoDDIEyfcKnomK3w8cWLAWz6igd8g6+7wvB9sjCANYLcZf0
 tIQexWr5zqLe80Cu4bMF8p854n/bHA9sqwpy93jBqwKuIF+diaYnpzJX0Y/9529Tpc4t
 1n22/beRF/gIHxxyo9Dmu7LlZhHs6jPw7LXUza4Ozi0Xqr9w4AucOv8svDIlKBJsCKI4
 kbbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677801250;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8o/IEZdj8Cn2a3a2Ro5nT/fmWKdys9Z3WQ6bWICIcGU=;
 b=SwyjqTUkbqsnQsbnklkeXwej499j3Pb3PN3QRI1OJ8BSZW7LlpUO3ykeKaxEjBOB5E
 QpZBrH+Qno7exVXlJHP3phCmsLqBnwCdrDZ0DOzZ8FACIGfOMvrwhyNYkkGf8nhAl62K
 WjJ/F1oIFYHIEkiSX/LZDM4OFLy0BnAgfqtlSQduK/ePGPDjmB0VrjaeWHSlHi0VlGPY
 2WCcUUXk1eXR/wz7hwxRcRVKAakk5a9qCinFX2ikGuWkCprAqPVxQSO+N/XTiL8jgW0r
 Z3p2zo8k9ZyN1x78JIb37aSF3MefMibOqkRnPGzFkQyssggpXzGa5qdBDE+utUiLrVKY
 NI+A==
X-Gm-Message-State: AO0yUKWlmmyUQPpubetbE6859d9YkTQVdefxpYwnlEu/mE3Iwx455yl8
 A2d6jJ9YnZrfJr42WUdco8JzfOX83FI=
X-Google-Smtp-Source: AK7set9xw6yYcUpQ834HKf0gFqVGnZ9bcMz7tqmaYidGEmTy7owSmE0clFs6hA13pZ4gnYdVcsFIUg==
X-Received: by 2002:a17:902:ed11:b0:19d:af21:dc2f with SMTP id
 b17-20020a170902ed1100b0019daf21dc2fmr31301pld.33.1677801250107; 
 Thu, 02 Mar 2023 15:54:10 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 kp14-20020a170903280e00b0019e31e5f7f9sm230346plb.71.2023.03.02.15.54.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 15:54:09 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v9 05/15] dma-buf/sync_file: Surface sync-file uABI
Date: Thu,  2 Mar 2023 15:53:27 -0800
Message-Id: <20230302235356.3148279-6-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302235356.3148279-1-robdclark@gmail.com>
References: <20230302235356.3148279-1-robdclark@gmail.com>
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
 Jonathan Corbet <corbet@lwn.net>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Pekka Paalanen <ppaalanen@gmail.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

We had all of the internal driver APIs, but not the all important
userspace uABI, in the dma-buf doc.  Fix that.  And re-arrange the
comments slightly as otherwise the comments for the ioctl nr defines
would not show up.

v2: Fix docs build warning coming from newly including the uabi header
    in the docs build

Signed-off-by: Rob Clark <robdclark@chromium.org>
Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
---
 Documentation/driver-api/dma-buf.rst | 10 ++++++--
 include/uapi/linux/sync_file.h       | 37 +++++++++++-----------------
 2 files changed, 23 insertions(+), 24 deletions(-)

diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/driver-api/dma-buf.rst
index 183e480d8cea..ff3f8da296af 100644
--- a/Documentation/driver-api/dma-buf.rst
+++ b/Documentation/driver-api/dma-buf.rst
@@ -203,8 +203,8 @@ DMA Fence unwrap
 .. kernel-doc:: include/linux/dma-fence-unwrap.h
    :internal:
 
-DMA Fence uABI/Sync File
-~~~~~~~~~~~~~~~~~~~~~~~~
+DMA Fence Sync File
+~~~~~~~~~~~~~~~~~~~
 
 .. kernel-doc:: drivers/dma-buf/sync_file.c
    :export:
@@ -212,6 +212,12 @@ DMA Fence uABI/Sync File
 .. kernel-doc:: include/linux/sync_file.h
    :internal:
 
+DMA Fence Sync File uABI
+~~~~~~~~~~~~~~~~~~~~~~~~
+
+.. kernel-doc:: include/uapi/linux/sync_file.h
+   :internal:
+
 Indefinite DMA Fences
 ~~~~~~~~~~~~~~~~~~~~~
 
diff --git a/include/uapi/linux/sync_file.h b/include/uapi/linux/sync_file.h
index ee2dcfb3d660..7e42a5b7558b 100644
--- a/include/uapi/linux/sync_file.h
+++ b/include/uapi/linux/sync_file.h
@@ -16,12 +16,16 @@
 #include <linux/types.h>
 
 /**
- * struct sync_merge_data - data passed to merge ioctl
+ * struct sync_merge_data - SYNC_IOC_MERGE: merge two fences
  * @name:	name of new fence
  * @fd2:	file descriptor of second fence
  * @fence:	returns the fd of the new fence to userspace
  * @flags:	merge_data flags
  * @pad:	padding for 64-bit alignment, should always be zero
+ *
+ * Creates a new fence containing copies of the sync_pts in both
+ * the calling fd and sync_merge_data.fd2.  Returns the new fence's
+ * fd in sync_merge_data.fence
  */
 struct sync_merge_data {
 	char	name[32];
@@ -34,8 +38,8 @@ struct sync_merge_data {
 /**
  * struct sync_fence_info - detailed fence information
  * @obj_name:		name of parent sync_timeline
-* @driver_name:	name of driver implementing the parent
-* @status:		status of the fence 0:active 1:signaled <0:error
+ * @driver_name:	name of driver implementing the parent
+ * @status:		status of the fence 0:active 1:signaled <0:error
  * @flags:		fence_info flags
  * @timestamp_ns:	timestamp of status change in nanoseconds
  */
@@ -48,14 +52,19 @@ struct sync_fence_info {
 };
 
 /**
- * struct sync_file_info - data returned from fence info ioctl
+ * struct sync_file_info - SYNC_IOC_FILE_INFO: get detailed information on a sync_file
  * @name:	name of fence
  * @status:	status of fence. 1: signaled 0:active <0:error
  * @flags:	sync_file_info flags
  * @num_fences	number of fences in the sync_file
  * @pad:	padding for 64-bit alignment, should always be zero
- * @sync_fence_info: pointer to array of structs sync_fence_info with all
+ * @sync_fence_info: pointer to array of struct &sync_fence_info with all
  *		 fences in the sync_file
+ *
+ * Takes a struct sync_file_info. If num_fences is 0, the field is updated
+ * with the actual number of fences. If num_fences is > 0, the system will
+ * use the pointer provided on sync_fence_info to return up to num_fences of
+ * struct sync_fence_info, with detailed fence information.
  */
 struct sync_file_info {
 	char	name[32];
@@ -69,30 +78,14 @@ struct sync_file_info {
 
 #define SYNC_IOC_MAGIC		'>'
 
-/**
+/*
  * Opcodes  0, 1 and 2 were burned during a API change to avoid users of the
  * old API to get weird errors when trying to handling sync_files. The API
  * change happened during the de-stage of the Sync Framework when there was
  * no upstream users available.
  */
 
-/**
- * DOC: SYNC_IOC_MERGE - merge two fences
- *
- * Takes a struct sync_merge_data.  Creates a new fence containing copies of
- * the sync_pts in both the calling fd and sync_merge_data.fd2.  Returns the
- * new fence's fd in sync_merge_data.fence
- */
 #define SYNC_IOC_MERGE		_IOWR(SYNC_IOC_MAGIC, 3, struct sync_merge_data)
-
-/**
- * DOC: SYNC_IOC_FILE_INFO - get detailed information on a sync_file
- *
- * Takes a struct sync_file_info. If num_fences is 0, the field is updated
- * with the actual number of fences. If num_fences is > 0, the system will
- * use the pointer provided on sync_fence_info to return up to num_fences of
- * struct sync_fence_info, with detailed fence information.
- */
 #define SYNC_IOC_FILE_INFO	_IOWR(SYNC_IOC_MAGIC, 4, struct sync_file_info)
 
 #endif /* _UAPI_LINUX_SYNC_H */
-- 
2.39.1

