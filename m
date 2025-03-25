Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B8FA70816
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 18:24:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17B7210E5C8;
	Tue, 25 Mar 2025 17:24:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="PLgz+rSw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F5D510E5DB
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 17:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742923471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lpjtlppTK5/lkJhOBorlfU7lpS28Avy09+tU63n0DK4=;
 b=PLgz+rSw/CVMnCOS8jbU1PB6YsOwU8dSruj6rupQgh5xjoDsKKPmhnD03s6CR1v0Ukhx18
 A/5u1URRxhQmQqExr4UEhoHi32M7FdtmOwPY4nB91nqUTDzGL8nAux1+h40tmrxk7hWiEQ
 yZ1aJzDGpM8D1tDIpmaq4Zfz2HErQgQ=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-248-VI23VYtMNHG7GgGXvoSg4g-1; Tue,
 25 Mar 2025 13:24:28 -0400
X-MC-Unique: VI23VYtMNHG7GgGXvoSg4g-1
X-Mimecast-MFC-AGG-ID: VI23VYtMNHG7GgGXvoSg4g_1742923464
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id BB89B180AF52; Tue, 25 Mar 2025 17:24:24 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.186])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 6EDCE180A802; Tue, 25 Mar 2025 17:24:22 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Tue, 25 Mar 2025 13:24:11 -0400
Subject: [PATCH 4/5] drm/panel: deprecate old-style panel allocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250325-b4-panel-refcounting-v1-4-4e2bf5d19c5d@redhat.com>
References: <20250325-b4-panel-refcounting-v1-0-4e2bf5d19c5d@redhat.com>
In-Reply-To: <20250325-b4-panel-refcounting-v1-0-4e2bf5d19c5d@redhat.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742923451; l=1073;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=A+LU5lgwdNhiA1Kyn1XfW5gM4lg/FJ5Fagf5T/rOWc4=;
 b=K9aJBhUC+EevWim2Moo3gSH2V6CmaEQO37I9AS4oIlot73QvPQhsPCDYe76uoIwwY5sdYE0Vf
 xsHnsK9OkxuC1jzj+/0sT/JFzHAJg8qKt3YIrfuM28TgspaY53KqmO2
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
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

Start moving to the new refcounted allocations using
the new API devm_drm_panel_alloc(). Deprecate any other
allocation.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/drm_panel.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index 11a0415bc61f59190ef5eb378d1583c493265e6a..5793011f4938a2d4fb9d84a700817bda317af305 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -74,8 +74,10 @@ EXPORT_SYMBOL(drm_panel_init);
  * drm_panel_add - add a panel to the global registry
  * @panel: panel to add
  *
- * Add a panel to the global registry so that it can be looked up by display
- * drivers.
+ * Add a panel to the global registry so that it can be looked
+ * up by display drivers. The panel to be added must have been
+ * allocated by devm_drm_panel_alloc(). Old-style allocation by
+ * kzalloc(), devm_kzalloc() and similar is deprecated.
  */
 void drm_panel_add(struct drm_panel *panel)
 {

-- 
2.48.1

