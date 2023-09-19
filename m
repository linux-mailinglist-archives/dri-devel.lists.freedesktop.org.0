Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0247A6E31
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 00:07:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C31C910E3F8;
	Tue, 19 Sep 2023 22:07:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2EE510E3F0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 22:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695161224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f4EupPm67ieQqJ6BGjiZVVQO57DUBAXgI6kdFWcxX4U=;
 b=Pgo7I8seV/F6j/HGyFiGGfkvyArzjO/Gn1hNgbpUTlaW/Ru10GjWoqY2i1CIBVECintoUd
 4pJYQe52f2Jt5P1+przh3GVs9u0Q8O/TM0s8sXZq9LuIh6nTg+jQB2t9ZF4Wgo/kMck1JU
 gB9e8dNAdTRqUNZ84HlWlZqbM6CBtpM=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-580-htkACPzPNNG7xAhSc6VRRw-1; Tue, 19 Sep 2023 18:07:00 -0400
X-MC-Unique: htkACPzPNNG7xAhSc6VRRw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 203A23C02539;
 Tue, 19 Sep 2023 22:07:00 +0000 (UTC)
Received: from emerald.lyude.net (unknown [10.22.18.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B337740C2064;
 Tue, 19 Sep 2023 22:06:59 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH v3 29/44] drm/nouveau/kms/nv50-: split DP disable+enable into
 two modesets
Date: Tue, 19 Sep 2023 17:56:24 -0400
Message-ID: <20230919220442.202488-30-lyude@redhat.com>
In-Reply-To: <20230919220442.202488-1-lyude@redhat.com>
References: <20230919220442.202488-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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
Cc: Karol Herbst <kherbst@redhat.com>, Danilo Krummrich <me@dakr.org>,
 open list <linux-kernel@vger.kernel.org>, Ben Skeggs <bskeggs@redhat.com>,
 Wayne Lin <Wayne.Lin@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ben Skeggs <bskeggs@redhat.com>

Link training can finally be moved out of the supervisor sequence,
but first we need to split DP modesets into separate disable and
enable sequences to be able to perform link training between them
instead.

- preparation for GSP-RM

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Acked-by: Danilo Krummrich <me@dakr.org>
Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index ee53bc5d10042..48e099ed7d51c 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -2375,7 +2375,8 @@ nv50_disp_outp_atomic_check_clr(struct nv50_atom *atom,
 		if (IS_ERR(outp))
 			return PTR_ERR(outp);
 
-		if (outp->encoder->encoder_type == DRM_MODE_ENCODER_DPMST) {
+		if (outp->encoder->encoder_type == DRM_MODE_ENCODER_DPMST ||
+		    nouveau_encoder(outp->encoder)->dcb->type == DCB_OUTPUT_DP) {
 			outp->flush_disable = true;
 			atom->flush_disable = true;
 		}
-- 
2.41.0

