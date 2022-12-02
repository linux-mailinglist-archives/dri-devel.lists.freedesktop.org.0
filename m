Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4445263FD37
	for <lists+dri-devel@lfdr.de>; Fri,  2 Dec 2022 01:42:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA97B10E68F;
	Fri,  2 Dec 2022 00:42:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1446 seconds by postgrey-1.36 at gabe;
 Fri, 02 Dec 2022 00:42:47 UTC
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AD4B10E68F
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Dec 2022 00:42:47 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2B20IKms085110;
 Thu, 1 Dec 2022 18:18:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1669940300;
 bh=QvkX6gPAkplxVtIrptAwJOcWAuTdEKHrkzxaF5ql/hA=;
 h=From:To:CC:Subject:Date;
 b=vDIu4V0nitQ/t4EXfnBM657T1OBOD/1yeapsEzi6KkUBBxV+C0X0OxKuc7J1iwuYR
 XNYQRxBlAJQCNH4g1VmoBI8Zhc58IGmXZG1fdj3XUwFbFf1Ajo2L6IS8PNGWRx+8oq
 zVhej0q/ZeiDZCzhpJk9jOHIp6NGw0c0sYX301Uc=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2B20IKRo017865
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 1 Dec 2022 18:18:20 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 1
 Dec 2022 18:18:20 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Thu, 1 Dec 2022 18:18:20 -0600
Received: from res.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2B20IKgS086413;
 Thu, 1 Dec 2022 18:18:20 -0600
From: Randolph Sapp <rs@ti.com>
To: <jyri.sarha@iki.fi>, <tomba@kernel.org>
Subject: [PATCH] drm: tidss: Fix pixel format definition
Date: Thu, 1 Dec 2022 18:18:03 -0600
Message-ID: <20221202001803.1765805-1-rs@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Randolph Sapp <rs@ti.com>, dri-devel@lists.freedesktop.org,
 a-bhatia1@ti.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There was a long-standing bug from a typo that created 2 ARGB1555 and
ABGR1555 pixel format entries. Weston 10 has a sanity check that alerted
me to this issue.

According to the Supported Pixel Data formats table we have the later
entries should have been for Alpha-X instead.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 drivers/gpu/drm/tidss/tidss_dispc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index ad93acc9abd2..16301bdfead1 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -1858,8 +1858,8 @@ static const struct {
 	{ DRM_FORMAT_XBGR4444, 0x21, },
 	{ DRM_FORMAT_RGBX4444, 0x22, },
 
-	{ DRM_FORMAT_ARGB1555, 0x25, },
-	{ DRM_FORMAT_ABGR1555, 0x26, },
+	{ DRM_FORMAT_XRGB1555, 0x25, },
+	{ DRM_FORMAT_XBGR1555, 0x26, },
 
 	{ DRM_FORMAT_XRGB8888, 0x27, },
 	{ DRM_FORMAT_XBGR8888, 0x28, },
-- 
2.34.1

