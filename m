Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E09B8AAA230
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:56:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4945910E596;
	Mon,  5 May 2025 22:56:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="j5WUiQf/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A06310E595;
 Mon,  5 May 2025 22:56:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A5AFC629CD;
 Mon,  5 May 2025 22:55:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FA99C4CEF2;
 Mon,  5 May 2025 22:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746485776;
 bh=L3J2k0XYHN23Rq/RpMF8JSWvtYRT5nuLPd31jZByzMw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=j5WUiQf/1jk4Bd3uppcrHK7yYpPz27ZtHkP9Fmznbo6D8ZDog4m5oCToT3V3kGs00
 YHGfuWyPq3Bpl+m52+rkJVdMy3VEaUVxfkcwUpcV8fx8X90IwyzP2bQjKzKszcDvzJ
 4WK6Hx2yBFRv2E2Pq/dCwQzImw16pmFJCCWPKjxmJ0YrtCpNrv+7zgleZeyeBG3YF6
 eGNJbtlGHfnvsY1XFyrvbv3OXSANfvX8yUOoIsP0eGJ9h2DwgSSn1RgswLV7mahFp8
 3iMPN+mMIX8c/7qFqVqQPvIIeKyl6AOkmoaVxy3uF9c0UYPX0GPJfIOe7A+CP1V4nr
 RGhgyX+dyA8AQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Maarten Lankhorst <dev@lankhorst.se>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Sasha Levin <sashal@kernel.org>, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@gmail.com, simona@ffwll.ch,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.12 478/486] drm/xe: Do not attempt to bootstrap VF
 in execlists mode
Date: Mon,  5 May 2025 18:39:14 -0400
Message-Id: <20250505223922.2682012-478-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
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

From: Maarten Lankhorst <dev@lankhorst.se>

[ Upstream commit f3b59457808f61d88178b0afa67cbd017d7ce79e ]

It was mentioned in a review that there is a possibility of choosing
to load the module with VF in execlists mode.

Of course this doesn't work, just bomb out as hard as possible.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20241210083111.230484-12-dev@lankhorst.se
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 7ddbfeaf494ac..29badbd829ab6 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -235,6 +235,9 @@ int xe_gt_sriov_vf_bootstrap(struct xe_gt *gt)
 {
 	int err;
 
+	if (!xe_device_uc_enabled(gt_to_xe(gt)))
+		return -ENODEV;
+
 	err = vf_reset_guc_state(gt);
 	if (unlikely(err))
 		return err;
-- 
2.39.5

