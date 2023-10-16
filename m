Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B1C7CAC50
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 16:52:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB9F010E201;
	Mon, 16 Oct 2023 14:52:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3E1710E1F9
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 14:52:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 0F83DCE1379;
 Mon, 16 Oct 2023 14:52:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4F94C433C8;
 Mon, 16 Oct 2023 14:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1697467957;
 bh=9DVsvyLP9wi7nhAzFg6lg11E2jbhETUGY9q87/GU6m8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GcUL1Hdyk1HDzvaYRP9m2+YmYoRdQzzZ4yAUN8xcDU3a5YhTgAvVA/VHUeoXfKnzS
 Y3KBmGWxRwdKIeLFAnqtPkiX8j4lOhvIpuwqkaJnPSrsjMHHgF4SQR9vr56DndIkrX
 vXJA/rWhxAWrMHvTRVUegDs6Lheno5ui6TW080os=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Subject: [PATCH 6.5 123/191] drm/tiny: correctly print `struct resource *` on
 error
Date: Mon, 16 Oct 2023 10:41:48 +0200
Message-ID: <20231016084018.250316756@linuxfoundation.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231016084015.400031271@linuxfoundation.org>
References: <20231016084015.400031271@linuxfoundation.org>
User-Agent: quilt/0.67
X-stable: review
X-Patchwork-Hint: ignore
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Javier Martinez Canillas <javierm@redhat.com>, Joey Gouly <joey.gouly@arm.com>,
 patches@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Thierry Reding <treding@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

6.5-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Joey Gouly <joey.gouly@arm.com>

commit c1165df2be2fffe3adeeaa68f4ee4325108c5e4e upstream.

The `res` variable is already a `struct resource *`, don't take the address of it.

Fixes incorrect output:

	simple-framebuffer 9e20dc000.framebuffer: [drm] *ERROR* could not acquire memory range [??? 0xffff4be88a387d00-0xfffffefffde0a240 flags 0x0]: -16

To be correct:

	simple-framebuffer 9e20dc000.framebuffer: [drm] *ERROR* could not acquire memory range [mem 0x9e20dc000-0x9e307bfff flags 0x200]: -16

Signed-off-by: Joey Gouly <joey.gouly@arm.com>
Fixes: 9a10c7e6519b ("drm/simpledrm: Add support for system memory framebuffers")
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Thierry Reding <treding@nvidia.com>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v6.3+
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://patchwork.freedesktop.org/patch/msgid/20231010174652.2439513-1-joey.gouly@arm.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/tiny/simpledrm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index ff86ba1ae1b8..8ea120eb8674 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -745,7 +745,7 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
 
 		ret = devm_aperture_acquire_from_firmware(dev, res->start, resource_size(res));
 		if (ret) {
-			drm_err(dev, "could not acquire memory range %pr: %d\n", &res, ret);
+			drm_err(dev, "could not acquire memory range %pr: %d\n", res, ret);
 			return ERR_PTR(ret);
 		}
 
-- 
2.42.0



