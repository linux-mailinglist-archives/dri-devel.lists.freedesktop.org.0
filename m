Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B317B1F8FC0
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 09:28:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4435D6E2C7;
	Mon, 15 Jun 2020 07:27:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EC726E0E4
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jun 2020 06:36:27 +0000 (UTC)
Received: by mail-il1-x143.google.com with SMTP id a13so12490935ilh.3
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jun 2020 23:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=bKaN8g4E8r9fQxgvVd0mPWT0d8FcyExRTIB0iopHs20=;
 b=ETKnsbcxF82ikBJ4PWFBq2K917ciwh8HDIPEUR4jCqP85AgzV6s4WH/RHAXPfC1P6G
 GrYS3YXBuHzLraLGZbqMGqepIdDByQ9///wyrDR4VLOImj9yE22338jOugJpTHxx5LON
 5QhkLv+fvqf01Y0qYHwNyFP/N2XqAGcLeU8+Zrwsi2vee32VuF7RNdzrpaGoWnyjedlX
 NKih70rnvhskUERAyOCiD5OOhJRK+2Eup8tVUNmWenlUSpI+S0gcqh25j5O2VBkzY7AS
 XnFJU9CCHlzW9k/vYFF0J24lMN9544HKguJtSQywjfUet3Gc89ugtPebwC08VSdPZI/E
 upiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=bKaN8g4E8r9fQxgvVd0mPWT0d8FcyExRTIB0iopHs20=;
 b=Vtc4W1GR7KlBQUUgiAghJV3Ps2yBdTZThtZCGXftoF0qRRF0CZMH3o7IvNAWGwv2GJ
 f6JEZyivU/au21zyEXa9PVNW3L0C4ttjryHENW50zb/4aMzOGef6mb9+AlC7maD5DZQ0
 GFM77VO0Slpl7arU4mWQI/mbprE1OG5SwCwC0wzCD0rKTlxCI9Vzls37QzUjAQcMvM+Q
 9A46CHRY/nxP4kwTemrU7YcYSrBDxl3vHh4eAYtBJ2d91ywCk/XujSk6TWgRlMv0LBxL
 vDvU65eDjyHNfTM4FPwJHCcZI4Gb3y96aLq2q6XiB4vtkyJyZwbM2IeiNSR61MFaAc61
 S4KA==
X-Gm-Message-State: AOAM530H2OZfiBbi2tzfnoowIhVhnp8QtEvY9bkhspzCHgZPDfY9h8JE
 SxhKTPR9u2Maw0TkqAyKqaM=
X-Google-Smtp-Source: ABdhPJx3O1I9dQFPkUoziq65XacrHWidrhZbvxbQYl4JhhKuWOxucU720iAh0UOkCFThmVQiGZKiww==
X-Received: by 2002:a92:aa13:: with SMTP id j19mr20877607ili.193.1592116586536; 
 Sat, 13 Jun 2020 23:36:26 -0700 (PDT)
Received: from cs-u-kase.dtc.umn.edu (cs-u-kase.cs.umn.edu. [160.94.64.2])
 by smtp.googlemail.com with ESMTPSA id r17sm5957131ilc.33.2020.06.13.23.36.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jun 2020 23:36:26 -0700 (PDT)
From: Navid Emamdoost <navid.emamdoost@gmail.com>
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panfrost: perfcnt: fix ref count leak in
 panfrost_perfcnt_enable_locked
Date: Sun, 14 Jun 2020 01:36:19 -0500
Message-Id: <20200614063619.44944-1-navid.emamdoost@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 15 Jun 2020 07:27:17 +0000
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
Cc: mccamant@cs.umn.edu, emamd001@umn.edu, kjlu@umn.edu, wu000273@umn.edu,
 Navid Emamdoost <navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

in panfrost_perfcnt_enable_locked, pm_runtime_get_sync is called which
increments the counter even in case of failure, leading to incorrect
ref count. In case of failure, decrement the ref count before returning.

Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
---
 drivers/gpu/drm/panfrost/panfrost_perfcnt.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
index 6913578d5aa7..92c64b20eb29 100644
--- a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
+++ b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
@@ -83,11 +83,13 @@ static int panfrost_perfcnt_enable_locked(struct panfrost_device *pfdev,
 
 	ret = pm_runtime_get_sync(pfdev->dev);
 	if (ret < 0)
-		return ret;
+		goto err_put_pm;
 
 	bo = drm_gem_shmem_create(pfdev->ddev, perfcnt->bosize);
-	if (IS_ERR(bo))
-		return PTR_ERR(bo);
+	if (IS_ERR(bo)) {
+		ret = PTR_ERR(bo);
+		goto err_put_pm;
+	}
 
 	/* Map the perfcnt buf in the address space attached to file_priv. */
 	ret = panfrost_gem_open(&bo->base, file_priv);
@@ -168,6 +170,8 @@ static int panfrost_perfcnt_enable_locked(struct panfrost_device *pfdev,
 	panfrost_gem_close(&bo->base, file_priv);
 err_put_bo:
 	drm_gem_object_put_unlocked(&bo->base);
+err_put_pm:
+	pm_runtime_put(pfdev->dev);
 	return ret;
 }
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
