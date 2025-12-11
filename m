Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCA6CB5CF1
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 13:24:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9910F10E7F8;
	Thu, 11 Dec 2025 12:24:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KbmPPGKE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B59AE10E7F0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 12:24:21 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4777771ed1aso142565e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 04:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765455860; x=1766060660; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T6v3fbrT3uzuThbyIoQuFOUOmSI/+P7Q2rmFbCz4jvk=;
 b=KbmPPGKEvQ539pSvd+CDgoQ7VmKxWx6wa03THeNq21YpPoiUSizS7nciU092WCbqz/
 qNxgm1Xro77bTZDLkn7cDEtF0QVgSiQOLbs7Sn3FSwxau6ElzcctX9CYBtd23zyVjXi1
 w4ERH0wiVeYGM8jFiiKXqW5JH8Md5AyrPOdWi4fsVxCPBqtGLPVsJqpWEDux7SIPKTRj
 HuBXpxUNQntkRGXts72aYRfJcshQMsqpUP1OLqU9TbUkDXdgd2BJyyQi5avUvGzSATxj
 F3NzvRBICRONumdA+fepwXRP1VF7k8YYtIfi+qBA42WFEVhuR+0Dm9n2IQPyF+47m180
 ThDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765455860; x=1766060660;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=T6v3fbrT3uzuThbyIoQuFOUOmSI/+P7Q2rmFbCz4jvk=;
 b=Hkjvduw0G7IZg92k3+qRyg8+SMekMAjxqFhwR9pA1yINgLs9Vl/DACJal0J9of/EEN
 4fCA558H6g55U2NOkQSIUu/Vx8w/eo/yj58DlsBKaSCWxv/oSJ67bcY/jX7zXOAsH/mX
 R2LowJvLBg4T4MpVgyVR9nL5K25uFKe0afyMnY3GSbKndKUkyA0bBSKt66HNIsmQb9SP
 qjSapQs+35uoNMkBknhMV3gxNxviS0VTw18ayiT62tmJMrEBJSaZmgitAvTJfJcfPKmR
 +4MzmutA9alIdKHET4UuScwILYxlPSpe6HqWxR+k/DUZGXcT09ZhhUEze3aAQOlGYtll
 MWkg==
X-Gm-Message-State: AOJu0YxIKhEzuj5XywxP0cNg0R04NO56V1welgp7s7i9W+QDi2Bgi9sK
 yDNqy/d3n3+jj+MFOO06U9u9cYB1NHge6GtMzLhXAS5VlK3v5EcWEvez
X-Gm-Gg: AY/fxX7lRXNqLbbUcL4QvRypMZfBq+S6X3mIJgX8/fXo78WNS+d7OV/b5LazB+qmIqH
 6+aAOkMRyU7GY3ppyZTOjs/ayzKmEAA/3VM1Oc+xf99e2l3bsYyOZqKXFNSsIj9/vmuy+CeBplJ
 5MFqJL+XePHL6dZLODNp3HkxEUarh3Ddr2bKFtMegIJvTpvplGC8MDTsV6ZfvsZ2E1UtSbQ5asZ
 N7zBmMvikPj9ZOjolVJimsPGnV/sV3bBleT5EUaDVLBnrUZU+YbWLddvrMWqLuuJUkSRIT4NhgM
 ohzw0LjS/JHHCVZUPWoZZdJ/i+ofr2IouqxYJky5t5Q0ZGcebF/flOWDfFPtDhzbwMPVd+B4POH
 10ndOowFzwMWjPdlQme4Drp+hMe1eypKmc9oRz3BJq08TXmfCIbm/0y9DRB2OiSt84kXGr4cCqH
 NUV8QrSJxkbPpGiJPJyVMIpGG3MFpS+5BIhO8=
X-Google-Smtp-Source: AGHT+IFtcxuwjO12y9wl7B3VJGexykNsO7pqVLTd/IFJklcCFoGNqavbn4ok6AE2Ip5G5theEviayQ==
X-Received: by 2002:a05:600c:1554:b0:477:7f4a:44b4 with SMTP id
 5b1f17b1804b1-47a837946bemr59419015e9.1.1765455860198; 
 Thu, 11 Dec 2025 04:24:20 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:152a:9f00:dc26:feac:12f7:4088])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a89d8e680sm12172785e9.6.2025.12.11.04.24.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 04:24:19 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, tursulin@ursulin.net, matthew.brost@intel.com,
 sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 12/19] drm/amdgpu: independence for the amdgpu_eviction_fence!
Date: Thu, 11 Dec 2025 13:16:43 +0100
Message-ID: <20251211122407.1709-13-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251211122407.1709-1-christian.koenig@amd.com>
References: <20251211122407.1709-1-christian.koenig@amd.com>
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

This allows amdgpu_eviction_fences to outlive the amdgpu module.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c | 3 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.h | 1 -
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c
index 23d7d0b0d625..95ee22c43ceb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c
@@ -167,9 +167,8 @@ amdgpu_eviction_fence_create(struct amdgpu_eviction_fence_mgr *evf_mgr)
 
 	ev_fence->evf_mgr = evf_mgr;
 	get_task_comm(ev_fence->timeline_name, current);
-	spin_lock_init(&ev_fence->lock);
 	dma_fence_init64(&ev_fence->base, &amdgpu_eviction_fence_ops,
-			 &ev_fence->lock, evf_mgr->ev_fence_ctx,
+			 NULL, evf_mgr->ev_fence_ctx,
 			 atomic_inc_return(&evf_mgr->ev_fence_seq));
 	return ev_fence;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.h
index fcd867b7147d..fb70efb54338 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.h
@@ -27,7 +27,6 @@
 
 struct amdgpu_eviction_fence {
 	struct dma_fence base;
-	spinlock_t	 lock;
 	char		 timeline_name[TASK_COMM_LEN];
 	struct amdgpu_eviction_fence_mgr *evf_mgr;
 };
-- 
2.43.0

