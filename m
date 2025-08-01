Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76602B184CE
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 17:17:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88A6E10E8BB;
	Fri,  1 Aug 2025 15:17:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="J67/tKR8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D8E210E8B7;
 Fri,  1 Aug 2025 15:17:42 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-45896cf24ebso10039605e9.1; 
 Fri, 01 Aug 2025 08:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754061461; x=1754666261; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1E57IOXM33KGklboNf9yR2RywI8PRQ2Op6eR7QA/9PM=;
 b=J67/tKR8NOVZUILMkWuDQ+HfeCYISOGgjgLD/mNgGlcX1eJUSdcMsgtRQTzMZL+Axm
 knoL1Y5VD1j6Pj/45Gymh/stVDoJyhS1zUEux4UCtAWBRPaHzuhBc5PBUwSBKMXNwQTT
 /MyEiaK0kUQI0Yn719D74u0mZQTb5//jrf6IOpYQAfG/YP7+Y7NqwsE829ndtHcGtYCh
 7gMqdFx2eb/8Km8XYtE6oalkC9yTSvhZ3779EIWK5Y33APgZQqDTKLKCc68Egt6Fp6n7
 t0NMHRbboTi1FnNRAR/SntLznqIDFWPubf4oLfejS8ygITa9LGeneJjsi7Y+FBd67kyn
 Cy3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754061461; x=1754666261;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1E57IOXM33KGklboNf9yR2RywI8PRQ2Op6eR7QA/9PM=;
 b=bH9Zl2M2VWb6JGakod+BeZ+YRQoYo59lLqhhAhlE++2xXTL/VcoaeH/50I6qaPoxQD
 mfwk3Wg6va641mYSNxJtVpDnSvzDa/qRVGXEF+Ec0svFzGEDDWqZjD208wykds2PofyP
 HrKNRwxnu4e5Y7iruDcPUDFa7LvivFOGysvtVSlkvtF75ZESqpH9+9VIV4nTN8WT8XYK
 aIvuAo+7bb37jOpNzogrqBoV2czU2Ir5f+rcObN+OAX3eoahSVM/KBDwB0jxGBSdVtC3
 Y73CUBxkK3yqV4wYUplmfisCGIkL4mO9RDppXnDIGu5yUFUx7SxjKPeRsSjaPqI4jCrS
 lRMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDFoBD+WJGbZoF3U8A7wLw9C8Z7G00/WexSZx3RsYh6rCbc7Q3KeX0zBdEnSZM+USC2aWT0Db3CaI=@lists.freedesktop.org,
 AJvYcCWug44bPOsCSYOKFOv78an7/O6VUGHR7EsF8WqSLDy3XoyERtQzeozWX61yxpvChQYS2rb3ZB52uCCE@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzp1KmcfIRfllrANh2h9QFF99sHjJBucbEWzHHwRlfJ/jjb5267
 nWcoV3ek+0Sm3AVG9qu0Xntpo9bQZmInQOZg69nzxSnkIbi0TmNrxZ2h
X-Gm-Gg: ASbGnctjKeMk1oiESX5O/kfz3M/Gb5ZOOjlnH+ADffMFpdH7SWlY2qPtSVxDVrdeRTw
 NBL5TTqsrw/WNq4uwyX4PCPz4VIZ3CHsncumiXXLdj0qh8MDCx4FnHrrlCsNAX4oGqyUZVoHFL6
 zpQKhol9HsO1PxfbXZstJe3Hxupi2hQQPImNmGm7SuoFGZcAlcwCF8zO9Tp7XYB0z3eVB9w2uuy
 Rscf0ajDvVpEr3rYLNwi0R2hUXjsdLHHNsHUqwPSCXiQoYMDDThGYxEZ3MeXc1xpv5LUhrEQ//N
 Q9R4yLeG8p32KOjfbrclbC0qbi0JVDSohFg8oIPReKTuZeLgPGIhLLJqijwo5cli0XJpRdS8JEa
 Ay2wg8ZirF298zlCBvm1c
X-Google-Smtp-Source: AGHT+IGvQuM9rEr7bK55M16XIZ/h5Sn3bJHPTfgaK19BoOh07/ewMbmlWBC7nIYl2set3+TRbMW5uQ==
X-Received: by 2002:a05:600c:810c:b0:456:f9f:657 with SMTP id
 5b1f17b1804b1-45892bcfb1amr109220805e9.27.1754061460654; 
 Fri, 01 Aug 2025 08:17:40 -0700 (PDT)
Received: from localhost ([87.254.0.133]) by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4589edf56e0sm69231365e9.1.2025.08.01.08.17.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 08:17:40 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/i915: remove redundant repeated checks on err
Date: Fri,  1 Aug 2025 16:17:04 +0100
Message-ID: <20250801151705.2432911-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

There are a couple of redundant repeated checks on err being non-zero that
are always true because they are inside a previous check on err being
non-zero. Remove the duplicated checks.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
index d8f4a10d71de..3913b48cece7 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
@@ -142,8 +142,7 @@ static int lmem_pages_migrate_one(struct i915_gem_ww_ctx *ww,
 		if (err) {
 			if (!silent_migrate)
 				pr_err("Object failed migration to smem\n");
-			if (err)
-				return err;
+			return err;
 		}
 
 		if (i915_gem_object_is_lmem(obj)) {
@@ -161,8 +160,7 @@ static int lmem_pages_migrate_one(struct i915_gem_ww_ctx *ww,
 		if (err) {
 			if (!silent_migrate)
 				pr_err("Object failed migration to lmem\n");
-			if (err)
-				return err;
+			return err;
 		}
 
 		if (i915_gem_object_has_struct_page(obj)) {
-- 
2.50.0

