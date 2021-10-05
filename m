Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A987422BF4
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 17:11:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3CAA6E402;
	Tue,  5 Oct 2021 15:10:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C2796EB90
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Oct 2021 15:10:58 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id k23so3477356pji.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Oct 2021 08:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+QnKdMD67+rQVIo2b0/8Hr/i0O4OC/30heYtQ6dc/js=;
 b=MWGHadB5myjzG7hi7dEWEPb8pOcALr2pFYDh0ztFd5+60GiynIznraGmKCFLG9e1J/
 60NqPZOBhULuBWXwnucxJ/AWgtP8nKcV9vTLWvlpBYy6FbdRgHG+xKzEJFloyTLEUIs4
 QzOxy+kLAS/LJ3leSqgLOjJlx23/8zJ9MRXAs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+QnKdMD67+rQVIo2b0/8Hr/i0O4OC/30heYtQ6dc/js=;
 b=w6hBhF2vC77+/VUs2pI/UQPtPoX9rd02LpyTKVO5qjdM0FwUinOzECOiohe3z+OmC6
 pbl9IPqGmqHWd92Ulo8lomkx3A9YtbcWLXTREjgZW9+Tbk3lm2CKf+JyNQOBhpH1fFAY
 A9tpw084EHR/gdATPMkYBzpX4XAujqKZAX498vLQ9tD6D8XPytMA6HbHsB/zsfvU67xL
 Etr9vhxDqmfDwyW3XTZwFD/KOOHwI2Aw6kKm12QrUfIGEkb8rxSaWL8DnEgx9XNCkvcz
 Ucl3bDg9V5m3E7AaJt2oYOfKTlk2LpKKjuS+o2VeuWiX8PXjRapH5x3t1nCpWeIWwyDk
 CIaQ==
X-Gm-Message-State: AOAM533G/dwDsJPrmji/r2pmA6vWgIvkK78hG0C8IK+nZb/XmZcEK7Nn
 EkoUAdXRdRud7XY+DwcEb42c97HK5WSAwQ==
X-Google-Smtp-Source: ABdhPJzSVCahQti09JKEx8hW7Dg7wwwmo3seeZ5OZCLdMc6jbjcG482M1ZiVw+8V4Fx/bV899Alhjw==
X-Received: by 2002:a17:90a:1a4c:: with SMTP id
 12mr4467161pjl.89.1633446657910; 
 Tue, 05 Oct 2021 08:10:57 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:68e6:d130:478e:edbd])
 by smtp.gmail.com with ESMTPSA id a15sm6280000pfg.53.2021.10.05.08.10.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 08:10:57 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Cc: Rodrigo.Siqueira@amd.com, ville.syrjala@linux.intel.com,
 Harry.Wentland@amd.com, khsieh@codeaurora.org, Jerry.Zuo@amd.com,
 alexander.deucher@amd.com, Douglas Anderson <dianders@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Harry Wentland <harry.wentland@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/edid: In connector_bad_edid() cap num_of_ext by
 num_blocks read
Date: Tue,  5 Oct 2021 08:10:28 -0700
Message-Id: <20211005081022.1.Ib059f9c23c2611cb5a9d760e7d0a700c1295928d@changeid>
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
---
This problem report came up in the context of a patch I sent out [1]
and this is my attempt at a fix. The problem predates my patch,
though. I don't personally know anything about DP compliance testing
and what should be happening here, nor do I apparently have any
hardware that actually reports a bad EDID. Thus this is just compile
tested. I'm hoping that someone here can test this and make sure it
seems OK to them.

 drivers/gpu/drm/drm_edid.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 9b19eee0e1b4..ccfa08631c57 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -1843,8 +1843,9 @@ static void connector_bad_edid(struct drm_connector *connector,
 	u8 num_of_ext = edid[0x7e];
 
 	/* Calculate real checksum for the last edid extension block data */
-	connector->real_edid_checksum =
-		drm_edid_block_checksum(edid + num_of_ext * EDID_LENGTH);
+	if (num_of_ext <= num_blocks - 1)
+		connector->real_edid_checksum =
+			drm_edid_block_checksum(edid + num_of_ext * EDID_LENGTH);
 
 	if (connector->bad_edid_counter++ && !drm_debug_enabled(DRM_UT_KMS))
 		return;
-- 
2.33.0.800.g4c38ced690-goog

