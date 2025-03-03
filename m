Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF0CA4C72B
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 17:31:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C43E010E497;
	Mon,  3 Mar 2025 16:31:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SZQlcKBk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01BB310E497;
 Mon,  3 Mar 2025 16:31:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 87C2461203;
 Mon,  3 Mar 2025 16:31:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03CD4C4CEE4;
 Mon,  3 Mar 2025 16:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741019488;
 bh=g9CIBY9Nmr7cS8ndBcPH61ca5n6zQszj26hUAnVfUAM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SZQlcKBkiomU+ydGFHvdIcbgEIrIf0WNU3dyv0tyFDneAZAQsuoT1h/Z1tYZl7OZl
 fSVeGNal5NX4DIYlKcyhgFIOy3UR5B177U1ryVhS8CPhp2uE+zz1lShT0IxicMbqri
 4/UVrCnl1zZRr8/VUjTlD/lW14RvAsb5ZrHcZn1AVxZgqS9UpzIqtlAQmJts12xqYn
 q+aGcHXDkOT8sO5NDY7jMZ+j+oxHuCHLU2/TZCoqSQCG5LVUnZjKrXyMLL8h8CdhvM
 ipQQZQcA6b4lwP5M+IjWJZ1XSjOb42hfZK6+w6jcCkduI7Z3kNdCGsp//RcHJjCWuj
 yDgvsbDFngKnw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Lyude Paul <lyude@redhat.com>,
 Sasha Levin <sashal@kernel.org>, dakr@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.6 09/11] drm/nouveau: Do not override forced
 connector status
Date: Mon,  3 Mar 2025 11:31:07 -0500
Message-Id: <20250303163109.3763880-9-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250303163109.3763880-1-sashal@kernel.org>
References: <20250303163109.3763880-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.80
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

From: Thomas Zimmermann <tzimmermann@suse.de>

[ Upstream commit 01f1d77a2630e774ce33233c4e6723bca3ae9daa ]

Keep user-forced connector status even if it cannot be programmed. Same
behavior as for the rest of the drivers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Lyude Paul <lyude@redhat.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20250114100214.195386-1-tzimmermann@suse.de
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/nouveau/nouveau_connector.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 22a125243d81f..c1985448d9b38 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -758,7 +758,6 @@ nouveau_connector_force(struct drm_connector *connector)
 	if (!nv_encoder) {
 		NV_ERROR(drm, "can't find encoder to force %s on!\n",
 			 connector->name);
-		connector->status = connector_status_disconnected;
 		return;
 	}
 
-- 
2.39.5

