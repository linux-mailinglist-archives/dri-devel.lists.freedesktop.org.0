Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 833E9A2B3BA
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 22:06:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F29FE10E955;
	Thu,  6 Feb 2025 21:06:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="fQuTcJMg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6890E10E955
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 21:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738875995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s7xAmzUbaN5huovQdYAEAsYWu0KhUnt9GjWcpVdzsA0=;
 b=fQuTcJMgbE0QGCAWNSW69gcrILL+OdMnnLCTaj8UvYMvAN11DrbuiJYsM1W4VwVV7EWnni
 jAqkwmL/EMX2mg/4NRb/nuLCGT3ORp42KQ1fVhwob4p9/YoYFLJ9NuJCUZmH7ObO1auPRV
 vWzPY4GZRXyvEU5R5qOgqIwRL+czF1w=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-625-qQPf6AzhOUiGnvPgy0xiMg-1; Thu,
 06 Feb 2025 16:06:32 -0500
X-MC-Unique: qQPf6AzhOUiGnvPgy0xiMg-1
X-Mimecast-MFC-AGG-ID: qQPf6AzhOUiGnvPgy0xiMg
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 734681800874; Thu,  6 Feb 2025 21:06:30 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.17.21])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 9C09A1800570; Thu,  6 Feb 2025 21:06:26 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 06 Feb 2025 16:05:59 -0500
Subject: [PATCH 04/14] drm/panel/jdi-lpm102a188a: Move to using
 mipi_dsi_generic_write_seq_multi()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-mipi-cocci-v1-4-4ff0c69e8897@redhat.com>
References: <20250206-mipi-cocci-v1-0-4ff0c69e8897@redhat.com>
In-Reply-To: <20250206-mipi-cocci-v1-0-4ff0c69e8897@redhat.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Joel Selvaraj <jo@jsfamily.in>, Ondrej Jirman <megi@xff.cz>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Artur Weber <aweber.kernel@gmail.com>, Jianhua Lu <lujianhua000@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738875969; l=2957;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=YY9bE9k54mPVjMb14lVjLXVWPpAYIrmSESM5ZlgANEU=;
 b=MuWUzWk138+PYDgGPkyO9/t5bPV/hiDsEXzstTvTHxe+a/j5VsjlRaRwXztm3CZKoqET3LqQx
 5oVKJEmN5bQBlrRjtAcTARKab+1+ox+ldm1Fkbvok1654/jw/KL5g2q
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

Use mipi_dsi_generic_write_seq_multi() instead of
mipi_dsi_generic_write_seq()

Used Coccinelle to do this change. SmPl patch:

@rule_2@
expression dsi_var;
expression list es;
identifier jdi;
@@
static int jdi_write_dcdc_registers(struct jdi_panel *jdi)
{
+struct mipi_dsi_multi_context dsi_ctx1 = { .dsi = jdi->link1 };
+struct mipi_dsi_multi_context dsi_ctx2 = { .dsi = jdi->link2 };
<+...
-mipi_dsi_generic_write_seq(jdi->link1,es);
+mipi_dsi_generic_write_seq_multi(&dsi_ctx1,es);
-mipi_dsi_generic_write_seq(jdi->link2,es);
+mipi_dsi_generic_write_seq_multi(&dsi_ctx2,es);
...+>
}

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c | 31 ++++++++++++++-------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c b/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
index 5b5082efb282bcf705cf2d38dea24901e9803648..30ed3acd4790d049cc2042a64dc10b77dde56034 100644
--- a/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
+++ b/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
@@ -161,27 +161,28 @@ static int jdi_setup_symmetrical_split(struct mipi_dsi_device *left,
 
 static int jdi_write_dcdc_registers(struct jdi_panel *jdi)
 {
+	struct mipi_dsi_multi_context dsi_ctx1 = { .dsi = jdi->link1 };
+	struct mipi_dsi_multi_context dsi_ctx2 = { .dsi = jdi->link2 };
 	/* Clear the manufacturer command access protection */
-	mipi_dsi_generic_write_seq(jdi->link1, MCS_CMD_ACS_PROT,
-				   MCS_CMD_ACS_PROT_OFF);
-	mipi_dsi_generic_write_seq(jdi->link2, MCS_CMD_ACS_PROT,
-				   MCS_CMD_ACS_PROT_OFF);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx1, MCS_CMD_ACS_PROT,
+					 MCS_CMD_ACS_PROT_OFF);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx2, MCS_CMD_ACS_PROT,
+					 MCS_CMD_ACS_PROT_OFF);
 	/*
 	 * Change the VGH/VGL divide rations to move the noise generated by the
 	 * TCONN. This should hopefully avoid interaction with the backlight
 	 * controller.
 	 */
-	mipi_dsi_generic_write_seq(jdi->link1, MCS_PWR_CTRL_FUNC,
-				   MCS_PWR_CTRL_PARAM1_VGH_330_DIV |
-				   MCS_PWR_CTRL_PARAM1_DEFAULT,
-				   MCS_PWR_CTRL_PARAM2_VGL_410_DIV |
-				   MCS_PWR_CTRL_PARAM2_DEFAULT);
-
-	mipi_dsi_generic_write_seq(jdi->link2, MCS_PWR_CTRL_FUNC,
-				   MCS_PWR_CTRL_PARAM1_VGH_330_DIV |
-				   MCS_PWR_CTRL_PARAM1_DEFAULT,
-				   MCS_PWR_CTRL_PARAM2_VGL_410_DIV |
-				   MCS_PWR_CTRL_PARAM2_DEFAULT);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx1, MCS_PWR_CTRL_FUNC,
+					 MCS_PWR_CTRL_PARAM1_VGH_330_DIV |
+					 MCS_PWR_CTRL_PARAM1_DEFAULT,
+					 MCS_PWR_CTRL_PARAM2_VGL_410_DIV |
+					 MCS_PWR_CTRL_PARAM2_DEFAULT);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx2, MCS_PWR_CTRL_FUNC,
+					 MCS_PWR_CTRL_PARAM1_VGH_330_DIV |
+					 MCS_PWR_CTRL_PARAM1_DEFAULT,
+					 MCS_PWR_CTRL_PARAM2_VGL_410_DIV |
+					 MCS_PWR_CTRL_PARAM2_DEFAULT);
 
 	return 0;
 }

-- 
2.47.0

