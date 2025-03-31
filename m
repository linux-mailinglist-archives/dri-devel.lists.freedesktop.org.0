Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D78CA76BC8
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 18:17:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0CCF10E457;
	Mon, 31 Mar 2025 16:17:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="JOVffHeF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A843510E451
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 16:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743437827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hXGoc6eNWHgPyvL59/knt6bfbN2WAIb4QRVcgXHCRwY=;
 b=JOVffHeF7UCmkVxeV47uJNWfBew6Jyjn/eJWjTvl6B7lWw5Mqcwb/1Nb6AH1BRF2Xtnh4D
 uQp2hBKe6RwXmj5UNz0Ik4Umah/ciU3mFYJ7kxWPn1kLv1G9dTA6vKX7oORb57Sx4c0xsr
 kQG6GfDhCybx20kaN9JlqGaudxZ+hI4=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-501-nX5MjEheOYmm7nWRuTQKLQ-1; Mon,
 31 Mar 2025 12:17:06 -0400
X-MC-Unique: nX5MjEheOYmm7nWRuTQKLQ-1
X-Mimecast-MFC-AGG-ID: nX5MjEheOYmm7nWRuTQKLQ_1743437825
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id DE9EA19560BB; Mon, 31 Mar 2025 16:17:04 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id C6F1E19560AD; Mon, 31 Mar 2025 16:17:02 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Mon, 31 Mar 2025 11:15:28 -0400
Subject: [PATCH v4 4/4] drm/panel/panel-simple: Use the new allocation in
 place of devm_kzalloc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250331-b4-panel-refcounting-v4-4-dad50c60c6c9@redhat.com>
References: <20250331-b4-panel-refcounting-v4-0-dad50c60c6c9@redhat.com>
In-Reply-To: <20250331-b4-panel-refcounting-v4-0-dad50c60c6c9@redhat.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743434129; l=1504;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=Z5nYVXi/n0DZaKeP9EMIATjTYHSvhfc6wg0Q/NsaJ9s=;
 b=VRKcVruy50ncSpHKM4ig1iTQg0vWl8QIuHkau4lEzcxxdqiCLEj6OPMPTCYHGB9RgcY2PIZMF
 zTtsLhMiwiuD1NjNEan1qQr4jAX1oS6Incx4X4dS0SiQmk24zt8/QRp
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
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

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>

---
v4: none.
v3: none.
v2: check error condition (Luca)
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

