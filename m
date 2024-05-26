Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1D28CF5EB
	for <lists+dri-devel@lfdr.de>; Sun, 26 May 2024 22:22:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDB8010F60A;
	Sun, 26 May 2024 20:22:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="PhiVssvG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-185.mta1.migadu.com (out-185.mta1.migadu.com
 [95.215.58.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA34A10F609
 for <dri-devel@lists.freedesktop.org>; Sun, 26 May 2024 20:22:14 +0000 (UTC)
X-Envelope-To: rfoss@kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1716754932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HQejp35xdHl089YksIdueCjCLA/1BLC6JglYUKdLrzM=;
 b=PhiVssvGa0otgkxBvZ6vngXfyNqXoYz2Td1XFsCxUXvwz5Y4MevBR8yY1/HMUCcdTJRlcu
 zZXSkQan1Nyxd9NG89c86Y6VCJ+4Ok/+J8JhggcZ0Zbi3n0ejfPIpJCu2nRHTmEdOfU9+M
 9oP9XD5m5a2RxER8e0NFI2n37N7g4lE=
X-Envelope-To: laurent.pinchart@ideasonboard.com
X-Envelope-To: dri-devel@lists.freedesktop.org
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: sui.jingfeng@linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH v6 09/10] drm/bridge: sii9234: Use fwnode APIs to abstract DT
 dependent API away
Date: Mon, 27 May 2024 04:21:14 +0800
Message-Id: <20240526202115.129049-10-sui.jingfeng@linux.dev>
In-Reply-To: <20240526202115.129049-1-sui.jingfeng@linux.dev>
References: <20240526202115.129049-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

Switch to use the freshly created drm_bridge_set_node() helper, no
functional changes. The reason behind of this introduction is that
the name 'of_node' itself has a smell of DT dependent, and it is a
internal memeber, when there has helper function, we should use the
revelant helper and avoid directly referencing and/or dereferencing
it.

Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/bridge/sii9234.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/sii9234.c b/drivers/gpu/drm/bridge/sii9234.c
index 7d2bbc31bac9..d930c093abb3 100644
--- a/drivers/gpu/drm/bridge/sii9234.c
+++ b/drivers/gpu/drm/bridge/sii9234.c
@@ -817,10 +817,11 @@ static int sii9234_init_resources(struct sii9234 *ctx,
 				  struct i2c_client *client)
 {
 	struct i2c_adapter *adapter = client->adapter;
+	struct fwnode_handle *fwnode = dev_fwnode(ctx->dev);
 	int ret;
 
-	if (!ctx->dev->of_node) {
-		dev_err(ctx->dev, "not DT device\n");
+	if (!fwnode) {
+		dev_err(ctx->dev, "firmware data is missing\n");
 		return -ENODEV;
 	}
 
-- 
2.34.1

