Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 879B67F2255
	for <lists+dri-devel@lfdr.de>; Tue, 21 Nov 2023 01:40:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 643F810E1FD;
	Tue, 21 Nov 2023 00:40:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AD9410E1FD;
 Tue, 21 Nov 2023 00:40:08 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1cf6373ce31so9801555ad.0; 
 Mon, 20 Nov 2023 16:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700527207; x=1701132007; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5jX3faK+AMFkz5EzUhNwZ3WOkYHYBNnVAbiCro2CYjs=;
 b=GKzweJq8ncY++PMZxl0oNtIEdzM4ijiGZosAfbr/VH6scx+lQM4gBJBSSFiCScO2Id
 wJWJH7rhjhpmsyYzE4tqtMYhFg1oZwcA9m+4lbTIOfrpWCBRnjyL6LLnRfGtpOJ3Rxio
 Kl4tHriJXu0jZv9UEwMhPAhYDJwfuu+2iTCNYJdShPNh8C7T8aFhSObu9FQTkF8DlchT
 b2l3pI2JpgDI+t5xNS39mOawn6lwhLHIhA+tVDhSj/f718F1mSEP83JZfqotHvBho6LU
 5iqN7C5BW8gRW5YqNwYYgjRfajmUGKFLSIEFi99tYKTfsb20wnq0irKvUX102SiDFvCY
 O6oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700527207; x=1701132007;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5jX3faK+AMFkz5EzUhNwZ3WOkYHYBNnVAbiCro2CYjs=;
 b=Aa72WjtCnWY2HFFPDMfPHfkppr5Nzj+pYBh7XoRcjw44PW0oCKaf+VfGxVaWnYePAk
 dExgYxJ+ey812AO79HK5n89besZVQ0yfA6MetTICk5VzogWN7upva4EfzaZosKX+ON3y
 JFEACzpHoymXoG6JE6ayYx+/OH+kdwyQoLT7fgN4v85et8Xfrx34Dk+TD02F9me0K9Ys
 7diT9YzMKqzJlUd0xDyKsIOha20KMchovXf6vkV5CrAt4WzKPe/xdxpx/HypEWx1Cp+x
 p4xnC7c8Wv4ZSVN2p2R/UngbIcdFWReQJVCQ+UcbXxwcXw6tGXrObvgiY/cGJvpFj/gu
 gD8Q==
X-Gm-Message-State: AOJu0YzZcXyMR5lNoBQzeawW/iqUfBiH5a/eVYYTV32h2JkofNqcHya4
 k8I93g3E+zBZG7Ea2h6mPlOzDD1rRos=
X-Google-Smtp-Source: AGHT+IETWon82ZL/ytWmj4xSyjfByZsKMh66sDsxn7S+5SvQQISILbKS7mDD6lwKCFFqYymg/KaJsQ==
X-Received: by 2002:a17:902:ec82:b0:1cf:6e9e:aa34 with SMTP id
 x2-20020a170902ec8200b001cf6e9eaa34mr391433plg.3.1700527206924; 
 Mon, 20 Nov 2023 16:40:06 -0800 (PST)
Received: from localhost ([47.215.232.245]) by smtp.gmail.com with ESMTPSA id
 t3-20020a1709028c8300b001bc930d4517sm6624935plo.42.2023.11.20.16.40.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Nov 2023 16:40:06 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/7] drm/msm/gem: Remove submit_unlock_unpin_bo()
Date: Mon, 20 Nov 2023 16:38:46 -0800
Message-ID: <20231121003935.5868-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231121003935.5868-1-robdclark@gmail.com>
References: <20231121003935.5868-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

The only point it is called is before pinning objects, so the "unpin"
part of the name is fiction.  Just remove it and call submit_cleanup_bo()
directly.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 996274ef32a6..2d5527dc3e1a 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -272,12 +272,6 @@ static void submit_cleanup_bo(struct msm_gem_submit *submit, int i,
 		dma_resv_unlock(obj->resv);
 }
 
-static void submit_unlock_unpin_bo(struct msm_gem_submit *submit, int i)
-{
-	unsigned cleanup_flags = BO_PINNED | BO_LOCKED;
-	submit_cleanup_bo(submit, i, cleanup_flags);
-}
-
 /* This is where we make sure all the bo's are reserved and pin'd: */
 static int submit_lock_objects(struct msm_gem_submit *submit)
 {
@@ -313,10 +307,10 @@ static int submit_lock_objects(struct msm_gem_submit *submit)
 	}
 
 	for (; i >= 0; i--)
-		submit_unlock_unpin_bo(submit, i);
+		submit_cleanup_bo(submit, i, BO_LOCKED);
 
 	if (slow_locked > 0)
-		submit_unlock_unpin_bo(submit, slow_locked);
+		submit_cleanup_bo(submit, slow_locked, BO_LOCKED);
 
 	if (ret == -EDEADLK) {
 		struct drm_gem_object *obj = submit->bos[contended].obj;
-- 
2.42.0

