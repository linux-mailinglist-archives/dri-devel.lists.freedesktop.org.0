Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66297A5E920
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 01:55:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C805710E7E0;
	Thu, 13 Mar 2025 00:55:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="CyR5z/aJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44A2610E7E0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 00:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741827310;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5sMj5qQZ1mcmow20dX8XpYgNx8znNE77O3nTheH5umQ=;
 b=CyR5z/aJcaWigJzVNTMejyRAJdgfMd3WL9N6UVxwQzxoKuqlu/Zv6JQr/+zx6UM4gLgieU
 MpdJa4TP9RKAxvkGjWhXhNjtwbu3aT3YDpTE1QNP/HZlOoXtd/shZKdokACASWMnVEjMbE
 4Wg66RtFdF5zZ1Nuvdux/RCeVltfEpk=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-343-w-TV-RCeMuG1OFVDo14WUw-1; Wed,
 12 Mar 2025 20:55:04 -0400
X-MC-Unique: w-TV-RCeMuG1OFVDo14WUw-1
X-Mimecast-MFC-AGG-ID: w-TV-RCeMuG1OFVDo14WUw_1741827298
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 02E7C180025C; Thu, 13 Mar 2025 00:54:58 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.186])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 93D511955BCB; Thu, 13 Mar 2025 00:54:55 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Wed, 12 Mar 2025 20:54:43 -0400
Subject: [PATCH RFC 2/2] drm/panel/panel-simple: Use the new allocation in
 place of devm_kzalloc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250312-drm-panel-v1-2-e99cd69f6136@redhat.com>
References: <20250312-drm-panel-v1-0-e99cd69f6136@redhat.com>
In-Reply-To: <20250312-drm-panel-v1-0-e99cd69f6136@redhat.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741827289; l=1221;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=SpQpLCI9T0ZitGPUZWpwmh94k+DUnd4JAAyPF4rKF0I=;
 b=KqdpOOFh2TvvDM2X5xcUUHYAqKpCynRDbDSYyD15YnRf1z1y+1B1rBB4EUq8RHjF9PKF6TTv7
 W8+nxlmyIU3C8vaZbdqrPj8AhT6uon5pvDWyTu4hVWMGG9VXxE2IHuo
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

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 232b03c1a259eb15e423b9d452d28e2ff95c70f8..d7530c3533af34f83ce8c6d6067e7f293f2d4bf1 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -579,7 +579,7 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 	u32 bus_flags;
 	int err;
 
-	panel = devm_kzalloc(dev, sizeof(*panel), GFP_KERNEL);
+	panel = devm_drm_panel_alloc(dev, struct panel_simple, base, &panel_simple_funcs);
 	if (!panel)
 		return -ENOMEM;
 
@@ -694,8 +694,6 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 	pm_runtime_set_autosuspend_delay(dev, 1000);
 	pm_runtime_use_autosuspend(dev);
 
-	drm_panel_init(&panel->base, dev, &panel_simple_funcs, connector_type);
-
 	err = drm_panel_of_backlight(&panel->base);
 	if (err) {
 		dev_err_probe(dev, err, "Could not find backlight\n");

-- 
2.48.1

