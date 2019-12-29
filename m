Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9322512C399
	for <lists+dri-devel@lfdr.de>; Sun, 29 Dec 2019 18:21:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 919A68934B;
	Sun, 29 Dec 2019 17:21:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE8848934B
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Dec 2019 17:21:46 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 36FD920722;
 Sun, 29 Dec 2019 17:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1577640105;
 bh=/OftrGjIqofA/1Jh5wjoEAE3U7CtCrQxKG3N/DyesZ0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qUYVSMC4GczfZaGW5/FBVFKSs17tl4IfklWGZ2UYe4kgGNpwveCfnfJ0TZwq3n2HS
 AdrtGQsAgdu98pPNOKFnGdnTdBP5PVTQrEYFPjm7d3KUw8x1hxvIGep9tibOSa9AzW
 r5AAzeQAL1/mGe00FMQhD0Pz0hHHwhO//ER4LOj4=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 4.14 020/161] drm: mst: Fix query_payload ack reply struct
Date: Sun, 29 Dec 2019 18:17:48 +0100
Message-Id: <20191229162403.009203257@linuxfoundation.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191229162355.500086350@linuxfoundation.org>
References: <20191229162355.500086350@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
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
Cc: Todd Previte <tprevite@gmail.com>, Sasha Levin <sashal@kernel.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Sean Paul <seanpaul@chromium.org>,
 dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

[ Upstream commit 268de6530aa18fe5773062367fd119f0045f6e88 ]

Spec says[1] Allocated_PBN is 16 bits

[1]- DisplayPort 1.2 Spec, Section 2.11.9.8, Table 2-98

Fixes: ad7f8a1f9ced ("drm/helper: add Displayport multi-stream helper (v0.6)")
Cc: Lyude Paul <lyude@redhat.com>
Cc: Todd Previte <tprevite@gmail.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20190829165223.129662-1-sean@poorly.run
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 include/drm/drm_dp_mst_helper.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_dp_mst_helper.h b/include/drm/drm_dp_mst_helper.h
index d55abb75f29a..eec6cba204ea 100644
--- a/include/drm/drm_dp_mst_helper.h
+++ b/include/drm/drm_dp_mst_helper.h
@@ -313,7 +313,7 @@ struct drm_dp_resource_status_notify {
 
 struct drm_dp_query_payload_ack_reply {
 	u8 port_number;
-	u8 allocated_pbn;
+	u16 allocated_pbn;
 };
 
 struct drm_dp_sideband_msg_req_body {
-- 
2.20.1



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
