Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7D83B182E
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 12:37:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62A286E8A5;
	Wed, 23 Jun 2021 10:37:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 418 seconds by postgrey-1.36 at gabe;
 Wed, 23 Jun 2021 10:37:42 UTC
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63D1C6E8A5;
 Wed, 23 Jun 2021 10:37:42 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 2164321916;
 Wed, 23 Jun 2021 10:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624444243; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=HCvoFUMGXgLIQO/hA7VYGyu+LChmbtQQAc+dzSw213M=;
 b=aZoZXMPpCOMVC2ogAFPWHm6UfM6wGyZMFuT8VTa0soMFVprOblOQfw5Fy0uuHHJTv3a27t
 Xo7d1yqAmdhaBHYUt4uIQZzQkR3Lo/5LUEiCkb3hs0gY8honH9x0vhZ52Z9fMz6YGDAAer
 9voXwrWqrlxNul/JB4kI1tia5H4ZxkQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624444243;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=HCvoFUMGXgLIQO/hA7VYGyu+LChmbtQQAc+dzSw213M=;
 b=fg1HPCSLsGLz/2D0dvo4QcmAWQiO/Ti2wKSk4zx1tioKnEA/DZu70ZP0Mc/EfCzvo9vPN/
 NSXGeQse+fnwvxBQ==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
 by relay2.suse.de (Postfix) with ESMTP id D3A5BA3B81;
 Wed, 23 Jun 2021 10:30:42 +0000 (UTC)
From: Michal Suchanek <msuchanek@suse.de>
To: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH] drm/amdgpu/dc: Really fix DCN3.1 Makefile for PPC64
Date: Wed, 23 Jun 2021 12:30:39 +0200
Message-Id: <20210623103039.9881-1-msuchanek@suse.de>
X-Mailer: git-send-email 2.26.2
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
Cc: Arnd Bergmann <arnd@arndb.de>, Leo Li <sunpeng.li@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Will Deacon <will@kernel.org>, Huang Rui <ray.huang@amd.com>,
 dri-devel@lists.freedesktop.org, Michal Suchanek <msuchanek@suse.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Also copy over the part that makes old gcc handling cross-platform.

Fixes: df7a1658f257 ("drm/amdgpu/dc: fix DCN3.1 Makefile for PPC64")
Fixes: 926d6972efb6 ("drm/amd/display: Add DCN3.1 blocks to the DC Makefile")
Signed-off-by: Michal Suchanek <msuchanek@suse.de>
---
The fact that the old gcc handling triggers on gcc 10 and 11 is another
story I don't want to delve into.
---
 drivers/gpu/drm/amd/display/dc/dcn31/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/Makefile b/drivers/gpu/drm/amd/display/dc/dcn31/Makefile
index 5dcdc5a858fe..4bab97acb155 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn31/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/Makefile
@@ -28,6 +28,7 @@ endif
 CFLAGS_$(AMDDALPATH)/dc/dcn31/dcn31_resource.o += -mhard-float
 endif
 
+ifdef CONFIG_X86
 ifdef IS_OLD_GCC
 # Stack alignment mismatch, proceed with caution.
 # GCC < 7.1 cannot compile code using `double` and -mpreferred-stack-boundary=3
@@ -36,6 +37,7 @@ CFLAGS_$(AMDDALPATH)/dc/dcn31/dcn31_resource.o += -mpreferred-stack-boundary=4
 else
 CFLAGS_$(AMDDALPATH)/dc/dcn31/dcn31_resource.o += -msse2
 endif
+endif
 
 AMD_DAL_DCN31 = $(addprefix $(AMDDALPATH)/dc/dcn31/,$(DCN31))
 
-- 
2.26.2

