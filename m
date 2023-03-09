Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B90D6B1DDF
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 09:24:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B87910E17E;
	Thu,  9 Mar 2023 08:24:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5073610E17E
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 08:24:26 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id s22so1242506lfi.9
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 00:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678350264;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QzEKFG/aktpDJ9N/nYMNYqb4XM+dS4l7JrgzOb9ZeCI=;
 b=gdbqYPy0VDDgMYHC9gt5Hmwd2pB0j4shL/PDoUP1Of5ZOG0m93gyd+bTsAw6lt/J1W
 jMycGzL6N2zngqxBohlWeT0+xloz+sxo918YzUn8Lvrz6nR0+uJOYMOAbkP1Wa7JTLsJ
 Ee7ZpmV0Hian3Rwm9bOw7UBagZHP25Dz3ureTC6kDm2BLh1/JkD83nHyYDM3i+E9rzFg
 qykplrbt82Q1KqSLPHf2+iGEC9T6wTWDKeUWcIcfCC9ub+1RNwnLqEy1KQvV3U74LSJ/
 tvIwZr1THXGiPKlV9pRSNFRjFSsJra37z4rvS0RUxX4A5AfHLdgqkatdtcagwrTtJ3xM
 6GSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678350264;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QzEKFG/aktpDJ9N/nYMNYqb4XM+dS4l7JrgzOb9ZeCI=;
 b=5LoahGfDl7FLmjv7jTkl2Ce7KLbN/6uthVfK1VZF4L60E7CpM2u79MzerZ5j+dg77C
 1D9NQWAkuEvzBnMWPV18sk/LkVDjRkYw0VWZ+dGn8eiuxQgQUOlFvXsIw/vLroxDWBrN
 OyuO/c1qwd8dX1ev9WSRupGHwo2hLOdRGOrAfpPA/y5InV0+28QVXSpooffNu6iHCN5l
 B28YDWUs3F3FwZmqjvLGHsG0IbU3d3ShK2bh8zwPQ5y2cG50X+ePuw657r7QO5f8qyup
 PNDauvwMGrkQ/hhZeC34XfXsGCL3IHZ3SJ8yfl5LAppQpR+np3CdyM69QaOKS0WkDoWB
 Eu0g==
X-Gm-Message-State: AO0yUKVTH47VEVlhWxhDrBfQehIUW7Q9m8HJCYLRhcoiXAQvVAInvGJf
 Bm4x8xjfUD4eOAwaQmGahI521DSL1T8tSPN4I+A=
X-Google-Smtp-Source: AK7set/h9zf2W+rGgcIN/k5zjr0nU0CYmzkwtFJXAfZXQQ7VXD2xUYvPgmrH4542xF/RjbElh4eckA==
X-Received: by 2002:a19:c216:0:b0:4b4:8f01:f8b1 with SMTP id
 l22-20020a19c216000000b004b48f01f8b1mr5498065lfc.31.1678350264247; 
 Thu, 09 Mar 2023 00:24:24 -0800 (PST)
Received: from Fecusia.lan (c-05d8225c.014-348-6c756e10.bbcust.telenor.se.
 [92.34.216.5]) by smtp.gmail.com with ESMTPSA id
 u17-20020ac25191000000b004db3aa3c542sm2565489lfi.47.2023.03.09.00.24.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 00:24:23 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Subject: [PATCH] drm/mcde: Do not use dirty GEM FB handling
Date: Thu,  9 Mar 2023 09:24:21 +0100
Message-Id: <20230309082421.439813-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.39.1
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This driver has no way to handle damage, the reason the
drm_gem_fb_create_with_dirty() was used was because I had the
ambition that the driver would only send out updates to DSI
command displays whenever something changed, so as to
minimize traffic.

It turns out this ambition with command mode isn't working
in practice because all the MCDE does is to create a
continuous stream of DSI commands and while it is possible to
send single frame updates with it, it's not been worthwhile.
So we are just setting up continuous updates.

Reported-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Thomas you can pick this as a prerequisite into your series
or just ACK it and I will merge it into drm-misc-next so you
can base your work on it.
---
 drivers/gpu/drm/mcde/mcde_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mcde/mcde_drv.c b/drivers/gpu/drm/mcde/mcde_drv.c
index 4aedb050d2a5..a592ad0d7886 100644
--- a/drivers/gpu/drm/mcde/mcde_drv.c
+++ b/drivers/gpu/drm/mcde/mcde_drv.c
@@ -94,7 +94,7 @@
 #define MCDE_PID_MAJOR_VERSION_MASK 0xFF000000
 
 static const struct drm_mode_config_funcs mcde_mode_config_funcs = {
-	.fb_create = drm_gem_fb_create_with_dirty,
+	.fb_create = drm_gem_fb_create,
 	.atomic_check = drm_atomic_helper_check,
 	.atomic_commit = drm_atomic_helper_commit,
 };
-- 
2.39.1

