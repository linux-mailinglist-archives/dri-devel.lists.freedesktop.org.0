Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0235CAC867D
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 04:51:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66BF310E790;
	Fri, 30 May 2025 02:51:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="X7uVmhK3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA65B10E790
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 02:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748573510;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GyvvJOkIKbLTvBeRzbJji4RMPGPkXp1Wy75edFdkPdI=;
 b=X7uVmhK3iiJnhoQqJo9ZuNjsg5iNbS09kDjNG0duUo4jgdc43Rb9adJ5FpsaDa0pLm0x++
 GlAkphi/LFBm01/f9KZkH8/Xu3Rj8c1f5gadAyYGFQcwaqWpbr+SCPRgWBlQfDUZE5Ic4b
 rYF7prBMEH1E4j6YPnYz476Yi5qPwmI=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-635-Qe3ENpAKN8mNR20en35DWQ-1; Thu,
 29 May 2025 22:51:46 -0400
X-MC-Unique: Qe3ENpAKN8mNR20en35DWQ-1
X-Mimecast-MFC-AGG-ID: Qe3ENpAKN8mNR20en35DWQ_1748573504
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id EE156180036F; Fri, 30 May 2025 02:51:43 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.17.97])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 90A071955D82; Fri, 30 May 2025 02:51:39 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 29 May 2025 21:46:25 -0500
Subject: [PATCH v2 23/46] panel/seiko-43wvf1g: Use refcounted allocation in
 place of devm_kzalloc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-23-5d75a3711e40@redhat.com>
References: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-0-5d75a3711e40@redhat.com>
In-Reply-To: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-0-5d75a3711e40@redhat.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Robert Chiras <robert.chiras@nxp.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Markuss Broks <markuss.broks@gmail.com>, 
 Artur Weber <aweber.kernel@gmail.com>, 
 Dzmitry Sankouski <dsankouski@gmail.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megi@xff.cz>, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, Janne Grunau <j@jannau.net>, 
 Michael Trimarchi <michael@amarulasolutions.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748573168; l=1422;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=mOydvWxhgCz8Daz0E6kkR/U2cY12XZilDTWu1Ewy/O4=;
 b=rNV7KeUaUvFdMuFPWRmgdrWy2J2zTBKFtpXT+owO19C5it2zySt5rLynzuCO0bFP6cBGmK7GJ
 6AyUTwif23AA/L1wFT2FhamiEcpcllHMGMBV4IWXz2alWSXwYkM+L7Q
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
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

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
v2: Use the correct connector.
---
 drivers/gpu/drm/panel/panel-seiko-43wvf1g.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c b/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
index 7d1b421ea9ddfcf84850a2fc589f7a43e24fc167..0935d83ee2db3cbec5744adfc6d1ad933537e580 100644
--- a/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
+++ b/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
@@ -204,9 +204,11 @@ static int seiko_panel_probe(struct device *dev,
 	struct seiko_panel *panel;
 	int err;
 
-	panel = devm_kzalloc(dev, sizeof(*panel), GFP_KERNEL);
-	if (!panel)
-		return -ENOMEM;
+	panel = devm_drm_panel_alloc(dev, struct seiko_panel, base,
+				     &seiko_panel_funcs,
+				     DRM_MODE_CONNECTOR_DPI);
+	if (IS_ERR(panel))
+		return PTR_ERR(panel);
 
 	panel->desc = desc;
 
@@ -224,9 +226,6 @@ static int seiko_panel_probe(struct device *dev,
 		return dev_err_probe(dev, PTR_ERR(panel->enable_gpio),
 				     "failed to request GPIO\n");
 
-	drm_panel_init(&panel->base, dev, &seiko_panel_funcs,
-		       DRM_MODE_CONNECTOR_DPI);
-
 	err = drm_panel_of_backlight(&panel->base);
 	if (err)
 		return err;

-- 
2.48.1

