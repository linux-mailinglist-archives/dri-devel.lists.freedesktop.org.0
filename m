Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF3065676A
	for <lists+dri-devel@lfdr.de>; Tue, 27 Dec 2022 06:54:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81E2B10E138;
	Tue, 27 Dec 2022 05:53:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69D4E10E138
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Dec 2022 05:53:35 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id z144so6524535iof.3
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Dec 2022 21:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9wARd1L8KoeksEpzilviu4ulCrJM4nCfjKCQtrReh+8=;
 b=KtWR1NWXObtv0A+S1nWRpm41eZaY26/OpoTg1WUZ0w96TGoaGxTskVlBy9RmAUg26I
 R50W5tkC5ZcQFkjLlDpE3K+Eebi3Ek2LtjejuCN1dyyzmdDotjvb03OKSHhHed9q3n1F
 scwRYzxgCR93T0aHENr/aJvGK684YPRaGbyzI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9wARd1L8KoeksEpzilviu4ulCrJM4nCfjKCQtrReh+8=;
 b=GxgRD7HxUehp3hY7B+vLghwo6n8ImXw9TDDSeVT8VvXf0K/wP/P9BrvgW1P4egpa9R
 CFSj7fbQnuu0uGelplyedhkbjqXq7qKvefZXW1eyJ+uLkJLNpTXvbBI1cK70jRkzYCDe
 4fR3f34w4kgEC3RVVsfEdQhj94mFsU+/4IbiqG1z3X0trnTpL2STIREibxyjkomPAhvX
 fIpwXxHLTD+UgNJERtWlO0m912auY2GoVLOi3C1sl08SOwvEizInD4yOCoURMrJIJkLX
 APn68Z+WNXGPi5613Uer6auz3G+zz05+aVGfwJOpisLLUh/y9qQUfY8H6xIC7U59KeJA
 5z3A==
X-Gm-Message-State: AFqh2koLaq/5weElMqe2N1WubGVyIuw5ZGYpN36Dq/t3U+i4OUbBmXkh
 xoD2SFCZHBlWUZKwzZ27dl4Ofw==
X-Google-Smtp-Source: AMrXdXte67TRl8MJY98BS/POkZrzxYuSwpJzPmANvIyiIz41oROqn94AbLwguwkLz3ZdO3qL9GeTXA==
X-Received: by 2002:a6b:da19:0:b0:6e4:e62c:38e3 with SMTP id
 x25-20020a6bda19000000b006e4e62c38e3mr15013786iob.5.1672120414631; 
 Mon, 26 Dec 2022 21:53:34 -0800 (PST)
Received: from midworld.bld.corp.google.com
 ([2620:15c:183:200:2d44:773f:eb35:d838])
 by smtp.gmail.com with ESMTPSA id
 z11-20020a05660217cb00b006df2b3f17c3sm4678335iox.30.2022.12.26.21.53.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Dec 2022 21:53:34 -0800 (PST)
From: Drew Davenport <ddavenport@chromium.org>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/display: Check source height is > 0
Date: Mon, 26 Dec 2022 22:53:24 -0700
Message-Id: <20221226225246.1.I15dff7bb5a0e485c862eae61a69096caf12ef29f@changeid>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
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
Cc: dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Drew Davenport <ddavenport@chromium.org>,
 =?UTF-8?q?Juha-Pekka=20Heikkil=C3=A4?= <juha-pekka.heikkila@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The error message suggests that the height of the src rect must be at
least 1. Reject source with height of 0.

Signed-off-by: Drew Davenport <ddavenport@chromium.org>

---
I was investigating some divide-by-zero crash reports on ChromeOS which
pointed to the intel_adjusted_rate function. Further prodding showed
that I could reproduce this in a simple test program if I made src_h
some value less than 1 but greater than 0.

This seemed to be a sensible place to check that the source height is at
least 1. I tried to repro this issue on an amd device I had on hand, and
the configuration was rejected.

Would it make sense to add a check that source dimensions are at least 1
somewhere in core, like in drm_atomic_plane_check? Or is that a valid
use case on some devices, and thus any such check should be done on a
per-driver basis?

Thanks.

 drivers/gpu/drm/i915/display/skl_universal_plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index 4b79c2d2d6177..9b172a1e90deb 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -1627,7 +1627,7 @@ static int skl_check_main_surface(struct intel_plane_state *plane_state)
 	u32 offset;
 	int ret;
 
-	if (w > max_width || w < min_width || h > max_height) {
+	if (w > max_width || w < min_width || h > max_height || h < 1) {
 		drm_dbg_kms(&dev_priv->drm,
 			    "requested Y/RGB source size %dx%d outside limits (min: %dx1 max: %dx%d)\n",
 			    w, h, min_width, max_width, max_height);
-- 
2.39.0.314.g84b9a713c41-goog

