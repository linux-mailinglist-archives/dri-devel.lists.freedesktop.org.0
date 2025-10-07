Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58378BC01FF
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 06:04:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 938EF10E028;
	Tue,  7 Oct 2025 04:04:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=cse.ust.hk header.i=@cse.ust.hk header.b="jfn+RmI1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cse.ust.hk (cssvr7.cse.ust.hk [143.89.41.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA9A210E028;
 Tue,  7 Oct 2025 04:04:11 +0000 (UTC)
Received: from homelab ([58.82.196.128]) (authenticated bits=0)
 by cse.ust.hk (8.18.1/8.12.5) with ESMTPSA id 59743mdj1771219
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 7 Oct 2025 12:03:55 +0800
ARC-Seal: i=1; a=rsa-sha256; d=cse.ust.hk; s=arccse; t=1759809836; cv=none;
 b=T1WbFvfnBYEUNuIOIvGpFDE9orlW8x1mdVxnfaj4txoooaus4Q9n2tHW9XOONrSOlddmyMXYJWyA0070MwNETOkQDKjIGh61aSg2SJMzhZtPtKxE7efi/3T2IFrN8j4iGxxfF4blaQLl9tOf5B+5uNC2jbVUaNtD09X8wibtnR0=
ARC-Message-Signature: i=1; a=rsa-sha256; d=cse.ust.hk; s=arccse;
 t=1759809836; c=relaxed/relaxed;
 bh=2BuDrMCvXr8B/qHQB25frmKIvNC9+6LCEg5JZzFlymM=;
 h=DKIM-Signature:Date:From:To:Subject:Message-ID:MIME-Version;
 b=oxxn7q6HkNFPdef6+6k7iJ2nNoi8IWeMTm+UbmxwsXM+PQgp59Z1JSRqk9CSEKZq04rC3/o0x/aRZ8M0uJg/cm6ETbATkv0GxSK+B+TDvlUX9N6mt4zpZUZm7R9Ibt2biKW2AucFl+cgtJzo/FSQxJ0kWvYFPKRdYs1HNCo9tf8=
ARC-Authentication-Results: i=1; cse.ust.hk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cse.ust.hk;
 s=cseusthk; t=1759809836;
 bh=2BuDrMCvXr8B/qHQB25frmKIvNC9+6LCEg5JZzFlymM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jfn+RmI1LhrzmfgZHBXmjkWlFqeBxz9oJMiMU5pObEau78tJ++bQn8rfcpHhWuxxz
 masxt3EChGz6Wi3B5MD5o0dZ1vn/whblbKhG2OT7HS4h8Xb5Qj3KxWcfrcC19PNy1X
 mrU87mE2Z2pyl1lJVixZf+EMK1YCfRuKF5iB+4jM=
Date: Tue, 7 Oct 2025 12:03:42 +0800
From: Shuhao Fu <sfual@cse.ust.hk>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Subject: [PATCH v2] drm/nouveau: Fix refcount leak in nouveau_connector_detect
Message-ID: <aOSRHjpaLTzeImD5@homelab>
References: <aOPy5aCiRTqb9kjR@homelab>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aOPy5aCiRTqb9kjR@homelab>
X-Env-From: sfual
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
Fixes: 0cd7e0718139 ("drm/nouveau/disp: add output method to fetch edid")
Cc: stable@vger.kernel.org

Change in v2:
- Add "Fixes" and "Cc" tags
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
-                       if (ret < 0)
-                               return connector_status_disconnected;
+                       if (ret < 0) {
+                               conn_status = connector_status_disconnected;
+                               goto out;
+                       }
                }

                nouveau_connector_set_edid(nv_connector, new_edid);
--
2.39.5

