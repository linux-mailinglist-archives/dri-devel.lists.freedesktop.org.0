Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F78C6E5398
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 23:06:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBFC110E600;
	Mon, 17 Apr 2023 21:06:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BD3510E5FF;
 Mon, 17 Apr 2023 21:06:11 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6D28962A35;
 Mon, 17 Apr 2023 21:06:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDCABC433D2;
 Mon, 17 Apr 2023 21:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681765569;
 bh=An4/qvBICNxrZq3RM6ajIvQGCH7WWPRxMuUGkIjf4xE=;
 h=From:To:Cc:Subject:Date:From;
 b=Lmi7RyLY/b4hnJV6EwWzVz51lWwZ/+MRxXeXhB63HP882GQTBywrF8b0NFVjr6yG2
 0pUXOTbNvsU1e8AP+VcRhoKdRYO/qLc9BsxidmVqMWfok+yNzK9qH15uJCgTLKvsJe
 uGgIYz/wLd/a4PlEPGmeZ5yrHRHfwSW5mfl+z5YMAC1tjuXwcVFebz1wa0Y8Z9mLi8
 2+VH22T2QOU629Drfn5WvW6nW4b0TlCxMs+Sm1CAdjn5dGhJWCHWGTPm59QexCljS2
 wXQpmbjXLy9wBm/qRR9eAzKAC6iWy/MQQ+6PRZKTlvEdl2KRgg2Y/UwpGbhyoY/91G
 3WmsHLn94Qe2Q==
From: Arnd Bergmann <arnd@kernel.org>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 1/2] drm/amd/display: mark dccg314_init() static
Date: Mon, 17 Apr 2023 23:05:42 +0200
Message-Id: <20230417210602.2614198-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
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
Cc: dri-devel@lists.freedesktop.org, Arnd Bergmann <arnd@arndb.de>,
 Alex Hung <alex.hung@amd.com>, Qingqing Zhuo <qingqing.zhuo@amd.com>,
 Taimur Hassan <Syed.Hassan@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Michael Strauss <michael.strauss@amd.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>, Jasdeep Dhillon <jdhillon@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

The newly introduced global function is not declared in a header or
called from another file, causing a harmless warning with sparse
or W=1 builds:

drivers/gpu/drm/amd/amdgpu/../display/dc/dcn314/dcn314_dccg.c:277:6: error: no previous prototype for 'dccg314_init' [-Werror=missing-prototypes]

Mark it static instead.

Fixes: 6f6869dcf415 ("drm/amd/display: prep work for root clock optimization enablement for DCN314")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dccg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dccg.c b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dccg.c
index 6f879265ad9c..de7bfba2c179 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dccg.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dccg.c
@@ -274,7 +274,7 @@ static void dccg314_set_dpstreamclk(
 	}
 }
 
-void dccg314_init(struct dccg *dccg)
+static void dccg314_init(struct dccg *dccg)
 {
 	int otg_inst;
 
-- 
2.39.2

