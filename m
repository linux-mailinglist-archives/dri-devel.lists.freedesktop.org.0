Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9031252D15F
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 13:24:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 478CF10E2C7;
	Thu, 19 May 2022 11:23:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E84B011A35E
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 11:23:49 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 8073C83BDB;
 Thu, 19 May 2022 13:23:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1652959428;
 bh=KW+9ViB5pzvRBUjFAW0Bj63gGgGCSaDRo9NCnBOYzt8=;
 h=From:To:Cc:Subject:Date:From;
 b=DPpLGQbKQrlK6fCHVY7S1toxTUBwAVNlejQzoBWU4IsX1m9dKYy1+Ba39TrdJv8hv
 yUMMrohbtEddXJpL/OD8XwcCo+wiaF7ICBHOmcxTyrpaLTkn4zrDI+zE1WOLOASt+o
 7ZHtVECGQrLtL8rVkvQtZk4OSq9FSQLlEN7dwnmrnbaZw+5tMosdkD0KnGzeBoDIW1
 Y8JARBplKf73ebkdA98gB6uWmjyqstWjHZw5LSq/DF1Bb3DEgUQsf9BihAF4Nbqir2
 OyNe0nDIqLRVdl4EiYThLv3f+R7oN7dtEXBQOt4FP2gRxonLVGWYSB3oRq8KZcuIRl
 GHk00SvLYVYaQ==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/bridge: anx7625: Add missing of_node_put for endpoint
Date: Thu, 19 May 2022 13:23:37 +0200
Message-Id: <20220519112337.62198-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, Javier Martinez Canillas <javierm@redhat.com>,
 robert.foss@linaro.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, Xin Ji <xji@analogixsemi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add of_node_put call on the endpoint node after it is not needed.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Xin Ji <xji@analogixsemi.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 53a5da6c49dd3..e92eb4a407452 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1638,6 +1638,7 @@ static int anx7625_parse_dt(struct device *dev,
 			bus_type = 0;
 
 		mipi_lanes = of_property_count_u32_elems(ep0, "data-lanes");
+		of_node_put(ep0);
 	}
 
 	if (bus_type == V4L2_FWNODE_BUS_TYPE_PARALLEL) /* bus type is Parallel(DSI) */
-- 
2.35.1

