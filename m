Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 896ED99B36E
	for <lists+dri-devel@lfdr.de>; Sat, 12 Oct 2024 13:26:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7B0610E12B;
	Sat, 12 Oct 2024 11:26:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="glycJtuR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76FAD10E12B;
 Sat, 12 Oct 2024 11:26:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D3CFCA40580;
 Sat, 12 Oct 2024 11:26:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E13AC4CECE;
 Sat, 12 Oct 2024 11:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728732408;
 bh=atjmffrzZgLCNMCiFzOqBVE3wLBEiqWkaoBHeOfXNHU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=glycJtuRKya+u46WceaOwk5jKyZaicIPmpEVLAzSYmBZvxIJeDSshzrqrAtBGyL8B
 T9zKG/7KgeppoX9VI28D9Zy2D9SpAHSfZTniy0hncWsWjjE21TfQXCAdzvGe77/sTM
 TdUudb/WhLOKmhLLmsyQhoWH0DSiBsBlE+s+SbC8MISKcUF/NoI9Nwk9U5HTKL230B
 DG7z+8oJIRC01lw44uf1SaQW3APkn+BI6N52VEPX8NLC8oCVqCf51l/sKwaZR1l/D6
 CibjOGol89HUXLX8eD/JM+E64e3hWmavPMtae0OhXtU3e9J8wxOhXeMYFWyr1AkRsc
 YFL6Lpon794yw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Sasha Levin <sashal@kernel.org>, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.11 14/16] drm/xe/mcr: Use Xe2_LPM steering tables
 for Xe2_HPM
Date: Sat, 12 Oct 2024 07:26:10 -0400
Message-ID: <20241012112619.1762860-14-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241012112619.1762860-1-sashal@kernel.org>
References: <20241012112619.1762860-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11.3
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

From: Gustavo Sousa <gustavo.sousa@intel.com>

[ Upstream commit 7929ffce0f8b9c76cb5c2a67d1966beaed20ab61 ]

According to Bspec, Xe2 steering tables must be used for Xe2_HPM, just
as it is with Xe2_LPM. Update our driver to reflect that.

Bspec: 71186
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20240920211459.255181-2-gustavo.sousa@intel.com
(cherry picked from commit 21ae035ae5c33ef176f4062bd9d4aa973dde240b)
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/xe/xe_gt_mcr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index 6d948a4691264..d57a765a1a969 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -407,7 +407,7 @@ void xe_gt_mcr_init(struct xe_gt *gt)
 	if (gt->info.type == XE_GT_TYPE_MEDIA) {
 		drm_WARN_ON(&xe->drm, MEDIA_VER(xe) < 13);
 
-		if (MEDIA_VER(xe) >= 20) {
+		if (MEDIA_VERx100(xe) >= 1301) {
 			gt->steering[OADDRM].ranges = xe2lpm_gpmxmt_steering_table;
 			gt->steering[INSTANCE0].ranges = xe2lpm_instance0_steering_table;
 		} else {
-- 
2.43.0

