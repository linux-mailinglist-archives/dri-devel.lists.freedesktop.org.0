Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F056BC3358
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 05:20:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5823310E741;
	Wed,  8 Oct 2025 03:20:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=cse.ust.hk header.i=@cse.ust.hk header.b="O1mWmbhe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cse.ust.hk (cssvr7.cse.ust.hk [143.89.41.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9208210E741;
 Wed,  8 Oct 2025 03:20:23 +0000 (UTC)
Received: from osx.local (ecs-119-8-240-33.compute.hwclouds-dns.com
 [119.8.240.33]) (authenticated bits=0)
 by cse.ust.hk (8.18.1/8.12.5) with ESMTPSA id 5983K89V1969764
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 8 Oct 2025 11:20:14 +0800
ARC-Seal: i=1; a=rsa-sha256; d=cse.ust.hk; s=arccse; t=1759893615; cv=none;
 b=rcPP8yLtXjCv4k/DLipdIwhSVZ5CwYt/xRFq7i0sc44nIC1QHO6MKK6f4NMvuQ8kYDya1k01xg07pUe2fM3cXzrsuq+OJWSQdo8LQCS9USU+itC8yK2FujLsLpkMTCmEiHkvUa3UPZ9mfTNiDN7YE8cQdqJhQjQDQJ2rOQyn4Rw=
ARC-Message-Signature: i=1; a=rsa-sha256; d=cse.ust.hk; s=arccse;
 t=1759893615; c=relaxed/relaxed;
 bh=WuLSA2EjkrLhSQFnaBGCNZGIYOqkvds6auE54bA3lWQ=;
 h=DKIM-Signature:Date:From:To:Subject:Message-ID:MIME-Version;
 b=cSCrFM+NEka5AqGCOg0vIypTESoI7v1+4r5/Iw+kIN7yny9+mcqkVFeAOpPi2vuB63bMjH9YfY+PwtIsi39lRszyy0eNcDlHUkBd47H0omi5RdOmJpJ6rmwT0PsW6f3y3S2JAcL3PwByrbKkfCTykeSXiS35+nefRX9kbPdq0w0=
ARC-Authentication-Results: i=1; cse.ust.hk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cse.ust.hk;
 s=cseusthk; t=1759893615;
 bh=WuLSA2EjkrLhSQFnaBGCNZGIYOqkvds6auE54bA3lWQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O1mWmbhe3wxDfirmk6JKjwo4Qc+QANnMrDAiMaxMv6vbHp21QI7HEUmaDtREupztT
 ITsS1D23MTLgcXf6uISKfRLSIZ43UdPgZs0z8dh//rgVL68sU0qEaYGtX3KX+x5a4p
 SIjm8/XVkjp/qyzWU2cfbTulg9rsFvv7Ircqe+jo=
Date: Wed, 8 Oct 2025 11:20:03 +0800
From: Shuhao Fu <sfual@cse.ust.hk>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 stable@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3] drm/nouveau: Fix refcount leak in nouveau_connector_detect
Message-ID: <aOXYV5pgilTvqMxR@osx.local>
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

Closes: https://gitlab.freedesktop.org/drm/nouveau/-/issues/450
Fixes: 0cd7e0718139 ("drm/nouveau/disp: add output method to fetch edid")
Signed-off-by: Shuhao Fu <sfual@cse.ust.hk>
Cc: stable@vger.kernel.org

Change in v3:
- Cc stable
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

