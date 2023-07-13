Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EC67528C5
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 18:37:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E817910E755;
	Thu, 13 Jul 2023 16:37:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF92F10E75C;
 Thu, 13 Jul 2023 16:37:03 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-34642952736so3818355ab.3; 
 Thu, 13 Jul 2023 09:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689266222; x=1691858222;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BmUO1J5EliCxWpcWuYGhTm19HhOvYVoh1+BXohGfWSM=;
 b=KuIuySGbHxWr2luhx6hKg1vvgvRLdtiQtr3IcR8WoH7X0Wwa0/h6fJfEd8l032wPuM
 1PcWBuhFRtaPc2tsH/G2q74blfh5Of1pKjzs5UrZ7/BwJ4Vr829mXVwbVoWSvhTatmpM
 w5f39t4SCQfDcGjfKNhqVOorY0OrfhVGFb4zfUN4Toi2La7Ut33OzElFAv9ns4yn9Tg7
 Y2TfC+zBLZKXw9iwLUmq5fG3eG4pfWnsTRK1sARQfAy/F9zhQaXv+aMK6d7xCncimosU
 5pNXpFMIf8zY0r5CQJK8Hozhtn15Xl05S6Bx/kvwmoy+e50OWopriS+vdrsejTq37imB
 0HKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689266222; x=1691858222;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BmUO1J5EliCxWpcWuYGhTm19HhOvYVoh1+BXohGfWSM=;
 b=iGMb6L5gCB94kTngSEyo4IF7rpyXY5VxwIoDSOPvVyk8zlXFguVyJPBQAIsEtSfkWf
 fXZE4rBfQmFPgUDX5F9i+jkHpZsB7xru6H1+TlhIKgq/7HzuEYSBnad+eFCnsMlqeVdL
 cx3W05HxtMlxLH31XGeLUmjUBi/tTLML7lqNFF5jZghxkr6pMl4ABPv+QWEipQMbj2rF
 r3/pbFNfQdihsZf1dyKBpFbyB3nnkfzZLJOMOh+l8F4/+Rtt3A84fq2yD4PCL6/hnARx
 rDzII3xguicmW/NU1qkbD32z6FhIGgxrzxnl9LwUd/wQ0ZyH9koi0Se7SKbLATSoVRjC
 Y0ow==
X-Gm-Message-State: ABy/qLailvEjon5+e5xMwE/uH9EzgyM3fCL/YWr61hYMQScfMBldee2j
 x/WzQSvMQbOCoTzf+tujaxY=
X-Google-Smtp-Source: APBJJlHKO7WCLEDxmaYSP3LhNmBmlPVndP0gCenFwmd4HZm4pnLqdWvaF5AZKoEED4EJ2uJ9Uqhlbw==
X-Received: by 2002:a92:d490:0:b0:347:7399:b170 with SMTP id
 p16-20020a92d490000000b003477399b170mr1306676ilg.32.1689266222716; 
 Thu, 13 Jul 2023 09:37:02 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 s7-20020a92d907000000b00345950d7e94sm2147571iln.20.2023.07.13.09.37.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jul 2023 09:37:02 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, daniel.vetter@ffwll.ch, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 17/21] drm: restore CONFIG_DRM_USE_DYNAMIC_DEBUG un-BROKEN
Date: Thu, 13 Jul 2023 10:36:22 -0600
Message-ID: <20230713163626.31338-18-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230713163626.31338-1-jim.cromie@gmail.com>
References: <20230713163626.31338-1-jim.cromie@gmail.com>
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
Cc: jani.nikula@intel.com, gregkh@linuxfoundation.org, seanpaul@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Lots of burn-in testing needed before signing, upstreaming.
I set default Y to maximize testing by default.

NOTE: without __UNIQUE_ID fix in HEAD~1, this population of
DRM_CLASSMAP_USE()rs experienced name collisions in several different
@lkp-robot allyes and randconfigs, probably because the macro is
always a file-scope declarator, and is always near the top of fhe
file.  Moving declarations around tended to fix one collision, only to
create another collision elsewhere.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index ba3fb04bb691..ff478fcba67e 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -52,8 +52,7 @@ config DRM_DEBUG_MM
 
 config DRM_USE_DYNAMIC_DEBUG
 	bool "use dynamic debug to implement drm.debug"
-	default n
-	depends on BROKEN
+	default y
 	depends on DRM
 	depends on DYNAMIC_DEBUG || DYNAMIC_DEBUG_CORE
 	depends on JUMP_LABEL
-- 
2.41.0

