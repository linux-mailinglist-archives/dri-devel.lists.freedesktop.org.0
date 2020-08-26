Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 793A12536CF
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 20:25:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D78D6EAA4;
	Wed, 26 Aug 2020 18:25:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A57756EA9D
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 18:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598466323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dcFp48n/aLMtpSE/1lSAUTj8bSRshm4WBYhHn9wvw8Q=;
 b=N9fNA0RMkcgdxnn50PPW3cgetpzkrqaxhXCfpyO3wm8VdTRquNzQcLlLKJ66/qhlnas+Qh
 H/r3PZzuCA5L0PP10EdnvxFWzWj65b0/wcOEFuFod3ZLLqeEUabRJJVgtOh4CK1x2CawOA
 KwYks6T+gwLjM47uwV5zWmO9iVZRHpc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-NJMvAa3eMmObAUD8K-updA-1; Wed, 26 Aug 2020 14:25:22 -0400
X-MC-Unique: NJMvAa3eMmObAUD8K-updA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 40C028015A8;
 Wed, 26 Aug 2020 18:25:20 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-119-77.rdu2.redhat.com
 [10.10.119.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9D6881002382;
 Wed, 26 Aug 2020 18:25:18 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Subject: [PATCH v5 05/20] drm/nouveau/kms: Don't clear DP_MST_CTRL DPCD in
 nv50_mstm_new()
Date: Wed, 26 Aug 2020 14:24:41 -0400
Message-Id: <20200826182456.322681-6-lyude@redhat.com>
In-Reply-To: <20200826182456.322681-1-lyude@redhat.com>
References: <20200826182456.322681-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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

Since fa3cdf8d0b09 ("drm/nouveau: Reset MST branching unit before
enabling") we've been clearing DP_MST_CTRL before we start enabling MST.
Since then clearing DP_MST_CTRL in nv50_mstm_new() has been unnecessary
and redundant, so let's remove it.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index e7874877da858..c4d138f0ca054 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -1535,17 +1535,6 @@ nv50_mstm_new(struct nouveau_encoder *outp, struct drm_dp_aux *aux, int aux_max,
 	struct drm_device *dev = outp->base.base.dev;
 	struct nv50_mstm *mstm;
 	int ret;
-	u8 dpcd;
-
-	/* This is a workaround for some monitors not functioning
-	 * correctly in MST mode on initial module load.  I think
-	 * some bad interaction with the VBIOS may be responsible.
-	 *
-	 * A good ol' off and on again seems to work here ;)
-	 */
-	ret = drm_dp_dpcd_readb(aux, DP_DPCD_REV, &dpcd);
-	if (ret >= 0 && dpcd >= 0x12)
-		drm_dp_dpcd_writeb(aux, DP_MSTM_CTRL, 0);
 
 	if (!(mstm = *pmstm = kzalloc(sizeof(*mstm), GFP_KERNEL)))
 		return -ENOMEM;
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
