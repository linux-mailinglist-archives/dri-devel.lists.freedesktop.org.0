Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC894943CA7
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 02:40:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1327C10E091;
	Thu,  1 Aug 2024 00:40:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="G8LjcMnB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10B0510E091;
 Thu,  1 Aug 2024 00:40:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 5B00ECE17A6;
 Thu,  1 Aug 2024 00:40:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB6D0C116B1;
 Thu,  1 Aug 2024 00:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722472840;
 bh=mHrDZThkia9FZr8QpjrKs8MvCfX8yJX7rXP9HOV+t94=;
 h=From:To:Cc:Subject:Date:From;
 b=G8LjcMnBkHmCpMTrhW3HqgMu/gNZ+4iTXdcYgEvO0Nl928W28eywJ1GlHKk0AKOC9
 y3eM08ZfrgEOkIRQNh9QFQBHY7WhgbvdT+bs11djqWAvvPkUeWqpnoRjLlfuVT/8yd
 kpFvCn63t944i/MAjGe2tj1H1BNDPDWaU2D8vK/DhFSUKDXTWfaoZkz0JWnJ42MRMJ
 zWxC6ArAyPtcxJXd2mfc5UIYrIhLOACwuBabir5Ue71WMK9AUz9jq+IxKweZ7Lw0CQ
 z7eaQWHenHRXkDnyMq8BeP/V85FcBbkmCaHtjKRGcXraeoEkQ93PR9Im6jFEQsDfch
 N8/x+71NmrwXA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Tim Huang <Tim.Huang@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Sasha Levin <sashal@kernel.org>, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, Jun.Ma2@amd.com, hannes@cmpxchg.org,
 vitaly.prosyak@amd.com, shashank.sharma@amd.com, andrealmeid@igalia.com,
 friedrich.vock@gmx.de, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 4.19 01/14] drm/amdgpu: fix overflowed array index
 read warning
Date: Wed, 31 Jul 2024 20:40:09 -0400
Message-ID: <20240801004037.3939932-1-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 4.19.319
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

From: Tim Huang <Tim.Huang@amd.com>

[ Upstream commit ebbc2ada5c636a6a63d8316a3408753768f5aa9f ]

Clear overflowed array index read warning by cast operation.

Signed-off-by: Tim Huang <Tim.Huang@amd.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
index 93794a85f83d8..d1efab2270340 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
@@ -497,8 +497,9 @@ static ssize_t amdgpu_debugfs_ring_read(struct file *f, char __user *buf,
 					size_t size, loff_t *pos)
 {
 	struct amdgpu_ring *ring = file_inode(f)->i_private;
-	int r, i;
 	uint32_t value, result, early[3];
+	loff_t i;
+	int r;
 
 	if (*pos & 3 || size & 3)
 		return -EINVAL;
-- 
2.43.0

