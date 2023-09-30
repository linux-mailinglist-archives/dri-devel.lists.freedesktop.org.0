Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C30AB7B44A5
	for <lists+dri-devel@lfdr.de>; Sun,  1 Oct 2023 01:43:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3C8210E089;
	Sat, 30 Sep 2023 23:42:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 605D310E082
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Sep 2023 23:42:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7A8A160B10;
 Sat, 30 Sep 2023 23:42:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 381EBC433C7;
 Sat, 30 Sep 2023 23:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696117376;
 bh=CsxBwJVm1bZHCwijbrh6IQBWuJt6PpsEf/jvmsVNvRY=;
 h=From:Date:Subject:To:Cc:From;
 b=MBl1S22Ey5vJOpMt7MZmO4cFGeksYRtpYNKfp4e0/UJIklgc59TlVV8s4N9KGAUJ8
 P7naw0vpFvKtfjSPNOObAHytteAOkn7Ft5Y3EkoOez6bGDm4SNmYqOloHuAxRLyVzc
 UYTBD/sfqipCoRN55LcP8vVz2kxr9O9mw3KiMz9oYpjDUDoP1nl926bb/mOXU1zHdF
 YW+NsAP6C3G1/3POpDz10OyM0Y+3OxQXtqXKvap67v6ZA8jxeonf54biNUPfYrUnA4
 7H50wNtBR60ESmh7ljQax//71B8AvT8V4iVSur8vekkEc1cWG4jpdQs3BSFJvbBng9
 BjpECuPVqjD5g==
From: Mark Brown <broonie@kernel.org>
Date: Sun, 01 Oct 2023 01:42:50 +0200
Subject: [PATCH] drm/rockchip: vop2: Convert to use maple tree register cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231001-drm-rockchip-maple-v1-1-ca396ab75be7@kernel.org>
X-B4-Tracking: v=1; b=H4sIAHmyGGUC/x3MSQqAMAxA0atI1gZqHECvIi5KG21wKimIIN7d4
 vIt/n8gsQonGIoHlC9Jch4ZVVmAC/ZYGMVnAxmqTU89et1RT7e6IBF3GzfGuaO29p1tiBhyGJV
 nuf/pOL3vBxyQm81kAAAA
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.13-dev-0438c
X-Developer-Signature: v=1; a=openpgp-sha256; l=1127; i=broonie@kernel.org;
 h=from:subject:message-id; bh=CsxBwJVm1bZHCwijbrh6IQBWuJt6PpsEf/jvmsVNvRY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBlGLJ8Jjc9oOR/vpaDIbuwyZK0zdfJwcMVH3fC4
 iKZdLtuhZiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZRiyfAAKCRAk1otyXVSH
 0Gm2B/4o4oxx5OVAaCiOxtwlofHIC0BmPsGKG6uszu0m+fL9D/qQkzplaxJFgi/p463XzlxQ0dV
 jlGa9ezoe9nSuDtunTGpDbtfUNmCL/62eBa9mTWxrXr7rl/bjBihDHtOj2I5oCMEAhHVGj/GOeV
 fRnmMPXwL30YQeh25JsSdauTXobdV+j0Rz07UtoYc1cbYM9uNkEeQdbPZVsTdsmwlUdn9fclCm3
 RKMdkxCzP5qJtr8+rLSDnfIUn34iOL7HQuaEJh9QojpnNZ51T4ih5qZDBraX/VYXSWXizCa73Ng
 egbcCbalJvzMbnAZPkeiLK1y+0np28+i2iIPTKsJKtdtherZ
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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
Cc: linux-rockchip@lists.infradead.org, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The maple tree register cache is based on a much more modern data structure
than the rbtree cache and makes optimisation choices which are probably
more appropriate for modern systems than those made by the rbtree cache.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 583df4d22f7e..9f4470171cf4 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -2641,7 +2641,7 @@ static const struct regmap_config vop2_regmap_config = {
 	.max_register	= 0x3000,
 	.name		= "vop2",
 	.volatile_table	= &vop2_volatile_table,
-	.cache_type	= REGCACHE_RBTREE,
+	.cache_type	= REGCACHE_MAPLE,
 };
 
 static int vop2_bind(struct device *dev, struct device *master, void *data)

---
base-commit: 6465e260f48790807eef06b583b38ca9789b6072
change-id: 20230929-drm-rockchip-maple-f6253d6a422e

Best regards,
-- 
Mark Brown <broonie@kernel.org>

