Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F155F93D9
	for <lists+dri-devel@lfdr.de>; Mon, 10 Oct 2022 01:50:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39BE610E2A8;
	Sun,  9 Oct 2022 23:50:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D11210E204;
 Sun,  9 Oct 2022 23:50:07 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 79DAE60D2B;
 Sun,  9 Oct 2022 23:50:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A3E1C433C1;
 Sun,  9 Oct 2022 23:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665359405;
 bh=flhMqOyp2jHHYjkvWABjQ6X28xgOgGeP/qWxCP2QoLs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gXY7GBBUA9z8rwrz64Cv3ZJ4LLxHDaAHVnbqulwE9Eelp2Y4Io/x+MRYJT4/xaX08
 8jQKWq7d1u/wRkAUeJiNe05H+Re5SSxJbEcj1HlVIHNdCPSugeCWaOMYeFC1QjEjIf
 FR/eUAVj/iQx4N522K+zYiTnz9VzArsZoX/6oSM9axZyUBDJgv69momh2+kBOxE6vu
 VgRu0Aiyxnospb7A0xYI732PffR3NkW+TVf0KCiIIAeJuW6fVzRaI8/WJqstC3QgKv
 AXQQma7W5bsgdFPXHjGP0dilwHWob9h075s6gFVsivI8TTq7FRfAsBVdF8ph5m+XUo
 5+QHZUe5iU8Aw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.0 11/44] drm/amd: fix potential memory leak
Date: Sun,  9 Oct 2022 19:48:59 -0400
Message-Id: <20221009234932.1230196-11-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221009234932.1230196-1-sashal@kernel.org>
References: <20221009234932.1230196-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Charlene.Liu@amd.com, Eric.Yang2@amd.com,
 sunpeng.li@amd.com, Bernard Zhao <bernard@vivo.com>, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, amd-gfx@lists.freedesktop.org,
 nicholas.kazlauskas@amd.com, mwen@igalia.com, michael.strauss@amd.com,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com, agustin.gutierrez@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Bernard Zhao <bernard@vivo.com>

[ Upstream commit 6160216fd2c97107e8a9ab39863b056d677fcd85 ]

This patch fix potential memory leak (clk_src) when function run
into last return NULL.

s/free/kfree/ - Alex

Signed-off-by: Bernard Zhao <bernard@vivo.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c
index 44ac1c2aabf5..b96e8089aaa3 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c
@@ -1719,6 +1719,7 @@ static struct clock_source *dcn30_clock_source_create(
 	}
 
 	BREAK_TO_DEBUGGER();
+	kfree(clk_src);
 	return NULL;
 }
 
-- 
2.35.1

