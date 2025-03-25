Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6DAA70817
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 18:24:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76CF510E5CB;
	Tue, 25 Mar 2025 17:24:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="CrbQvX/O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 461C910E5D4
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 17:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742923472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zqecdvb5kxDyC4DfU4KESc1NRxh5rJKZha3vk1oMdUg=;
 b=CrbQvX/Ox42EpRUWlNwlGhW1iIISvbnlnw1xWZM4ZN5W/6IozDa3MRrCAn6t6nKCmLNKKq
 exZpesQoJq8yapzJ63gXC41y8Grk8efyh4wj2k0jqZZUNyZ0MoLjojGPh3FkI4aljKrRpK
 posgYWXPZUyPOO0yr40wQt0SkoPbzqk=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-613-lgfh-2E3Or6lzojP0a_kkg-1; Tue,
 25 Mar 2025 13:24:29 -0400
X-MC-Unique: lgfh-2E3Or6lzojP0a_kkg-1
X-Mimecast-MFC-AGG-ID: lgfh-2E3Or6lzojP0a_kkg_1742923467
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 1D3A7196B344; Tue, 25 Mar 2025 17:24:27 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.186])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 1180D180B48D; Tue, 25 Mar 2025 17:24:24 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Tue, 25 Mar 2025 13:24:12 -0400
Subject: [PATCH 5/5] drm/panel/panel-simple: Use the new allocation in
 place of devm_kzalloc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250325-b4-panel-refcounting-v1-5-4e2bf5d19c5d@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742923451; l=1256;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=kXLbCzIF+uo4T+POQrxwrpIlzuIGHuhI0CWjiIfvzVs=;
 b=dJEbLwx9gCwDPXI1Ix2M63daJZlz7WwZpKxA/1T8uTYjv+kQVTKDODlaEanmHtkW2vaCZKaq/
 rdTQZB/H1blCnNIYHsWjZ0HdEX1d6+51f26Dkn3tk8gd32pFIZWIfZw
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

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 6ba600f97aa4c8daae577823fcf17ef31b0eb46f..60b845fad4e1b378af52d34dfae0139c4625dc51 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -579,7 +579,8 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 	u32 bus_flags;
 	int err;
 
-	panel = devm_kzalloc(dev, sizeof(*panel), GFP_KERNEL);
+	panel = devm_drm_panel_alloc(dev, struct panel_simple, base,
+				     &panel_simple_funcs, desc->connector_type);
 	if (!panel)
 		return -ENOMEM;
 
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

