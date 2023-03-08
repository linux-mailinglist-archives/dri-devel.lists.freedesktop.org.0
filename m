Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E35396B0D90
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 16:54:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E36D10E639;
	Wed,  8 Mar 2023 15:53:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA27310E630;
 Wed,  8 Mar 2023 15:53:39 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id p6so18139919plf.0;
 Wed, 08 Mar 2023 07:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678290819;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EbDlebxpAu8Jy85TzCfB9W36IqqFAcxu6Fybm4OXr4E=;
 b=ethz/tcwIqxFWg8rZBESWLcOnT61/jBqhZ80v/RzAbQGK9r71sa+/VkQDJQ0hy3kH+
 U+Fjw1NchSL9RPnrrB1wdh6tIP4BlONOBmM6iaVq2iwntSf6u0XRhCW498JKQWMCHFnR
 sUK6bxrJaxdKbLVowayRpYLDwtKOUPrDd5mxalopjtFm3hp+JSWX36YRFS55vc68xz88
 7I9tq39ZkOTeOaBg3vLUx8cGb2B8ic0XTkmgpWnrfAgQtG/+Yv/VionLfPnX+jBL4EQS
 Gd89Z0mQTGAVzfJUdSLH4EttscP7iHcz73ZvNI3VRZA7/bAl5JyyD/Gm5tRcsYQ7RTpg
 LwVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678290819;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EbDlebxpAu8Jy85TzCfB9W36IqqFAcxu6Fybm4OXr4E=;
 b=d5Ohp1ln2hbAoRy+JvY0oRUDIJGzIxHmN2SbC1cEPC0X/O30oY0vqUANADr/NyrkNN
 tnxQd435pJd63lfsfR+WwOs42GqBvYMsUG6RxT0FUTPnyMyP0bFpqqIjDZJrKzXoTYvJ
 R8mRdEf1AryJEWaSaIdbG44mCcq8ThxpPVtv3b8nLlodbS8t0o2fdzTzo4IB83AzmxsC
 DqnHeuAv5RBSoJRu999tcNdnAWYpZCnHIGz8AIrU9eVr9Dk2vvTIAcvTwF5aFHyq/EdJ
 fiEISgWXyhxKux/mTgkJdsc85oME+r4t2ckuQbsChoqhRxzp6FxCSqgs9N1GJfaqb5CI
 klGA==
X-Gm-Message-State: AO0yUKUiUx0Wvp+2RE5clC9ZF/8RkTT2/ibBYQtzHjjWsW9H5M7Lng+O
 QdI3GGV9a2QTxHgRrOEUFfSkpF4SzT8=
X-Google-Smtp-Source: AK7set9ehM4kiJT0VFaO2tzlGH0SSkFEDrNpXRegxJcLPydnEdmlO2KUXBQAXEOBo017es2DfICPBA==
X-Received: by 2002:a17:902:f54f:b0:19d:164e:5565 with SMTP id
 h15-20020a170902f54f00b0019d164e5565mr18271427plf.56.1678290819198; 
 Wed, 08 Mar 2023 07:53:39 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 kd13-20020a17090313cd00b0019a8e559345sm8518732plb.167.2023.03.08.07.53.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 07:53:38 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v10 05/15] dma-buf/sync_file: Surface sync-file uABI
Date: Wed,  8 Mar 2023 07:52:56 -0800
Message-Id: <20230308155322.344664-6-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230308155322.344664-1-robdclark@gmail.com>
References: <20230308155322.344664-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Jonathan Corbet <corbet@lwn.net>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 intel-gfx@lists.freedesktop.org,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Gustavo Padovan <gustavo@padovan.org>, Matt Turner <mattst88@gmail.com>,
 freedreno@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
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
2.39.2

