Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33063805F2E
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 21:13:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2E2C10E542;
	Tue,  5 Dec 2023 20:13:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5C2A10E542
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 20:13:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2E58661934;
 Tue,  5 Dec 2023 20:13:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50268C433CB;
 Tue,  5 Dec 2023 20:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701807224;
 bh=sjzE8QZ8uXSlrXNRxh0UBUKR87kmK2KHZp2G4Sxqhrs=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Gk97RPpIZ8GZ9TGjd2N5pqzscHAF0ogln/+b3jPehBDG29/0nLH776NEkNBgWoAmO
 tIwksCtSc8w6g6zPLQ1rKFjfq4PFtMBqCXUfkCYTjfWFncR5RFE16XqhM2utRpAR9a
 8SNcMWweKweAPG9n9BRD+iBsTaVzOn+PvnzcRB+h83Q//P8fl9dDKR3GAtF4edaQjJ
 sCGv1uPoL7IesyASP3lG5rI958Bt+SiiVq6QeYw6aRY4ooEBeYUNrykl8FkY9zt73u
 bmFyPgHf9sh6vsdP7GkR3dUcPQGJsOSFqT/qq/CCvmOmUL5D4smRrMgJaPei0FraSH
 71DETylH3Peww==
From: Nathan Chancellor <nathan@kernel.org>
Date: Tue, 05 Dec 2023 13:13:34 -0700
Subject: [PATCH 1/3] usb: typec: nb7vpq904m: Only select DRM_AUX_BRIDGE with OF
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231205-drm_aux_bridge-fixes-v1-1-d242a0ae9df4@kernel.org>
References: <20231205-drm_aux_bridge-fixes-v1-0-d242a0ae9df4@kernel.org>
In-Reply-To: <20231205-drm_aux_bridge-fixes-v1-0-d242a0ae9df4@kernel.org>
To: dmitry.baryshkov@linaro.org
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1345; i=nathan@kernel.org;
 h=from:subject:message-id; bh=sjzE8QZ8uXSlrXNRxh0UBUKR87kmK2KHZp2G4Sxqhrs=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDKn5LeV7nCdxCa7boyh86aeRbD3TLZ2QnKfKe6sW9k+em
 JRqcqy1o5SFQYyLQVZMkaX6sepxQ8M5ZxlvnJoEM4eVCWQIAxenAEzEcRHD/0wZN4PYy1f9nY4k
 6DhnWgkGMf1j/fqsevePvXov3/kd+cHI8Nz7zxddA/Yp59UVdCbGfsk55/Mn5fNqffX7NnuZPtu
 e5QAA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
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
Cc: neil.armstrong@linaro.org, heikki.krogerus@linux.intel.com,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, patches@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 bryan.odonoghue@linaro.org, linux@roeck-us.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CONFIG_DRM_AUX_BRIDGE depends on CONFIG_OF but that dependency is not
included when CONFIG_TYPEC_MUX_NB7VPQ904M selects it, resulting in a
Kconfig warning when CONFIG_OF is disabled:

  WARNING: unmet direct dependencies detected for DRM_AUX_BRIDGE
    Depends on [n]: HAS_IOMEM [=y] && DRM_BRIDGE [=y] && OF [=n]
    Selected by [y]:
    - TYPEC_MUX_NB7VPQ904M [=y] && USB_SUPPORT [=y] && TYPEC [=y] && I2C [=y] && (DRM [=y] || DRM [=y]=n) && DRM_BRIDGE [=y]

Only select CONFIG_DRM_AUX_BRIDGE with both CONFIG_DRM_BRIDGE and
CONFIG_OF to clear up the warning.

Fixes: c5d296bad640 ("usb: typec: nb7vpq904m: switch to DRM_AUX_BRIDGE")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/usb/typec/mux/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/mux/Kconfig b/drivers/usb/typec/mux/Kconfig
index 5120942f309d..38416fb0cc3c 100644
--- a/drivers/usb/typec/mux/Kconfig
+++ b/drivers/usb/typec/mux/Kconfig
@@ -40,7 +40,7 @@ config TYPEC_MUX_NB7VPQ904M
 	tristate "On Semiconductor NB7VPQ904M Type-C redriver driver"
 	depends on I2C
 	depends on DRM || DRM=n
-	select DRM_AUX_BRIDGE if DRM_BRIDGE
+	select DRM_AUX_BRIDGE if DRM_BRIDGE && OF
 	select REGMAP_I2C
 	help
 	  Say Y or M if your system has a On Semiconductor NB7VPQ904M Type-C

-- 
2.43.0

