Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6163BCC4E
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 13:16:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 596C66E0E6;
	Tue,  6 Jul 2021 11:16:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66A386E0E6;
 Tue,  6 Jul 2021 11:16:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 381FE61C6E;
 Tue,  6 Jul 2021 11:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625570177;
 bh=ZtR6uqjh9r46IYe5YwSQZB+ViQIJ6CXVhQ+5mOkRKOI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=T0cuG8Gx5RD8KMnz7xijg015vsmKopfCCNqm4WpQDyWvq0C2AyYmcta7sYwCRnp6B
 47TpJOHxnFtxUTVJIKOIZaMkQNcZZMF7CfOB3wxhObUDJ1Mb1Qqmvc1unE8/STSo8t
 USC5TX+6WOzzFzTWQPc3lrYwYRpxL1LPUuJwVuOXxFzSV9ze9PAW1GaC71ncXTBY/B
 C9KQOV75OsF0/nZCkQk5++hlln/wCheVXfqCdVlkvqyMXi4v7cM6+xVXp43dUa7+rp
 YpcklkNF08LqWHSK0RsxhQ8LoRZxHuw7Sw9EljUUjU0sgaSWwX3rnVBpcU6GYUswuv
 viwEgdqd1CFVg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.13 094/189] drm/amd/display: Fix crash during MPO +
 ODM combine mode recalculation
Date: Tue,  6 Jul 2021 07:12:34 -0400
Message-Id: <20210706111409.2058071-94-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210706111409.2058071-1-sashal@kernel.org>
References: <20210706111409.2058071-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Stylon Wang <stylon.wang@amd.com>, Sasha Levin <sashal@kernel.org>,
 Krunoslav Kovac <Krunoslav.Kovac@amd.com>, amd-gfx@lists.freedesktop.org,
 Daniel Wheeler <daniel.wheeler@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Aric Cyr <aric.cyr@amd.com>

[ Upstream commit 665f28507a2a3d8d72ed9afa9a2b9b17fd43add1 ]

[Why]
When calculating recout width for an MPO plane on a mode that's using
ODM combine, driver can calculate a negative value, resulting in a
crash.

[How]
For negative widths, use zero such that validation will prune the
configuration correctly and disallow MPO.

Signed-off-by: Aric Cyr <aric.cyr@amd.com>
Reviewed-by: Krunoslav Kovac <Krunoslav.Kovac@amd.com>
Acked-by: Stylon Wang <stylon.wang@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
index 78278a10d899..3b1068a09095 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
@@ -776,6 +776,11 @@ static void calculate_recout(struct pipe_ctx *pipe_ctx)
 			if (split_idx == split_count) {
 				/* rightmost pipe is the remainder recout */
 				data->recout.width -= data->h_active * split_count - data->recout.x;
+
+				/* ODM combine cases with MPO we can get negative widths */
+				if (data->recout.width < 0)
+					data->recout.width = 0;
+
 				data->recout.x = 0;
 			} else
 				data->recout.width = data->h_active - data->recout.x;
-- 
2.30.2

