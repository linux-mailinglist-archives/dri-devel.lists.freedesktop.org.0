Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8AA9863F4
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 17:43:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30C7310EA64;
	Wed, 25 Sep 2024 15:43:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="W0WsIQUx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74FF710EA52;
 Wed, 25 Sep 2024 15:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zPvVsOHukMZnajyg/RPQ+3mmZw7xkw50bkFZLNoHM5U=; b=W0WsIQUxRD87HD7c6zEYyqVMsE
 aE4zH2CN0/d+oEbYjHHHRfXYnQPIXGbxH1GGxm1Rfjqnd2uqJxTWH4U4pH1ZovWA5xh2+3rTtfN0t
 KTBDdU/tSiwmuV1Cox+X6Y/Fui++i8sC8bGtfncoOGyi6vSNgLDJZovkRLYjjRWUDYw5OexNbxxB6
 YzAHOHIdcv/F81wk9fT5MY36ZErHhezQ35hEX9yC205oCRbJkYF4coWLxIiuxNXWE/5vt9oVI8Hlj
 lYaO785ANFvh8UXMYKXqNTjS0McmeStwe4mBLUaiqfkusxDK9TsjDjMaqSR0irHT9NI2xN0whLxMH
 bdUp1MJQ==;
Received: from [189.6.17.125] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1stUAw-000y8P-TX; Wed, 25 Sep 2024 17:43:35 +0200
From: Melissa Wen <mwen@igalia.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/amd/display: increase max surfaces in line with
 planes and streams
Date: Wed, 25 Sep 2024 12:37:18 -0300
Message-ID: <20240925154324.348774-2-mwen@igalia.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240925154324.348774-1-mwen@igalia.com>
References: <20240925154324.348774-1-mwen@igalia.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

091a97e542cf ("drm/amd/display: Fix warning. Set MAX_SURFACES to 3")
reduced the max number of surfaces since, at that time, there was no use
for more. However, HW and driver evolves and there are now driver
versions that allow two overlay planes (max_slave_planes). Moreover,
commit 3cfd03b79425 ("drm/amd/display: update max streams per surface")
states 6 is the max surfaces supported asics can have. Therefore, update
MAX_SURFACES to match MAX_SURFACE_NUM, MAX_PLANES and MAX_STREAMS.

It also addresses array-index-out-of-bounds reported in the link.

Link: https://gitlab.freedesktop.org/drm/amd/-/issues/3594
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/amd/display/dc/dc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index 3992ad73165b..08b00b263533 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -57,7 +57,7 @@ struct dmub_notification;
 
 #define DC_VER "3.2.301"
 
-#define MAX_SURFACES 3
+#define MAX_SURFACES 6
 #define MAX_PLANES 6
 #define MAX_STREAMS 6
 #define MIN_VIEWPORT_SIZE 12
-- 
2.45.2

