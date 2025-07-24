Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D263FB11348
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 23:50:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8CF610E3ED;
	Thu, 24 Jul 2025 21:50:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=iitb.ac.in header.i=@iitb.ac.in header.b="iBWYiLY/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 348 seconds by postgrey-1.36 at gabe;
 Thu, 24 Jul 2025 16:14:35 UTC
Received: from smtp1.iitb.ac.in (smtpd10.iitb.ac.in [103.21.126.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD13410E05D
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 16:14:35 +0000 (UTC)
Received: from ldns2.iitb.ac.in (ldns2.iitb.ac.in [10.200.12.2])
 by smtp1.iitb.ac.in (Postfix) with SMTP id A302B1014A3C
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 21:38:43 +0530 (IST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.iitb.ac.in A302B1014A3C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=iitb.ac.in; s=mail;
 t=1753373323; bh=PBtZjclGvWMG1gSoG68HfxNQCP8AO1bqgt1liPtj8Yw=;
 h=Date:From:To:Cc:Subject:From;
 b=iBWYiLY/W/6ZuNiPRi27fx74KBIjT0gON3Vv0Q4u3pU14SpIcmOr6LDWC5bVNiu8o
 jq25sBZqtcrXlZynUfOdzubyXDOKbmkgYkRAUMzYwQy7tu11WwkJxZlT5/PFPKAx6c
 +pB6hGdlQGpXFN99NlBtM9FIaPdAy2s93lxukMW4=
Received: (qmail 25085 invoked by uid 510); 24 Jul 2025 21:38:43 +0530
X-Qmail-Scanner-Diagnostics: from 10.200.1.25 by ldns2 (envelope-from
 <akhilesh@ee.iitb.ac.in>, uid 501) with qmail-scanner-2.11
 spamassassin: 3.4.1. mhr: 1.0. {clamdscan: 0.100.0/26337} 
 Clear:RC:1(10.200.1.25):SA:0(0.0/7.0):. Processed in 3.901129 secs;
 24 Jul 2025 21:38:43 +0530
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on ldns2.iitb.ac.in
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=7.0 tests=IITB_ORIG,PROPER_IITB_MSGID,
 URIBL_BLOCKED autolearn=disabled version=3.4.1
X-Spam-Pyzor: Reported 0 times.
X-Envelope-From: akhilesh@ee.iitb.ac.in
X-Qmail-Scanner-Mime-Attachments: |
X-Qmail-Scanner-Zip-Files: |
Received: from unknown (HELO ldns2.iitb.ac.in) (10.200.1.25)
 by ldns2.iitb.ac.in with SMTP; 24 Jul 2025 21:38:39 +0530
Received: from bhairav.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
 by ldns2.iitb.ac.in (Postfix) with ESMTP id E929F3414E6;
 Thu, 24 Jul 2025 21:38:38 +0530 (IST)
Received: from bhairav-test.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
 (Authenticated sender: akhilesh)
 by bhairav.ee.iitb.ac.in (Postfix) with ESMTPSA id B38B91E813B7;
 Thu, 24 Jul 2025 21:38:38 +0530 (IST)
Date: Thu, 24 Jul 2025 21:38:32 +0530
From: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 asrivats@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 akhileshpatilvnit@gmail.com, skhan@linuxfoundation.org
Subject: [PATCH] drm: panel: orisetech: improve error handling during probe
Message-ID: <aIJagJ/RnhSCtb2t@bhairav-test.ee.iitb.ac.in>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailman-Approved-At: Thu, 24 Jul 2025 21:50:37 +0000
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

Use dev_err_probe() helper as directed by core driver model to handle
driver probe error. Use standard helper defined at drivers/base/core.c
to maintain code consistency.

Inspired by,
commit a787e5400a1ce ("driver core: add device probe log helper")

Signed-off-by: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
---
 drivers/gpu/drm/panel/panel-orisetech-ota5601a.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-orisetech-ota5601a.c b/drivers/gpu/drm/panel/panel-orisetech-ota5601a.c
index fc87f61d4400..e971d1536654 100644
--- a/drivers/gpu/drm/panel/panel-orisetech-ota5601a.c
+++ b/drivers/gpu/drm/panel/panel-orisetech-ota5601a.c
@@ -277,11 +277,8 @@ static int ota5601a_probe(struct spi_device *spi)
 		       DRM_MODE_CONNECTOR_DPI);
 
 	err = drm_panel_of_backlight(&panel->drm_panel);
-	if (err) {
-		if (err != -EPROBE_DEFER)
-			dev_err(dev, "Failed to get backlight handle\n");
-		return err;
-	}
+	if (err)
+		return dev_err_probe(dev, err, "Failed to get backlight handle\n");
 
 	drm_panel_add(&panel->drm_panel);
 
-- 
2.34.1

