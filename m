Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 270033E2951
	for <lists+dri-devel@lfdr.de>; Fri,  6 Aug 2021 13:16:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3986E883F4;
	Fri,  6 Aug 2021 11:16:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-canonical-1.canonical.com
 (smtp-relay-canonical-1.canonical.com [185.125.188.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCC8B6E8DC;
 Fri,  6 Aug 2021 11:16:17 +0000 (UTC)
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id BDD7940643; 
 Fri,  6 Aug 2021 11:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1628248575;
 bh=K45ys8L4xpEH11ycYMqx65JY8D/NZO6D2I6izRFfqSQ=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
 b=DbKJ6NXpyHS7Z4kymvh06e4xGVUc+/yPsDHdsRSaREBxhB5LfgLdaySs9Zac5BW5/
 kLdpE6Kwrz5uvGe89Jf3/Ry+408QWbOwV6Ege7VV3eIDafjhbLxE0rmQ4ugs4szmTL
 miRxov5oY6+OXPwIYiNzvnIVtwYz4UtxRnMJaTyH67Jt35xgrrxZmHVehuixp2ZksD
 9qQLnC/2y3cNmiNkaPKMM3Lmt8Qt4HpZ0j47N89c2GmciAvbcaud5LD8LZ/tnOX7gX
 8IMQpWYyJTqGa7QDQ36otWa1Uef5zOCWVbZH/01lJ8ySqNd0qFoMxkRTn2gPMeINvM
 P2b7yDENeoZNQ==
From: Colin King <colin.king@canonical.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui.Pan@amd.com, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Jun Lei <Jun.Lei@amd.com>,
 Jimmy Kizito <Jimmy.Kizito@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amd/display: Remove redundant initialization of variable
 eng_id
Date: Fri,  6 Aug 2021 12:16:15 +0100
Message-Id: <20210806111615.11803-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

From: Colin Ian King <colin.king@canonical.com>

The variable eng_id is being initialized with a value that is never
read, it is being re-assigned on the next statment. The assignment
is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c
index 1a89d565c92e..de80a9ea4cfa 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c
@@ -305,7 +305,7 @@ struct link_encoder *link_enc_cfg_get_next_avail_link_enc(
 	const struct dc_state *state)
 {
 	struct link_encoder *link_enc = NULL;
-	enum engine_id eng_id = ENGINE_ID_UNKNOWN;
+	enum engine_id eng_id;
 
 	eng_id = find_first_avail_link_enc(dc->ctx, state);
 	if (eng_id != ENGINE_ID_UNKNOWN)
-- 
2.31.1

