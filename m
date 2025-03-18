Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC29A67D69
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 20:55:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A783110E4C7;
	Tue, 18 Mar 2025 19:55:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TbylAs4W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36D0710E265
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 18:20:28 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-54ac9b3ddf6so62778e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 11:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742322025; x=1742926825; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FBan4wol6XPgP+/yLu6aCRZmWKzav4I2GXdbdcPbMJQ=;
 b=TbylAs4WQ+VrtR0IzUXg2abW9vdpJmYfiEeNBVHNmOJSgn3Bxy4sGZkeU/3AReI9Uc
 0E2UxGBrSpJ/Vnddqa87Vh+MUQfWOCVS3aI8QIoBe6b9WP/+h+h73U9so4cbJctYFrI3
 zn2t/Qy8oUPk862pgcG1BZg0SWndNR63raiV/ySveFbOW0U2B4Qxq6coG1EPhcG1cQr2
 cFaNN5tpD83Ik1VCdlzIjW2AcYcO/hoq6NO59NOrulmtOOjOOIV1W43kppZE2nfkdeYs
 T12EQTdByW6Gq8kacoqMHoin7FMrzk5fgMdo8t5H1e7/2YZmASCQInYb1tpXGKHjTuQm
 ac7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742322025; x=1742926825;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FBan4wol6XPgP+/yLu6aCRZmWKzav4I2GXdbdcPbMJQ=;
 b=TnU4ZK0R+PTzjXTpPs8oVplZfD3YV5/PzRBV3PhIUq8mEHdWerAm0+sJVyg8iTgXgH
 kJG4/XdGLURY9a50zFW9tJBKYqSl+TRH3I56CcgfsSPbPwwY8x+FOqcXiAzB7Hp4g097
 xh3yMvH4sDdUHQczNQv7ZIs4V3IgT2j5oBwp/swF7rK/qFOAUe1xdvDawvS34Dy10msm
 y6xqcYeGLVY0t8jj/RVtSToDuje6o1xWRrg+fjtuHR1v5iuA0Z/NRPEreCGv4p2lYGTt
 XIDyQakQqbKxG3AMX1TId1sZoYg/56M3fJRQL3XDfnUL6lLe3QWMZA5xUvSdiUWSDOoV
 GWJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWklDmwkR4G92FruqbHph+cXzK5PsGexxUP0XaxM4Ywtkrfoxdu1/vDgr2aqADZKOrP2Agrh+11qyw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxEzGYR+RAjZZm6OqZwn8nO3f8vU/z92m8DAWujeX3Rs+vLkMbF
 doWcvAxnrMn0VKf992iUPA08MrUry4CCp5YUSlUU6Z96bcctQ/1xYtBmuXPv/ginFQ==
X-Gm-Gg: ASbGncsegsuLsEms2BhqsZzNBBhkQWu1ELSTrIjR5B8ScvQgimy6iXgOE8B13xS+r43
 jxilZDSlvZvSqTJZEQ03YrOE+6KC18IqSkGnRvIirM+UL76Q41wfnpC1O43Cx/XSh4gozNEsV5C
 rmZj60bV1XEz6Yaa2EwUa9tIGj4ETvuLllS054AHAjB4qplIXlMwwdMDoRf/qfGW69gbtP1RjqG
 eWga2DYkRzH4Au07ezPD7LlQxr08FgJQhIp6cN2mlU62gp+gBl8QkBnB0MJmoVO6oRJPxK2q0Cr
 kx6ZAkD+EV86qrO8wPnii6aLTg2NvmBc66dPGa2tllO72A==
X-Google-Smtp-Source: AGHT+IEp41sTRtQHleO8s17cTcBz/WRGvYLMOBfDJzuipfBrbh5s+omLIFbsikMDaTnozZf+tG9gXg==
X-Received: by 2002:a05:6512:308f:b0:549:86c8:113a with SMTP id
 2adb3069b0e04-54a03b8d777mr3549627e87.15.1742322024618; 
 Tue, 18 Mar 2025 11:20:24 -0700 (PDT)
Received: from leo-laptop.. ([85.89.126.105]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549ba7a84desm1780577e87.46.2025.03.18.11.20.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 11:20:24 -0700 (PDT)
From: Leonid Arapov <arapovl839@gmail.com>
To: Helge Deller <deller@gmx.de>
Cc: Leonid Arapov <arapovl839@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 "Dr. David Alan Gilbert" <linux@treblig.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 linux-omap@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org
Subject: [PATCH 29/29] fbdev: omapfb: Add 'plane' value check
Date: Tue, 18 Mar 2025 21:19:52 +0000
Message-ID: <20250318211959.8557-2-arapovl839@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250318211959.8557-1-arapovl839@gmail.com>
References: <20250318211959.8557-1-arapovl839@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 18 Mar 2025 19:55:27 +0000
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

Function dispc_ovl_setup is not intended to work with the value OMAP_DSS_WB
of the enum parameter plane.

The value of this parameter is initialized in dss_init_overlays and in the
current state of the code it cannot take this value so it's not a real
problem.

For the purposes of defensive coding it wouldn't be superfluous to check
the parameter value, because some functions down the call stack process
this value correctly and some not.

For example, in dispc_ovl_setup_global_alpha it may lead to buffer
overflow.

Add check for this value.

Found by Linux Verification Center (linuxtesting.org) with SVACE static
analysis tool.

Signed-off-by: Leonid Arapov <arapovl839@gmail.com>
---
 drivers/video/fbdev/omap2/omapfb/dss/dispc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dispc.c b/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
index 8db074862824..1dc70c96d813 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
@@ -2733,9 +2733,13 @@ int dispc_ovl_setup(enum omap_plane plane, const struct omap_overlay_info *oi,
 		bool mem_to_mem)
 {
 	int r;
-	enum omap_overlay_caps caps = dss_feat_get_overlay_caps(plane);
+	enum omap_overlay_caps caps;
 	enum omap_channel channel;
 
+	if (plane == OMAP_DSS_WB)
+		return -EINVAL;
+
+	caps = dss_feat_get_overlay_caps(plane);
 	channel = dispc_ovl_get_channel_out(plane);
 
 	DSSDBG("dispc_ovl_setup %d, pa %pad, pa_uv %pad, sw %d, %d,%d, %dx%d ->"
-- 
2.45.2

