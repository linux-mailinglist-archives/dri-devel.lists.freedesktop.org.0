Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C97FD9C1AE8
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 11:42:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0821910E960;
	Fri,  8 Nov 2024 10:42:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ispras.ru header.i=@ispras.ru header.b="rkZu10gd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9855810E960;
 Fri,  8 Nov 2024 10:42:33 +0000 (UTC)
Received: from fpc.intra.ispras.ru (unknown [10.10.165.14])
 by mail.ispras.ru (Postfix) with ESMTPSA id 8517C40777C7;
 Fri,  8 Nov 2024 10:42:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 8517C40777C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
 s=default; t=1731062551;
 bh=K7peh/qccz/koCm9bosthYUMrdTm0HUmjIy0yZegWZA=;
 h=From:To:Cc:Subject:Date:From;
 b=rkZu10gdhum3UxfKRfq18BkpYxNYkjCWDbu49eQ+R+2PR3pFq4ycgHbZO1ZBk18yd
 Cgr0OUoLBKTeUSyLuYApqs/or7O3QA/8ylHbjBDaoiVbT7KZ6FqaKkUSMcbsHvREUL
 y9Wa8ufZmr5RXnOGdFRAAZXGzF4+xs3yd/1I7w6Y=
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	stable@vger.kernel.org
Cc: Fedor Pchelkin <pchelkin@ispras.ru>, Sasha Levin <sashal@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org, Alexey Khoroshilov <khoroshilov@ispras.ru>,
 Jonathan Gray <jsg@jsg.id.au>
Subject: [PATCH 6.1 resend] Revert "drm/amd/display: Skip Recompute DSC Params
 if no Stream on Link"
Date: Fri,  8 Nov 2024 13:42:24 +0300
Message-Id: <20241108104224.504424-1-pchelkin@ispras.ru>
X-Mailer: git-send-email 2.39.5
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

This reverts commit 7c887efda1201110211fed8921a92a713e0b6bcd which is
commit 8151a6c13111b465dbabe07c19f572f7cbd16fef upstream.

It is a duplicate of the change made in 6.1.105 by commit 282f0a482ee6
("drm/amd/display: Skip Recompute DSC Params if no Stream on Link").

This is a consequence of two different upstream commits performing the
exact same change and one of which has been cherry-picked. No point to
keep it in the stable branch.

Found by Linux Verification Center (linuxtesting.org) with Svace static
analysis tool.

Reported-by: Alexey Khoroshilov <khoroshilov@ispras.ru>
Signed-off-by: Fedor Pchelkin <pchelkin@ispras.ru>
---
Dropped from other stables by Jonathan Gray
https://lore.kernel.org/stable/20241007035711.46624-1-jsg@jsg.id.au/T/#u

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index 1acef5f3838f..855cd71f636f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -1255,9 +1255,6 @@ static bool is_dsc_need_re_compute(
 		}
 	}
 
-	if (new_stream_on_link_num == 0)
-		return false;
-
 	if (new_stream_on_link_num == 0)
 		return false;
 
-- 
2.39.5

