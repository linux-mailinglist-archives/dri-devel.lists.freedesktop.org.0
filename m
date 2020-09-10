Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DF5265CE8
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 11:50:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AA576E9AC;
	Fri, 11 Sep 2020 09:49:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CF9C89DFD
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 17:18:48 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id w16so6848874qkj.7
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 10:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KOPXfJ4o+30xKb8orSC8RLivwhkM6sb3eQ91eOmY0Vo=;
 b=gNcWA/DM9IKpsqtMRdGgyqQBa8ngfSU0q04kaiB/amfRI5odcxESYG9avLfaext3aR
 MTBhV7S0tIkeb6rvVo/oM4QNgeAnZobe2glDYt3akPElqv7scj9/BCIuGRH8BOwLKgHC
 8T7CvZ3siJpvaw1VkA9fqbjVSW5pMMp03K2VOVLo344lOlhMt+OwM3PKI5+zMDyQj14Z
 bIf0x2ixTqcKpb+zjZPuNYb3mhvU/fYE8w0QWQ2XvytuC4yuU0KeDHHKz6nsOBLyWQiY
 xIvGAS3BHP9rpF6YcHRcpDs3TuLpEYX8sQN4TzTLBWQ8xqTvLYevBPB9zqAYKqgDCbWm
 uSig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KOPXfJ4o+30xKb8orSC8RLivwhkM6sb3eQ91eOmY0Vo=;
 b=Z7/UVVPFDZnqT1bl7t6mwLqazDYVcwwEBoIInD59oYi8c/DkWgNhxK069XkMGDaWFh
 2ES/bvFXxDuOj8Sp1K4rlLhL1YUH0448FaBHRmi5++p+WKNQSJ+E6or3XOvWoFeyJHEU
 PYAoyIV3Cj7ft+3cmSUs3rrNVUhaLEmUBQ9I2FKnc8QfJXMbBnaMIQRgv1Wid6LkeC2R
 vqD66ZaKpS43EuI13CYV6jWS4BydICmyq28CNLzERSeVuLBVM7ZEj53L5Tx5RbmvMDEt
 Z2tawR/EUNLdvJTzE21Sfh5D513r+HBRwquhalbrYYd/BRxSuUaq2XVWirM962sx8KiV
 ffkg==
X-Gm-Message-State: AOAM530KGir8WL68qgLizTJ13wDmK4ntLfQXD+Y/5l9oTJIZLhYqoHAo
 HwGV5fH2025YcG2MVPZ9C7o=
X-Google-Smtp-Source: ABdhPJxwB25vHPpgRsVbfVcHXlqygPLmZlVsqyZuhSN4fHMZ/F6hTxWL8F5aoBE4JZF8QQlHp/ZDzw==
X-Received: by 2002:a37:b347:: with SMTP id c68mr8956861qkf.430.1599758327484; 
 Thu, 10 Sep 2020 10:18:47 -0700 (PDT)
Received: from localhost.localdomain ([2604:1380:45d1:2600::1])
 by smtp.gmail.com with ESMTPSA id a25sm7370452qtd.8.2020.09.10.10.18.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 10:18:46 -0700 (PDT)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Eric Anholt <eric@anholt.net>,
	Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH] drm/vc4: Fix bitwise OR versus ternary operator in
 vc4_plane_mode_set
Date: Thu, 10 Sep 2020 10:18:32 -0700
Message-Id: <20200910171831.4112580-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-Mailman-Approved-At: Fri, 11 Sep 2020 09:49:36 +0000
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
Cc: clang-built-linux@googlegroups.com,
 Nathan Chancellor <natechancellor@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Clang warns:

drivers/gpu/drm/vc4/vc4_plane.c:901:27: warning: operator '?:' has lower
precedence than '|'; '|' will be evaluated first
[-Wbitwise-conditional-parentheses]
                                fb->format->has_alpha ?
                                ~~~~~~~~~~~~~~~~~~~~~ ^
drivers/gpu/drm/vc4/vc4_plane.c:901:27: note: place parentheses around
the '|' expression to silence this warning
                                fb->format->has_alpha ?
                                ~~~~~~~~~~~~~~~~~~~~~ ^
drivers/gpu/drm/vc4/vc4_plane.c:901:27: note: place parentheses around
the '?:' expression to evaluate it first
                                fb->format->has_alpha ?
                                ~~~~~~~~~~~~~~~~~~~~~~^
1 warning generated.

Add the parentheses as that was clearly intended, otherwise
SCALER5_CTL2_ALPHA_PREMULT won't be added to the list.

Fixes: c54619b0bfb3 ("drm/vc4: Add support for the BCM2711 HVS5")
Link: https://github.com/ClangBuiltLinux/linux/issues/1150
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 drivers/gpu/drm/vc4/vc4_plane.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index 24d7e6db6fdd..89543fa8ca4d 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -898,8 +898,8 @@ static int vc4_plane_mode_set(struct drm_plane *plane,
 		vc4_dlist_write(vc4_state,
 				VC4_SET_FIELD(state->alpha >> 4,
 					      SCALER5_CTL2_ALPHA) |
-				fb->format->has_alpha ?
-					SCALER5_CTL2_ALPHA_PREMULT : 0 |
+				(fb->format->has_alpha ?
+					SCALER5_CTL2_ALPHA_PREMULT : 0) |
 				(mix_plane_alpha ?
 					SCALER5_CTL2_ALPHA_MIX : 0) |
 				VC4_SET_FIELD(fb->format->has_alpha ?

base-commit: 8c3c818c23a5bbce6ff180dd2ee04415241df77c
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
