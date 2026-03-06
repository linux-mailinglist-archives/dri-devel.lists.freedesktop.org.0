Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4LORNJbtqmmOYAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 16:07:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63FAE22376A
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 16:07:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 687D010E3BE;
	Fri,  6 Mar 2026 15:06:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gMT4GAbG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A264F10E3BE;
 Fri,  6 Mar 2026 15:06:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A09F460127;
 Fri,  6 Mar 2026 15:06:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37261C2BC87;
 Fri,  6 Mar 2026 15:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772809616;
 bh=iPL1KTeGN4AZsj8P3Tdxd7pG3wQBIceCKNb1YSqkPQs=;
 h=From:To:Cc:Subject:Date:From;
 b=gMT4GAbGOkUvu7pEf3WSi3riN6UMGc5YzMkkvLDOlXF+526ctQGhiD7ZvUv7QRw1y
 tkpngcTHQl6PVkTm6iDdT7ksvB487fQzQ9G2+28JjpKpmOG/AQhd/5gVMTijwGHGo6
 j0Dc2oHYklqBmie9o/HMFV+H3H96yXyZ/C7qokdgEeIcBFWA/DJb3NkM3TKnFLy7ap
 BGowVtLGopwB1UpOEBQk8A+sBDQkJyoh2Z5593Fq/vLqtC+Xr6EJBvQLH4SX5E1mPn
 39EcZqvYSeB7RCuev2v77NDvRLkPCfES0nYPqcQMUl5VQS4rOAgd77T9H1efqY2z9A
 79eDEe1Je/u7Q==
From: Arnd Bergmann <arnd@kernel.org>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Timur Tabi <ttabi@nvidia.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Dave Airlie <airlied@redhat.com>,
 Ben Skeggs <bskeggs@nvidia.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/nouveau: avoid
 -Wtautological-constant-out-of-range-compare warning
Date: Fri,  6 Mar 2026 16:06:44 +0100
Message-Id: <20260306150650.465132-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
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
X-Rspamd-Queue-Id: 63FAE22376A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[redhat.com,kernel.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,nvidia.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.972];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arndb.de:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

From: Arnd Bergmann <arnd@arndb.de>

Checking a large 64-bit constant against a 32-bit dma_addr_t produces a harmless
compiler output when extra warnings are enabled, but leads to a build failure
with -Werror:

drivers/gpu/drm/nouveau/nvkm/subdev/fb/gb202.c:17:37: error: result of comparison of constant 4503599627370495 with expression of type 'dma_addr_t' (aka 'unsigned int') is always false [-Werror,-Wtautological-constant-out-of-range-compare]
   17 |         WARN_ON(fb->sysmem.flush_page_addr > DMA_BIT_MASK(52));

As the calculations of sysmem.flush_page_addr are mostly done on u64 types anyway,
change the struct member to the same type. This feels less invasive than changing
each WARN_ON() to add an extra cast or extended condition to shut up the warning.

Fixes: 31d3354f42c0 ("drm/nouveau: verify that hardware supports the flush page address")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/nouveau/include/nvkm/subdev/fb.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/fb.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/fb.h
index e0d777a933e1..7b932449606b 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/fb.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/fb.h
@@ -38,7 +38,7 @@ struct nvkm_fb {
 
 	struct {
 		struct page *flush_page;
-		dma_addr_t flush_page_addr;
+		u64 flush_page_addr;
 	} sysmem;
 
 	struct nvkm_ram *ram;
-- 
2.39.5

