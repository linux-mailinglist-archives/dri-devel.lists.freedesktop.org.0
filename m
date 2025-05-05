Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E32EAAA1E6
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:52:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8C7C10E57B;
	Mon,  5 May 2025 22:52:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Dq8U1lWv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C6B110E578;
 Mon,  5 May 2025 22:52:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D2BB9A4D17A;
 Mon,  5 May 2025 22:47:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 752F8C4CEEE;
 Mon,  5 May 2025 22:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746485566;
 bh=GXJ3ln4fmVC95xJ/nz54IuqackY6monmNUpFwtpRZj8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Dq8U1lWvOFy14kdkdo2KD20qigjg5pnSkaOZUszkfO7qMkvkW7cTmxlLVzISEO1/e
 2O+gUhPwYX//u3aT9osnXzF8HhqRJcTQBmHFuYwoYvXIi8etj/iTMU/7kKmsax3JQS
 NVSBEJhepHdQoXJMODBw2KuvHGA27ePHXa+clujhtoumbf9DcfQZCDz6vRIa8nXzwY
 y8Qo58wAhiDkBwddSk9eVjhmNsIgpmCjIbe4AO9nvHIb4/R/QSqpz+0XCFkMo1/sU4
 QF7tfsLx9bWjMwI9oCkRMYRqzTzMmJo+qHfIu4dQ4UsolT9FReRgBuLIqX0c+jbzM4
 /CuOegx0JNiTw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Tom Chung <chiahsuan.chung@amd.com>, Roman Li <roman.li@amd.com>,
 Zaeem Mohamed <zaeem.mohamed@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch, siqueira@igalia.com, alex.hung@amd.com,
 alvin.lee2@amd.com, aurabindo.pillai@amd.com, Austin.Zheng@amd.com,
 Ilya.Bakoulin@amd.com, mario.limonciello@amd.com, Wayne.Lin@amd.com,
 Josip.Pavic@amd.com, dillon.varone@amd.com, wenjing.liu@amd.com,
 linux@treblig.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.12 370/486] drm/amd/display: Initial psr_version
 with correct setting
Date: Mon,  5 May 2025 18:37:26 -0400
Message-Id: <20250505223922.2682012-370-sashal@kernel.org>
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

From: Tom Chung <chiahsuan.chung@amd.com>

[ Upstream commit d8c782cac5007e68e7484d420168f12d3490def6 ]

[Why & How]
The initial setting for psr_version is not correct while
create a virtual link.

The default psr_version should be DC_PSR_VERSION_UNSUPPORTED.

Reviewed-by: Roman Li <roman.li@amd.com>
Signed-off-by: Tom Chung <chiahsuan.chung@amd.com>
Signed-off-by: Zaeem Mohamed <zaeem.mohamed@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index 762bf04efe7ed..ff189177244bb 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -276,6 +276,7 @@ static bool create_links(
 		link->link_id.type = OBJECT_TYPE_CONNECTOR;
 		link->link_id.id = CONNECTOR_ID_VIRTUAL;
 		link->link_id.enum_id = ENUM_ID_1;
+		link->psr_settings.psr_version = DC_PSR_VERSION_UNSUPPORTED;
 		link->link_enc = kzalloc(sizeof(*link->link_enc), GFP_KERNEL);
 
 		if (!link->link_enc) {
-- 
2.39.5

