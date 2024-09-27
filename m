Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F3E988092
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 10:42:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB74B10EC7B;
	Fri, 27 Sep 2024 08:42:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="i30ypwcy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A8BB10EC7A
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2024 08:42:00 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2f762de00fbso22243851fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2024 01:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727426519; x=1728031319; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=mDMgyKKew/IZsYrrEs1u6/IPCFvw+mgWRq2aYRNTWOU=;
 b=i30ypwcycACNTlif8odwFmQzjq+PTvLsCcnkQuKrSA18smKmSlfhAFDUq4PbSn1fWN
 cfXhSddaA3Zts8RA8hkPoxV+URBKahwcNRU4apy7qKLSd6p3JsMMw20YBPfs3WO9iVyD
 OgDHrwkncZ20y/i0D7c0gjBAw8s2Vp3IZhEr1P0u/IRY+DOIUp+LAAzOgioOMWcAq8x+
 kLwBhWPkWr1dhaxfzXCL/Oa4cuOpLu0DWVlV4rZHntLm8khBzEe6gGaVuVaJRqOp5XFX
 jaWcf9sYEl+GDHCW0KNYA7ROf1ey7iUQfCPoHdbegQ4lv8xCBORMWverLSASGU01yFP9
 1Hyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727426519; x=1728031319;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mDMgyKKew/IZsYrrEs1u6/IPCFvw+mgWRq2aYRNTWOU=;
 b=QTIbn3GN1/c9BBW4O3Hb2QYsoq8fJWtmGVhHTXI7/Mne6HFpYEH2NyZj2W9bbnli9S
 915VSqJcgWfXTDjIKLX7/DLUIqXqVUAGh0Q5OHMLZBv7vXih0SgVrNTpuNO+XHM3tGod
 lmplGNaRG+h5IcA6IdNSW5cB11zuLmYpV9Cr5c8b6kLWbojrsMuIR7KCYaGx8kIKzyqU
 WdOD57m0BlvOv/2WeFi9ki/jO3ftgjY7i9mznIEEyB1be1BdEkmkqb5np97xG5Z/BcTi
 3b7OOEte0LEwqgEBUOiW5JuVJBFukV4BU9Vdw3ZXR2wWfkQ24n8Xzs6OWK+05IN9LQta
 H51A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjYx7d/QVszuGSGWYmMCAAXApON6Fgm7hxzMHNYqGTvJuR3m6lCzOvkoVRLreO/dyOjtkcWpMNEbs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyNVWX13t7wzlQn2G/a/dx9gQpWXC1fW14/Z36D1s/7wFofTBsu
 uFNSxoD4r5iVBuwPd2GgHIt88iGj08YNgHSeIJdZXl2sSJZ+wbtL
X-Google-Smtp-Source: AGHT+IGZnZaQEdYuGQz5WHQTYA/v0g5kbvBONwZQM8n7Ehcx9ws/3Lls3We0mmno089vomnZrNVgtA==
X-Received: by 2002:a05:651c:2104:b0:2f6:5492:dcaa with SMTP id
 38308e7fff4ca-2f9d41ca8b1mr15839771fa.41.1727426518371; 
 Fri, 27 Sep 2024 01:41:58 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1515:2900:6181:3f3e:a0cc:be1a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42f57de2e46sm19363415e9.19.2024.09.27.01.41.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2024 01:41:57 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: pstanner@redhat.com, dakr@kernel.org, ltuikov89@gmail.com,
 simona.vetter@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/sched: clarify the documentation on
 drm_sched_entity_error
Date: Fri, 27 Sep 2024 10:41:53 +0200
Message-Id: <20240927084153.18583-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240927084153.18583-1-christian.koenig@amd.com>
References: <20240927084153.18583-1-christian.koenig@amd.com>
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

Sima requested that in a discussion, just copy&paste my explanation from
the mail.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index b06c0696f970..90eba2ee3875 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -168,8 +168,21 @@ bool drm_sched_entity_is_ready(struct drm_sched_entity *entity)
  * drm_sched_entity_error - return error of last scheduled job
  * @entity: scheduler entity to check
  *
- * Opportunistically return the error of the last scheduled job. Result can
- * change any time when new jobs are pushed to the hw.
+ * Drivers should use this function in two ways:
+ *
+ * 1. In it's prepare callback so that when one submission fails all following
+ * from the same ctx are marked with an error number as well.
+ *
+ * This is intentionally done in a driver callback so that driver decides if
+ * they want subsequent submissions to fail or not. That can be helpful for
+ * example for in kernel paging queues where submissions don't depend on each
+ * other and a failed submission shouldn't cancel all following.
+ *
+ * 2. In it's submission IOCTL to reject new submissions and inform userspace
+ * that it needs to kick of some error handling.
+ *
+ * Returns the error of the last scheduled job. Result can change any time when
+ * new jobs are pushed to the hw.
  */
 int drm_sched_entity_error(struct drm_sched_entity *entity)
 {
-- 
2.34.1

