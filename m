Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 764FD62209F
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 01:16:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 950D310E546;
	Wed,  9 Nov 2022 00:16:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5E7C10E546
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Nov 2022 00:16:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 82BA0B81CAE;
 Wed,  9 Nov 2022 00:16:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CF77C433D6;
 Wed,  9 Nov 2022 00:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667953000;
 bh=k6rIgcDbcoDJIq3EZLWAhM+cWpUtGnxgL4bipmDPg84=;
 h=From:To:Cc:Subject:Date:From;
 b=nBRaKyid9YJHdSRpVRPiKJB1X2djFFHf1FwKmGhDdtx3oyOSmXoZgtee8iyHzhWJE
 8Zof+FrAtl/JLA1JUbb3GWxdaCcS+RMFTYGIwmASTw54XyRRXpZIxq+HJttXQVKgYq
 ZQeYOB1BTzC/0shjVZMXMAsleg0HxuoxMZDg+txLbP31IPvsTQwFWk9c2uYUXm2U5Y
 Q7YdeW6yis4kROVm7h5gCxiQ90/fdvo/Egmu25OSSCBuPZcP4L1rNDYg5YLUda1plK
 p+ZXy7pQ3vN/th/TXNdSOfZeVWVGjgJ578G01uIIVOBXi71d+JYaLBgAZ1Bt7eeb7X
 AoXhCkL19X2jA==
From: Nathan Chancellor <nathan@kernel.org>
To: Hyun Kwon <hyun.kwon@xilinx.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v2] drm: xlnx: Fix return type of zynqmp_dp_bridge_mode_valid
Date: Tue,  8 Nov 2022 17:14:25 -0700
Message-Id: <20221109001424.1422495-1-nathan@kernel.org>
X-Mailer: git-send-email 2.38.1
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
Cc: Kees Cook <keescook@chromium.org>, Tom Rix <trix@redhat.com>,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 patches@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Nathan Huckleberry <nhuck@google.com>,
 linux-arm-kernel@lists.infradead.org, Dan Carpenter <error27@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Nathan Huckleberry <nhuck@google.com>

The mode_valid field in drm_bridge_helper_funcs is expected to be of
type
enum drm_mode_status (* mode_valid) (struct drm_bridge *bridge,
                                     struct drm_display_mode *mode);

The mismatched return type breaks forward edge kCFI since the underlying
function definition does not match the function hook definition. A new
warning in clang will catch this at compile time:

  drivers/gpu/drm/xlnx/zynqmp_dp.c:1573:16: error: incompatible function pointer types initializing 'enum drm_mode_status (*)(struct drm_bridge *, const struct drm_display_info *, const struct drm_display_mode *)' with an expression of type 'int (struct drm_bridge *, const struct drm_display_info *, const struct drm_display_mode *)' [-Werror,-Wincompatible-function-pointer-types-strict]
          .mode_valid = zynqmp_dp_bridge_mode_valid,
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
  1 error generated.

The return type of zynqmp_dp_bridge_mode_valid should be changed from
int to enum drm_mode_status.

Reported-by: Dan Carpenter <error27@gmail.com>
Link: https://github.com/ClangBuiltLinux/linux/issues/1703
Link: https://github.com/ClangBuiltLinux/linux/issues/1750
Signed-off-by: Nathan Huckleberry <nhuck@google.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
[nathan: Rebase on drm-misc-next and fix conflicts
         Add note about new clang warning]
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---

Please consider picking this up so that it makes 6.2.

v2:
  - Take over for Nathan, as he is busy with other matters.
  - Rebase on drm-misc-next and resolve conflicts.
  - Add a note about new clang warning that will catch this issue at
    compile time.

v1: https://lore.kernel.org/20220913205600.155172-1-nhuck@google.com/

 drivers/gpu/drm/xlnx/zynqmp_dp.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index 7c9ae167eac7..0a7b466446fb 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -1362,9 +1362,10 @@ static void zynqmp_dp_bridge_detach(struct drm_bridge *bridge)
 	zynqmp_dp_aux_cleanup(dp);
 }
 
-static int zynqmp_dp_bridge_mode_valid(struct drm_bridge *bridge,
-				       const struct drm_display_info *info,
-				       const struct drm_display_mode *mode)
+static enum drm_mode_status
+zynqmp_dp_bridge_mode_valid(struct drm_bridge *bridge,
+			    const struct drm_display_info *info,
+			    const struct drm_display_mode *mode)
 {
 	struct zynqmp_dp *dp = bridge_to_dp(bridge);
 	int rate;

base-commit: 1a0257c352638916fdaffaac2ddedb8e049312f3
-- 
2.38.1

