Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DE1389A76
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 02:25:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 075A46E4C9;
	Thu, 20 May 2021 00:25:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8674C6E4C9
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 00:25:22 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 b13-20020a17090a8c8db029015cd97baea9so4366020pjo.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 17:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aRquPtKESR1fixPzXGluszKZZ1e3a9BRsbbdMoeuLvY=;
 b=Ds0tK1t4lVQ8KE/sGvf2nUVymAK21Pt8pKPu3fln6VW9CNikaOaUrGjV4DPHFPbQ+s
 CrE9qPxuFx80GzKOsWy/tx7t0AC57nz/Ictcrbg4xp864prwxIt69Hb9v/dSkuTPZD61
 7pIUUGfmzYO93Wp+YVhARCpxNoVBGUjPBTDng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aRquPtKESR1fixPzXGluszKZZ1e3a9BRsbbdMoeuLvY=;
 b=UddcWiyimT1Z+OT6R/sO4Y+k27pctguN4W8g1+sCK5EL4pASadDOZW68tDLCIV29oo
 gyCzSUnDHVeUt3cGE5la3pE0J7wY3ZvHP6s5GyRQZlZj/uMFEfSaBAZfEicqm82Mvga9
 BvsMyj1AoZyomHS4zNcjP/S6FEjEnotu+RewgFtX+lJmVHlmTKoceR/Op/lEq527b7Nb
 vHyXDP9KkYd7LdyBy60AtMnP8LGTXAm4UQsUddqRNbOxSjxWqX82RLIbhaP/Wndv9SkL
 +AA0qsZcPGoWPeRGyr/eKPZng/oDnpVH0SjT+0WZ1UszPHS1ZP4uJizWBBz5hoXAFgE1
 yKog==
X-Gm-Message-State: AOAM532/COb8+jT3JbdXFAvkjEP+0ojTSPvUUilHpulVnQVGLX18c73D
 6//6/dikRTJlNpgnUWJAzB5CKQ==
X-Google-Smtp-Source: ABdhPJzQ4U2lTNUnLgnTbBfp6T56SKS85QwT+rKLMXH6K8ql9c3cbNItvfoNOn06y8J7swXPzEuKMg==
X-Received: by 2002:a17:90a:7e03:: with SMTP id
 i3mr155918pjl.197.1621470322127; 
 Wed, 19 May 2021 17:25:22 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:200b:db75:4e6c:8b96])
 by smtp.gmail.com with ESMTPSA id i14sm398904pfk.130.2021.05.19.17.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 17:25:21 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 1/7] component: Drop 'dev' argument to
 component_match_realloc()
Date: Wed, 19 May 2021 17:25:13 -0700
Message-Id: <20210520002519.3538432-2-swboyd@chromium.org>
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
In-Reply-To: <20210520002519.3538432-1-swboyd@chromium.org>
References: <20210520002519.3538432-1-swboyd@chromium.org>
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
Cc: Saravana Kannan <saravanak@google.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Russell King <rmk+kernel@arm.linux.org.uk>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This argument isn't used. Drop it.

Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/base/component.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/base/component.c b/drivers/base/component.c
index 272ba42392f0..bbe1757dfa89 100644
--- a/drivers/base/component.c
+++ b/drivers/base/component.c
@@ -307,8 +307,7 @@ static void devm_component_match_release(struct device *dev, void *res)
 	component_match_release(dev, res);
 }
 
-static int component_match_realloc(struct device *dev,
-	struct component_match *match, size_t num)
+static int component_match_realloc(struct component_match *match, size_t num)
 {
 	struct component_match_array *new;
 
@@ -359,7 +358,7 @@ static void __component_match_add(struct device *master,
 		size_t new_size = match->alloc + 16;
 		int ret;
 
-		ret = component_match_realloc(master, match, new_size);
+		ret = component_match_realloc(match, new_size);
 		if (ret) {
 			*matchptr = ERR_PTR(ret);
 			return;
@@ -469,7 +468,7 @@ int component_master_add_with_match(struct device *dev,
 	int ret;
 
 	/* Reallocate the match array for its true size */
-	ret = component_match_realloc(dev, match, match->num);
+	ret = component_match_realloc(match, match->num);
 	if (ret)
 		return ret;
 
-- 
https://chromeos.dev

