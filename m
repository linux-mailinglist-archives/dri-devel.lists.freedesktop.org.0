Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF1DC68236
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 09:12:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70D7210E0C0;
	Tue, 18 Nov 2025 08:12:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=stgolabs.net header.i=@stgolabs.net header.b="IytJ168X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1201 seconds by postgrey-1.36 at gabe;
 Mon, 17 Nov 2025 16:10:15 UTC
Received: from purple.birch.relay.mailchannels.net
 (purple.birch.relay.mailchannels.net [23.83.209.150])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AF7A10E3E7
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 16:10:14 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id 3ECD02216CA;
 Mon, 17 Nov 2025 15:31:03 +0000 (UTC)
Received: from pdx1-sub0-mail-a208.dreamhost.com
 (trex-green-9.trex.outbound.svc.cluster.local [100.127.179.209])
 (Authenticated sender: dreamhost)
 by relay.mailchannels.net (Postfix) with ESMTPA id BEFA2222C66;
 Mon, 17 Nov 2025 15:31:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
 t=1763393462;
 b=6wWtlHgb6DcHRtWiS8u7InZ50dT80mcV1p4PM+m4OK9zoj0EkCno8I3sOgEVw28AhRO+O4
 b1WESpCqZmyz3kWb4F4DtkxgZzVVDx277iVrkbDWJIxQHaXClhi3EnFZKY2V9o38HTILQa
 IuLgak7o5GFDA0IEt1WRW1HAv4DHcEYeyAJj7HtkxxURAx76OTrcuiaFMZiRkt6MZjUTvC
 m5AykYz15Y7xz0P4PsRpUaFaaNgWnqoHY3eMvWCxg5cKnmUjKBWT5/QXqqXEU9UmPv6Fcu
 OeSgG2epVGVMsTHEKm29TZpAwr7fTpUIJneAtwxfsrOYtUuUIiTPdKuGSdDLHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net; s=arc-2022; t=1763393462;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:dkim-signature;
 bh=tmIcLJE21cuVExhp4i8hlplnFxVcK/+w7b0gmJCSvc0=;
 b=nFNYhF1F0Mpb3EE80zzBLkh1vv+L6jPcv8QQHEgxpTZy12ykXmnfKnIaROq91nl6HL6rJQ
 +NdV5kofpaIwzdjlOrD5hzTzGUwObjVQLyuAyXXYG5mkhHtWyJA8W/ULC22pva18HFzrtp
 Beeb6O92X7OVLrZW6pttdTCEfyFewuWC38LeJKsiIGgGF8G27gR2ICUE0Ykh6a+ZjbREE3
 cANUGRHKdryPrmYpYzHv04pzymJ16ccUHpUIoiaGAd3M70Sz9YAYkZszpGe0mTKilHWNMq
 ofJvULIR0ZEzs/V5qS1NNMytlQ8LXRU46ykgaWp5BRgimzVm1bJobNSC7cEQNA==
ARC-Authentication-Results: i=1; rspamd-5664d6b969-jw4bl;
 auth=pass smtp.auth=dreamhost smtp.mailfrom=dave@stgolabs.net
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Gusty-Ruddy: 5983744840ed8224_1763393463112_2942303523
X-MC-Loop-Signature: 1763393463112:3697356689
X-MC-Ingress-Time: 1763393463112
Received: from pdx1-sub0-mail-a208.dreamhost.com (pop.dreamhost.com
 [64.90.62.162]) (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
 by 100.127.179.209 (trex/7.1.3); Mon, 17 Nov 2025 15:31:03 +0000
Received: from offworld.lan (unknown [76.167.199.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dave@stgolabs.net)
 by pdx1-sub0-mail-a208.dreamhost.com (Postfix) with ESMTPSA id 4d9BXk0xM1z2x; 
 Mon, 17 Nov 2025 07:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
 s=dreamhost; t=1763393462;
 bh=tmIcLJE21cuVExhp4i8hlplnFxVcK/+w7b0gmJCSvc0=;
 h=From:To:Cc:Subject:Date:Content-Transfer-Encoding;
 b=IytJ168X4S9KZWN2ZBXQxYeGaiio3AYiEcycyY06nLXfp4rrM8Y/pn5o0Bj+qvjtb
 wX6hJ0to+djaavV9CsXJgkN3ttr/v4V+Tpjl+3VO2x+5EswVACTDVPPR8/H+s3ojLh
 YpBAVDA92hY1/hE7lbvxnaXSP7JVQ6sAUbrzSEUQxl6XFus8qz0boOisqBWyAGsv1I
 P4pyDBTzfc7aGJaOftgH+tFaVz5Rjf34KCDy5TmpPfvl2FUvrLb7SRQo75ojgTIY/D
 uxQ5TvuWkTYEnkn88UldWnfz7rPSQ00NktpvOENKkUZHseRe9MSdQ5Toznr8SoBk4b
 TWlRab4J4Henw==
From: Davidlohr Bueso <dave@stgolabs.net>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dave@stgolabs.net
Subject: [PATCH] gpu/drm: Use local kmap in drm_clflush_page()
Date: Mon, 17 Nov 2025 07:30:57 -0800
Message-Id: <20251117153057.1800631-1-dave@stgolabs.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 18 Nov 2025 08:12:21 +0000
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

Replace the now deprecated kmap_atomic() with kmap_local_page().

Optimize for the non-highmem cases and avoid disabling preemption and
pagefaults as clflushopt does not require being CPU locality guarantees
and the mapping will hold valid across context switches. Further, highmem
is planned to to be removed[1].

[1] https://lore.kernel.org/all/4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com/
Signed-off-by: Davidlohr Bueso <dave@stgolabs.net>
---
 drivers/gpu/drm/drm_cache.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_cache.c b/drivers/gpu/drm/drm_cache.c
index ea1d2d5d2c66..b6a309f827f8 100644
--- a/drivers/gpu/drm/drm_cache.c
+++ b/drivers/gpu/drm/drm_cache.c
@@ -57,10 +57,10 @@ drm_clflush_page(struct page *page)
 	if (unlikely(page == NULL))
 		return;
 
-	page_virtual = kmap_atomic(page);
+	page_virtual = kmap_local_page(page);
 	for (i = 0; i < PAGE_SIZE; i += size)
 		clflushopt(page_virtual + i);
-	kunmap_atomic(page_virtual);
+	kunmap_local(page_virtual);
 }
 
 static void drm_cache_flush_clflush(struct page *pages[],
-- 
2.39.5

