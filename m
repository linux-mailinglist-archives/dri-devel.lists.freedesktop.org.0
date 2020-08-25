Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F14252118
	for <lists+dri-devel@lfdr.de>; Tue, 25 Aug 2020 21:51:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B66266E97F;
	Tue, 25 Aug 2020 19:51:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 319146E98F
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Aug 2020 19:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598385073;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=glOtKXBEY1QH1RwrMnCm+/sIThOKQ4eJ0NSY4m+jER8=;
 b=KDaYzMvJAEaXW69dvRyl1bx0jkpE6D5ZK1hLX1lNk0lkYftm1k/0/j19i0dE0rIjXehrHL
 etCYbIIFrqYBLCnlBJxxf4KmZR0LcqnF7m/xz3BmT7H3OeFcDCV4to7mez6GdC8VJbsFr9
 UxO2dkstkylW8TR79GyHNn+loCcdoEQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-O23qU7KTOjWHvTITN5jOkg-1; Tue, 25 Aug 2020 15:51:09 -0400
X-MC-Unique: O23qU7KTOjWHvTITN5jOkg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9153010A5D82;
 Tue, 25 Aug 2020 19:51:06 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-120-227.rdu2.redhat.com
 [10.10.120.227])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0C33D5D9D3;
 Tue, 25 Aug 2020 19:51:02 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Subject: [RFC v4 07/20] drm/nouveau/kms/nv50-: Use
 drm_dp_dpcd_(readb|writeb)() in nv50_sor_disable()
Date: Tue, 25 Aug 2020 15:50:14 -0400
Message-Id: <20200825195027.74681-8-lyude@redhat.com>
In-Reply-To: <20200825195027.74681-1-lyude@redhat.com>
References: <20200825195027.74681-1-lyude@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 James Jones <jajones@nvidia.com>, open list <linux-kernel@vger.kernel.org>,
 Ben Skeggs <bskeggs@redhat.com>, Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Just use drm_dp_dpcd_(readb|writeb)() so we get automatic DPCD logging

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 255a281249bc8..612d98fa0a2dc 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -1630,19 +1630,22 @@ nv50_sor_disable(struct drm_encoder *encoder,
 {
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(nv_encoder->crtc);
+	struct nouveau_connector *nv_connector =
+		nv50_outp_get_old_connector(nv_encoder, state);
 
 	nv_encoder->crtc = NULL;
 
 	if (nv_crtc) {
-		struct nvkm_i2c_aux *aux = nv_encoder->aux;
+		struct drm_dp_aux *aux = &nv_connector->aux;
 		u8 pwr;
 
-		if (aux) {
-			int ret = nvkm_rdaux(aux, DP_SET_POWER, &pwr, 1);
+		if (nv_encoder->dcb->type == DCB_OUTPUT_DP) {
+			int ret = drm_dp_dpcd_readb(aux, DP_SET_POWER, &pwr);
+
 			if (ret == 0) {
 				pwr &= ~DP_SET_POWER_MASK;
 				pwr |=  DP_SET_POWER_D3;
-				nvkm_wraux(aux, DP_SET_POWER, &pwr, 1);
+				drm_dp_dpcd_writeb(aux, DP_SET_POWER, pwr);
 			}
 		}
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
