Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9343263F6E5
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 18:53:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DEE710E65F;
	Thu,  1 Dec 2022 17:53:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01C0D10E65F
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 17:53:44 +0000 (UTC)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net
 [173.49.113.140]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id 5D64D33F219;
 Thu,  1 Dec 2022 17:53:42 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1669917223; bh=wQc2r2vS0sCjPU+IzDGMTKHg/lXiVtqSh+tXf+W1lTk=;
 h=From:To:Cc:Subject:Date:From;
 b=Ili4injkTHywQSV7vWpKMfV3z2bFqcvdzfQvbW/0caNhK+wUeX37cEr+nI4DkcSln
 3XhC0imqwx2fihgBHSeBvxpN21z6sDcNlMYJ09ROBoLEBlRicgn8rMLf4kw+kBtnF7
 T3J/RmFQqXWuWdvniwHrtCSfhCJ3CX5Wms0wbDp6FR6Qr3M6H530pkwzleRTfxnwM1
 FReSq3hd1Cr+lBJg4uDnEwtZ3jv+cn7YL5jk6DQopvyqCywi/VtiV2hNDMDo3CS5a/
 EX22Tpv9MNNBXF4irhW+rXx2/k961gVea86a+HXgcjw/xufiJALaqW9sSNV5/aS74V
 DkiNm8Rw6c6UQ==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/vmwgfx: Don't use screen objects when SEV is active
Date: Thu,  1 Dec 2022 12:53:41 -0500
Message-Id: <20221201175341.491884-1-zack@kde.org>
X-Mailer: git-send-email 2.37.2
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
Reply-To: Zack Rusin <zackr@vmware.com>
Cc: krastevm@vmware.com, Nicholas Hunt <nhunt@vmware.com>, banackm@vmware.com,
 mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

When SEV is enabled gmr's and mob's are explicitly disabled because
the encrypted system memory can not be used by the hypervisor.

The driver was disabling GMR's but the presentation code, which depends
on GMR's, wasn't honoring it which lead to black screen on hosts
with SEV enabled.

Make sure screen objects presentation is not used when guest memory
regions have been disabled to fix presentation on SEV enabled hosts.

Fixes: 3b0d6458c705 ("drm/vmwgfx: Refuse DMA operation when SEV encryption is active")
Cc: <stable@vger.kernel.org> # v5.7+
Signed-off-by: Zack Rusin <zackr@vmware.com>
Reported-by: Nicholas Hunt <nhunt@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c b/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
index 8db61c541a80..e1f36a09c59c 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
@@ -926,6 +926,10 @@ int vmw_kms_sou_init_display(struct vmw_private *dev_priv)
 	struct drm_device *dev = &dev_priv->drm;
 	int i;
 
+	/* Screen objects won't work if GMR's aren't available */
+	if (!dev_priv->has_gmr)
+		return -ENOSYS;
+
 	if (!(dev_priv->capabilities & SVGA_CAP_SCREEN_OBJECT_2)) {
 		return -ENOSYS;
 	}
-- 
2.37.2

