Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA871E9151
	for <lists+dri-devel@lfdr.de>; Sat, 30 May 2020 14:50:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1EBA6E06E;
	Sat, 30 May 2020 12:49:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FFD26E065
 for <dri-devel@lists.freedesktop.org>; Sat, 30 May 2020 12:49:53 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id x6so6772242wrm.13
 for <dri-devel@lists.freedesktop.org>; Sat, 30 May 2020 05:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bEajEsUU5sqnyngtbsEKYRXXKL/xXjIafgFONtJKFRw=;
 b=I8EzHOobYmhKKdrBFbspCbDO983WtNT5tpPF677DTMjVjRDmHdoWIISfh8g9q3rFXf
 lMrzqDMfcLzy1s2SMrJNzXAPQa1AcSzcUrFiRjrMtNw6c65u3U56oeO2uNuzwYgyKX6s
 /t3jsIiSPlwCBv9uD5s0c8ZtobpzZHaIcKJsFFXoXuoZXuAy43Z2tzFBOGSIqKTZTMn7
 aF2cmdJNAJGgLEqrcVKHfHuN9MxDxeEYEH7yC97ciTtc+Kgqu4O2dAfcSOo9V73QHXbs
 WuzXnk5Mm3YEXyCqfDOScMUZAV5jaGIzIx/1vd3fDV3SIHnOWuDuxMAGgn5wdXc1Jgtl
 0g4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bEajEsUU5sqnyngtbsEKYRXXKL/xXjIafgFONtJKFRw=;
 b=Trsbp0jFcvaXaARklQ2XuKJhEnBNKDZFrwSQ5N4btCC12HtopViwSkSaDBDpb1DA82
 zAJhI0UvJ7wjBqrLKGzAu+/fd0W60SwLsM/VwPa0XGiO5l++POtVnjHd+WH7ZFC7v3uV
 E98RJIRohbvYGDDyBc9jhQVS5mTDqmi9rnyTkVD6/ULXVqAnWq+sb7UDw5+k58nv/N/y
 gYL11McuXAAx5T6Hbb+vZbaSDir3N968S/f06KdSm1PvKXcl3rX4iOmuH5zx1r6Qeniz
 cqHVkQqK+tIiYHEnIHxAWJ3Jrciq+AmAHIn5nRYGFuD8SljcdGtVtud48iAO8wqeRLoT
 WxBw==
X-Gm-Message-State: AOAM532P2QJL8tbxcZwV2h6TWnYbGbntYQkiDAEnVAncSKw/HPv+8UJV
 2/fLdpasrnQy4JzM9o2Wz2gFZrim
X-Google-Smtp-Source: ABdhPJx7GegisxEkqG/RLX1P0cHxgInS2fRhUwsRF7PtVZ8MIFyOT2nCFtCLrALr7o45bZVao8zEmA==
X-Received: by 2002:adf:f790:: with SMTP id q16mr13483066wrp.399.1590842991981; 
 Sat, 30 May 2020 05:49:51 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id q128sm3355051wma.38.2020.05.30.05.49.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 May 2020 05:49:51 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/auth: make drm_{set,drop]master_ioctl symmetrical
Date: Sat, 30 May 2020 13:46:40 +0100
Message-Id: <20200530124640.4176323-2-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200530124640.4176323-1-emil.l.velikov@gmail.com>
References: <20200530124640.4176323-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 emil.l.velikov@gmail.com, Colin Ian King <colin.king@canonical.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently the ret handling is all over the place - with two redundant
assignments and another one addressed earlier.

Use the exact same flow in both functions.

v2: straighten the code flow, instead of just removing the assignments

Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Colin Ian King <colin.king@canonical.com>
Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
Colin, pretty sure that this should address couple of Coverity warnings.
Yet I didn't check their web UI thingy.
---
 drivers/gpu/drm/drm_auth.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
index 4c723e3a689c..f2d46b7ac6f9 100644
--- a/drivers/gpu/drm/drm_auth.c
+++ b/drivers/gpu/drm/drm_auth.c
@@ -215,7 +215,7 @@ drm_master_check_perm(struct drm_device *dev, struct drm_file *file_priv)
 int drm_setmaster_ioctl(struct drm_device *dev, void *data,
 			struct drm_file *file_priv)
 {
-	int ret = 0;
+	int ret;
 
 	mutex_lock(&dev->master_mutex);
 
@@ -272,12 +272,15 @@ int drm_dropmaster_ioctl(struct drm_device *dev, void *data,
 	if (ret)
 		goto out_unlock;
 
-	ret = -EINVAL;
-	if (!drm_is_current_master(file_priv))
+	if (!drm_is_current_master(file_priv)) {
+		ret = -EINVAL;
 		goto out_unlock;
+	}
 
-	if (!dev->master)
+	if (!dev->master) {
+		ret = -EINVAL;
 		goto out_unlock;
+	}
 
 	if (file_priv->master->lessor != NULL) {
 		DRM_DEBUG_LEASE("Attempt to drop lessee %d as master\n", file_priv->master->lessee_id);
@@ -285,7 +288,6 @@ int drm_dropmaster_ioctl(struct drm_device *dev, void *data,
 		goto out_unlock;
 	}
 
-	ret = 0;
 	drm_drop_master(dev, file_priv);
 out_unlock:
 	mutex_unlock(&dev->master_mutex);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
