Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8351B3FAAB
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 11:36:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1902010E634;
	Tue,  2 Sep 2025 09:36:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Jk+m9o+A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7EBC10E632
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 09:36:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8FE81439E8;
 Tue,  2 Sep 2025 09:36:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20726C4CEF5;
 Tue,  2 Sep 2025 09:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756805784;
 bh=bDydH9Fw2rzHOr6RMxR/pPFXB7nD0sWGAt2Hcy2x5Gs=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Jk+m9o+A75zMv6BtvL7tiwgi9wcolLkTnrLZgsTZalmAzNCeLOkiImiPD6uMGMiVb
 ZFNp9B8xizTVBknW30F8A9xmtV3VSAfD6+wgJBHywMlfHKbclhRLLwUMnFaWKm5bML
 tKhHG4Wi9eXVWRbhlNv6PQnfh4Ask4iGMk/TlYMr9CAPw1QO8cnqhtilHdQK7Da/cP
 q5mvfmVpAzuI19tvzYqumHnoBHKInB6hbmH2ItmUtTX3MLIe9LNnBriy45zRhGDYCV
 2VUb9PTdZ/Oqp30lccSGuuCuTcYn6Tq/ovlrOdXLuCTpkppSxM8IPx6ZyJ2rK94F0h
 KRRGwJ3uW8iSw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 02 Sep 2025 11:35:21 +0200
Subject: [PATCH v2 22/37] drm/loongson: Switch to
 drm_atomic_get_new_crtc_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-drm-no-more-existing-state-v2-22-de98fc5f6d66@kernel.org>
References: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
In-Reply-To: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Sui Jingfeng <suijingfeng@loongson.cn>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1371; i=mripard@kernel.org;
 h=from:subject:message-id; bh=bDydH9Fw2rzHOr6RMxR/pPFXB7nD0sWGAt2Hcy2x5Gs=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnbdoXe3HZ3nemufaLxetWvu57dL9Y0XpT1/cbO9+quv
 v3e3SkNHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAiPVaMDZ//c9+7uSr6kYGy
 ZqXd23R7javrT7+baXpSzaZLy/hM7Br/exPfPpE90ba8bXLAlv41Txjr0x4eMVnq2pfe/WLhfdW
 5Gy+cvMJ8kdn5r9A0c883rG5pyjkaFfe51p0O+b04suDN7o2HAQ==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

The loongson atomic_check implementation uses the deprecated
drm_atomic_get_existing_crtc_state() helper.

This hook is called as part of the global atomic_check, thus before the
states are swapped. The existing state thus points to the new state, and
we can use drm_atomic_get_new_crtc_state() instead.

Signed-off-by: Maxime Ripard <mripard@kernel.org>

---
To: Sui Jingfeng <suijingfeng@loongson.cn>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/loongson/lsdc_plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/loongson/lsdc_plane.c b/drivers/gpu/drm/loongson/lsdc_plane.c
index aa9a97f9c4dc28eea3098507ce52e6aa6caa46eb..2967a5cca06936d5d2480fac258b01e11f8d28e1 100644
--- a/drivers/gpu/drm/loongson/lsdc_plane.c
+++ b/drivers/gpu/drm/loongson/lsdc_plane.c
@@ -194,11 +194,11 @@ static int lsdc_cursor_plane_atomic_async_check(struct drm_plane *plane,
 		drm_dbg(plane->dev, "unsupported cursor size: %ux%u\n",
 			new_state->crtc_w, new_state->crtc_h);
 		return -EINVAL;
 	}
 
-	crtc_state = drm_atomic_get_existing_crtc_state(state, new_state->crtc);
+	crtc_state = drm_atomic_get_new_crtc_state(state, new_state->crtc);
 	if (!crtc_state->active)
 		return -EINVAL;
 
 	if (plane->state->crtc != new_state->crtc ||
 	    plane->state->src_w != new_state->src_w ||

-- 
2.50.1

