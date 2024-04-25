Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 512A58B1A1A
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 07:03:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E310D11A0EE;
	Thu, 25 Apr 2024 05:03:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=kapsi.fi header.i=@kapsi.fi header.b="bfWxcSbf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55DF410F5C2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 05:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aPVMRTdlFL1UnVFeHStRQof3/O1C9D6JbXTmFYVJl0Q=; b=bfWxcSbfmatxCB11YxHNEchogK
 IM251thIcFIhfW95ww8Kur5+r1bWDx9DzJHZEDIU23cmuybwBvrQB+vWW2hQIogRkEoN2lSNsXlMd
 AmOQf3LKXbAIUitK2d7ZblfiFemMnwbJtkvP9bCOYMalyg888Jiqy1yoArOFCT6rHU3BsXO7X+y7h
 qc2gw9VUwFthAHHY2F24wie7egDYZHihHRm/nO+1wxQVW887geR1pwvD7s0y1/x2L+8xh2Yk3gMvl
 elDNXecWGrGJmHanJXgKg7lfD3rQ5XVl1P4q8SaFrkcio0PBizPgEJ6ZPfjZmXPXNWjZNqqQf1fHQ
 NFndDg7w==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=toshino.localdomain) by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <cyndis@kapsi.fi>) id 1rzrG7-00Fmla-2b;
 Thu, 25 Apr 2024 08:02:59 +0300
From: Mikko Perttunen <cyndis@kapsi.fi>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH 4/5] gpu: host1x: Add MLOCK recovery for rest of engines
Date: Thu, 25 Apr 2024 08:02:36 +0300
Message-ID: <20240425050238.2943404-4-cyndis@kapsi.fi>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240425050238.2943404-1-cyndis@kapsi.fi>
References: <20240425050238.2943404-1-cyndis@kapsi.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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

From: Mikko Perttunen <mperttunen@nvidia.com>

Add class IDs / MLOCKs for MLOCK recovery for rest of engines
present on Tegra234.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/host1x/hw/cdma_hw.c | 12 ++++++++++++
 include/linux/host1x.h          |  5 +++++
 2 files changed, 17 insertions(+)

diff --git a/drivers/gpu/host1x/hw/cdma_hw.c b/drivers/gpu/host1x/hw/cdma_hw.c
index 1b65a10b9dfc..3f3f0018eee0 100644
--- a/drivers/gpu/host1x/hw/cdma_hw.c
+++ b/drivers/gpu/host1x/hw/cdma_hw.c
@@ -254,12 +254,24 @@ static void timeout_release_mlock(struct host1x_cdma *cdma)
 	u32 offset;
 
 	switch (ch->client->class) {
+	case HOST1X_CLASS_NVJPG1:
+		offset = HOST1X_COMMON_NVJPG1_MLOCK;
+		break;
+	case HOST1X_CLASS_NVENC:
+		offset = HOST1X_COMMON_NVENC_MLOCK;
+		break;
 	case HOST1X_CLASS_VIC:
 		offset = HOST1X_COMMON_VIC_MLOCK;
 		break;
+	case HOST1X_CLASS_NVJPG:
+		offset = HOST1X_COMMON_NVJPG_MLOCK;
+		break;
 	case HOST1X_CLASS_NVDEC:
 		offset = HOST1X_COMMON_NVDEC_MLOCK;
 		break;
+	case HOST1X_CLASS_OFA:
+		offset = HOST1X_COMMON_OFA_MLOCK;
+		break;
 	default:
 		WARN(1, "%s was not updated for class %u", __func__, ch->client->class);
 		return;
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index 9c8119ed13a4..5a7a81e5f9bd 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -14,12 +14,17 @@
 
 enum host1x_class {
 	HOST1X_CLASS_HOST1X = 0x1,
+	HOST1X_CLASS_NVJPG1 = 0x7,
+	HOST1X_CLASS_NVENC = 0x21,
+	HOST1X_CLASS_NVENC1 = 0x22,
 	HOST1X_CLASS_GR2D = 0x51,
 	HOST1X_CLASS_GR2D_SB = 0x52,
 	HOST1X_CLASS_VIC = 0x5D,
 	HOST1X_CLASS_GR3D = 0x60,
+	HOST1X_CLASS_NVJPG = 0xC0,
 	HOST1X_CLASS_NVDEC = 0xF0,
 	HOST1X_CLASS_NVDEC1 = 0xF5,
+	HOST1X_CLASS_OFA = 0xF8,
 };
 
 struct host1x;
-- 
2.42.0

