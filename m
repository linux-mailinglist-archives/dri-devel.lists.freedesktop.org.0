Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE07D5594BA
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 10:05:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DD3C112C63;
	Fri, 24 Jun 2022 08:05:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BF0D112C32;
 Fri, 24 Jun 2022 08:05:00 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id z11so2295706edp.9;
 Fri, 24 Jun 2022 01:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m/E6hWEFQyi25CxFeEuPVoEVkNjsUA/fW4bkRRrhTG8=;
 b=e8Okw9V9KyZY0LQ9UKvtkO1+tj9txF7SZgjxfu0nIPVJ7UHFSFPajh1LcrrR+mc/Ax
 7Xcml0b3DTzx3T2bMsv8lp7T6q7E8SECtadIf2BbI5ZWp1CKCCjXMJ+X+N3gB+Fbk+hI
 b31Ng6R/qrQ8N6LOuGNRH4RuKGuBjnKOVPxxK7EXBtqVHECTyUdENgmbiNMStYeqtDEf
 i8j/Pv/qCpjDot+5YbNEf4ExwNPa/ehQnPHUm9ruLn2IZbJZpd2tKFDQwHw3MDtpAITE
 BVAJdg6xrEucAqwIZovpm02Nb/tWQUOGD/LUv75bzOhZfpRKGHx3/vDdg1//bFowy+2C
 xUAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m/E6hWEFQyi25CxFeEuPVoEVkNjsUA/fW4bkRRrhTG8=;
 b=V2OIiPILrOMzPHb1ieV7zDC9fWhXuRJrnNeW2ZIaCoPVToDxonmtZoJHj3hx2jZHuv
 es2bK6aVbp38Y522t4bnb10ewvuusyMRke8rpbu4wNi9TyC2XApKDROCHBCDIcY1wM33
 8Q5I2jt4ANBITAEDZJXiRxQStDNjr3ykqj5YPP5WpzJyKjWEav0SeoRdK6wGgndPkdnX
 4SAgadwABWrlvS2rSJwyAHK0Kc5WwPBqenaTwDXjk1cU6O3omXgFLfELhNIppJmyZv89
 vpnkmgNFNxfteVEF17/8Tb9rajBZRP4BNjVi0PvVOIAOQO9Wfa48l3KmHvDZxDLEBNvo
 xoww==
X-Gm-Message-State: AJIora+oeewPn84xIVLvGlUGvb2cQ0K1CSzp36A0KGfAH5UkJt722FN/
 wEbXWNuOcTgKar056FTFdy4=
X-Google-Smtp-Source: AGRyM1sPm1PtPb+HeXcaBFnsmjeMMONuCGOa4UKNnvwqlpKNsvibmM7CXbEqPCXHhwwP42+MiDXxcw==
X-Received: by 2002:a05:6402:5c9:b0:420:aac6:257b with SMTP id
 n9-20020a05640205c900b00420aac6257bmr15655024edx.128.1656057900060; 
 Fri, 24 Jun 2022 01:05:00 -0700 (PDT)
Received: from able.fritz.box (p57b0bd9f.dip0.t-ipconnect.de. [87.176.189.159])
 by smtp.gmail.com with ESMTPSA id
 c19-20020a170906155300b006fea43db5c1sm697779ejd.21.2022.06.24.01.04.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 01:04:59 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 10/14] drm/i915: use drm_file_rss
Date: Fri, 24 Jun 2022 10:04:40 +0200
Message-Id: <20220624080444.7619-11-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220624080444.7619-1-christian.koenig@amd.com>
References: <20220624080444.7619-1-christian.koenig@amd.com>
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
Cc: mhocko@suse.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This allows the OOM killer to make a better decision which process to reap.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/i915/i915_driver.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index 90b0ce5051af..fc269055a07c 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -1741,6 +1741,7 @@ static const struct file_operations i915_driver_fops = {
 #ifdef CONFIG_PROC_FS
 	.show_fdinfo = i915_drm_client_fdinfo,
 #endif
+	.file_rss = drm_file_rss,
 };
 
 static int
-- 
2.25.1

