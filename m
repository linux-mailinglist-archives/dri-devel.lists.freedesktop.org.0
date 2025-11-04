Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C09C0C322C6
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 17:57:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F10A410E64C;
	Tue,  4 Nov 2025 16:57:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="c7Dpujr+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD26D10E64C
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 16:57:39 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-47112a73785so38249535e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Nov 2025 08:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1762275458; x=1762880258; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mlwXBKKEiD0RmcIOKolsb93Y5R8skb7DhUMfXKujcjY=;
 b=c7Dpujr+6BfRHuz44qA5QFUh7qrpbjCHldfLJwmQcLawHdjk33Cj4qSFXdvk66eUFm
 GfDhVsSliG1Yxn/TyWRrZv0mf/x8VBCvHMiS0OfC4WLfaGJr9TMFrRU789U9ZKhLLjwg
 DsVsqyRPER3r+r8v6SM20ynHmGdnD7lLTTAoPSayrx/IHw6jBnv/bcWSR3KiGzSTNU1B
 G5MXvppZrH0zCxZ0rd1Zpjc3QD3yDTEVsEYRITBUQov4srnx7ca3T1OASMlfD6PjSMiu
 CyXY6ZkLpCNCmHrNcVrjCDXaKVXoKKT3XLG2/cXNdkY/v92BpJ/RljqDG6Ra99j9kLus
 szmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762275458; x=1762880258;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mlwXBKKEiD0RmcIOKolsb93Y5R8skb7DhUMfXKujcjY=;
 b=UQeOXNdb2sh65lTBsD+nZ4Tp4AIX+Zbtbn5jO8biGQ9V7iardb3ZuzGejrFtp7ExIa
 os0AIS/AQ7QGQZIsy54Or0frViFml3pcgsMK4/HyAWODGLx+0fJ3XPIwd675uTDu/dJH
 PlS4Vh0FLplKOFnAKsS6nOnmrv0hAAW8pmS7r6qZ2W08QkmIC4yKTNG7GqRhfOj4Es9L
 oBgiUQdUigeA5ixctQ4J9yUDhqCCZC+lBzj8yN/2lt4AS4pmRulApJvpf5BYkFVXXegp
 n0r9vA0mJjP47GQ9A3mJDiGx0oVNJoEDIelq+4qNtaWRUT6DQVoIJ2oub+mX+lOpmLEr
 sCDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHdmmPk1WoW4cQASC5uiqS8JPqIC6+I8lbHHYj6yLkMM/Dv1P9RZGe5O4YUuXzXmcY01IJbgiLowk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwgUBxGLre6c7/IXjdyk72H2VG2g6jfaJ+AFX4r8Mvj3XqQyW9h
 gGY7XkQzdo9zzd1mdP3XpGzPB0U9ta13Ua2GTffTKzmF1eMwbcOrQfWeN9hP3D5jg3IkVFRAa5L
 HgKwk
X-Gm-Gg: ASbGncuzAhVhXqzfw9XK1ZEVaVihq9+oj+mmvz9w7RKfPzRLfdhvBhUic0n1//io+zJ
 cbyuhBnWvfzW8HauT06TA8niWotg578IUZ8V+S8axuGCPyYeKgAzmgPimOKaZr7gFpvRnvcp7Bg
 kD3aFzCwaUpxItCj2htuVmxgwGoVWl5Jx4LxCkBgNISXjRoJl03umUBhUFtEGnVhzaRdHQGuM5L
 feIH8HxS4n8VsGxBbkPimDmXSujy+VFDAub79HQoEP9qUQ2BrpEhPWJzHrahMbiWEUjQ5YuXWr3
 Rp+SbFdAqrNgW32R0PaTYlSdGxL23sOwDur8D2F18HDaSxPOxRNNVjcjeirs1opRe1jeqZX7bYH
 XC3koz8I+sW6mTi/GTIgUDMTsw6JpQ2Weqldf/q5jRxoglItIq2t23Vykg7eQqj/wFfZKZd9bty
 Z0MkgKKXrDbrMJfyiUJmLYxVo=
X-Google-Smtp-Source: AGHT+IGGpxciVU3IC52UvqvLQu7qBBlz9I1KHZxvhIU86nWuSc4WQ8BUqYR3aWCctDbQWiX1UN664A==
X-Received: by 2002:a05:600c:1912:b0:477:1622:7f78 with SMTP id
 5b1f17b1804b1-477308a5e56mr150921885e9.40.1762275458183; 
 Tue, 04 Nov 2025 08:57:38 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4775cdc2d14sm200645e9.1.2025.11.04.08.57.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Nov 2025 08:57:37 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Michal Hocko <mhocko@suse.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH] drm/tilcdc: replace use of system_wq with system_percpu_wq
Date: Tue,  4 Nov 2025 17:57:31 +0100
Message-ID: <20251104165731.315074-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently if a user enqueue a work item using schedule_delayed_work() the
used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
schedule_work() that is using system_wq and queue_work(), that makes use
again of WORK_CPU_UNBOUND.

This lack of consistentcy cannot be addressed without refactoring the API.

This patch continues the effort to refactor worqueue APIs, which has begun
with the change introducing new workqueues and a new alloc_workqueue flag:

commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")

system_wq should be the per-cpu workqueue, yet in this name nothing makes
that clear, so replace system_wq with system_percpu_wq.

The old wq (system_wq) will be kept for a few release cycles.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 drivers/gpu/drm/tilcdc/tilcdc_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
index b5f60b2b2d0e..57518a4ab4e1 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
@@ -985,7 +985,7 @@ irqreturn_t tilcdc_crtc_irq(struct drm_crtc *crtc)
 				dev_err(dev->dev,
 					"%s(0x%08x): Sync lost flood detected, recovering",
 					__func__, stat);
-				queue_work(system_wq,
+				queue_work(system_percpu_wq,
 					   &tilcdc_crtc->recover_work);
 				tilcdc_write(dev, LCDC_INT_ENABLE_CLR_REG,
 					     LCDC_SYNC_LOST);
-- 
2.51.1

