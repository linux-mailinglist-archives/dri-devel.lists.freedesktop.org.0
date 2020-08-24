Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D852A2507B5
	for <lists+dri-devel@lfdr.de>; Mon, 24 Aug 2020 20:33:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 100CF6E437;
	Mon, 24 Aug 2020 18:33:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 146366E343
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Aug 2020 18:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598293991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nDN8OKH/igdTXe1JZhVc/ikuMKRfmf49543jqaV4qUQ=;
 b=SpgWGZy0tgRKoq1XiRyUwdLTr7fK8nJWYpDy3k0M4dWJdc8a45Q3lnRRiGzxI4lCoE/p05
 QaTFHOrcC+chY+nY8pizhUPA0m21otrRHFNAcnh4UxDF4nmNWqXU10IwLmTJuUQtP7CkqP
 PLHvwUjjOVGCMgfQnnn9h3Ek/Uepf5E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-8WE-K4HYMnGsgDHFsvC9Ng-1; Mon, 24 Aug 2020 14:33:08 -0400
X-MC-Unique: 8WE-K4HYMnGsgDHFsvC9Ng-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B85081F018;
 Mon, 24 Aug 2020 18:33:06 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-114-60.rdu2.redhat.com
 [10.10.114.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0E1465C22A;
 Mon, 24 Aug 2020 18:33:02 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 2/2] drm/nouveau/kms/nv50-: Log SOR/PIOR caps
Date: Mon, 24 Aug 2020 14:32:53 -0400
Message-Id: <20200824183253.826343-3-lyude@redhat.com>
In-Reply-To: <20200824183253.826343-1-lyude@redhat.com>
References: <20200824183253.826343-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: David Airlie <airlied@linux.ie>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 James Jones <jajones@nvidia.com>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <dri-devel@lists.freedesktop.org>, Manasi Navare <manasi.d.navare@intel.com>,
 Ben Skeggs <bskeggs@redhat.com>, Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since I'm almost certain I didn't get capability checking right for
pre-volta chipsets, let's start logging any caps we find to make things
like this obvious in the future.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 800b7757252e3..6210ee1c145a2 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -258,6 +258,14 @@ evo_kick(u32 *push, struct nv50_dmac *evoc)
 /******************************************************************************
  * Output path helpers
  *****************************************************************************/
+static void
+nv50_outp_dump_caps(struct nouveau_drm *drm,
+		    struct nouveau_encoder *outp)
+{
+	NV_DEBUG(drm, "%s caps: dp_interlace=%d\n",
+		 outp->base.base.name, outp->caps.dp_interlace);
+}
+
 static void
 nv50_outp_release(struct nouveau_encoder *nv_encoder)
 {
@@ -1715,6 +1723,7 @@ nv50_sor_create(struct drm_connector *connector, struct dcb_output *dcbe)
 	drm_connector_attach_encoder(connector, encoder);
 
 	disp->core->func->sor->get_caps(disp, nv_encoder, ffs(dcbe->or) - 1);
+	nv50_outp_dump_caps(drm, nv_encoder);
 
 	if (dcbe->type == DCB_OUTPUT_DP) {
 		struct nvkm_i2c_aux *aux =
@@ -1875,6 +1884,7 @@ nv50_pior_create(struct drm_connector *connector, struct dcb_output *dcbe)
 	drm_connector_attach_encoder(connector, encoder);
 
 	disp->core->func->pior->get_caps(disp, nv_encoder, ffs(dcbe->or) - 1);
+	nv50_outp_dump_caps(drm, nv_encoder);
 
 	return 0;
 }
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
