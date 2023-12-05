Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE09E805F30
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 21:13:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADBB710E55F;
	Tue,  5 Dec 2023 20:13:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F53E10E567
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 20:13:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id C09E7B81C95;
 Tue,  5 Dec 2023 20:13:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81F7AC433C7;
 Tue,  5 Dec 2023 20:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701807224;
 bh=UvvCP2cr3Sol/CXMJFp/czhZ/k3NKffJrLgAuSfn1xA=;
 h=From:Subject:Date:To:Cc:From;
 b=coBmld9N/VoJIhT5CBN39p88BfHbQoOq2L0k1QKXGUWcqwUDmNx7FibgZ7EgkzVwR
 8shoY0C4GN3n/bczW3LirTDjuIII/5Z3LjZZ1zfPJT9As3HYeFjfuIe88p3T/aYJ6f
 gZKXyorwKOg8ashEsK/LuzcCAOo2yAYTP9tQekdPBf5TXR4uVB9asXi6ZQaufPVaxX
 2zgVny5kWpxtaVU/cjbrh/3ML2Cj9/ZpUfbuPNjtu05uEvK4aM9FCVHITiv15QYAuk
 EuahNLLCP3xvHfo+IHc3EjYjPLEq8CvAqVSr0cmHaugJBL/sGUOelzVPwSiXD10RB6
 mgotKmv1YBcOg==
From: Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH 0/3] A few fixes for transparent bridge support
Date: Tue, 05 Dec 2023 13:13:33 -0700
Message-Id: <20231205-drm_aux_bridge-fixes-v1-0-d242a0ae9df4@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG2Eb2UC/x3LSQqAMAxA0atI1hbaOlS8iohUGzULB1KUgnh3g
 8vP4z8QkQkjtNkDjDdFOnYJk2cwrX5fUFGQBqttYayuVOBt8FcaRqYgOlPCqExtXaMxOF16kPV
 k/EHOrn/fD7V4nZhmAAAA
To: dmitry.baryshkov@linaro.org
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=829; i=nathan@kernel.org;
 h=from:subject:message-id; bh=UvvCP2cr3Sol/CXMJFp/czhZ/k3NKffJrLgAuSfn1xA=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDKn5LWVcDm2P989pn/7u+ftPnCrlVz1uMsv63O4xmCtYY
 DX/xPHNHaUsDGJcDLJiiizVj1WPGxrOOct449QkmDmsTCBDGLg4BWAi0Y8YGSb03zS/MHHtWk3L
 J/9FRTvV3CZW5i/bcyfwhZ2xsF5suwrDP7Uva/fu5FH+/mBJhUC/z/eJIb9/bdESK3rbwM999TD
 Pa1YA
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
 kernel test robot <lkp@intel.com>, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, patches@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 bryan.odonoghue@linaro.org, linux@roeck-us.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

This series fixes two Kconfig issues that I noticed with the selection
of CONFIG_DRM_AUX{,_HPD}_BRIDGE along with a fix for a sparse report
that I noticed while seeing if these had already been resolved.

---
Nathan Chancellor (3):
      usb: typec: nb7vpq904m: Only select DRM_AUX_BRIDGE with OF
      usb: typec: qcom-pmic-typec: Only select DRM_AUX_HPD_BRIDGE with OF
      drm/bridge: Return NULL instead of plain 0 in drm_dp_hpd_bridge_register() stub

 drivers/usb/typec/mux/Kconfig   | 2 +-
 drivers/usb/typec/tcpm/Kconfig  | 2 +-
 include/drm/bridge/aux-bridge.h | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
---
base-commit: 4900e0396e59be233cfa636369d4eec6b40dbeca
change-id: 20231205-drm_aux_bridge-fixes-162780ed704a

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>

