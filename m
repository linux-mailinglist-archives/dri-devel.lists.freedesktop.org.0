Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BF5943B4A
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 02:25:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DA6410E7CC;
	Thu,  1 Aug 2024 00:25:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mjaIZDDs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C410F10E7CB;
 Thu,  1 Aug 2024 00:25:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 01C00CE187E;
 Thu,  1 Aug 2024 00:25:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4173C4AF0E;
 Thu,  1 Aug 2024 00:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722471903;
 bh=GCYeZ+s1AD2VNXhrhF1gjDx7P1Cnb4MLBbCIKetoeSc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mjaIZDDsSP7wmB9+sFA2mJhQXn9hPCDO4DHAEZJq1lk2rO5qUcYd70CHjxErXQFCv
 v8SgbeXxlnNjNPaSt4sPsycKkU3bTeJIpZ8SCUpWo4gSGSdBKfm5suobkPRfTyNOiI
 OhM7DuCIjmgyfD4MnvnTrrNJR//nzM4LHJ7tswuD/rcwdvllKvOhdGia2Bi4K/fqDK
 f+v7Ff3HOyApEDWu3KUYEBFKzsko+LYMHf412hcJNuHKf13RuxgOq0TvigWc0heFGp
 lcaSi+EIrN/d/J1LUvdH07Yo/OvvjSluFYV/yAOl8l+JSd2k5WSYaGnbpoFZPdbf7m
 tAXwU7CZR7TPQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alex Hung <alex.hung@amd.com>, Harry Wentland <harry.wentland@amd.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.6 55/83] drm/amd/display: Skip
 wbscl_set_scaler_filter if filter is null
Date: Wed, 31 Jul 2024 20:18:10 -0400
Message-ID: <20240801002107.3934037-55-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801002107.3934037-1-sashal@kernel.org>
References: <20240801002107.3934037-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.43
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

From: Alex Hung <alex.hung@amd.com>

[ Upstream commit c4d31653c03b90e51515b1380115d1aedad925dd ]

Callers can pass null in filter (i.e. from returned from the function
wbscl_get_filter_coeffs_16p) and a null check is added to ensure that is
not the case.

This fixes 4 NULL_RETURNS issues reported by Coverity.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Acked-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dwb_scl.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dwb_scl.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dwb_scl.c
index 994fb732a7cb7..a0d437f0ce2ba 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dwb_scl.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dwb_scl.c
@@ -690,6 +690,9 @@ static void wbscl_set_scaler_filter(
 	int pair;
 	uint16_t odd_coef, even_coef;
 
+	if (!filter)
+		return;
+
 	for (phase = 0; phase < (NUM_PHASES / 2 + 1); phase++) {
 		for (pair = 0; pair < tap_pairs; pair++) {
 			even_coef = filter[phase * taps + 2 * pair];
-- 
2.43.0

