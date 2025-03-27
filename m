Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CFCA73513
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 15:56:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE39C10E112;
	Thu, 27 Mar 2025 14:56:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="N3LOj5tY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EC3110E905
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 14:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743087360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ol/1honC/kq9bsbo+vJ/yLdgWul5QcmvruhVbpK4p80=;
 b=N3LOj5tYXr6n0zZLC8hwVUQnEMP7BID0kpc3/iB8R3AgYp4ObPa+InkGLTHcjhYTNGPRui
 KtzmUcCIpcCyG9ZV66hkU0cywFWD6CHy0EmJgCEZlrHWpYJd5fwpNnpPV0dcwkyPkXcmpY
 45b67A5ZXNBXwgM17/ME66tteozoHYg=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-235-EKEiDDACOgemo9ZOIFIKBA-1; Thu,
 27 Mar 2025 10:55:58 -0400
X-MC-Unique: EKEiDDACOgemo9ZOIFIKBA-1
X-Mimecast-MFC-AGG-ID: EKEiDDACOgemo9ZOIFIKBA_1743087357
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D5ABE180025A; Thu, 27 Mar 2025 14:55:56 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id C3ADC180A803; Thu, 27 Mar 2025 14:55:54 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 27 Mar 2025 10:55:42 -0400
Subject: [PATCH v2 4/4] drm/panel/panel-simple: Use the new allocation in
 place of devm_kzalloc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250327-b4-panel-refcounting-v2-4-b5f5ca551f95@redhat.com>
References: <20250327-b4-panel-refcounting-v2-0-b5f5ca551f95@redhat.com>
In-Reply-To: <20250327-b4-panel-refcounting-v2-0-b5f5ca551f95@redhat.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743087343; l=1372;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=G/LOUd/2xefq/+K9tkawZjMsn5YeytPryd54sCiSKhI=;
 b=INfqMQVpmbSyOot5SD8bv0Vt72aecl6YWRzOF337aaRi/r7Rds33RF0OavdjAOp6dK9hYW3ba
 rhH6/+FkgsdBL6h4kIN3ztWTaH886/oxxvkvggaF+i23h0GIGqidW5H
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

Start using the new helper that does the refcounted
allocations.

v2: check error condition (Luca)

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 6ba600f97aa4c8daae577823fcf17ef31b0eb46f..df718c4a86cb7dc0cd126e807d33306e5a21d8a0 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -579,9 +579,10 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 	u32 bus_flags;
 	int err;
 
-	panel = devm_kzalloc(dev, sizeof(*panel), GFP_KERNEL);
-	if (!panel)
-		return -ENOMEM;
+	panel = devm_drm_panel_alloc(dev, struct panel_simple, base,
+				     &panel_simple_funcs, desc->connector_type);
+	if (IS_ERR(panel))
+		return PTR_ERR(panel);
 
 	panel->desc = desc;
 
@@ -694,8 +695,6 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 	pm_runtime_set_autosuspend_delay(dev, 1000);
 	pm_runtime_use_autosuspend(dev);
 
-	drm_panel_init(&panel->base, dev, &panel_simple_funcs, connector_type);
-
 	err = drm_panel_of_backlight(&panel->base);
 	if (err) {
 		dev_err_probe(dev, err, "Could not find backlight\n");

-- 
2.48.1

