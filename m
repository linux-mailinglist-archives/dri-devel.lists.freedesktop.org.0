Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB796A6308
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 23:58:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C07C410E136;
	Tue, 28 Feb 2023 22:58:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F42310E103;
 Tue, 28 Feb 2023 22:58:49 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 m8-20020a17090a4d8800b002377bced051so15349336pjh.0; 
 Tue, 28 Feb 2023 14:58:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677625128;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hG7vKOCZs7RF7xaksAPYUQd1A2SxHbLuaH7Mq26I3gY=;
 b=EvydJjNFp+u1SVWCsmQl6hCES4FLObikUxdCaUzTp+mazMyN04WpakjfWOiWYZpQ9K
 +18Q+ZrVN6rXU535yHal4u0v9WlNj4fL83CX21cvR5kaAswoUkIIwPiP6yA7uSomZ2q4
 gOyL+8oS9/tESst5ORa9gq9/1quHZQT/awWoAwyGXR4G4xRhnGfJueSfJbFixQNDhsV+
 gSLgbCPMR+YRh9/psIjCBZ2zV70Lq/Am60VGukvTC352yjnZJCRJ6iQ47q9zdpYG+RW4
 JJ/Fs8OSN0EAlcLSodzwcWV0JQ/lIWcliG3tbJoDP5OA7yH1hUodS/10ILurYlxl3Z47
 xYmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677625128;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hG7vKOCZs7RF7xaksAPYUQd1A2SxHbLuaH7Mq26I3gY=;
 b=b2ZkVwN/7X92AvWdQJmH9UQ/cYTQnGdTG9W3n5P6M3okapHg+4xY0MfVEVOX/TcYEE
 8QJv7SxSMhiDAeqrEEU3s6yBRAFpT6jGU+BFN7a7glUOIgdCsh1TdTASf9XTJHL0A38H
 kDUxPiHoOYY9gvIDH6MxvdJEbVOarEqKBYo4eboJv5Q+rukTNVT4+i8W30cmx0u9Sn82
 eR22t484abIy+/7cNiw3fq5kdrQbMLrWLsFhcpUjyzrJhjfw/Z3unSmYZCEeXn7NIUco
 Rvx1MBeLAz/GzqJWIwf0KfrA2Hm2xGUTwHQcL8WFNWouXACAb5Gd/CN24usYnCKJBI0A
 zanQ==
X-Gm-Message-State: AO0yUKWvMxA1lyN2mSf5N1mh9EHtZqb7vLLAX89L7aoCcBRr/qZuzuHh
 SuTuz/icEhFluqcPsPknwRIAuouoW8U=
X-Google-Smtp-Source: AK7set8lrAj3oH7C94OxUvYLU1Uk1OCd5R4A9eqbUFXEtWJ7E8gHvhvvliXhpZQfXk8gGBCizI2YJQ==
X-Received: by 2002:a17:902:cec5:b0:19a:6acc:1de2 with SMTP id
 d5-20020a170902cec500b0019a6acc1de2mr5095396plg.35.1677625128309; 
 Tue, 28 Feb 2023 14:58:48 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 e19-20020a170902ed9300b0019949fd956bsm7038431plj.178.2023.02.28.14.58.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 14:58:47 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v8 05/16] dma-buf/sync_file: Surface sync-file uABI
Date: Tue, 28 Feb 2023 14:58:09 -0800
Message-Id: <20230228225833.2920879-6-robdclark@gmail.com>
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

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 Documentation/driver-api/dma-buf.rst | 10 ++++++--
 include/uapi/linux/sync_file.h       | 35 +++++++++++-----------------
 2 files changed, 22 insertions(+), 23 deletions(-)

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
index ee2dcfb3d660..eced40c204d7 100644
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
@@ -76,23 +85,7 @@ struct sync_file_info {
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

