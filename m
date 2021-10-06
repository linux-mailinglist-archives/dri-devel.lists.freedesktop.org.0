Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A28B94235D4
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 04:29:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 284D76E4C5;
	Wed,  6 Oct 2021 02:29:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B794B6E4C5
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Oct 2021 02:29:29 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id 75so1116646pga.3
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Oct 2021 19:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Sz7y3ippQxa0H/IuFAdDEK40pN2B6QfqrRhf4vYPERM=;
 b=KBrSWdbI3+9YUBiU1Raqd+E73k5fETH6Wx8MhhYZlxXEarCjM3eOnFSkqoNTh3+iPr
 vTmlT9oGQNCFKIwrHDD/qAfjiYDZnMIVUgVS8X43EmPExAvS9/qtJPAwTC+wuJdYJSAd
 v8J2PfuDNk47zupaLUfcVAbaJWg+4esUpQFMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Sz7y3ippQxa0H/IuFAdDEK40pN2B6QfqrRhf4vYPERM=;
 b=NQxNJy2PpLEXS5Hwhihvk/68hzIJsgywFe7OFPnjMmv2R5Y+HIusWDBXRegd5fyKd6
 ZuavjqA2vvvSUr6DyZCNy7A5N1YRwXJ4bQvGmSqmJ+/m3CRT8uBAcplUVFpsHR4h2Q/g
 hxFqvafdSWEQGVG1X1ol7z4Bdnv9NS0KoO3hLrMvZmhR1dX6+PF7bO/EY50eYk7Aja8j
 XuIrJgEQMRXz8KVufGzIwYBpptfStT2wseyN3wEzxNAdcbApXbb0RQtbp2zI3rq2AGP3
 BJoKL+q9/UML8mIfpZFBagTqsV1+20p5KzTrBdm5gLAjSAXvI45HpvaJFptjgA5ll4C3
 6Xmg==
X-Gm-Message-State: AOAM532DWCeaJe2jw9/BDu9v70cSCXIcF4z1W78pRWjLZkTbVAyg0dkQ
 2Da0Mfrn/58CAveIuH9oeYS1kEo3qsv98A==
X-Google-Smtp-Source: ABdhPJz6xXzmXTGDKz/phC2NPCwms3/AsNl+Pj68f7tGHPEunhH0H+DHQZgn79rCUGho/WJx2PkiiA==
X-Received: by 2002:aa7:9d0b:0:b0:44c:62a6:8679 with SMTP id
 k11-20020aa79d0b000000b0044c62a68679mr13809829pfp.0.1633487369108; 
 Tue, 05 Oct 2021 19:29:29 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:68e6:d130:478e:edbd])
 by smtp.gmail.com with ESMTPSA id z4sm19497744pfz.99.2021.10.05.19.29.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 19:29:28 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Cc: Rodrigo.Siqueira@amd.com, Jerry.Zuo@amd.com, alexander.deucher@amd.com,
 Harry.Wentland@amd.com, khsieh@codeaurora.org,
 ville.syrjala@linux.intel.com, Douglas Anderson <dianders@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Harry Wentland <harry.wentland@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/edid: In connector_bad_edid() cap num_of_ext by
 num_blocks read
Date: Tue,  5 Oct 2021 19:29:08 -0700
Message-Id: <20211005192905.v2.1.Ib059f9c23c2611cb5a9d760e7d0a700c1295928d@changeid>
X-Mailer: git-send-email 2.33.0.800.g4c38ced690-goog
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

In commit e11f5bd8228f ("drm: Add support for DP 1.4 Compliance edid
corruption test") the function connector_bad_edid() started assuming
that the memory for the EDID passed to it was big enough to hold
`edid[0x7e] + 1` blocks of data (1 extra for the base block). It
completely ignored the fact that the function was passed `num_blocks`
which indicated how much memory had been allocated for the EDID.

Let's fix this by adding a bounds check.

This is important for handling the case where there's an error in the
first block of the EDID. In that case we will call
connector_bad_edid() without having re-allocated memory based on
`edid[0x7e]`.

Fixes: e11f5bd8228f ("drm: Add support for DP 1.4 Compliance edid corruption test")
Reported-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
This problem report came up in the context of a patch I sent out [1]
and this is my attempt at a fix. The problem predates my patch,
though. I don't personally know anything about DP compliance testing
and what should be happening here, nor do I apparently have any
hardware that actually reports a bad EDID. Thus this is just compile
tested. I'm hoping that someone here can test this and make sure it
seems OK to them.

Changes in v2:
- Added a comment/changed math to help make it easier to grok.

 drivers/gpu/drm/drm_edid.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 9c9463ec5465..0383d97c306f 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -1840,11 +1840,20 @@ static void connector_bad_edid(struct drm_connector *connector,
 			       u8 *edid, int num_blocks)
 {
 	int i;
-	u8 num_of_ext = edid[0x7e];
+	u8 last_block;
+
+	/*
+	 * 0x7e in the EDID is the number of extension blocks. The EDID
+	 * is 1 (base block) + num_ext_blocks big. That means we can think
+	 * of 0x7e in the EDID of the _index_ of the last block in the
+	 * combined chunk of memory.
+	 */
+	last_block = edid[0x7e];
 
 	/* Calculate real checksum for the last edid extension block data */
-	connector->real_edid_checksum =
-		drm_edid_block_checksum(edid + num_of_ext * EDID_LENGTH);
+	if (last_block < num_blocks)
+		connector->real_edid_checksum =
+			drm_edid_block_checksum(edid + last_block * EDID_LENGTH);
 
 	if (connector->bad_edid_counter++ && !drm_debug_enabled(DRM_UT_KMS))
 		return;
-- 
2.33.0.800.g4c38ced690-goog

