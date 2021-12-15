Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92476476066
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 19:14:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3FC510E2DC;
	Wed, 15 Dec 2021 18:14:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9559610E2DC
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 18:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=metanate.com; s=stronger; h=Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Content-Type:Reply-To:Content-ID:Content-Description:
 In-Reply-To:References; bh=wsq8cUBFjzgYgnMDS2RJHFOuvoD7tYl9ctoDcV6S2XU=; b=ma
 VHM7jnW3jr4hNhZHkDvbhYleitth2sQiAk9MQr4S21BANoKCUezlSV2fxfYr3Bxz+Lb3ETG6oFk76
 HRmLtccR3HooekJURkDGWIw6c+GSNADF8zBWZra7N9Mdxx9SgruBVu4nTIsaFBwdzm8gLPAdnqiLm
 PQeIyY69c7Zvex5/fSBnxfk02Zppy+OUgrQcIvmQyYJwFXCdlaOeO7G6mmaeOxsznh1Mp8tI+K8QV
 mh7e4n5xbv0n3NVvzkc7IyxmESBXtYyv14G8vcQVtqkN77EsAt2QP3Zg331QvenUtq8w+53T5+D/H
 1RueANeVYxJFgafLegyqTDY2wkvs41UQ==;
Received: from [81.174.171.191] (helo=donbot.metanate.com)
 by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.93) (envelope-from <john@metanate.com>)
 id 1mxYmz-0001lA-Au; Wed, 15 Dec 2021 18:14:05 +0000
From: John Keeping <john@metanate.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/rockchip: vop: duplicate subclassed state variables
Date: Wed, 15 Dec 2021 18:13:58 +0000
Message-Id: <20211215181358.2950649-1-john@metanate.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated: YES
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
Cc: David Airlie <airlied@linux.ie>, Sandy Huang <hjc@rock-chips.com>,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Duplicating the CRTC state should copy all of the fields in the
subclassed state as well as the base state.  Switch to kmemdup to cover
all of these (which are all simple variables).

Most of the state variables are only used for .atomic_enable where they
will have been set in the initial check, and enable_afbc is always set
in the preceding .atomic_check, so the only issue here is inspecting the
state later when these field end up no longer reflecting what has been
programmed in the hardware.

Signed-off-by: John Keeping <john@metanate.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index f3975905599b..0efd79be8f3b 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -1552,7 +1552,7 @@ static struct drm_crtc_state *vop_crtc_duplicate_state(struct drm_crtc *crtc)
 {
 	struct rockchip_crtc_state *rockchip_state;
 
-	rockchip_state = kzalloc(sizeof(*rockchip_state), GFP_KERNEL);
+	rockchip_state = kmemdup(crtc->state, sizeof(*rockchip_state), GFP_KERNEL);
 	if (!rockchip_state)
 		return NULL;
 
-- 
2.34.1

