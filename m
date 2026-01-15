Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4286DD222DA
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 03:46:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37E1410E69E;
	Thu, 15 Jan 2026 02:46:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="Ksve7xAH";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="bAPnzDGu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22C0010E69E
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 02:46:20 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4ds6n63z5Mz9trS;
 Thu, 15 Jan 2026 03:46:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1768445178;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=d/1QSeTzrWabOvfIEmXJgMe2fp7T/EyAvskHtqfPXeE=;
 b=Ksve7xAHJKHBvRA7Edg13FQIsO64hN0Yw4VOX5BmQXpLMYPeGDuBm1kdRJkJY44J0YvMzy
 ikArzQ+dG56CPZDocUJgaBmofTEQSwaRDKZfE7VbtUTGl1tRNL22/KAvOe/ipNTQz+4LXr
 4tiJh+DFXYJ6CFlDgOpR8ImpUdS/iPaPIkVm06oXAEcvhmknL9sSv9FlVSeHpuAfBKZ2RD
 RXOkOiZqdCDfda7fSrtoMdM+zZkQq0yQmpKPzHrkiAKVQ9lyUj6k/Pr2l366UN90tc0JUT
 kDTz4+/DFH6rrtHi+93xnWsOnk+3702y8q8OJQr5zXHiLryzsmp24lNzOFRUEA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1768445176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=d/1QSeTzrWabOvfIEmXJgMe2fp7T/EyAvskHtqfPXeE=;
 b=bAPnzDGupixWypxdC+KAA+Q0lRebkdH9zne5xWIvwW5NK3JqM9vbbAMytNboVRXt1HJk0+
 z0vCRu8dTp0jgmOhj2U17Wll/JZ2NtB74EDwtjMtSIh3lZI/tl82x0326IcpouE1QDeTPv
 LKylz0AfKbxrIXF0hctCtIl9xa6EVoPjZnFl8KtfBKkb28gkD9yOPlOY7Iw+uNdZLAGtGk
 S359O6pRduutVPouEyflyENAO/VNr4azNBxocZXZsDRzxgDJb6JAY6uhcFYirCecCed6pc
 Qy554lCxZiT43DCYiTrI7R56Zjmy0DalNKxUNtHBcaD3y2n452cM3Q5TZcpZmw==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Subject: [PATCH] drm: of: Fix drm_of_get_data_lanes_count_ep() return value
 documentation
Date: Thu, 15 Jan 2026 03:45:53 +0100
Message-ID: <20260115024610.661624-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: k3mgt68uxbhygtis8d6z9j3aens847xy
X-MBO-RS-ID: 6285f9d1f4e94d0c0d5
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

Update drm_of_get_data_lanes_count_ep() return value documentation
to match the drm_of_get_data_lanes_count() return value documentation.
The drm_of_get_data_lanes_count_ep() is only a wrapper around the
drm_of_get_data_lanes_count() and therefore returns the same error
codes.

Fixes: fc801750b197 ("drm: of: Add drm_of_get_data_lanes_count and drm_of_get_data_lanes_ep")
Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: David Airlie <airlied@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/gpu/drm/drm_of.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index 4f65ce729a473..cfd0518174de8 100644
--- a/drivers/gpu/drm/drm_of.c
+++ b/drivers/gpu/drm/drm_of.c
@@ -539,8 +539,8 @@ EXPORT_SYMBOL_GPL(drm_of_get_data_lanes_count);
  *
  * Return:
  * * min..max - positive integer count of "data-lanes" elements
- * * -EINVAL - the "data-mapping" property is unsupported
- * * -ENODEV - the "data-mapping" property is missing
+ * * -ve - the "data-lanes" property is missing or invalid
+ * * -EINVAL - the "data-lanes" property is unsupported
  */
 int drm_of_get_data_lanes_count_ep(const struct device_node *port,
 				   int port_reg, int reg,
-- 
2.51.0

