Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A842A66DBAD
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 11:59:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D07210E491;
	Tue, 17 Jan 2023 10:59:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 179C910E491
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 10:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1673953151; x=1705489151;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ozw0uC54/LYaa0bVtEywCyFj6gzjN7Xki0z4Y7/t+TY=;
 b=P4xYFv1wMim8jl1juYzfSPDsKvrS1lEONaSCpqKKBrbRS/Ex1o0IGDdt
 57u5s4mv94TrBVOSk77OdEapTPIHrd/CdEIoVPVyNZDATybXw5UvqV6uY
 C1l68KfsE0TKLdXPVncSSSAXrS8kZrsG5k8K0wEmtmQoIP+lgic7pCfcP
 9sPeQT/s5tS8U0y2J8i/BuuiY0iac1QWCMJUWTEsaM/V997e4DP37X+jW
 kDqJHb7102xPL4uR8TrXqYxx6a5db4TBpR2P+cCG8JDelPvDa/o6+wHY+
 Cr9SJx6kDqntmPETUU5PIR/KlhWkKSnQaOJJSkgsfT0vpVn01I8f+roxU w==;
X-IronPort-AV: E=Sophos;i="5.97,222,1669071600"; d="scan'208";a="28473620"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 17 Jan 2023 11:59:08 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Tue, 17 Jan 2023 11:59:08 +0100
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Tue, 17 Jan 2023 11:59:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1673953148; x=1705489148;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ozw0uC54/LYaa0bVtEywCyFj6gzjN7Xki0z4Y7/t+TY=;
 b=j5euxat7KT8dA8mjJ4kD0XqelruZQL2oNa3iPrHqeotItqAgO3vp5DDY
 tblXObD0VYZa2e8MSawc98tP5SQzqHOIZa1nXfb67esG8TgvKMTYodUdu
 Qhaxg+3W3cnnFJhw//fTHsds7WybKPZiv2XDsAwcPd5ymBveA6Zw+EDct
 AZ8K+8EAgg15MN0AlFwPH6VeZI0gq0CfByPls52Yi3L7hPtTa4zUf8iXV
 I9bvNi/fTPpn70qgIdDaVpW5s63kN1VayYT8ALCtHoxuBa0ZXmXBXToCQ
 9xFMaBBdn/OExdHOYVTC2RXOgngtNgPGdkpG7TJU8CzlxSIQXze0but5k Q==;
X-IronPort-AV: E=Sophos;i="5.97,222,1669071600"; d="scan'208";a="28473619"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 17 Jan 2023 11:59:08 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 60594280056;
 Tue, 17 Jan 2023 11:59:08 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 1/1] drm/bridge: sii902x: Use dev_err_probe
Date: Tue, 17 Jan 2023 11:59:03 +0100
Message-Id: <20230117105903.2068235-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This helps figuring out why the device probe is deferred.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/gpu/drm/bridge/sii902x.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
index d212ff7f7a87..f4a8f227c41b 100644
--- a/drivers/gpu/drm/bridge/sii902x.c
+++ b/drivers/gpu/drm/bridge/sii902x.c
@@ -1116,7 +1116,8 @@ static int sii902x_probe(struct i2c_client *client)
 		sii902x->next_bridge = of_drm_find_bridge(remote);
 		of_node_put(remote);
 		if (!sii902x->next_bridge)
-			return -EPROBE_DEFER;
+			return dev_err_probe(dev, -EPROBE_DEFER,
+					     "Failed to find remote bridge\n");
 	}
 
 	mutex_init(&sii902x->mutex);
-- 
2.34.1

