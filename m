Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5F940D684
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 11:44:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 519426EB39;
	Thu, 16 Sep 2021 09:44:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D16426EB37
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 09:44:16 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id q11so8427563wrr.9
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 02:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YNTwPa/ukwHAcbgK2EYvlx/6J9Qtj3bcwUG5UpA/d2I=;
 b=anJu+GdJ8r7IReQ665UT8EERus72GUMwf1yvdHTS2IlI2pHriRXoB/34UAxRiphlwl
 JzLBYNs0fyNzx5OBh5bBAuvAIVnnfx2IS4ovbidZWZ86fRZyft08l46rnyqfQQauQbbo
 +9azNaB4+GWT5mVwiMO6bm7nMb4aChNp+pQWCmRLvWl65loZJu22/mfo4kt86tYXAOp/
 h6+cpIrciahI2L0ilVmhbsmsWYhshOuDznhRIlXrRW7R5FF8Vv4atHyvs/DFVHgT7rMh
 LdPfDdHo/tf2sXbqAXgbUL8GrX0dYOxt0nVoN+AKSX7Tc7NDbKd6J9IR3v8dWaCeMqMX
 jtpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YNTwPa/ukwHAcbgK2EYvlx/6J9Qtj3bcwUG5UpA/d2I=;
 b=fz24NSb51Fa8q40fU1mlcRw7ZZ6KB1wp2ocgJggG4Oxf2s78PVEeIt3DzEdzUB0tjS
 yK/qN80l+4Y4QeXCfSUZyWLai9+Z8g9zmZ9X0epB4HkQRZhVelCfWF5TosNOVOp32nbK
 qLRXNK1sCOs8KEveEf9/ZWM+/XTXcJrKimItDa1KkRVtRignoYmheiwLmOyewJ1Qc4Wq
 yzz7w43TcJNrnXUyXUYZQz1PTX10pT3nSvquQ9cc1DCgF3SFWsGymq8MEtz9HsCDYsaI
 0032BS3FiUV5bDJHK/GcYo8x0h21w1jNDf2HA/VjPl5Q5JIBw720z6KVR7xp5ov5tsZw
 kAzw==
X-Gm-Message-State: AOAM5327hV2J2/I+RpEcGHqecEnz/yeKORZoEZWaUShZoj6S2iZEIwST
 cmm5P0FYdlHuEAANchIomIo=
X-Google-Smtp-Source: ABdhPJwPuz8gEAC0746r3Y3IKxW8MlamGVTG350FENP6Ra/koXN8UO2RtdrH4mkGco4tvISej/VR/Q==
X-Received: by 2002:adf:e643:: with SMTP id b3mr5050574wrn.67.1631785455292;
 Thu, 16 Sep 2021 02:44:15 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id l2sm7435374wmi.1.2021.09.16.02.44.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 02:44:14 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH 4/6] drm/tegra: Do not reference tegra_plane_funcs directly
Date: Thu, 16 Sep 2021 11:44:02 +0200
Message-Id: <20210916094404.888267-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210916094404.888267-1-thierry.reding@gmail.com>
References: <20210916094404.888267-1-thierry.reding@gmail.com>
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

From: Thierry Reding <treding@nvidia.com>

Instead of referencing the tegra_plane_funcs struct directly, use each
plane's vtable instead. This makes it more future-proof in case any of
the planes ever use a different set of functions.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/dc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 16c7aabb94d3..2025b18d2f63 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -1267,9 +1267,9 @@ static struct drm_plane *tegra_dc_add_planes(struct drm_device *drm,
 			err = PTR_ERR(planes[i]);
 
 			while (i--)
-				tegra_plane_funcs.destroy(planes[i]);
+				planes[i]->funcs->destroy(planes[i]);
 
-			tegra_plane_funcs.destroy(primary);
+			primary->funcs->destroy(primary);
 			return ERR_PTR(err);
 		}
 	}
-- 
2.33.0

