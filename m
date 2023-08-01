Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B31F76C11A
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 01:36:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E70B010E472;
	Tue,  1 Aug 2023 23:35:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA2DE10E469
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 23:35:49 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id
 e9e14a558f8ab-348ccbf27eeso28518955ab.0
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Aug 2023 16:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690932949; x=1691537749;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fs8KKrYjZk0r9Wo5TdxMtD6IOfpOECGrCMFsRZEQgtA=;
 b=rMWjAJ2U+WaD5Mutqiu7RyPW6dIfKMHHFZdPz9DW9uYUEibGxPKkrvORHZJLx/Jv3T
 1dc8iBkAbGs4DepKAoxzIr5aZPJVxIXD6g1suy2U3aLf/xP3J01Q3FbrwedTDEY+6sN4
 B8VDc5qRY6OIZDVC/gcvBYlRFhH6WU3m6cDLpw79ikVAA0lQM0vLfriHQKXutYJzddLX
 GfLmbdjzWxAj5uXFa3pmwmx1raKrkdOdBPzzg8Z/qkLp75eIyhLryWvTsqip53MVHlTK
 2NT0AWm71L2d22wyNK/Ofgdwi6A0QmHxp5+gsmr/lTV8j2iPf7Nnfn6O+KA0dYGGteHn
 ZrLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690932949; x=1691537749;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fs8KKrYjZk0r9Wo5TdxMtD6IOfpOECGrCMFsRZEQgtA=;
 b=TdzVZ33b6fwgHFoLcy30chpzlZCODpc1YBoxkp+VEogE2nPMve2SSWX0BJEZft1JOB
 k7sQM4iZynN19Mw9nrjEwtZpomE0ZLrkAseTlLMDMlcbBbQdHAnMOi0juFKXMmRjaKV2
 l/OWFxHbjuGKNGcPjIWqslyqzwzN14Ess6lm9hsWw0J/3cuLEXKOMSGk4zqlprbpxAoq
 wJINQNS/VrQ6lkULsW8UP7XBzM6aCrC2xgiNGWlnYZqxN7pkIJ0x7kywdRGVkbCgYkuM
 2aK2z9ooCnWpvYiJiJI0BwdSlQVTVph2q5izrEI0BNcOGfo5AgJWr9SICZ2R58/YOS8G
 5tzQ==
X-Gm-Message-State: ABy/qLarqeCcbis9ovP9MyjmQamq39WZu9wNVo3grqHa8Dm0lVc27zPK
 SzIs5uK8NXWlGtT8oc0h9sJAQ47nqLJ5bw==
X-Google-Smtp-Source: APBJJlGQrB6closmM7i+Fr2ICbD25X6ZFESbxdFjRxd02w6APHYDZuZQp0CoVZZSIMLZruIJcOqMJA==
X-Received: by 2002:a05:6e02:1a6d:b0:349:3c0:395d with SMTP id
 w13-20020a056e021a6d00b0034903c0395dmr12049221ilv.1.1690932949106; 
 Tue, 01 Aug 2023 16:35:49 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 t13-20020a92ca8d000000b00348d652a6b4sm4157967ilo.48.2023.08.01.16.35.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Aug 2023 16:35:48 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: [PATCH v5 20/23] drm: restore CONFIG_DRM_USE_DYNAMIC_DEBUG un-BROKEN
Date: Tue,  1 Aug 2023 17:35:10 -0600
Message-ID: <20230801233515.166971-25-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230801233515.166971-1-jim.cromie@gmail.com>
References: <20230801233515.166971-1-jim.cromie@gmail.com>
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

Lots of burn-in testing needed before signing, upstreaming.

NOTE: I set default Y to maximize testing by default.
Is there a better way to do this ?

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

