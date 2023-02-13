Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 163F1695230
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 21:50:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2213910E719;
	Mon, 13 Feb 2023 20:49:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8024010E717;
 Mon, 13 Feb 2023 20:49:56 +0000 (UTC)
Received: from mx0.riseup.net (mx0-pn.riseup.net [10.0.1.42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mx0.riseup.net", Issuer "R3" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4PFxKw1Zg0zDqCJ;
 Mon, 13 Feb 2023 20:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1676321396; bh=tJfjNJCSBuOsQxjOLfCloRrxClQEzj3cjIynnI8X/5Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NnYRtN8/q+J4fBVXH5/3sZzgZ+BUBT0PT2vdcIiaM+gA1e/KWnW8O2u+6yfl3ZS68
 cC6PjnoeHUO2xtMNP+22qfwnGIULNlspO3gaK6W8x8NA4ajIfHFeanIZOEXywHCILj
 rtkZqf5247qKVxJxEtZT/BCJ3UgufUyX4yFygrmk=
Received: from fews2.riseup.net (fews2-pn.riseup.net [10.0.1.84])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx0.riseup.net (Postfix) with ESMTPS id 4PFxKv41B3z9sm7;
 Mon, 13 Feb 2023 20:49:55 +0000 (UTC)
X-Riseup-User-ID: 49B6C23F6B034937D37A5702EBB026C424B501D7744FA75301F3E2B49314B49F
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews2.riseup.net (Postfix) with ESMTPSA id 4PFxKn4M7Bz1yPW;
 Mon, 13 Feb 2023 20:49:49 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 01/10] drm/amd/display: Turn global functions into static
Date: Mon, 13 Feb 2023 17:49:14 -0300
Message-Id: <20230213204923.111948-2-arthurgrillo@riseup.net>
In-Reply-To: <20230213204923.111948-1-arthurgrillo@riseup.net>
References: <20230213204923.111948-1-arthurgrillo@riseup.net>
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
Cc: sunpeng.li@amd.com, tales.aparecida@gmail.com, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, Arthur Grillo <arthurgrillo@riseup.net>,
 mairacanal@riseup.net, alexander.deucher@amd.com, andrealmeid@riseup.net,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Turn global functions that are only used locally into static ones. This
reduces the number of -Wmissing-prototypes warnings.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c | 2 +-
 drivers/gpu/drm/amd/display/dc/irq/dcn201/irq_service_dcn201.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c
index 8c368bcc8e7e..a737782b2840 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c
@@ -87,7 +87,7 @@ static int dcn315_get_active_display_cnt_wa(
 	return display_count;
 }
 
-bool should_disable_otg(struct pipe_ctx *pipe)
+static bool should_disable_otg(struct pipe_ctx *pipe)
 {
 	bool ret = true;
 
diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn201/irq_service_dcn201.c b/drivers/gpu/drm/amd/display/dc/irq/dcn201/irq_service_dcn201.c
index 27dc8c9955f4..3c7cb3dc046b 100644
--- a/drivers/gpu/drm/amd/display/dc/irq/dcn201/irq_service_dcn201.c
+++ b/drivers/gpu/drm/amd/display/dc/irq/dcn201/irq_service_dcn201.c
@@ -37,7 +37,7 @@
 #include "soc15_hw_ip.h"
 #include "ivsrcid/dcn/irqsrcs_dcn_1_0.h"
 
-enum dc_irq_source to_dal_irq_source_dcn201(
+static enum dc_irq_source to_dal_irq_source_dcn201(
 		struct irq_service *irq_service,
 		uint32_t src_id,
 		uint32_t ext_id)
-- 
2.39.1

