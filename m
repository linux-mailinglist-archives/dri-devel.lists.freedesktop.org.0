Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A41FA64DEC4
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 17:38:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AA3910E3C0;
	Thu, 15 Dec 2022 16:37:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE13610E377;
 Thu, 15 Dec 2022 16:37:52 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6AD1861E58;
 Thu, 15 Dec 2022 16:37:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEDEDC433D2;
 Thu, 15 Dec 2022 16:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671122269;
 bh=RV+MWWk++Ih2bkesG4BCmtmkZAUvC1BBjtjl9erq92U=;
 h=From:To:Cc:Subject:Date:From;
 b=HBBGEmENzDsR6v2JzTk9TsAw9a5xMy9TsGY6JZDw1L0qqzQqPIY07i8Qw2odeYYUg
 qqxgxiB9NJXMLxLCaAk33gZIBI+IOaUEvqtdIgJzxgo/5ykUWho5ljgwWk1yrQzAz4
 f0TUSjbzj0c6VqOhrB/VkJA/B5J+FqIYxqM11wNxjGgNe+0im4oWCBXyOdYU6zlssx
 wsY6ynr08+JA0+mt4x20OnPZgyhQcpRPib361frVWiv9bcenSBL0itX5DV5OHiRIBq
 9JI7gmWa5Yq9BiUJ7Fr7FvjrUXaQtLHCL9qOgWA4jAEG4CIe79ZlNpUHiC5BeRTlQc
 u1ea7XRG0LeKg==
From: Arnd Bergmann <arnd@kernel.org>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Subject: [PATCH] drm/amd/display: fix dp_retrieve_lttpr_cap return code
Date: Thu, 15 Dec 2022 17:37:10 +0100
Message-Id: <20221215163743.452648-1-arnd@kernel.org>
X-Mailer: git-send-email 2.35.1
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
Cc: Alan Liu <HaoPing.Liu@amd.com>, Arnd Bergmann <arnd@arndb.de>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Wenjing Liu <wenjing.liu@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, George Shen <george.shen@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

The dp_retrieve_lttpr_cap() return type changed from 'bool'
to 'enum dc_status', so now the early 'return' uses the wrong
type:

drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c: In function 'dp_retrieve_lttpr_cap':
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c:5075:24: error: implicit conversion from 'enum <anonymous>' to 'enum dc_status' [-Werror=enum-conversion]
 5075 |                 return false;
      |                        ^~~~~

Convert it to return 'DC_OK', which is the same value as 'false'.

Fixes: b473bd5fc333 ("drm/amd/display: refine wake up aux in retrieve link caps")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
No idea if DC_OK is the intended return code, but it leaves the behavior
unchanged and fixes the warning.
---
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
index af9411ee3c74..95dbfa4e996a 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
@@ -5095,7 +5095,7 @@ enum dc_status dp_retrieve_lttpr_cap(struct dc_link *link)
 	bool vbios_lttpr_interop = link->dc->caps.vbios_lttpr_aware;
 
 	if (!vbios_lttpr_interop || !link->dc->caps.extended_aux_timeout_support)
-		return false;
+		return DC_OK;
 
 	/* By reading LTTPR capability, RX assumes that we will enable
 	 * LTTPR extended aux timeout if LTTPR is present.
-- 
2.35.1

