Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1CC3D475C
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jul 2021 13:19:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8401B6FC6E;
	Sat, 24 Jul 2021 11:19:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34C656FC18;
 Sat, 24 Jul 2021 11:19:17 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 m2-20020a17090a71c2b0290175cf22899cso7333934pjs.2; 
 Sat, 24 Jul 2021 04:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9YtTx2F8aCtjxUTXqe0aUtd1QKwb/HSkiydeejpIB4k=;
 b=DvPcmCPEmDyLe3TGFTP1QJeVA2WB+aAXO8mtDMt92/tIWfVwoxyj/t+ohBnZhllumo
 FE8nIVjaonsiw5dBGIuKHq5HwvCS+RUy7HQLPgjUJ2OG2ki1X2sPyNz9OTIz5RDCj/Q0
 TULtxmO2p7V7NaIniuhDYieJ05ETRDTZNH06S96TDnJAYDgnwUyK56O6hTnJIBCrZzbz
 oE2sV1ptouoT+cunTJ6XEJvbfVFqHx6uyfCFZdyW/zYc0CLRjOcIxxstpi8unewZ8ZMw
 CcMBMYraxUKiFmoranTvKMp1CVTb6CaPaHx45wcC25uTJLdvQmxvvr3oWnzD4gXSggTr
 5YEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9YtTx2F8aCtjxUTXqe0aUtd1QKwb/HSkiydeejpIB4k=;
 b=F2dKTd2D76d/hvzb9TnoMBcUrwe0w9H6dZg0mGDlJynwadQ3FrPWDC8ILeJ1Bs5sRj
 g2iGyIpN1gnljffva0L+O7prhsCWg0DfmDgarSy2D9xhlcHq5FWdAC27Bg5szrfrB1et
 ccRSF+TDQSVDfK0AV2VS6fRGpW6Al6YyOAN2sPy3HpF08Ave3qmdjF0gMuijNBDy4HJ4
 F3dFLCB3hMZyzFZg5jYxGiYgyNZcpDVceb0rLKY8XKlhgbQl86Sl9ZbXAzbXZzW5LRCA
 BVa1TeXmtCfjOoBMSGT3ox/X78rc/itaUw/WoGQbE36S9n5eCZHRHWVLY7ZDpSESXEB5
 lOpQ==
X-Gm-Message-State: AOAM531l4sBTYX5dLXQR47GHXhcmr7aqagu05YVxAww765aRFyjVLDEM
 8ZObcv5nKN+EvxG/syHCagg=
X-Google-Smtp-Source: ABdhPJyrONu1cda28NLCVz+hXTIkL/SdYozfXqjGTiFBPvzVDezB4CPrSnB9KOd278Mq2Mi/gub3UQ==
X-Received: by 2002:a17:90a:9ac:: with SMTP id
 41mr17424928pjo.97.1627125556886; 
 Sat, 24 Jul 2021 04:19:16 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id v15sm21310057pff.105.2021.07.24.04.19.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jul 2021 04:19:16 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: linux-graphics-maintainer@vmware.com, zackr@vmware.com, airlied@linux.ie,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, corbet@lwn.net
Subject: [PATCH v2 1/3] drm: use the lookup lock in drm_is_current_master
Date: Sat, 24 Jul 2021 19:18:22 +0800
Message-Id: <20210724111824.59266-2-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210724111824.59266-1-desmondcheongzx@gmail.com>
References: <20210724111824.59266-1-desmondcheongzx@gmail.com>
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
Cc: gregkh@linuxfoundation.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>, skhan@linuxfoundation.org,
 Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Inside drm_is_current_master, using the outer drm_device.master_mutex
to protect reads of drm_file.master makes the function prone to creating
lock hierarchy inversions. Instead, we can use the
drm_file.master_lookup_lock that sits at the bottom of the lock
hierarchy.

Reported-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/drm_auth.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
index f00354bec3fb..9c24b8cc8e36 100644
--- a/drivers/gpu/drm/drm_auth.c
+++ b/drivers/gpu/drm/drm_auth.c
@@ -63,8 +63,9 @@
 
 static bool drm_is_current_master_locked(struct drm_file *fpriv)
 {
-	lockdep_assert_held_once(&fpriv->minor->dev->master_mutex);
-
+	/* Either drm_device.master_mutex or drm_file.master_lookup_lock
+	 * should be held here.
+	 */
 	return fpriv->is_master && drm_lease_owner(fpriv->master) == fpriv->minor->dev->master;
 }
 
@@ -82,9 +83,9 @@ bool drm_is_current_master(struct drm_file *fpriv)
 {
 	bool ret;
 
-	mutex_lock(&fpriv->minor->dev->master_mutex);
+	spin_lock(&fpriv->master_lookup_lock);
 	ret = drm_is_current_master_locked(fpriv);
-	mutex_unlock(&fpriv->minor->dev->master_mutex);
+	spin_unlock(&fpriv->master_lookup_lock);
 
 	return ret;
 }
-- 
2.25.1

