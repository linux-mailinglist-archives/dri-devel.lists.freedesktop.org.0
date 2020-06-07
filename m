Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3A91F097F
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jun 2020 06:06:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A8C06E25E;
	Sun,  7 Jun 2020 04:06:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E7666E25B;
 Sun,  7 Jun 2020 04:06:18 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id q19so14485050eja.7;
 Sat, 06 Jun 2020 21:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wQbGVJsmgUaaNGKlxIx9gObTOhSlYMWEOJh9oGiI0Ds=;
 b=B8cP/1D8oLjBQiZ/A46ol+KeJZ4vqenXN1dRJVNDB4Vi79qzt1VxKwg8Gvf/DTsR88
 VeTAlg4FUnYAUHlYZzaxsFiFGWf1qLJVOlaHTAqdQlSmO5VYwUAiMVQf6zx0ln6oYshA
 DUkKLzljRSq6kdihBKFaXPboCawZULfmvVbI2Iy38/ndjWzjaOZhgcp3I2ruMWO66WKn
 YNtTgp9H51tFb6l2HN4cQA73Lmh4W/Apj+Y8zgvxMga8Bj4UuYpfYfpQ77m/0j65qQYn
 tOG9IwMi+FNAPLYqlkjWYPm/ic75Ua53eo5428mLNuA/NL+bPC29+Qrl4/Yx3gfdLGPS
 Smkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wQbGVJsmgUaaNGKlxIx9gObTOhSlYMWEOJh9oGiI0Ds=;
 b=h9QEE9tEc7pmpnsAwkhZAP4QL8IgWtYSJmxubSxnlSAIJeVaoT/P2UME0n3upzsoC3
 i2aLSHUZuKS75jU9Slcq6jG7GoPOJZpwljitw4IPQjRusr/z/2vWs8RCgvu1q9VEi+A0
 vKKKBjljgi52mEOFn11VmVLWSHcKhQ7eDBF1l3/VwCnjm+P36XCJ+7BZDYoPYv2CRKDq
 FOhKz5EjoMXFAcTlG4vcduDmX8JsWdHdfTQfZUACMuqCbnj8YVrBouF+MHPu/2veLlcT
 8eI7jR/iQ3ShlJeW/gDaPx3NVpInUsXeiqCQRC/hgjDVjHTKlV8bW7Zs2BQk0mTezDUk
 cvIg==
X-Gm-Message-State: AOAM532tLF4HzKXZa7yHlLws5O5XYNH1GX3gft64WmYz5rsijiAuclWc
 opZKRRHTPhZtqbkt5kL3NUp3kQwF
X-Google-Smtp-Source: ABdhPJzqNOOTL2xeC8kFJYl79Xci8avCzaCIKouujtXawDJPbjt2bQe9ANxacUo4kPYMJCWlBszrbg==
X-Received: by 2002:a17:906:73db:: with SMTP id
 n27mr15127111ejl.16.1591502776665; 
 Sat, 06 Jun 2020 21:06:16 -0700 (PDT)
Received: from twisty.localdomain
 (dynamic-2a01-0c23-8430-e100-f914-43b7-6b66-02cf.c23.pool.telefonica.de.
 [2a01:c23:8430:e100:f914:43b7:6b66:2cf])
 by smtp.gmail.com with ESMTPSA id w13sm7797243eju.124.2020.06.06.21.06.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Jun 2020 21:06:16 -0700 (PDT)
From: Mario Kleiner <mario.kleiner.de@gmail.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/amd/display: Enable fp16 also on DCE-10.
Date: Sun,  7 Jun 2020 06:05:57 +0200
Message-Id: <20200607040558.15996-2-mario.kleiner.de@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200607040558.15996-1-mario.kleiner.de@gmail.com>
References: <20200607040558.15996-1-mario.kleiner.de@gmail.com>
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
Cc: alexander.deucher@amd.com, nicholas.kazlauskas@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Assuming the hw supports fp16, this would be also
useful for standard dynamic range displays, not
only for HDR use cases, because it would allow
to get more precise color reproduction with about
~11 bpc linear precision in the unorm range
0.0 -1.0.

Signed-off-by: Mario Kleiner <mario.kleiner.de@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/dce100/dce100_resource.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dce100/dce100_resource.c b/drivers/gpu/drm/amd/display/dc/dce100/dce100_resource.c
index a28c4ae0f259..10bb4e6e7bac 100644
--- a/drivers/gpu/drm/amd/display/dc/dce100/dce100_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dce100/dce100_resource.c
@@ -385,7 +385,7 @@ static const struct dc_plane_cap plane_cap = {
 	.pixel_format_support = {
 			.argb8888 = true,
 			.nv12 = false,
-			.fp16 = false
+			.fp16 = true
 	},
 
 	.max_upscale_factor = {
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
