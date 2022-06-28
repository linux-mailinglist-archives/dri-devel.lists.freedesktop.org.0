Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B9F55BD52
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 04:21:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CA7D10EFA6;
	Tue, 28 Jun 2022 02:21:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5EC510EFA6
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 02:21:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5B033B81C0E;
 Tue, 28 Jun 2022 02:21:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17A15C341CC;
 Tue, 28 Jun 2022 02:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656382878;
 bh=WfxWBIpku8sGa/2eIW1WWz589oUqjHx3Q1CNU29m1JY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hjnboY9tSpK7XaeW8TiZiagiHS+RGapQkiizRHdNzknL6bVEKCSlNEdtsgNEmI07G
 kcdoSuBr1bYLV1eqa/sNeA6y+qP8U9d3IWD3+5ea1qHVJaDs5pBcH1Nc8ZXxpZLQne
 eSwO93REtXwdERhnPXX3i8ZE+qI9rSGytpbdlIpKjmLRNPT71bkhPeP5mFKnkOVQ9y
 Ly2y7ISuu/A7W6DtyussYyarDRPX5pReYdgUhHM4HNTP/BGsckaRtbUCMzDO4W272z
 iwLzMDMk2ijcw9bc9ni7/LTrQzrJm+P4AgH/oowxA278EK4X2wAjl495LSanKuFnkV
 DyqjPkZlAqdXg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 08/41] drm/vc4: plane: Prevent async update if we
 don't have a dlist
Date: Mon, 27 Jun 2022 22:20:27 -0400
Message-Id: <20220628022100.595243-8-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220628022100.595243-1-sashal@kernel.org>
References: <20220628022100.595243-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, emma@anholt.net, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, Melissa Wen <mwen@igalia.com>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Maxime Ripard <maxime@cerno.tech>

[ Upstream commit cb468c7d84d174ab9cd638be9f5b3f1ba2b311a0 ]

The vc4 planes are setup in hardware by creating a hardware descriptor
in a dedicated RAM. As part of the process to setup a plane in KMS, we
thus need to allocate some part of that dedicated RAM to store our
descriptor there.

The async update path will just reuse the descriptor already allocated
for that plane and will modify it directly in RAM to match whatever has
been asked for.

In order to do that, it will compare the descriptor for the old plane
state and the new plane state, will make sure they fit in the same size,
and check that only the position or buffer address have changed.

Reviewed-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
Link: https://lore.kernel.org/r/20220610115149.964394-2-maxime@cerno.tech
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/vc4/vc4_plane.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index 19161b6ab27f..c085c750f1e9 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -1219,6 +1219,10 @@ static int vc4_plane_atomic_async_check(struct drm_plane *plane,
 
 	old_vc4_state = to_vc4_plane_state(plane->state);
 	new_vc4_state = to_vc4_plane_state(new_plane_state);
+
+	if (!new_vc4_state->hw_dlist)
+		return -EINVAL;
+
 	if (old_vc4_state->dlist_count != new_vc4_state->dlist_count ||
 	    old_vc4_state->pos0_offset != new_vc4_state->pos0_offset ||
 	    old_vc4_state->pos2_offset != new_vc4_state->pos2_offset ||
-- 
2.35.1

