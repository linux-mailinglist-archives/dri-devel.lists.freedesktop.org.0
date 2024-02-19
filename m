Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1020985A322
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 13:25:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E01D10E07A;
	Mon, 19 Feb 2024 12:25:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="HnIggYjM";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="hFjUjvKR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22D5A10E07A
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 12:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1708345500; x=1739881500;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9bZTQfFErD83ZpeUe8f6tUjcWK8u+2HNM0QEJ6Cyo2s=;
 b=HnIggYjMmfXOgTgD8bqQdWdgihavrg3fSgSTvE7kpzeCdvTwIefo8erT
 XzYc9cknf/VMT5VrEbIUKplfi5b6hEgxPkdHHGskqXDqucB4/ACU2wwbH
 6mHuEr7DEQ7S2OTbeNvc30+XYcscyrF8ITYS2JqfFIpFj8ZSiWqnBj2hS
 8INUpZ7ygtJ7XHua29h7vm3u0Vof3MIfVuim+eHW3tKi79yzUot5yf3yR
 bi3cZrxJJBZh+n54srEBU+6QWD+QfIhWQ2/xRzn33a4SxEUGVB3Wfygcj
 8aR6k9zrjQptnFsULvu21Vl1nAxt0m+Q48T7A6kg2ymTe88BGy5wp/diF Q==;
X-IronPort-AV: E=Sophos;i="6.06,170,1705359600"; d="scan'208";a="35475550"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 19 Feb 2024 13:24:58 +0100
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5077216F242; Mon, 19 Feb 2024 13:24:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1708345494; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=9bZTQfFErD83ZpeUe8f6tUjcWK8u+2HNM0QEJ6Cyo2s=;
 b=hFjUjvKR0JKs/dssdk3MOmFCIW3zrTofvZq+9VGGWnsKnyqLBoZPGYaUBP3GS8EXdr1DUl
 7ypoTNyPVIx/0+aNooOCTkLGGDTb77pTqCqArMCw7b+mFHgRZZi9uvCNxcTBPREg9OoZQx
 ksdvTDvQe6oT1rnst6F03X0B3SLkhWUZEUv2aZhwIt2yeeZDCxo9aq2dmfZ+0Ew7+oLf2/
 WJrP5yOehtVQAfPqWR9XQoddQ5Mk7ccY+SNhJ/uBinfZH7QYWETfKjLNgcl67vMRRqXT4F
 6IxEumVeXKw/Z9XOG2BWLq4ZH0QBJSJmZ2uB7oFY6rPOlXgC7J2efvVFLuPiPA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Schiffer <matthias.schiffer@tq-group.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [RESEND 1/2] drm: fsl-dcu: Use dev_err_probe
Date: Mon, 19 Feb 2024 13:24:48 +0100
Message-Id: <20240219122449.3083748-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
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

fsl_dcu_drm_modeset_init can return -EPROBE_DEFER, so use dev_err_probe
to remove an invalid error message and add it to deferral description.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
index a395f93449f3..90cbd18f096d 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
@@ -103,10 +103,8 @@ static int fsl_dcu_load(struct drm_device *dev, unsigned long flags)
 	int ret;
 
 	ret = fsl_dcu_drm_modeset_init(fsl_dev);
-	if (ret < 0) {
-		dev_err(dev->dev, "failed to initialize mode setting\n");
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev->dev, ret, "failed to initialize mode setting\n");
 
 	ret = drm_vblank_init(dev, dev->mode_config.num_crtc);
 	if (ret < 0) {
-- 
2.34.1

