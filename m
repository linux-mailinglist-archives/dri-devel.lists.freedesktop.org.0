Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3C8CD20F9
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 22:54:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 432F010F0E8;
	Fri, 19 Dec 2025 21:54:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="DYVu29fg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2B0910F0E8
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 21:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1766181239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yT/vkIL4JqiLKqlGqIsKx0mk6qKhYZKvJPVbSWT23XE=;
 b=DYVu29fg+yIroQZuu+QIfLs8rSVX0QHjetGeHcPqVvnsHmWZ6uz/wqK0Fea+yEVSJUndlY
 W5ka+vKGBaoyPiWkMEmSrSWg7IYn7QIv2lmM4wcSvdsQS4cwF43MzRjghcAKlwq++Xnq/I
 bBaNw04TyKIXYCXcdaNO+GlTT/lNWm4=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-279-71bDXKARMI2wW1XdZGx_IQ-1; Fri,
 19 Dec 2025 16:53:57 -0500
X-MC-Unique: 71bDXKARMI2wW1XdZGx_IQ-1
X-Mimecast-MFC-AGG-ID: 71bDXKARMI2wW1XdZGx_IQ_1766181235
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 7950D18005AE; Fri, 19 Dec 2025 21:53:55 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.80.166])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 31C7B300021A; Fri, 19 Dec 2025 21:53:53 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: "Timur Tabi" <ttabi@nvidia.com>, "Dave Airlie" <airlied@redhat.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Ben Skeggs" <bskeggs@nvidia.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Ben Skeggs" <bskeggs@redhat.com>, "David Airlie" <airlied@gmail.com>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Maxime Ripard" <mripard@kernel.org>, "Danilo Krummrich" <dakr@kernel.org>,
 "Lyude Paul" <lyude@redhat.com>
Subject: [PATCH 2/2] drm/nouveau/kms/nv50-: Assert we hold nv50_disp->lock in
 nv50_head_flush_*
Date: Fri, 19 Dec 2025 16:52:03 -0500
Message-ID: <20251219215344.170852-3-lyude@redhat.com>
In-Reply-To: <20251219215344.170852-1-lyude@redhat.com>
References: <20251219215344.170852-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
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

Now that we've had one bug that occurred in nouveau as the result of
nv50_head_flush_* being called without the appropriate locks, let's add
some lockdep asserts to make sure this doesn't happen in the future.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/head.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/head.c b/drivers/gpu/drm/nouveau/dispnv50/head.c
index 3dd742b4f8232..e32ed1db6c566 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/head.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/head.c
@@ -43,6 +43,9 @@ nv50_head_flush_clr(struct nv50_head *head,
 	union nv50_head_atom_mask clr = {
 		.mask = asyh->clr.mask & ~(flush ? 0 : asyh->set.mask),
 	};
+
+	lockdep_assert_held(&head->disp->mutex);
+
 	if (clr.crc)  nv50_crc_atomic_clr(head);
 	if (clr.olut) head->func->olut_clr(head);
 	if (clr.core) head->func->core_clr(head);
@@ -65,6 +68,8 @@ nv50_head_flush_set_wndw(struct nv50_head *head, struct nv50_head_atom *asyh)
 void
 nv50_head_flush_set(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
+	lockdep_assert_held(&head->disp->mutex);
+
 	if (asyh->set.view   ) head->func->view    (head, asyh);
 	if (asyh->set.mode   ) head->func->mode    (head, asyh);
 	if (asyh->set.core   ) head->func->core_set(head, asyh);
-- 
2.52.0

