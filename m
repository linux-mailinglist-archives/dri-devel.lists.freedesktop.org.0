Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B5F40C46F
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 13:36:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2D246E924;
	Wed, 15 Sep 2021 11:36:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-canonical-1.canonical.com
 (smtp-relay-canonical-1.canonical.com [185.125.188.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C4356E91C;
 Wed, 15 Sep 2021 11:36:13 +0000 (UTC)
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 242C43F108; 
 Wed, 15 Sep 2021 11:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1631705772;
 bh=V6LVzXE8Uk9yBBqq1mcc0plej4doxWMczd7CQVzrmXE=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
 b=ogqCQSpnBeuq6PVLoHl8FXEFw2TKAcude+jsq1cum948uGBZR38EDu04WIr3N+iuT
 dv6XfEkU9VK4Awi7aMeCsoz/0IxqhY/ruyB5QFhn3CeCxd9GbgM7vaP3oQ1j3JaSA9
 HwvkVYuSbKx8bTzvRr7L7AdpjNQarzp3FvFRLsq+JY04Vt8Uv5PgiPN/TzJqK9d5ol
 LD/l50RpbwSc6hzAYzqV6xOsN4Ra31JZEIVsQmAm1AnjBzF4lU5OcDXNFoHNzp3M6q
 iVQEO1juz4Q3Dt5lqonuS0G/fV6QWQmJw2MxaMarVTUhTDhVHygisjInoQS/SQij/9
 da7aiQFv+Ol+g==
From: Colin King <colin.king@canonical.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui.Pan@amd.com, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/radeon: make array encoded_lanes static
Date: Wed, 15 Sep 2021 12:36:11 +0100
Message-Id: <20210915113611.13620-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.32.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Colin Ian King <colin.king@canonical.com>

Don't populate the read-only array encoded_lanes on the stack but instead it
static. Also makes the object code smaller by 97 bytes:

Before:
   text    data    bss     dec    hex filename
  38899    8064      0   46963   b773 ./drivers/gpu/drm/radeon/r600_dpm.o

After:
   text    data    bss     dec    hex filename
  38738    8128      0   46866   b712 ./drivers/gpu/drm/radeon/r600_dpm.o

(gcc version 11.2.0)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/radeon/r600_dpm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/r600_dpm.c b/drivers/gpu/drm/radeon/r600_dpm.c
index fd4226b99862..9d2bcb9551e6 100644
--- a/drivers/gpu/drm/radeon/r600_dpm.c
+++ b/drivers/gpu/drm/radeon/r600_dpm.c
@@ -1361,7 +1361,9 @@ u16 r600_get_pcie_lane_support(struct radeon_device *rdev,
 
 u8 r600_encode_pci_lane_width(u32 lanes)
 {
-	u8 encoded_lanes[] = { 0, 1, 2, 0, 3, 0, 0, 0, 4, 0, 0, 0, 5, 0, 0, 0, 6 };
+	static const u8 encoded_lanes[] = {
+		0, 1, 2, 0, 3, 0, 0, 0, 4, 0, 0, 0, 5, 0, 0, 0, 6
+	};
 
 	if (lanes > 16)
 		return 0;
-- 
2.32.0

