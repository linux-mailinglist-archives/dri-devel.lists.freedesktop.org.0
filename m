Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C19137D440
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 22:30:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89C946ECD0;
	Wed, 12 May 2021 20:30:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FA2C6ECD0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 May 2021 20:30:54 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <colin.king@canonical.com>)
 id 1lgvVM-0006Pb-5r; Wed, 12 May 2021 20:30:52 +0000
From: Colin King <colin.king@canonical.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH][next] drm: simpledrm: Fix use after free issues
Date: Wed, 12 May 2021 21:30:51 +0100
Message-Id: <20210512203051.299026-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Colin Ian King <colin.king@canonical.com>

There are two occurrances where objects are being free'd via
a put call and yet they are being referenced after this. Fix these
by adding in the missing continue statement so that the put on the
end of the loop is skipped over.

Addresses-Coverity: ("Use after free")
Fixes: 11e8f5fd223b ("drm: Add simpledrm driver")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/tiny/simpledrm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index 2bdb477d9326..eae748394b00 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -298,6 +298,7 @@ static int simpledrm_device_init_clocks(struct simpledrm_device *sdev)
 			drm_err(dev, "failed to enable clock %u: %d\n",
 				i, ret);
 			clk_put(clock);
+			continue;
 		}
 		sdev->clks[i] = clock;
 	}
@@ -415,6 +416,7 @@ static int simpledrm_device_init_regulators(struct simpledrm_device *sdev)
 			drm_err(dev, "failed to enable regulator %u: %d\n",
 				i, ret);
 			regulator_put(regulator);
+			continue;
 		}
 
 		sdev->regulators[i++] = regulator;
-- 
2.30.2

