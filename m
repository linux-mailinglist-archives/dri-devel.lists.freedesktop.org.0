Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E12A6BC8DE
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 09:21:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1A1510EC6F;
	Thu, 16 Mar 2023 08:20:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6471010EC67;
 Thu, 16 Mar 2023 08:20:43 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id o12so4225538edb.9;
 Thu, 16 Mar 2023 01:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678954842;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=HdnXEe9FKUUR3RfMsG6oApf9dmV8FHuN5e5hMJ9ObEs=;
 b=pB1AB4KQvYLaLn1RaR1dC9UfkteAi5nJW2KPMaPAhCQt0MpJbjwczIugHjmjFibKR1
 cw2pr6VHBRNtfiuGHIYNR/GsqDEUxio4fCuEZMEXGGG9141dbb+8R9vFkQXuX4b2s55m
 YMcVtxLxXgCsmNBRufN9iumKT/BD7GdN3RMAZtSLKtvxYER9hiyl4z3Uz2iftLGSbxXE
 yiCgC4+khMzDddaffKYs+Gmq8gG9TzUF/Ng14EeiLnMlKeX17u31zmJmLtyk/rPsLBr5
 TRxQWWAQ3GS0RasWzFmc4Y6+VqT7kE1+3qqn3xC7fcFNC0QkoQnJKb5dAMNSZdqhPtpF
 d01A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678954842;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HdnXEe9FKUUR3RfMsG6oApf9dmV8FHuN5e5hMJ9ObEs=;
 b=irBREgULKdPVJIE4ORqw1odaQPaJ2Uwry25aZaG1TmhQe6z69IZT/a5+9iswKpch/L
 JUPp+00aypMMki4P837bEMucZp3EaTwySQWKCyvaB+nzV6jIwUFZbhdbl/3e6HZl3M/R
 cdEVpfxEIomrxs5YX38mdSsTSARtDulxKK62nvslsm/sQZJcyfzrUW/mzOI5e5ISjuS0
 bT+AdMsE4aMttoxNvd4n29RS2lMvVwrUP9h6jMVE1n7mIaoV8Sot2AR5tobulP6JEMZv
 6qNDNReqKWZ8IZMN+82VqCSYQ/qldActMmvPkq2ZY3SfhjzlNwR4agECmAhs8M3aobe0
 redg==
X-Gm-Message-State: AO0yUKVEvkGkXvneP6SgCO0kIdix5E8zRUOue7oWyrSaafREdDCYSsW4
 FDuj/JvhKfViZpq2DnlYwrs=
X-Google-Smtp-Source: AK7set8ljeVjdAXJcQJSY9wEO8f6r2I4Y+kEagDBX1e9bqQWUCO4mWixmKtBOkHDrxKnOvNYzGlFmA==
X-Received: by 2002:a17:907:a088:b0:927:8285:18a3 with SMTP id
 hu8-20020a170907a08800b00927828518a3mr10821115ejc.0.1678954841813; 
 Thu, 16 Mar 2023 01:20:41 -0700 (PDT)
Received: from able.fritz.box (p5b0ea2e7.dip0.t-ipconnect.de. [91.14.162.231])
 by smtp.gmail.com with ESMTPSA id
 ja19-20020a170907989300b008cf8c6f5c43sm3519895ejc.83.2023.03.16.01.20.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 01:20:41 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: mcanal@igalia.com, stanislaw.gruszka@linux.intel.com, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, daniel@ffwll.ch, jani.nikula@linux.intel.com,
 mwen@igalia.com, maxime@cerno.tech, wambui.karugax@gmail.com,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/7] drm/debugfs: stop calling debugfs_init() for the render
 node
Date: Thu, 16 Mar 2023 09:20:31 +0100
Message-Id: <20230316082035.567520-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230316082035.567520-1-christian.koenig@amd.com>
References: <20230316082035.567520-1-christian.koenig@amd.com>
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

We want to remove per minor debugfs directories. Start by stopping
drivers from adding anything inside of those.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/drm_debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 4f643a490dc3..63bf8045944f 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -242,7 +242,7 @@ int drm_debugfs_init(struct drm_minor *minor, int minor_id,
 		drm_client_debugfs_init(minor);
 	}
 
-	if (dev->driver->debugfs_init)
+	if (dev->driver->debugfs_init && dev->render != minor)
 		dev->driver->debugfs_init(minor);
 
 	list_for_each_entry_safe(entry, tmp, &dev->debugfs_list, list) {
-- 
2.34.1

