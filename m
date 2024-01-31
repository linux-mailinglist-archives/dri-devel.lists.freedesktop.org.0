Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 675648442B3
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 16:10:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8590410F012;
	Wed, 31 Jan 2024 15:10:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA12810F012;
 Wed, 31 Jan 2024 15:10:00 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-1d72f71f222so31334015ad.1; 
 Wed, 31 Jan 2024 07:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706713739; x=1707318539; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kjgLEA96psNlw7oy7+wMc8J4ysFO6yGdu22kdKlQ/Bk=;
 b=P1EJWN4i7Nzu4Pc10F6tak8psUjsQMavIwDteAuDNXhxAdTSNKGfrvgn3ZIqIe+Q1C
 PwhmPGv0hSsyZlXQijbACNrPOQFXhPy6Z/Cd3BVNBURJNqunKhRX/HgVbFXeD7q1HvvI
 S+dvxmWX8Qb83YFHeEzYnl+Ip89L3Nan8Kctnt2h+im3ZRywyUwzyXfNeTqsVKQDFI+W
 0Fnu+XpykE+vuHjVtR3MkYs/aHZzV+D+XwI81oNTQlayUno+CiIqVoZwGpzgQLGWDL0n
 Osu5a2HUtGVeuaqTSapFqRK12T5p4GZ0KUN07FW1qx3tbJLKFPMZsjfiJPCaGRRjyV3r
 DlyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706713739; x=1707318539;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kjgLEA96psNlw7oy7+wMc8J4ysFO6yGdu22kdKlQ/Bk=;
 b=ldc9zlm6llFaM7HB9oRGEdOLeM2eu/n+ADeSWDHIJvZnWzUKDqN+OUvRYILsejaMjX
 skTR2+g3PYeTdaMh+YWwLFeKH26FgL1DX4wPiYZzW7i38wWRufRRh0ughZ+2CQbBogXZ
 7H5/Fq9K3HuRI099hUze65MIQScglpBjM2VZlU7k/3L2GXKk8iuxnv/u2Bi36mvo8M/u
 dA5oe3oqusRIZ7IZ+RAwS/mHl0pjY2AOWP/ZSuOsiwKJgBezVjApZDUNd9BuIn2Ut00y
 gx90scUMJUo21tgYrNNDRGtaflvLs2D3WGYWsuVTKwLbskAGXlboHvAxd9jsMZA9Tajs
 +6eQ==
X-Gm-Message-State: AOJu0Yy90sbseHgPY/vXEwBHtAvLg73SBq74UJAG3/AayTLOpNftEm0z
 +N6QKETm4AgUs0je1x0RcNBw4Amb8emBddxFF4GTvZ3S2g4ptZFfknJnM1yP
X-Google-Smtp-Source: AGHT+IELMQ63ocPD4wuPi+ke5HI8IlfGoYnxgj8y/siWaSNWv5CSXMKr5f4mKr26X7FiQk0GEJsZnw==
X-Received: by 2002:a17:902:e5c3:b0:1d5:dac4:5015 with SMTP id
 u3-20020a170902e5c300b001d5dac45015mr2240225plf.11.1706713739469; 
 Wed, 31 Jan 2024 07:08:59 -0800 (PST)
Received: from localhost ([2a00:79e1:2e00:1301:e1c5:6354:b45d:8ffc])
 by smtp.gmail.com with ESMTPSA id
 w11-20020a170902d10b00b001d8d1bf5b98sm6385188plw.54.2024.01.31.07.08.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jan 2024 07:08:58 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3] drm/msm/gem: Fix double resv lock aquire
Date: Wed, 31 Jan 2024 07:08:54 -0800
Message-ID: <20240131150854.44089-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.43.0
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
Cc: Rob Clark <robdclark@chromium.org>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Since commit 79e2cf2e7a19 ("drm/gem: Take reservation lock for vmap/vunmap
operations"), the resv lock is already held in the prime vmap path, so
don't try to grab it again.

v2: This applies to vunmap path as well
v3: Fix fixes commit

Fixes: 79e2cf2e7a19 ("drm/gem: Take reservation lock for vmap/vunmap operations")
Signed-off-by: Rob Clark <robdclark@chromium.org>
Acked-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/msm/msm_gem_prime.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_prime.c b/drivers/gpu/drm/msm/msm_gem_prime.c
index 5f68e31a3e4e..0915f3b68752 100644
--- a/drivers/gpu/drm/msm/msm_gem_prime.c
+++ b/drivers/gpu/drm/msm/msm_gem_prime.c
@@ -26,7 +26,7 @@ int msm_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map)
 {
 	void *vaddr;
 
-	vaddr = msm_gem_get_vaddr(obj);
+	vaddr = msm_gem_get_vaddr_locked(obj);
 	if (IS_ERR(vaddr))
 		return PTR_ERR(vaddr);
 	iosys_map_set_vaddr(map, vaddr);
@@ -36,7 +36,7 @@ int msm_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map)
 
 void msm_gem_prime_vunmap(struct drm_gem_object *obj, struct iosys_map *map)
 {
-	msm_gem_put_vaddr(obj);
+	msm_gem_put_vaddr_locked(obj);
 }
 
 struct drm_gem_object *msm_gem_prime_import_sg_table(struct drm_device *dev,
-- 
2.43.0

