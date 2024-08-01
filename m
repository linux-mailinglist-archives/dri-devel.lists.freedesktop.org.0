Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8751943A72
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 02:15:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC85F10E741;
	Thu,  1 Aug 2024 00:15:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="M5H6PFjA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23D0810E742;
 Thu,  1 Aug 2024 00:15:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9586F6173C;
 Thu,  1 Aug 2024 00:15:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A26D5C116B1;
 Thu,  1 Aug 2024 00:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722471312;
 bh=4jGE/HMHzC1CdEpHNS0Zke1c5VcLzul6vO3XVwoF4Lo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=M5H6PFjAacbTEc3ZFhuA78Rhp5eFmWjoWJxUs20y0Xvet6sel+vna2G50iszrEGCd
 G90RkkD3SguVQsXNa4Exmm6wcMQ4CKQkBUtePs5KPE38egPG+53vSWTelY0/yah1hL
 OcrGn+Yyp+T+uZ35wzFgj7/BUbx4ZCBp6UcazTIPDHFW64Sq4xVml7wPIStPYAvHHj
 DrjlHkKuEXTOTKYxuSQ0K7xvSe2DCeKo6zJ2/mDr3exOxicsq/bXGBi5jmZLmOJhBj
 PV/4rjYsceSF2QryHOyhRI+r3VrC7wLYmjxLsJWuM2aAJDpLx4jqSd7tNCAimVo7Z1
 t1ZLn2eeo49Pw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>, Sasha Levin <sashal@kernel.org>,
 thomas.hellstrom@linux.intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.10 067/121] drm/xe: Check valid domain is passed in
 xe_force_wake_ref
Date: Wed, 31 Jul 2024 20:00:05 -0400
Message-ID: <20240801000834.3930818-67-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801000834.3930818-1-sashal@kernel.org>
References: <20240801000834.3930818-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.2
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

From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

[ Upstream commit 35feb8dbbca627d118ccc1f2111841788c142703 ]

Assert domain is not XE_FORCEWAKE_ALL.

v2
- use domain != XE_FORCEWAKE_ALL (Michal)

v3
- Fix commit description.

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20240607125741.1407331-2-himal.prasad.ghimiray@intel.com
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/xe/xe_force_wake.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
index 83cb157da7cc6..23b36d13f18a6 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.h
+++ b/drivers/gpu/drm/xe/xe_force_wake.h
@@ -24,7 +24,7 @@ static inline int
 xe_force_wake_ref(struct xe_force_wake *fw,
 		  enum xe_force_wake_domains domain)
 {
-	xe_gt_assert(fw->gt, domain);
+	xe_gt_assert(fw->gt, domain != XE_FORCEWAKE_ALL);
 	return fw->domains[ffs(domain) - 1].ref;
 }
 
-- 
2.43.0

