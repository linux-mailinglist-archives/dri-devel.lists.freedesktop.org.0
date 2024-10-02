Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6991198CE0A
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 09:49:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CC2010E1D6;
	Wed,  2 Oct 2024 07:49:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UqFRuBvr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2884410E1D6;
 Wed,  2 Oct 2024 07:49:07 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-a90188ae58eso814117066b.1; 
 Wed, 02 Oct 2024 00:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727855345; x=1728460145; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1sE33RK9i6Dr1qCPzfRCLBr1LX2ZDnRlOdHfUf2FKHc=;
 b=UqFRuBvrpWiIWTDejeK+EUoDDTk7Zs3/6V2M9kcVbRotuLPRGXpRsgbyL8GQd8i/gP
 VdTXU+Szw5ev7PbVH+jQ+uOksvem42QVC9vQH0F1VT0tvPJBE5Oumu5WTgqKyP62T/3b
 imtfSfdSC6J0jomNX2VvINyNNtFtfNdnHlaDn3CGK2NmVQsfQTg9OQBmn3zb5OLnXHuX
 gkAJBDmW2gs/owksjQ5N3cQcFqNA537hBfBp3SP/U5dC7ki/KJg8Ui7wLLhtmDlzwxq6
 9uRM3lkcXNPEjjOlwUCPYLiK/wWYuIre72cCPxKQUS/HVdvgjsCvFIr7ZkbCclm8yzoO
 BPFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727855345; x=1728460145;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1sE33RK9i6Dr1qCPzfRCLBr1LX2ZDnRlOdHfUf2FKHc=;
 b=i4og+1DFmKj/BwBTIRklnaFy4HfT2Wa4rDJShFpTWzlTElXOkds+UKhb2ipi2uhnCD
 PlZ4e3Hi2UlzWkSfXUVH4U3PN6BkZMHRBeXNjiXEREHrCAEkzLTQW9ePN3kcb8lKO5nf
 5zv5bSzgIxjb9Pq0adfIo0bMRe4ELR9z1cbfyyVOQkwAmfJ3GDrkySZaizKpMOmuW/RF
 cIMhhB1PDzCf5A3jGTJqIvttPJsFdhbhKJkKDo1w3+T9HmNYWa9bL1qTUvA09N1jjJI7
 sjhv2HPgcOXH2FX2/MSBJmatCxjVJduI+odthqHU1BuPcWuTLNmFjRouD6blac0WOsDM
 YyPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxPrqFnwuKIRsv0inaW26Kl1V3efeoxPjeUjGpVoRa9f37qUYwyJYvVd+8FULs24eaRjSOvFREUOo=@lists.freedesktop.org,
 AJvYcCVqy37eVXUZSgqi6CC3YR3DYiHdzG8GazuS917+7/Sh2iuikOUcNcnEzlIWZkN/CCZN2VgOMm7DJrE=@lists.freedesktop.org,
 AJvYcCVukBv9+oSt0Sc+QgacfXSwK3QTqOH/jHY7RYBcGCYfoMKwJAqPvDFYfNw0g34oRLivFrVrDjMT561J@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxSqFHxOyohTraYb2w3PcwALctdrMqaWmk60SS+KyKfQY5EnWw1
 p/mYaPRKCZgoRP04Po1xSlVb9rG2joy06bWX5iJ7/lWqpNm0ebQ5
X-Google-Smtp-Source: AGHT+IF1OGVlHVCOZY7ncJbcAHiJ3yHF47hZOCjc40mcpPrCwCrw9KqUsqhkQw283ZrsikK00WvzJg==
X-Received: by 2002:a17:907:705:b0:a86:ac91:a571 with SMTP id
 a640c23a62f3a-a98f83875afmr216654066b.56.1727855344841; 
 Wed, 02 Oct 2024 00:49:04 -0700 (PDT)
Received: from localhost
 (craw-09-b2-v4wan-169726-cust2117.vm24.cable.virginm.net. [92.238.24.70])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c2999076sm824885166b.218.2024.10.02.00.49.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2024 00:49:04 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/i915/display: Fix spelling mistake "Uncomressed" ->
 "Uncompressed"
Date: Wed,  2 Oct 2024 08:49:03 +0100
Message-Id: <20241002074903.833232-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.5
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

There is a spelling mistake in a drm_WARN message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 74311bb9d290..a5057ee4cbe5 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -3811,7 +3811,7 @@ static void enabled_joiner_pipes(struct drm_i915_private *dev_priv,
 		 secondary_ultrajoiner_pipes);
 
 	drm_WARN(display->drm, (uncompressed_joiner_pipes & bigjoiner_pipes) != 0,
-		 "Uncomressed joiner pipes(%#x) and bigjoiner pipes(%#x) can't intersect\n",
+		 "Uncompressed joiner pipes(%#x) and bigjoiner pipes(%#x) can't intersect\n",
 		 uncompressed_joiner_pipes, bigjoiner_pipes);
 
 	drm_WARN(display->drm, secondary_bigjoiner_pipes !=
-- 
2.39.5

