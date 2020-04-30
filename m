Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 625621BF9FD
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 15:51:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6209D6E8AC;
	Thu, 30 Apr 2020 13:51:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F08496E8AC
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 13:51:07 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2B0562137B;
 Thu, 30 Apr 2020 13:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588254667;
 bh=PQO2qszkR2ZOJGdXJ9WPdFL9T2v4oNVLb9SEfQ0GBfE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LaVjopSsE41AZx8PuqKNVTBlNfy7BvBJFIcAw2sbOTRijv7IQvuqySAWal04CSaxH
 1xvcKsNJrm6LhUER3goWj0BVw3xIgoMyMiR16kz7V3o9Bl0oWElMr5GNocnFOI28Y2
 FdTizDNNc2XEKVcz2OcysdZ+lPTccT4sduTeh05w=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.6 20/79] drm/bridge: anx6345: set correct BPC for
 display_info of connector
Date: Thu, 30 Apr 2020 09:49:44 -0400
Message-Id: <20200430135043.19851-20-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200430135043.19851-1-sashal@kernel.org>
References: <20200430135043.19851-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Vasily Khoruzhick <anarsoul@gmail.com>, Sasha Levin <sashal@kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Vasily Khoruzhick <anarsoul@gmail.com>

[ Upstream commit 1e8a6ce9186dbf342eebc07cf14cae5e82164e03 ]

Some drivers (e.g. sun4i-drm) need this info to decide whether they
need to enable dithering. Currently driver reports what panel supports
and if panel supports 8 we don't get dithering enabled.

Hardcode BPC to 6 for now since that's the only BPC
that driver supports.

Fixes: 6aa192698089 ("drm/bridge: Add Analogix anx6345 support")
Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
Acked-by: Jernej Skrabec <jernej.skrabec@siol.net>
Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
Link: https://patchwork.freedesktop.org/patch/msgid/20200329222253.2941405-1-anarsoul@gmail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/bridge/analogix/analogix-anx6345.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
index 526507102c1ea..8d32fea84c75e 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
@@ -485,6 +485,9 @@ static int anx6345_get_modes(struct drm_connector *connector)
 
 	num_modes += drm_add_edid_modes(connector, anx6345->edid);
 
+	/* Driver currently supports only 6bpc */
+	connector->display_info.bpc = 6;
+
 unlock:
 	if (power_off)
 		anx6345_poweroff(anx6345);
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
