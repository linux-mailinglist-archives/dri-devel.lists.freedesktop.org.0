Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2656D189277
	for <lists+dri-devel@lfdr.de>; Wed, 18 Mar 2020 01:10:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DC416E265;
	Wed, 18 Mar 2020 00:10:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 455 seconds by postgrey-1.36 at gabe;
 Wed, 18 Mar 2020 00:10:38 UTC
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [216.205.24.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B0D16E265
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 00:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584490237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5ZGul9wAdAsYKRs6DsvL3qGxyS9Wfr9NLLvWL1Wy7L4=;
 b=Mi7MWmNJdbvSkOHiQ1HdPEoZLfV9HFNW45Ws3nhyD9X+GEtQ0Nv1NsjxusPitNGv6lI4xg
 1RKtTUxv2GfnTujaN0FTh3YXMxszENcGHCFjQg5gKIuOlPgM5J1itE/wC6YPoTXD599JmA
 T/PPY+Rb/VPLOkyIA8Y1rITKbxqSka0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-PKDNyvXWM0KupGYUccKZuw-1; Tue, 17 Mar 2020 20:04:28 -0400
X-MC-Unique: PKDNyvXWM0KupGYUccKZuw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9DA8F1137840;
 Wed, 18 Mar 2020 00:04:27 +0000 (UTC)
Received: from whitewolf.redhat.com (ovpn-113-173.rdu2.redhat.com
 [10.10.113.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B3C3B5DA81;
 Wed, 18 Mar 2020 00:04:26 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
Subject: [PATCH 2/2] drm/nouveau/connector: Fix DDC error when probing
 force-disabled connectors
Date: Tue, 17 Mar 2020 20:04:23 -0400
Message-Id: <20200318000423.205005-2-lyude@redhat.com>
In-Reply-To: <20200318000423.205005-1-lyude@redhat.com>
References: <20200318000423.205005-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_connector.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 0d42a7e5deff..9fb00c4b9764 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -550,6 +550,9 @@ nouveau_connector_detect(struct drm_connector *connector, bool force)
 	int ret;
 	enum drm_connector_status conn_status = connector_status_disconnected;
 
+	if (connector->force == DRM_FORCE_OFF)
+		return conn_status;
+
 	/* Cleanup the previous EDID block. */
 	if (nv_connector->edid) {
 		drm_connector_update_edid_property(connector, NULL);
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
