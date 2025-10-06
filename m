Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 863E6BBFB8E
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 00:44:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1764510E138;
	Mon,  6 Oct 2025 22:44:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=cse.ust.hk header.i=@cse.ust.hk header.b="rr1hTbhk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 818 seconds by postgrey-1.36 at gabe;
 Mon, 06 Oct 2025 17:02:37 UTC
Received: from cse.ust.hk (cssvr7.cse.ust.hk [143.89.41.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BA5710E039;
 Mon,  6 Oct 2025 17:02:37 +0000 (UTC)
Received: from homelab ([58.82.196.128]) (authenticated bits=0)
 by cse.ust.hk (8.18.1/8.12.5) with ESMTPSA id 596GmgIw1681762
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 7 Oct 2025 00:48:48 +0800
ARC-Seal: i=1; a=rsa-sha256; d=cse.ust.hk; s=arccse; t=1759769329; cv=none;
 b=u6BffOttA8edvq5IIWlw9D1OXn2Vr3IujB1iv5/YVGSAyYWdvDXGKTveF+Qwt0EbM3s/zbje00wKGaV22g7Kjmeqad4oeTKo++3wNbK0UiDmEOT51cQmpI318YD3P5bUFI85a0z0KpdV4IskRWzE1R13hfLqd7+2P2maZJhNDOA=
ARC-Message-Signature: i=1; a=rsa-sha256; d=cse.ust.hk; s=arccse;
 t=1759769329; c=relaxed/relaxed;
 bh=oGM5vpkyAsmTUtIk5RM/tQs1EUajj7ebFZCNrR8AKuM=;
 h=DKIM-Signature:Date:From:To:Subject:Message-ID:MIME-Version;
 b=dWG2tclzCd7pY3zf9u139f/jMzECNovrotpDIJz2ntrNKiiWcf7TR2piWkJ2/PRTacxjNwkCGb14W5JaMh8Nhq32pp66/2LesOrcygahuAQWrSNCBNjtJ9Bi6Up3JmUgmY49dEUug5akuW+toF8CWsJio3xW92P4fp9C+FtcrJc=
ARC-Authentication-Results: i=1; cse.ust.hk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cse.ust.hk;
 s=cseusthk; t=1759769329;
 bh=oGM5vpkyAsmTUtIk5RM/tQs1EUajj7ebFZCNrR8AKuM=;
 h=Date:From:To:Cc:Subject:From;
 b=rr1hTbhk3kH283RzkS+LstTZ/Q6xtM/rNNbKf32pI4LBMi9nX0E7z1NbamBUsCqMD
 bQal8nrd73l9hHOSSXoYylr6ep+jsG5Utz4tOs2dMap+dj/M7Ni+fTepHvfLhAfUEb
 s97sW8Zkyo4FWz1TQz+wTDNhJNZIybfmOjeS28cw=
Date: Tue, 7 Oct 2025 00:48:37 +0800
From: Shuhao Fu <sfual@cse.ust.hk>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Subject: [PATCH] drm/nouveau: Fix refcount leak in nouveau_connector_detect
Message-ID: <aOPy5aCiRTqb9kjR@homelab>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Env-From: sfual
X-Mailman-Approved-At: Mon, 06 Oct 2025 22:44:46 +0000
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

A possible inconsistent refcount update has been identified in function
`nouveau_connector_detect`, which may cause a resource leak.

After calling `pm_runtime_get_*(dev->dev)`, the usage counter of `dev->dev`
gets increased. In case function `nvif_outp_edid_get` returns negative,
function `nouveau_connector_detect` returns without decreasing the usage
counter of `dev->dev`, causing a refcount inconsistency.

Signed-off-by: Shuhao Fu <sfual@cse.ust.hk>
Closes: https://gitlab.freedesktop.org/drm/nouveau/-/issues/450
---
 drivers/gpu/drm/nouveau/nouveau_connector.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 63621b151..45caccade 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -600,8 +600,10 @@ nouveau_connector_detect(struct drm_connector *connector, bool force)
 				new_edid = drm_get_edid(connector, nv_encoder->i2c);
 		} else {
 			ret = nvif_outp_edid_get(&nv_encoder->outp, (u8 **)&new_edid);
-			if (ret < 0)
-				return connector_status_disconnected;
+			if (ret < 0) {
+				conn_status = connector_status_disconnected;
+				goto out;
+			}
 		}
 
 		nouveau_connector_set_edid(nv_connector, new_edid);
-- 
2.39.5

