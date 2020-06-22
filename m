Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0899E204B99
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jun 2020 09:49:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 786D76E959;
	Tue, 23 Jun 2020 07:48:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
 [209.85.208.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E82136E918
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 20:45:54 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id n23so20888439ljh.7
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 13:45:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vLDSApuJ0v81hqVWKGC7U58iC5Y/D0ks2PXVy/bBVsQ=;
 b=SXExCqIrWJkwjJ3VqRMJBWugEwSoRjMW14HKc+5FDK4dplQ6Ma4HwsT32lHBA2Fueq
 DcXD+NrjDVbBcttfhB75BYMfRY6M9tLheaIQ1/xEEWusHNMl8wt3DJNvpnPu/enW3NDB
 eksBUvH/V6p+Qu0u70v0wTpvVCH13GOfzdDUlxog7m8TS5qZSDOi4iuk7eaoG+4z0IcE
 bkwVUGbSxCBXn8LPALnCjYk1QD8drWW+DH7+ezxlUiL/4m+U3akW+TZggTsUhpzX3/+X
 HG3/i/9bmiwSEG7bKFu2KpnBERhCP0GzIT0n7m4PTXmkyO3iQNQ7begYm8ILNEPskSO2
 1k1Q==
X-Gm-Message-State: AOAM532ZE9lyLzb+ND51izb2w19ktYbFLJjV4wFXJItJWeUHH3M6GDEY
 Vgi002QrbXzeLA+jX/IhR7E=
X-Google-Smtp-Source: ABdhPJwzB6UHwxJ1YrbwAUcm9GmVOZcbiVSJ0aSHpBEom2b+5l+RnXEAmCW0zZ8jMyLXZ9LGfBSzcA==
X-Received: by 2002:a2e:96cd:: with SMTP id d13mr9076836ljj.251.1592858753330; 
 Mon, 22 Jun 2020 13:45:53 -0700 (PDT)
Received: from localhost.localdomain (broadband-37-110-38-130.ip.moscow.rt.ru.
 [37.110.38.130])
 by smtp.googlemail.com with ESMTPSA id j18sm3691359lfj.68.2020.06.22.13.45.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2020 13:45:52 -0700 (PDT)
From: Denis Efremov <efremov@linux.com>
To: Alan Cox <alan@linux.intel.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/gma500: Fix direction check in psb_accel_2d_copy()
Date: Mon, 22 Jun 2020 23:45:37 +0300
Message-Id: <20200622204537.26792-1-efremov@linux.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 23 Jun 2020 07:48:47 +0000
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
Cc: stable@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Denis Efremov <efremov@linux.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

psb_accel_2d_copy() checks direction PSB_2D_COPYORDER_BR2TL twice.
Based on psb_accel_2d_copy_direction() results, PSB_2D_COPYORDER_TL2BR
should be checked instead in the second direction check.

Fixes: 4d8d096e9ae8 ("gma500: introduce the framebuffer support code")
Cc: stable@vger.kernel.org
Signed-off-by: Denis Efremov <efremov@linux.com>
---
 drivers/gpu/drm/gma500/accel_2d.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/gma500/accel_2d.c b/drivers/gpu/drm/gma500/accel_2d.c
index adc0507545bf..8dc86aac54d2 100644
--- a/drivers/gpu/drm/gma500/accel_2d.c
+++ b/drivers/gpu/drm/gma500/accel_2d.c
@@ -179,8 +179,8 @@ static int psb_accel_2d_copy(struct drm_psb_private *dev_priv,
 		src_x += size_x - 1;
 		dst_x += size_x - 1;
 	}
-	if (direction == PSB_2D_COPYORDER_BR2TL ||
-	    direction == PSB_2D_COPYORDER_BL2TR) {
+	if (direction == PSB_2D_COPYORDER_BL2TR ||
+	    direction == PSB_2D_COPYORDER_TL2BR) {
 		src_y += size_y - 1;
 		dst_y += size_y - 1;
 	}
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
