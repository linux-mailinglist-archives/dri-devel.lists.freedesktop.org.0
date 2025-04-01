Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 811DBA78108
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 19:05:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B47510E1F4;
	Tue,  1 Apr 2025 17:05:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="NEAG0puM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8738A10E1F4
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 17:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743527135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZBlWYqQZDg95twKY6/F4fFDg5FwcOXt+bMpy9kaQ1x4=;
 b=NEAG0puMqzTvuTBpZcjXLLw/8+mE2ghqmhENbq2mFTO8HnQhMQPlzos6FdTEWU4HWtZ/rQ
 PLO2yQtHK3WTpVLpDTOWgSnyySY6+rRVPNDz2NO546lP+rHGL6mWBW8afJvPvVPRJ9vG8A
 2WBJyrtCkjgBrCSz9RqGzQo+y44RqmQ=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-543-Zlru7EbDMjacaN-kXZUHXQ-1; Tue,
 01 Apr 2025 13:05:32 -0400
X-MC-Unique: Zlru7EbDMjacaN-kXZUHXQ-1
X-Mimecast-MFC-AGG-ID: Zlru7EbDMjacaN-kXZUHXQ_1743527130
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 9A13B1955BC1; Tue,  1 Apr 2025 17:05:30 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 1CB07180B487; Tue,  1 Apr 2025 17:05:27 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Tue, 01 Apr 2025 12:03:48 -0400
Subject: [PATCH 05/10] panel/bf060y8m-aj0: Use refcounted allocation in
 place of devm_kzalloc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250401-b4-drm-panel-mass-driver-convert-v1-5-cdd7615e1f93@redhat.com>
References: <20250401-b4-drm-panel-mass-driver-convert-v1-0-cdd7615e1f93@redhat.com>
In-Reply-To: <20250401-b4-drm-panel-mass-driver-convert-v1-0-cdd7615e1f93@redhat.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Linus Walleij <linus.walleij@linaro.org>, Joel Selvaraj <jo@jsfamily.in>, 
 Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743523429; l=1420;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=c0wLE9NVru+MfKD0ti9z13jGljVE8zQ7g/rQltDrSPc=;
 b=pntShaSLkOzMndLmkH65yfLl8IXOs0PnQ65rFT0kLKACTlYhO47X8bhZiH01s5/GHcpsDbv5c
 ebmyPzJSMeFBT1xUNmcAwMSqnbuUQz/bnnb9tnVskXBQemQ3ZeAfbpA
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

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c b/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c
index 7e66db4a88bbed27920107458d01efd9cf4986df..5eb0727438cd73360f5360aba55f1eb1659fc7c6 100644
--- a/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c
+++ b/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c
@@ -350,9 +350,11 @@ static int boe_bf060y8m_aj0_probe(struct mipi_dsi_device *dsi)
 	struct boe_bf060y8m_aj0 *boe;
 	int ret;
 
-	boe = devm_kzalloc(dev, sizeof(*boe), GFP_KERNEL);
-	if (!boe)
-		return -ENOMEM;
+	boe = devm_drm_panel_alloc(dev, struct boe_bf060y8m_aj0, panel,
+				   &boe_bf060y8m_aj0_panel_funcs,
+				   DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(boe))
+		return PTR_ERR(boe);
 
 	ret = boe_bf060y8m_aj0_init_vregs(boe, dev);
 	if (ret)
@@ -374,9 +376,6 @@ static int boe_bf060y8m_aj0_probe(struct mipi_dsi_device *dsi)
 			  MIPI_DSI_CLOCK_NON_CONTINUOUS |
 			  MIPI_DSI_MODE_LPM;
 
-	drm_panel_init(&boe->panel, dev, &boe_bf060y8m_aj0_panel_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
-
 	boe->panel.prepare_prev_first = true;
 
 	boe->panel.backlight = boe_bf060y8m_aj0_create_backlight(dsi);

-- 
2.48.1

