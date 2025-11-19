Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44781C702C8
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 17:44:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5445C10E678;
	Wed, 19 Nov 2025 16:43:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="P1LqKfnC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AD0F10E036;
 Wed, 19 Nov 2025 16:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1763570626;
 bh=xKKVQjhFCD4L9vNzkMfPXyX6itdkqpxxDrT938bt8lw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=P1LqKfnCZ0k7+GH+oWodhONjQMqqYVcUsUWjC6ISqj6zbzD4me8esWh+5FeYBI/SS
 74/WqpCWdoJWR0zgR5BRiRphMRjFiYIrlno4BG6qgi8mLk2HbqBpLMCP8jtEISqmYP
 YuxCTUyjtf5R+7Ntu7LVkkvLZRq6p9e7j7HF/hLfIZQ9YrFARlzXCz8NPelU9fmA8G
 21eN5CGa2SK6iXLfRYFry5V1HNSz/G6v30ShXPFyC1hynAVRX8SdvDC7MJWA5wBwjy
 YNZ92BHH3nbJ/6D42cGarH5lbuOSBiM9f5FW1UWsEQiJIYYaihGXDFzYhQTRjzVrhQ
 IkuPFhyAgP3wA==
Received: from localhost.localdomain (unknown [92.206.121.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: gerddie)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 5A5A517E13B2;
 Wed, 19 Nov 2025 17:43:46 +0100 (CET)
From: gert.wollny@collabora.com
To: Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Gert Wollny <gert.wollny@collabora.com>,
 Christian Gmeiner <cgmeiner@igalia.com>
Subject: [PATCH v5 3/5] drm/etnaviv: Add a new function to emit a series of
 states to cmd stream
Date: Wed, 19 Nov 2025 17:45:49 +0100
Message-ID: <20251119164624.9297-4-gert.wollny@collabora.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251119164624.9297-1-gert.wollny@collabora.com>
References: <20251110144625.18653-1-gert.wollny@collabora.com>
 <20251119164624.9297-1-gert.wollny@collabora.com>
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

From: Gert Wollny <gert.wollny@collabora.com>

v2: fix formatting and remove superfluous masking (Lucas)

Signed-off-by: Gert Wollny <gert.wollny@collabora.com>
Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_buffer.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_buffer.h b/drivers/gpu/drm/etnaviv/etnaviv_buffer.h
index 4cf77cdee..c5a0d1fb9 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_buffer.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_buffer.h
@@ -36,6 +36,19 @@ static inline void CMD_LOAD_STATE(struct etnaviv_cmdbuf *buffer, u32 reg,
 	OUT(buffer, value);
 }
 
+static inline void CMD_LOAD_STATES_START(struct etnaviv_cmdbuf *buffer, u32 reg,
+					 u32 nvalues)
+{
+	u32 index = reg >> VIV_FE_LOAD_STATE_HEADER_OFFSET__SHR;
+
+	buffer->user_size = ALIGN(buffer->user_size, 8);
+
+	/* write a register via cmd stream */
+	OUT(buffer, VIV_FE_LOAD_STATE_HEADER_OP_LOAD_STATE |
+			    VIV_FE_LOAD_STATE_HEADER_OFFSET(index) |
+			    VIV_FE_LOAD_STATE_HEADER_COUNT(nvalues));
+}
+
 static inline void CMD_END(struct etnaviv_cmdbuf *buffer)
 {
 	buffer->user_size = ALIGN(buffer->user_size, 8);
-- 
2.51.0

