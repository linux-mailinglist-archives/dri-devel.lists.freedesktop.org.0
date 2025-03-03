Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 135E7A4C73E
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 17:32:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60D9710E49E;
	Mon,  3 Mar 2025 16:32:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lM3q5LNQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19D1110E49E;
 Mon,  3 Mar 2025 16:32:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B4D895C591A;
 Mon,  3 Mar 2025 16:30:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26534C4CED6;
 Mon,  3 Mar 2025 16:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741019555;
 bh=60POIUAE8MUOThoRKFxbWyRNp22VrKkaS17XYtsLJUo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lM3q5LNQJojRUIMgQmyx64WSwbW1+FvMj87DUbmeQ3TESqPFHTFYZ5jaklV1aKfQk
 6QJl3AkTLmjtkd+LT0pCMDY55JqTN4K9Iu0tnbqfev9WlDNaEbuEDIiWtlBmZ54wYU
 vEcYJMm/8GPabQ7XK3dNs8PL5wnGdFOw14DGQZq7RBv4HBlhGWciyL0JtbT+sX4Pva
 zuDZEXuQTSWzJuWoGsKONyPNqhsZebJanFoAxpe6zCTXe0lkY8BxfBuVmLuRnfrxPA
 aXzdqJlIGmGEI4vSiBIeEY+VBaptaEAV2+ovUYxV4p8TOhDG/e5+XB8js0OwTZ6EYf
 LBrr7aAwD8qTQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Lyude Paul <lyude@redhat.com>,
 Sasha Levin <sashal@kernel.org>, dakr@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Subject: [PATCH AUTOSEL 5.4 3/4] drm/nouveau: Do not override forced connector
 status
Date: Mon,  3 Mar 2025 11:32:26 -0500
Message-Id: <20250303163228.3764394-3-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250303163228.3764394-1-sashal@kernel.org>
References: <20250303163228.3764394-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.4.290
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
index c49303ba30c80..6f2bf5e9992f8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -759,7 +759,6 @@ nouveau_connector_force(struct drm_connector *connector)
 	if (!nv_encoder) {
 		NV_ERROR(drm, "can't find encoder to force %s on!\n",
 			 connector->name);
-		connector->status = connector_status_disconnected;
 		return;
 	}
 
-- 
2.39.5

