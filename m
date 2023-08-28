Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B141978B5D8
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 19:03:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70A0410E00E;
	Mon, 28 Aug 2023 17:03:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out203-205-221-231.mail.qq.com (out203-205-221-231.mail.qq.com
 [203.205.221.231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFE5610E00E
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 17:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1693242198;
 bh=cPNK+81IGn0TQpKkotv2WdAq+z2m9yPGmO2U+lmiC/M=;
 h=From:To:Cc:Subject:Date;
 b=k6mj2tZD5lRWmNptkA4ffLB1Ne8aTyVQwnlgpgAmkr/NBdUEHHFV2QO4F5uUePWBL
 2JV0n6oY2E2nh5VQdFMJ7xb14UDcFKcBJR/OJf80BQdCc+uefFxDAuluaztLtiQUoU
 aEC7+qQR6BgKGF5SOKIL4fqNy1pce5RcCJPHOT4c=
Received: from KernelDevBox.byted.org ([180.184.51.142])
 by newxmesmtplogicsvrszc2-1.qq.com (NewEsmtp) with SMTP
 id DC3048EC; Tue, 29 Aug 2023 00:55:03 +0800
X-QQ-mid: xmsmtpt1693241703t8cvcq53r
Message-ID: <tencent_026E4B04ACDCE341411EF54862F8C6AB1605@qq.com>
X-QQ-XMAILINFO: NvKyM24IHTKSlKGvWHJ9FbVaOla+tcVA5EuhPy5wgmj14mHAPCI21r+zyzFvbC
 zEbP4kTEBCIhYXMIdpd0itwzVmo11tKwlAlvVEkMha0Uf69Fv2/OQaW9CB/5o1NJzW8baPjVLqyU
 gGNXDozJjClOkxKfNl6oJYTesrUOqTZ+WdMKzy/RgoVO2yt9MHtzIGEwCCPAP3kJsgLMt3qTNUZj
 5wbxFWohVoX6qVxv9CUtUf7wHIYcURdSJPaWD0YnRGIm6Q0zLwFw2YHui9uqrNzOqcr07sf7SHN+
 sWZ6lREn9Mq+Yi8FXmkeLduQvGIkQf0fCr/SC2/mKF2uRTPcE56V3yEuYUhY13nv7/e/VfHijjIA
 b/Bi15BkmZpIqN/JfPYdplsD1rF8XOcWZkzT6DV0+yUach2at0h69uJmk0HjRS4h2CnFgk+0WJOu
 okqdhU4K4zDzTklAbpe6Bc8jPq9UMAIl3H8J9pVmj/1hAX/LvTMPGx0CMbcrfY+jT7qqzw9MAdG+
 xJDhkvRDaOqfFJmnveJRbKLmIxmujZpD5VEPhJchxV1GWaGpNeGlB6FT9fg0fyVC2HRCz2ULKTdR
 SV8dGOJVw0QRgz0kywGEIE3zrUXeaYFeIKolOXcbZW0YBC3y3n9ggOnqnREeqGXChwf9jeg5Au76
 Pido6M5mKdLmQzV17D2TghvoKLt/+avD/+CRRRrVdk4djLkYtw7kxs6z2TEriYqXCsGjWq3Tlfu4
 PMzEjDUvLRcMold6fp/DSNxtjdXXahNnPYYER8j44XhyGWJOYj0hfpqhgU0QAaXHcaLPASwvv+Gj
 jBCCS43yEZj7zAKunAt7z4QfYYk+MW+pWDNSumcIXhxSbg7k+6SjTaRlt2jm9ERck9NboBwc7VW+
 aCevBuldn7Dbi1ZkcG+zfJR7MFTKFAEtmHzzR7dZyA7zliFvxHvP8eQhkT7JvJNpaf4DWM3S74yy
 aOaappAagmeL8su1R0mweeLcG7UsOeKMdKXubs1v8lnAOgnRVK2HtLwmBz8RBjmoqKNPZXaOM=
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
From: Zhang Shurong <zhang_shurong@foxmail.com>
To: victor.liu@nxp.com
Subject: [PATCH] drm/bridge: imx: fix potential NULL pointer dereference in
 imx8qxp_ldb_parse_dt_companion()
Date: Tue, 29 Aug 2023 00:55:01 +0800
X-OQ-MSGID: <20230828165501.2887816-1-zhang_shurong@foxmail.com>
X-Mailer: git-send-email 2.30.2
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
Cc: dri-devel@lists.freedesktop.org, neil.armstrong@linaro.org,
 rfoss@kernel.org, jonas@kwiboo.se, shawnguo@kernel.org, s.hauer@pengutronix.de,
 linux-kernel@vger.kernel.org, jernej.skrabec@gmail.com,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 Zhang Shurong <zhang_shurong@foxmail.com>, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

of_match_device() may fail and returns a NULL pointer.

Fix this by checking the return value of of_match_device().

Fixes: 3818715f62b4 ("drm/bridge: imx: Add LDB support for i.MX8qxp")
Signed-off-by: Zhang Shurong <zhang_shurong@foxmail.com>
---
 drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
index 7984da9c0a35..d272f35c8eac 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
@@ -488,6 +488,8 @@ static int imx8qxp_ldb_parse_dt_companion(struct imx8qxp_ldb *imx8qxp_ldb)
 	 * string.
 	 */
 	match = of_match_device(dev->driver->of_match_table, dev);
+	if (!match)
+		return -ENODEV;
 	if (!of_device_is_compatible(companion, match->compatible)) {
 		DRM_DEV_ERROR(dev, "companion LDB is incompatible\n");
 		ret = -ENXIO;
-- 
2.30.2

