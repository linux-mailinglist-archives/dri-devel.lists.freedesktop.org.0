Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECBF8A9515
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 10:34:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19F7F113AC0;
	Thu, 18 Apr 2024 08:34:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="N52Lm3VK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 230C4113AC0;
 Thu, 18 Apr 2024 08:34:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 3F74ECE16A8;
 Thu, 18 Apr 2024 08:34:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB27BC113CC;
 Thu, 18 Apr 2024 08:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713429280;
 bh=mm128Q0AdH9Dvjnv7b4cIuV9GNgaiwIadPzWSTcvOcM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=N52Lm3VKCcPqN8tpR+YRwXPxacUTwpSH7L5eIq8LmosIjo2h9ddpVSOEiTM5T2f2A
 3FgFn49pZ3SLKFYM7D8duH70vvbHUp6ZSRImwhow7yAWN3FEeemiMuqwF36fC2WemO
 Lnm8Cb/KJ7ZW+hqqMP2eLIwLT3e3MEQrCPTC4d+8x0uxn5LcVjT3RASL2y0wD83yia
 tPD+VrkBAUPN/Pc3cMnhqspqWNlt0OwOpUYtlfFhJnIZgpuRlY5LlnGhtee6WKeXSI
 NC62QK2VIBu9tOT6sRywsZDV7GvnO2dGN394AiOT1F3Se4UmDRiq+UhYQA6qSEx4NL
 68X2MQ7ogYl7g==
From: Arnd Bergmann <arnd@kernel.org>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Martin Leung <martin.leung@amd.com>,
 Mounika Adhuri <moadhuri@amd.com>, Roman Li <roman.li@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] drm/amd/display: fix graphics_object_id size
Date: Thu, 18 Apr 2024 10:34:03 +0200
Message-Id: <20240418083421.3956461-2-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240418083421.3956461-1-arnd@kernel.org>
References: <20240418083421.3956461-1-arnd@kernel.org>
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

