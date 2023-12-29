Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6397C82014F
	for <lists+dri-devel@lfdr.de>; Fri, 29 Dec 2023 21:05:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05D7210E04F;
	Fri, 29 Dec 2023 20:05:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 475 seconds by postgrey-1.36 at gabe;
 Fri, 29 Dec 2023 20:05:31 UTC
Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com
 [IPv6:2001:41d0:203:375::ad])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C39110E04F
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Dec 2023 20:05:31 +0000 (UTC)
Message-ID: <4005041d-5e86-4c72-822d-8b4d90483807@sagacioussuricata.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sagacioussuricata.com; 
 s=key1; t=1703879854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=N84ii6hlAuTCtBXfTyvPhgNAFHwRxprkKK0Ej5hVvtc=;
 b=vmd8jpFItsxZg/1y49TjVrFGyvtQ4TLT4IJXXBADd+HIOybs9yabHDNgcnXvj9tilsXh+R
 lSfvIta/fVhlnGxVEc3+SJJDgSuOe2HsKjKlC7kg4YhOEmnlIPh/ehDklPUPdw/L4bkKv6
 npsxrSiQw/8BpNXlab/3dL6X0Utbr7b//jBvRyZUG7Pu6fSGX8HAQEg463Zre08XljnZV4
 XIFqeWbRsnrMpM8A57WsT72gTK3WHhKZiMBWX2v/mxImWNesjzMFyYHhdTYbHIZSwdRi59
 fM0znRNXe4xAYi2ofCFbXZPOFhb0xxBnft4bYRwFqgyo9vNIu/sylZDaxLoyGQ==
Date: Fri, 29 Dec 2023 19:57:31 +0000
MIME-Version: 1.0
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Daniel Fuchs <software@sagacioussuricata.com>
Subject: [PATCH] drm/panel: enable prepare_prev_first for BOE tv101wum
Content-Language: en-US
To: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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

After commit 9e15123eca79 ("drm/msm/dsi: Stop unconditionally
powering up DSI hosts at modeset"), the host DSI bridge can no
longer be assumed to be available. Enable prepare_prev_first for
the panel to ensure the DSI bridge is ready before panel init.

Fixes display on the IdeaPad Duet 3 (wormdingler).

Suggested-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Daniel Fuchs <software@sagacioussuricata.com>

diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
index c4c0f08e9202..82f4313adbc4 100644
--- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
@@ -1873,6 +1873,7 @@ static int boe_panel_add(struct boe_panel *boe)
 
 	drm_panel_init(&boe->base, dev, &boe_panel_funcs,
 		       DRM_MODE_CONNECTOR_DSI);
+	boe->base.prepare_prev_first = true;
 	err = of_drm_get_panel_orientation(dev->of_node, &boe->orientation);
 	if (err < 0) {
 		dev_err(dev, "%pOF: failed to get orientation %d\n", dev->of_node, err);
