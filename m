Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6233798EA6D
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 09:37:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7A0710E7B2;
	Thu,  3 Oct 2024 07:37:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=yandex-team.ru header.i=@yandex-team.ru header.b="XnZf1xvj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 641 seconds by postgrey-1.36 at gabe;
 Wed, 02 Oct 2024 12:37:26 UTC
Received: from forwardcorp1d.mail.yandex.net (forwardcorp1d.mail.yandex.net
 [178.154.239.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2D8610E066
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2024 12:37:26 +0000 (UTC)
Received: from mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c12:4a24:0:640:9413:0])
 by forwardcorp1d.mail.yandex.net (Yandex) with ESMTPS id 742476003B;
 Wed,  2 Oct 2024 15:26:41 +0300 (MSK)
Received: from kniv-nix.yandex-team.ru (unknown [2a02:6b8:b081:6413::1:3])
 by mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id ZQa8h82Ig0U0-XCZIZoN5; Wed, 02 Oct 2024 15:26:40 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; t=1727872000;
 bh=BS9mL8Bw7Lo0Kw6QmoUghvwWGovppnMzZ0k0iicLcEc=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=XnZf1xvj3wgg172N1x5xR4EUX2UkEDvDhCsvHEXiHPWAaXDYVRWaGkhZQOyT2JfEe
 hh2VBbHRH2LppJlmf+nb4/ibytdqBjlZ2x58Dp4h9M6+sjMThBIRlR1gh9gYQ2dKga
 kJD5uogUSdKAGdwaojwzP9roPu2zAXg3Arp36/yY=
Authentication-Results: mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Nikolay Kuratov <kniv@yandex-team.ru>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 lvc-project@linuxtesting.org, bcm-kernel-feedback-list@broadcom.com,
 Sinclair Yeh <syeh@vmware.com>, Zack Rusin <zack.rusin@broadcom.com>,
 Thomas Hellstrom <thellstrom@vmware.com>, Simona Vetter <simona@ffwll.ch>,
 Nikolay Kuratov <kniv@yandex-team.ru>
Subject: [PATCH] drm/vmwgfx: Handle surface check failure correctly
Date: Wed,  2 Oct 2024 15:24:29 +0300
Message-Id: <20241002122429.1981822-1-kniv@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Yandex-Filter: 1
X-Mailman-Approved-At: Thu, 03 Oct 2024 07:37:11 +0000
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

Currently if condition (!bo and !vmw_kms_srf_ok()) was met
we go to err_out with ret == 0.
err_out dereferences vfb if ret == 0, but in our case vfb is still NULL.

Fix this by assigning sensible error to ret.

Found by Linux Verification Center (linuxtesting.org) with SVACE

Signed-off-by: Nikolay Kuratov <kniv@yandex-team.ru>
Cc: stable@vger.kernel.org
Fixes: 810b3e1683d0 ("drm/vmwgfx: Support topology greater than texture size")
---
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index 288ed0bb75cb..752510a11e1b 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -1539,6 +1539,7 @@ static struct drm_framebuffer *vmw_kms_fb_create(struct drm_device *dev,
 		DRM_ERROR("Surface size cannot exceed %dx%d\n",
 			dev_priv->texture_max_width,
 			dev_priv->texture_max_height);
+		ret = -EINVAL;
 		goto err_out;
 	}
 
-- 
2.34.1

