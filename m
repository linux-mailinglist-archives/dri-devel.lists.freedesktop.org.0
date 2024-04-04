Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCD8899231
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 01:37:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A77A11365A;
	Thu,  4 Apr 2024 23:37:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="HpS2sHpu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D42CB113674
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Apr 2024 23:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1712273865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8ypcfm8f/5CHd95kPjs/R9gdMDLtVxLsgq1JjJ/htFQ=;
 b=HpS2sHpuUYeERA6wfmN5bafwHXKKhAQUmLr7mfURB43wbPrHfGowmX0tdMGPtXu5TBiDH5
 HoFi55qSmhuCe8E5n1zjHd3nlAMbnOFv2IkB3u8GuxYskDrDl5rsHZfvUmClSm+RnzfBYD
 hmiuT/Sb7yq2rX7zsu3KOcS0UNeQ7Ok=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-199-6pLPrQW0MIqKHr5AwYWBFw-1; Thu, 04 Apr 2024 19:37:41 -0400
X-MC-Unique: 6pLPrQW0MIqKHr5AwYWBFw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7E8858007A3;
 Thu,  4 Apr 2024 23:37:41 +0000 (UTC)
Received: from chopper.lyude.net (unknown [10.22.8.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9873F8173;
 Thu,  4 Apr 2024 23:37:40 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Karol Herbst <kherbst@redhat.com>, Danilo Krummrich <dakr@redhat.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] drm/nouveau/kms/nv50-: Disable AUX bus for disconnected
 DP ports
Date: Thu,  4 Apr 2024 19:35:53 -0400
Message-ID: <20240404233736.7946-2-lyude@redhat.com>
In-Reply-To: <20240404233736.7946-1-lyude@redhat.com>
References: <20240404233736.7946-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
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

GSP has its own state for keeping track of whether or not a given display
connector is plugged in or not, and enforces this state on the driver. In
particular, AUX transactions on a DisplayPort connector which GSP says is
disconnected can never succeed - and can in some cases even cause
unexpected timeouts, which can trickle up to cause other problems. A good
example of this is runtime power management: where we can actually get
stuck trying to resume the GPU if a userspace application like fwupd tries
accessing a drm_aux_dev for a disconnected port. This was an issue I hit a
few times with my Slimbook Executive 16 - where trying to offload something
to the discrete GPU would wake it up, and then potentially cause it to
timeout as fwupd tried to immediately access the dp_aux_dev nodes for
nouveau.

Likewise: we don't really have any cases I know of where we'd want to
ignore this state and try an aux transaction anyway - and failing pointless
aux transactions immediately can even speed things up. So - let's start
enabling/disabling the aux bus in nouveau_dp_detect() to fix this. We
enable the aux bus during connector probing, and leave it enabled if we
discover something is actually on the connector. Otherwise, we just shut it
off.

This should fix some people's runtime PM issues (like myself), and also get
rid of quite of a lot of GSP error spam in dmesg.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_dp.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
index fb06ee17d9e54..8b1be7dd64ebe 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dp.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
@@ -232,6 +232,9 @@ nouveau_dp_detect(struct nouveau_connector *nv_connector,
 	    dpcd[DP_DPCD_REV] != 0)
 		return NOUVEAU_DP_SST;
 
+	// Ensure that the aux bus is enabled for probing
+	drm_dp_dpcd_set_powered(&nv_connector->aux, true);
+
 	mutex_lock(&nv_encoder->dp.hpd_irq_lock);
 	if (mstm) {
 		/* If we're not ready to handle MST state changes yet, just
@@ -293,6 +296,13 @@ nouveau_dp_detect(struct nouveau_connector *nv_connector,
 	if (mstm && !mstm->suspended && ret != NOUVEAU_DP_MST)
 		nv50_mstm_remove(mstm);
 
+	/* GSP doesn't like when we try to do aux transactions on a port it considers disconnected,
+	 * and since we don't really have a usecase for that anyway - just disable the aux bus here
+	 * if we've decided the connector is disconnected
+	 */
+	if (ret == NOUVEAU_DP_NONE)
+		drm_dp_dpcd_set_powered(&nv_connector->aux, false);
+
 	mutex_unlock(&nv_encoder->dp.hpd_irq_lock);
 	return ret;
 }
-- 
2.44.0

