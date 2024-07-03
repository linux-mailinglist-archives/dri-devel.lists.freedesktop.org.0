Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F9E9261C1
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 15:26:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3B3C10E0EE;
	Wed,  3 Jul 2024 13:26:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JKhLU1s9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0F1510E013
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 13:26:07 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-36798779d75so86607f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jul 2024 06:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720013166; x=1720617966; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zrGWK9ix3Z5llLRfYODIcW20ljsKJIUMR1M7aT6SnbA=;
 b=JKhLU1s9RESKQfhLfg2FdKONMMkcGgm0NrUCK8fykGFto6VOw9ojdmE49/2mn92Np6
 CBisuiB38wD7uHFttJ2qp2A1WhFsbrPTcJRr010+sTIfHWuc2amW+fP5lbkfhbYOmWca
 4inQZ3WZaSyOHPmSX2//d/XkDM0b3EYVux49I+FGcAInAY0eXszTZN4vhsDULTTssE+m
 8tvnno7mLsIsXMnhhM66OdI7pyyuM0wxw0NAkQ/85paAW2wmygRcoYgcudcP9fL+fPLC
 CA8U8lhSKM7EDCzmxfBDQAmBdkIPaRssRwuo44UeWAXY6QuY5vILsnEFvYYVqGn9m5MO
 439w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720013166; x=1720617966;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zrGWK9ix3Z5llLRfYODIcW20ljsKJIUMR1M7aT6SnbA=;
 b=WlhZXeAzyT+X7NlJ726jrga+mxXE1kjnX9ZglTVLu6bC9Gkz540sFPFunFYb/sUnIv
 xRWOuv/+CTXhSxcFq/c9pq1kq/8IZErBBjIsrBFAmgbeJjj3N+DX2Jrf3g9x+oelUPrM
 9efiu/tpscS4B+6/a+C1fheE0Kn5Qvd5DAD852O8QQJYbDqDWhaUDDGcPQWqvu60EVvM
 V7tF3Q2olWtsbuELyO6QspHgvkc7BTMeIALF1T0Rqlx+++KnG7K8WalnYeMHruTdrefB
 Il8rhY4Iq2z5dJqyHt6jbJtKj4biFIKNA4Y8Jn1eKOP93IM8HjXYn3eGTS1A7p2wrUhr
 BMQw==
X-Gm-Message-State: AOJu0Ywzo+MA6edz+94c2If8xAiV1vO/lBTFaA4tGZdoyj21WkcnTElr
 EU/afY472cb9Vd7gzM+CA+DL860Ia24FwJo50cv5T8qmv0JKOjWY
X-Google-Smtp-Source: AGHT+IHoLZoUG7som/ugw3WN2aXPUwp9seP/PtSIbWW2tjcUdADh6TDTU0ugYB+eGSTw7K8v13aYtw==
X-Received: by 2002:a5d:66c6:0:b0:367:918e:a10a with SMTP id
 ffacd0b85a97d-367918ea186mr1587574f8f.28.1720013165891; 
 Wed, 03 Jul 2024 06:26:05 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1559:9300:5f5d:6303:9414:d3d])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256af5ba51sm237197665e9.12.2024.07.03.06.26.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 06:26:05 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: matthew.brost@intel.com,
	thomas.hellstrom@linux.intel.com
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/5] drm/exec: don't immediately add the prelocked obj
Date: Wed,  3 Jul 2024 15:25:59 +0200
Message-Id: <20240703132602.4756-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240703132602.4756-1-christian.koenig@amd.com>
References: <20240703132602.4756-1-christian.koenig@amd.com>
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

Some contended objects might never be locked again in the case of eviction
handling for example.

Make sure that those doesn't show up in the list of locked objects until
they are explicitely mentioned.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/drm_exec.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_exec.c b/drivers/gpu/drm/drm_exec.c
index 2da094bdf8a4..220df336fbd9 100644
--- a/drivers/gpu/drm/drm_exec.c
+++ b/drivers/gpu/drm/drm_exec.c
@@ -61,8 +61,11 @@ static void drm_exec_unlock_all(struct drm_exec *exec)
 		drm_gem_object_put(obj);
 	}
 
-	drm_gem_object_put(exec->prelocked);
-	exec->prelocked = NULL;
+	if (exec->prelocked) {
+		dma_resv_unlock(exec->prelocked->resv);
+		drm_gem_object_put(exec->prelocked);
+		exec->prelocked = NULL;
+	}
 }
 
 /**
@@ -179,16 +182,9 @@ static int drm_exec_lock_contended(struct drm_exec *exec)
 		dma_resv_lock_slow(obj->resv, &exec->ticket);
 	}
 
-	ret = drm_exec_obj_locked(exec, obj);
-	if (unlikely(ret))
-		goto error_unlock;
-
 	exec->prelocked = obj;
 	return 0;
 
-error_unlock:
-	dma_resv_unlock(obj->resv);
-
 error_dropref:
 	drm_gem_object_put(obj);
 	return ret;
@@ -214,6 +210,10 @@ int drm_exec_lock_obj(struct drm_exec *exec, struct drm_gem_object *obj)
 		return ret;
 
 	if (exec->prelocked == obj) {
+		ret = drm_exec_obj_locked(exec, obj);
+		if (unlikely(ret))
+			return ret;
+
 		drm_gem_object_put(exec->prelocked);
 		exec->prelocked = NULL;
 		return 0;
-- 
2.34.1

