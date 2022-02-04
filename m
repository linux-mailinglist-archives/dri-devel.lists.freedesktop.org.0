Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8D34A9769
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 11:04:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 806EE10F181;
	Fri,  4 Feb 2022 10:04:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3285010F181;
 Fri,  4 Feb 2022 10:04:40 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id w25so12055702edt.7;
 Fri, 04 Feb 2022 02:04:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=lua3ndSNkQ4/4Jps3PRoP7cS+stYoWZoem0sckVfZ4Y=;
 b=J6fLl5aNXVs7I7cJKmW+cvYJYiMnH4xxcXJmbxzwowAzLiVNNfYtym5eqlEXTMbvdO
 jyqt7VPBNUIC0WU5R2Li2xjq0YdXRtBriRfk5dvtwcvNDINzyp19MCUPG5Ev2HGQ4Vxn
 g6w7YUeeFRNBndYBK4hDHGdAJYfctaUFYScUuKccdXmC50/2zOWPew6Fx8P5yfMJHM6f
 Ux2zu4IverpLIQrG/KJy/fJPzg2aC3geRy5jXOUJxzsxCTKvYLCNUN6R+/ArrtSFZc/R
 2yDRyM6oLmGRI5AUK3oadxHnZr+q1kOmQqPk/jr/YPq7j1VVtloVt8pyJpZIL893G9IE
 bx2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lua3ndSNkQ4/4Jps3PRoP7cS+stYoWZoem0sckVfZ4Y=;
 b=IE8s/9O+4FmkPaed8Z+usvySMwMLqpHq+bykjkgZ36QXU4LVprYPqd11Vua6IZAIlM
 M0lMeVkagL3pBMxFnJ+J+q4eSdOcHcZbJ2OLV9JG46KI8oexeJ0X0EBShoJAqrbkz5qu
 6DugMGZ5+Vv99g/hgRDGMOF/2xvv4DMkoddx5BozavGq1baOm6tCTlZoY10b7aCnlSQK
 6V8DnSPT5VYMUAWJq7+inK3+qrOE5/03IjlXjTOIKmJHJv4abygW6mltaoVPnkhSM4+6
 ybJ4qNNIrQZ4YS66E0O6eJ9Tgi+6uv3BpXbegkAFZjYY+tSgWbFaPu9L+8CXjegDv894
 wmyg==
X-Gm-Message-State: AOAM533QPbLctY4ZtDGJDmyqgaxhLIO3LG4fAZf6wc60WOHIs4pIfbaE
 4MrVFe4eq06mFrI0dpFhhLE=
X-Google-Smtp-Source: ABdhPJz8hCqpmvlhCbMTzHXgtghoGTUiIoV0KxhuC94AUMCYZjdcSIN4UbCV+Z4RoJk32V5kj+6oAQ==
X-Received: by 2002:a50:d70e:: with SMTP id t14mr2287416edi.19.1643969078713; 
 Fri, 04 Feb 2022 02:04:38 -0800 (PST)
Received: from able.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id z10sm633943edl.54.2022.02.04.02.04.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 02:04:38 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: sumit.semwal@linaro.org, thomas.hellstrom@linux.intel.com,
 daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/6] dma-buf: warn about dma_fence_array container rules v2
Date: Fri,  4 Feb 2022 11:04:25 +0100
Message-Id: <20220204100429.2049-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220204100429.2049-1-christian.koenig@amd.com>
References: <20220204100429.2049-1-christian.koenig@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's not allowed to nest another dma_fence container into a dma_fence_array
or otherwise we can run into recursion.

Warn about that when we create a dma_fence_array.

v2: fix comment style and typo in the warning pointed out by Thomas

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/dma-buf/dma-fence-array.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
index 3e07f961e2f3..cb1bacb5a42b 100644
--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -176,6 +176,20 @@ struct dma_fence_array *dma_fence_array_create(int num_fences,
 
 	array->base.error = PENDING_ERROR;
 
+	/*
+	 * dma_fence_array objects should never contain any other fence
+	 * containers or otherwise we run into recursion and potential kernel
+	 * stack overflow on operations on the dma_fence_array.
+	 *
+	 * The correct way of handling this is to flatten out the array by the
+	 * caller instead.
+	 *
+	 * Enforce this here by checking that we don't create a dma_fence_array
+	 * with any container inside.
+	 */
+	while (num_fences--)
+		WARN_ON(dma_fence_is_container(fences[num_fences]));
+
 	return array;
 }
 EXPORT_SYMBOL(dma_fence_array_create);
-- 
2.25.1

