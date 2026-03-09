Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EEYzCHbArmlEIgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 13:43:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FF52390A6
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 13:43:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E43A110E4DB;
	Mon,  9 Mar 2026 12:43:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="XPBE3rHI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 447D310E4DB
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 12:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1773060207;
 bh=no3kiz7ooCRGH5uWGRp4If36+fhqGDtHgp8ejQ+S/HQ=;
 h=From:To:Cc:Subject:Date:From;
 b=XPBE3rHIw7p+XMfRng580H58AHDzVO90mThFwYASwI+ACRomMugTSFQx5Sa1w29vM
 UcEUtt8yWasi9+jRY4r2QgaT1p+ZT3tEScwpC9Mq8d89eFLMtrXOAI0v30MaC6Gw0J
 tcgst6YER0zHk41vrhj43t31l7U6JMF6EVdJ7k/ervd+ZKTJADMJdjxibKIiPZO7EL
 WLp/0EezGnZTOApQfc2DyMypVnAMbpvPHvf9k/6e5jP9eDRH2cuK/XDqse0GclchRm
 Z07ITwMZ4EanxrSkOAJ7enAJj/0y9sp+epM4d4zyymPMjTFF4obJytyG7W3bw8yC7d
 iZdfXZWaKwS8Q==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 8644517E041C;
 Mon,  9 Mar 2026 13:43:27 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH v2] drm/panthor: Fix the "done_fence is initialized" detection
 logic
Date: Mon,  9 Mar 2026 13:43:18 +0100
Message-ID: <20260309124318.222902-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
X-Rspamd-Queue-Id: A7FF52390A6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:steven.price@arm.com,m:liviu.dudau@arm.com,m:adrian.larumbe@collabora.com,m:kernel@collabora.com,m:nicolas.frattaroli@collabora.com,m:tvrtko.ursulin@igalia.com,m:phasta@kernel.org,m:christian.koenig@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.977];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:dkim,collabora.com:email,collabora.com:mid,amd.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,arm.com:email]
X-Rspamd-Action: no action

After commit 541c8f2468b9 ("dma-buf: detach fence ops on signal v3"),
dma_fence::ops == NULL can't be used to check if the fence is initialized.
Use dma_fence_was_initialized() instead.

v2:
- Use dma_fence_was_initialized() instead of open-coding it

Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Philipp Stanner <phasta@kernel.org>
Cc: Christian König <christian.koenig@amd.com>
Reported-by: Steven Price <steven.price@arm.com>
Reported-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Fixes: 541c8f2468b9 ("dma-buf: detach fence ops on signal v3")
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_sched.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index bd703a2904a1..c15941ebe07a 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -3915,7 +3915,7 @@ static void job_release(struct kref *ref)
 	if (job->base.s_fence)
 		drm_sched_job_cleanup(&job->base);
 
-	if (job->done_fence && job->done_fence->ops)
+	if (dma_fence_was_initialized(job->done_fence))
 		dma_fence_put(job->done_fence);
 	else
 		dma_fence_free(job->done_fence);
-- 
2.53.0

