Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0D67E3DD2
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 13:31:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73FDA10E5C6;
	Tue,  7 Nov 2023 12:31:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88E1910E5C6;
 Tue,  7 Nov 2023 12:31:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 4C892B8165B;
 Tue,  7 Nov 2023 12:31:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78336C433CA;
 Tue,  7 Nov 2023 12:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699360275;
 bh=wvaUSrY3S8godRYePLky/TPd8j7ygIKj7p7gRhB3l/g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=J0/jS0j7YipI/a5ZdrKJ1CBL4TUprq0XS2Q2kWVTLVjuWMu85ncB10turL4Zelgr0
 MuNqCVIvFic7IKN29bQTXG5LK/QTqZt2+IzXY0UrAaceN0CuuHv5dRrS18cm+rS2zn
 bq3KAYueJpFppmlhRAWpr2DwT715cl/uJPmhqxx4G9vGn34w6xR/yrbkYEoF9imbsK
 yhb2ZX/hTdjA4XDbT+f9/TYvEMYNtQxEM0TwaYTErHjzLRQR41bvzeYVSjd23I59vS
 HYU/r8IjeCKC4Ws03buKaLYVIY/m6ZJQtFBJELYryrsdEw9j36CWUqBqmJhFS1RZkr
 5wbdAtE2A5BOw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 04/11] drm/radeon: Fix UBSAN
 array-index-out-of-bounds for Radeon HD 5430
Date: Tue,  7 Nov 2023 07:30:37 -0500
Message-ID: <20231107123100.3762796-4-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107123100.3762796-1-sashal@kernel.org>
References: <20231107123100.3762796-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.199
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
Cc: Felix Held <felix.held@amd.com>, Sasha Levin <sashal@kernel.org>,
 dri-devel@lists.freedesktop.org, Xinhui.Pan@amd.com,
 amd-gfx@lists.freedesktop.org, Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mario Limonciello <mario.limonciello@amd.com>

[ Upstream commit c63079c61177ba1b17fa05c6875699a36924fe39 ]

For pptable structs that use flexible array sizes, use flexible arrays.

Suggested-by: Felix Held <felix.held@amd.com>
Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2894
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/radeon/pptable.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/pptable.h b/drivers/gpu/drm/radeon/pptable.h
index 4c2eec49dadc9..94947229888ba 100644
--- a/drivers/gpu/drm/radeon/pptable.h
+++ b/drivers/gpu/drm/radeon/pptable.h
@@ -74,7 +74,7 @@ typedef struct _ATOM_PPLIB_THERMALCONTROLLER
 typedef struct _ATOM_PPLIB_STATE
 {
     UCHAR ucNonClockStateIndex;
-    UCHAR ucClockStateIndices[1]; // variable-sized
+    UCHAR ucClockStateIndices[]; // variable-sized
 } ATOM_PPLIB_STATE;
 
 
-- 
2.42.0

