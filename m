Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD8E76C117
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 01:36:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5D7010E46D;
	Tue,  1 Aug 2023 23:35:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC97610E465
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 23:35:46 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id
 ca18e2360f4ac-790bed44880so43563439f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Aug 2023 16:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690932946; x=1691537746;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fs8KKrYjZk0r9Wo5TdxMtD6IOfpOECGrCMFsRZEQgtA=;
 b=ChoEi8LbCC4cHDxX2Juv5dFQPfCzGWzC6WVddBeiUy3chB6YUji5n0rzqb8/2QAia4
 5U45w27jywQExyXR9GCfMFPWOEt2GjckxJsZ/8QdIDZ1rds38gL0Rsd79lva4U/IDbcH
 RW58pHQl5I5NwIKjZ8FeVf3AYZ4Tg/YL5hEMpRvCDxELqWUKNl+oEJKVJbOdVNE3QGYI
 iRXXnckvP6gus+WOJgsY5BCu0E87OURqJewKP79TOPJNu21WCjubDqfVq1Qm7QDmFK27
 YfYTNrnCSmXtGSMQ1u88UCi4iTxNDcjz9h7LmddD+IX+Le9h6PAdmUa8j2D0WMYGNPYg
 cYgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690932946; x=1691537746;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fs8KKrYjZk0r9Wo5TdxMtD6IOfpOECGrCMFsRZEQgtA=;
 b=k/uQ/uK0jO6E095fUmqFJi5kWjhygQIYK23PiweoJnpqC7lYZgzPg8rxs30ioQjZWn
 uROZCfl7PcNHVJ00J9sL5tSPFSXCyFB5LrdAYMf1df9LP3JpKz/a8yPMv+ocT059CFG6
 fKIWdfcJFJySVKwtmqVJFLz+A+Gpr7BX9lXXeYxLkOkZSuiZc229pocNgq23YDc7j0RZ
 o5tAy7JQTFy/RN7WJgev07xMDGhf7xih1MpGFmMhNJc7JCku9TpjSIF7SATodqnAnUXb
 Tn+ZkXdhBWYMR50C9yA4211B36gfdDVxgyQYrtN7hq70ORtCUX8NvTjhgpymqIQVJFHo
 B2JQ==
X-Gm-Message-State: ABy/qLZi4YcYcSqHYUexGkbwbZlAU+/vdtMp1BVuzQCXhxwxcp8sg42K
 qhMEg3QFgUyjAbbSmJpzwtA5rhuOe051Xw==
X-Google-Smtp-Source: APBJJlFoxkaJAR97WFFPFBfijdt81fQOWWcWUhcJ59B6jQne8rh7Ex5Y5y5H7xiwn+BM9nRB4SFyVg==
X-Received: by 2002:a05:6e02:2188:b0:348:8050:5268 with SMTP id
 j8-20020a056e02218800b0034880505268mr9884342ila.12.1690932946224; 
 Tue, 01 Aug 2023 16:35:46 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 t13-20020a92ca8d000000b00348d652a6b4sm4157967ilo.48.2023.08.01.16.35.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Aug 2023 16:35:45 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: [PATCH v5 19/22] drm: restore CONFIG_DRM_USE_DYNAMIC_DEBUG un-BROKEN
Date: Tue,  1 Aug 2023 17:35:07 -0600
Message-ID: <20230801233515.166971-22-jim.cromie@gmail.com>
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

