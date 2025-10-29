Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63756C18C37
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 08:47:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABFC210E712;
	Wed, 29 Oct 2025 07:47:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VDT2OqsA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E938710E714
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 07:47:55 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-7a27053843bso9564592b3a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 00:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761724075; x=1762328875; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=q30GbqlTwe2nQMX4UB7blFcjur++GRluVV4AWK8Q6Ek=;
 b=VDT2OqsAdBoyD7BeUjv5nzqOBS8J0rzA352UYrWv5DVGITVkcqFY1fb+hzYLFg7caj
 nrYXr5CfLeMawb0pRtmfluWAa/RUuAaydd+LMT9XmDep0126nR42uXEI6OhBASsRWZOf
 VYQxathO7tS72eA/mukFtE7zHPoEA3LU/68QoaXZSQxH/TGQWSwyQ2TApYsxtKUSGVK0
 a2VwgzBTHfZBEPk0AJFNURv1tY3WGYrKFJiHkEwna0Odscfgd8Ow+pvKzRMFRN49ptlL
 RzdXDzGeLncODFZ5Mva1XPLRe6jnwUjMICUmA849xHPi2mY9hjjuoxtJCMSmNK8i33Nt
 OpfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761724075; x=1762328875;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q30GbqlTwe2nQMX4UB7blFcjur++GRluVV4AWK8Q6Ek=;
 b=SNyZAw5tbGeJs7IFDxQAKRWsuLHMLLFyZ8UkXIKbiu7hv3gytiO74FxkkDJouqerYB
 1g6VJ3cXAa4P8TvXSrTgETr+dELCbmwP9iSnHNnFE3nlk55eWrPhunAzicDPimJoV8m5
 OR6XLbH2Sb7Y0YNZtP2CF2vVMRAM0NdV7bbotDCMTTUQbDn4Yn4gjysFMoK50B/RAdpq
 b8/fJiWx/e79jugL2LuflyB1718PUASIbbl2CHP/OVfCtEBRkJhVcyap7o25HvPo+W2K
 xYt7KoIB0jKDJBVtRbF75biwAA46V0Td5IyQcNltuJHYaWbwRLRO/WObfGyI6DlQH7Ji
 3lcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3Hu967Ty+CyfL1ikFX9fuc64z1clp7VzB0tYGQdI3KwaDKhOVRAkNT+4nPmcTv7Vhx1dzl33zw0w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxG5YubQv4i0nWw82n6FgxCQZcyZ8XDu2l1ZBoXjndcibFk0c5G
 5//r0nDW5OsUcc2PM/EEYToS76MmsEjNw/qiNUDf0smIt91+W3ZbXUk8
X-Gm-Gg: ASbGncsBQv7BCoFKuGOk6nVEWiPhU4nmTFjAP8spQ34eBpVigstGQDM8lMXQHhz9kVC
 Rpa00LTXrDD21sB5jIGZc/rVpW+xIUUlLkcrO05QkzwtE7ekHya4sKFEgXNRo+6TiKDX1mutiR6
 aknMY/7zk1Vlqmu+NDNI0DaLa8K7Io4iagzzkapz5MClx/V36IcvEkl3yd2Yb8MYR27+KA/r3Jf
 RQiUH2kIYn0i7Q6D6lOIJeHP2PktLnIt6pRrf/05m7KhYBKXqcLizQ0rSzOqbQV5n8qcOfb19a9
 Cy89tCYSqRAYgyqfRvZEiYDHb2+2sFfq6Yi/4e5RcIZKVQvEEaIqdyudyMaL9dyGbXTt3Jnpk4I
 OBq3zf8/laOpPH6ORCA5k1Yyvmo94P0CEU506ACcSu7TwwQBkUcs+ihWfbrDhq6s1afnZz79FzE
 efMoncp+a8gTOCudrl2kBhfA==
X-Google-Smtp-Source: AGHT+IFuC13ebf9tUyrUJPnxA/BVzsjUbwXpoTRR8n0eYfWFABlmJzwguFPrChLih2199JwTZmChYQ==
X-Received: by 2002:a62:e90c:0:b0:77f:50df:df36 with SMTP id
 d2e1a72fcca58-7a4e4c1ce32mr2077224b3a.18.1761724075412; 
 Wed, 29 Oct 2025 00:47:55 -0700 (PDT)
Received: from localhost.localdomain ([124.77.218.104])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-7a41408c4dfsm14201813b3a.65.2025.10.29.00.47.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 29 Oct 2025 00:47:55 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Wadim Egorov <w.egorov@phytec.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: linmq006@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH] drm/bridge: sii902x: Fix device node reference leak
 sii902x_probe
Date: Wed, 29 Oct 2025 15:47:36 +0800
Message-Id: <20251029074737.18282-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
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

of_graph_get_endpoint_by_regs() gets a reference to the endpoint node
to read the "bus-width" property but fails to call of_node_put()
to release the reference, causing a reference count leak.

Add the missing of_node_put() call to fix this.

Found via static analysis and code review.

Fixes: d284ccd8588c ("drm/bridge: sii902x: Set input bus format based on bus-width")
Cc: stable@vger.kernel.org
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/gpu/drm/bridge/sii902x.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
index d537b1d036fb..3a247ac3c7dd 100644
--- a/drivers/gpu/drm/bridge/sii902x.c
+++ b/drivers/gpu/drm/bridge/sii902x.c
@@ -1189,8 +1189,10 @@ static int sii902x_probe(struct i2c_client *client)
 
 	sii902x->bus_width = 24;
 	endpoint = of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);
-	if (endpoint)
+	if (endpoint) {
 		of_property_read_u32(endpoint, "bus-width", &sii902x->bus_width);
+		of_node_put(endpoint);
+	}
 
 	endpoint = of_graph_get_endpoint_by_regs(dev->of_node, 1, -1);
 	if (endpoint) {
-- 
2.39.5 (Apple Git-154)

