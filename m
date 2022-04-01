Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6524EEFCB
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 16:29:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8F8110E939;
	Fri,  1 Apr 2022 14:29:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20B4F10E939
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 14:29:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BB253B82500;
 Fri,  1 Apr 2022 14:29:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB6EBC340EE;
 Fri,  1 Apr 2022 14:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648823363;
 bh=aoUe/M1CYOzKJMsQYqxk8lxuYJkmbYkYDaHKmDTSJss=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AOdulAj2OIRKWAFzRIU+C91lhEeK4lEDf+uxyQWDuDCR9EoZ3FIihVVjz/Li37770
 fUlfJWYtK+pH2VSskZMXENepMaJfVO+hI5qOwOF0nY0tvbLXwr/VHtQeS6sbe3GDLF
 WV11hZpvb3ISRZaGkXYQC37ECZkl5D/jfHZZUGMywXA635GnJpN1OXT5sxB88wYRDU
 dLdEgvImgvJTWxUNyeS49Upqmaq7x9CL/FxltLFiArI972zAZ6KZc6xssZLKJ2PkpT
 ypStFIPhcYKyiIN+9tdet8R4R0o9oanA+55yLRaNc4o+E8YnIqiyBHQIufTMp5Ftot
 C/TKJqmp20Iaw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.17 071/149] drm/sprd: fix potential NULL dereference
Date: Fri,  1 Apr 2022 10:24:18 -0400
Message-Id: <20220401142536.1948161-71-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220401142536.1948161-1-sashal@kernel.org>
References: <20220401142536.1948161-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Kevin Tang <kevin3.tang@gmail.com>,
 airlied@linux.ie, zhang.lyra@gmail.com,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 yong.wu@mediatek.com, Thomas Zimmermann <tzimmermann@suse.de>,
 baolin.wang7@gmail.com, orsonzhai@gmail.com, etom@igel.co.jp,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Kevin Tang <kevin3.tang@gmail.com>

[ Upstream commit 8668658aebb0a19d877d5a81c004baf716c4aaa6 ]

'drm' could be null in sprd_drm_shutdown, and drm_warn maybe dereference
it, remove this warning log.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Kevin Tang <kevin3.tang@gmail.com>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://lore.kernel.org/all/20220117084044.9210-1-kevin3.tang@gmail.com

v1 -> v2:
- Split checking platform_get_resource() return value to a separate patch
- Use dev_warn() instead of removing the warning log

Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/sprd/sprd_drm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sprd/sprd_drm.c b/drivers/gpu/drm/sprd/sprd_drm.c
index a077e2d4d721..af2be97d5ed0 100644
--- a/drivers/gpu/drm/sprd/sprd_drm.c
+++ b/drivers/gpu/drm/sprd/sprd_drm.c
@@ -155,7 +155,7 @@ static void sprd_drm_shutdown(struct platform_device *pdev)
 	struct drm_device *drm = platform_get_drvdata(pdev);
 
 	if (!drm) {
-		drm_warn(drm, "drm device is not available, no shutdown\n");
+		dev_warn(&pdev->dev, "drm device is not available, no shutdown\n");
 		return;
 	}
 
-- 
2.34.1

