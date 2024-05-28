Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9268D1A47
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 13:52:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2848510FB44;
	Tue, 28 May 2024 11:52:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AUNRaBey";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91ECE10EA31;
 Tue, 28 May 2024 11:52:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D4A1762022;
 Tue, 28 May 2024 11:52:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F038C32782;
 Tue, 28 May 2024 11:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716897125;
 bh=TcxjokVtWXmJOGhnJW9abbtWL0y6hS0Uwog6v9HcmCo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AUNRaBeyx6rMagKw2XMqLf9UxVbVUCTU2rz+d4rU4OCqWKbmh5yZKOeCTs6WLWIE0
 DZTfDaO43bdToSAa9iTrSUiL8kN6YtVzvgiRhYsxN5MTAEdf/0xSLI3xh6N6sDT9g6
 HGUmkVieB7F5nkqMDWqn5t82+8xOjPQJ1oaexjat73SuPNkBc+4Yh/jZwZ1u3xeDxo
 ZWInPMfjVS6gn1zkEmqaXBrNQLCu2aWuHvqzTHBYQnwRo45PfdxW86GYzN0tNMqvqN
 q77+16Lt9PwE7NVgG0TGTg0/9+IgY6NjTaey2/yGcr2KpcRjlIeXqlz5B+07KCe7PW
 8XiA2fM2c7dmQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Roman Li <roman.li@amd.com>,
 Mounika Adhuri <moadhuri@amd.com>, Martin Leung <martin.leung@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] [RESEND] drm/amd/display: fix graphics_object_id size
Date: Tue, 28 May 2024 13:51:19 +0200
Message-Id: <20240528115146.2870032-2-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240528115146.2870032-1-arnd@kernel.org>
References: <20240528115146.2870032-1-arnd@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

The graphics_object_id structure is meant to fit into 32 bits, as it's
passed by value in and out of functions. A recent change increased
the size to 128 bits, so it's now always passed by reference, which
is clearly not intended and ends up producing a compile-time warning:

drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_factory.c: In function 'construct_phy':
drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_factory.c:743:1: error: the frame size of 1040 bytes is larger than 1024 bytes [-Werror=frame-larger-than=]

Add back the bitfields to revert to the original size, while keeping
the 'enum' type change.

fec85f995a4b ("drm/amd/display: Fix compiler redefinition warnings for certain configs")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
Originally sent as https://lore.kernel.org/all/20240418083421.3956461-2-arnd@kernel.org/
---
 drivers/gpu/drm/amd/display/include/grph_object_id.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/include/grph_object_id.h b/drivers/gpu/drm/amd/display/include/grph_object_id.h
index 08ee0350b31f..54e33062b3c0 100644
--- a/drivers/gpu/drm/amd/display/include/grph_object_id.h
+++ b/drivers/gpu/drm/amd/display/include/grph_object_id.h
@@ -226,8 +226,8 @@ enum dp_alt_mode {
 
 struct graphics_object_id {
 	uint32_t  id:8;
-	enum object_enum_id  enum_id;
-	enum object_type  type;
+	enum object_enum_id  enum_id :4;
+	enum object_type  type :4;
 	uint32_t  reserved:16; /* for padding. total size should be u32 */
 };
 
-- 
2.39.2

