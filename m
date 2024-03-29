Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B17689199F
	for <lists+dri-devel@lfdr.de>; Fri, 29 Mar 2024 13:44:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 646CF1126CC;
	Fri, 29 Mar 2024 12:44:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="vCwAt0TZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51A301126D7
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Mar 2024 12:44:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F0A9B6192E;
 Fri, 29 Mar 2024 12:44:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C12AC433F1;
 Fri, 29 Mar 2024 12:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711716288;
 bh=ch8YjyWB1RWFmmfpIP5tddcgDn4YJeWGhzIDm7eEsD4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vCwAt0TZ2YspIaHMxiF6ehusGvhEo0WkDAoeOB75YWsOCd/GW8uBTCxPX8r7jzeBs
 lofRWCT3aio8LzWoi3zI0w0cpqfj3FXnDICMTDUkgWRv+o3WzRqWclCgv4ZpsuHrLS
 wvbK1IY2MgPjYg04vauqZu+49TWDEaujpL9n3X0LiHW2oCXkGkayCF9b7kpR643T6e
 RIqrT/HxdxhBe14C79TRM1x1d53MCG+3KJm3IoeSYG4d91FmBAXedX9H5P9m6aWykm
 M/O+fMu0sMy2fL29QNAJ73BIxdne94acAkAWjkRmpg+ark2CoZ+6eS1XRTNFaqkibN
 E9i3cgXaA8IPQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Koby Elbaz <kelbaz@habana.ai>, Oded Gabbay <ogabbay@kernel.org>,
 Sasha Levin <sashal@kernel.org>, ttayar@habana.ai, obitton@habana.ai,
 fkassabri@habana.ai, dhirschfeld@habana.ai, osharabi@habana.ai,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.6 41/75] accel/habanalabs: increase HL_MAX_STR to 64
 bytes to avoid warnings
Date: Fri, 29 Mar 2024 08:42:22 -0400
Message-ID: <20240329124330.3089520-41-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240329124330.3089520-1-sashal@kernel.org>
References: <20240329124330.3089520-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.23
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

From: Koby Elbaz <kelbaz@habana.ai>

[ Upstream commit 8c075401f2dbda43600c61f780a165abde77877a ]

Fix a warning of a buffer overflow:
‘snprintf’ output between 38 and 47 bytes into a destination of size 32

Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/accel/habanalabs/common/habanalabs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/habanalabs/common/habanalabs.h b/drivers/accel/habanalabs/common/habanalabs.h
index 05febd5b14e9c..179e5e7013a12 100644
--- a/drivers/accel/habanalabs/common/habanalabs.h
+++ b/drivers/accel/habanalabs/common/habanalabs.h
@@ -2508,7 +2508,7 @@ struct hl_state_dump_specs {
  * DEVICES
  */
 
-#define HL_STR_MAX	32
+#define HL_STR_MAX	64
 
 #define HL_DEV_STS_MAX (HL_DEVICE_STATUS_LAST + 1)
 
-- 
2.43.0

