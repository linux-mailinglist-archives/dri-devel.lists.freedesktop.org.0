Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E01787AC6D3
	for <lists+dri-devel@lfdr.de>; Sun, 24 Sep 2023 08:42:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87DD710E0CE;
	Sun, 24 Sep 2023 06:42:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.219])
 by gabe.freedesktop.org (Postfix) with ESMTP id 73BBD10E0CE
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Sep 2023 06:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=N0gkh5tC+ChwweYN80
 y3EQPf2uMx44WfANoaXNQ07/Y=; b=Rh835qLOFMtdLoQUyzWSuzOM0k4dIJ7+KA
 Y1OSc0zT2ixGgwbKeOr6raNb/zmiDA9jH++DLCGZA2zfyKTgopn99DSoh2dXFxKO
 sybbxKJROe1GP0CN8UUi4K+mIRPXKMpY745XL2jqaSqgAYDDXwe0M0Gj5Tetw2Wp
 kEfDk1HdA=
Received: from localhost.localdomain (unknown [223.104.131.178])
 by zwqz-smtp-mta-g1-4 (Coremail) with SMTP id _____wCHjRFE2g9lvoerCw--.57896S2;
 Sun, 24 Sep 2023 14:42:14 +0800 (CST)
From: liuhaoran <liuhaoran14@163.com>
To: robdclark@gmail.com
Subject: [PATCH] drm/msm/mdp4: Add error handling in mdp4_lvds_connector_init()
Date: Sun, 24 Sep 2023 14:41:59 +0800
Message-Id: <20230924064159.14739-1-liuhaoran14@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wCHjRFE2g9lvoerCw--.57896S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KFW3Wr13Jw45GFy5ZrykGrg_yoW8Cr15pr
 WjyrZaqr40gry3KFn8AF1kCrn5ArWkKF1jgr109w15G348G34qyFW8Jr1ku3Z8Jr93Jr47
 ZwsrXF47GF1UC3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U2JPiUUUUU=
X-Originating-IP: [223.104.131.178]
X-CM-SenderInfo: xolxxtxrud0iqu6rljoofrz/1tbiTgj0gmNh-QidlQAAsP
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
Cc: liuhaoran <liuhaoran14@163.com>, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds error-handling for the drm_connector_init() and
drm_connector_attach_encoder inside the mdp4_lvds_connector_init().

Signed-off-by: liuhaoran <liuhaoran14@163.com>
---
 .../gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c    | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
index 7444b75c4215..62eb363ba90f 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
@@ -96,6 +96,7 @@ struct drm_connector *mdp4_lvds_connector_init(struct drm_device *dev,
 {
 	struct drm_connector *connector = NULL;
 	struct mdp4_lvds_connector *mdp4_lvds_connector;
+	int ret;
 
 	mdp4_lvds_connector = kzalloc(sizeof(*mdp4_lvds_connector), GFP_KERNEL);
 	if (!mdp4_lvds_connector)
@@ -106,8 +107,12 @@ struct drm_connector *mdp4_lvds_connector_init(struct drm_device *dev,
 
 	connector = &mdp4_lvds_connector->base;
 
-	drm_connector_init(dev, connector, &mdp4_lvds_connector_funcs,
-			DRM_MODE_CONNECTOR_LVDS);
+	ret = drm_connector_init(dev, connector, &mdp4_lvds_connector_funcs,
+				 DRM_MODE_CONNECTOR_LVDS);
+
+	if (ret)
+		return ret;
+
 	drm_connector_helper_add(connector, &mdp4_lvds_connector_helper_funcs);
 
 	connector->polled = 0;
@@ -115,7 +120,10 @@ struct drm_connector *mdp4_lvds_connector_init(struct drm_device *dev,
 	connector->interlace_allowed = 0;
 	connector->doublescan_allowed = 0;
 
-	drm_connector_attach_encoder(connector, encoder);
+	ret = drm_connector_attach_encoder(connector, encoder);
+
+	if (ret)
+		return ret;
 
 	return connector;
 }
-- 
2.17.1

