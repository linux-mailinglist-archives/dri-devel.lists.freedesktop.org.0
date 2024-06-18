Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 954DD90C21D
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 05:01:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C411910E54E;
	Tue, 18 Jun 2024 03:01:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="dNwouVea";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A02AE10E54A;
 Tue, 18 Jun 2024 03:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DKE9E8EfN4qFoXgS2Nhr4CIKzmxCOJoEG4cKtj5vuJs=; b=dNwouVeagns0aQk+ar4zvgWuTc
 7qqpQcg5c44zpvy/aJVu18v7y/ZFEVVhLkDHpeXeWcAsV/dV8/RsO6f5IVYz1Be5teRbfKPK6WrQr
 7Tj2RyCC455+URRpIvN6C7n357kUNza0i9uEz5Heew+LInkzmvOOajckapWGQfJbqclcwpvD9YrUJ
 p/jhS5Jjs3eKaG1mgmDoBIgULWqOdOEQM98oZguuGFnXVqUv5ULGeBXtXFFpOcmdbyZFYMV4oZGrP
 lSYu2Fn0q1xu52HCG02tdSltiBH3q1FwOzVCvq6OY62UrmG7U5Of/ccIIRFNR2zIO73FR3BWL1Hag
 9iXI3zyg==;
Received: from [191.8.29.108] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sJP64-004YXc-6u; Tue, 18 Jun 2024 05:01:24 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: kernel-dev@igalia.com, Melissa Wen <mwen@igalia.com>,
 alexander.deucher@amd.com, christian.koenig@amd.com,
 Simon Ser <contact@emersion.fr>, Pekka Paalanen <ppaalanen@gmail.com>,
 daniel@ffwll.ch, Daniel Stone <daniel@fooishbar.org>,
 =?UTF-8?q?=27Marek=20Ol=C5=A1=C3=A1k=27?= <maraeo@gmail.com>,
 Dave Airlie <airlied@gmail.com>, ville.syrjala@linux.intel.com,
 Xaver Hugl <xaver.hugl@gmail.com>, Joshua Ashton <joshua@froggi.es>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
Subject: [PATCH v7 6/9] drm/nouveau: Enable async flips on the primary plane
Date: Tue, 18 Jun 2024 00:00:21 -0300
Message-ID: <20240618030024.500532-7-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240618030024.500532-1-andrealmeid@igalia.com>
References: <20240618030024.500532-1-andrealmeid@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

This driver can perfom async flips on primary planes, so enable it.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
 drivers/gpu/drm/nouveau/dispnv04/crtc.c | 4 ++++
 drivers/gpu/drm/nouveau/dispnv50/wndw.c | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/crtc.c b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
index 4310ad71870b..fd06d46d49ec 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
@@ -1285,6 +1285,7 @@ int
 nv04_crtc_create(struct drm_device *dev, int crtc_num)
 {
 	struct nouveau_display *disp = nouveau_display(dev);
+	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nouveau_crtc *nv_crtc;
 	struct drm_plane *primary;
 	int ret;
@@ -1338,6 +1339,9 @@ nv04_crtc_create(struct drm_device *dev, int crtc_num)
 	if (ret)
 		return ret;
 
+	if (drm->client.device.info.chipset >= 0x11)
+		primary->async_flip = true;
+
 	return nvif_head_vblank_event_ctor(&nv_crtc->head, "kmsVbl", nv04_crtc_vblank_handler,
 					   false, &nv_crtc->vblank);
 }
diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
index 7a2cceaee6e9..55db0fdf61e7 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
@@ -763,6 +763,10 @@ nv50_wndw_new_(const struct nv50_wndw_func *func, struct drm_device *dev,
 			return ret;
 	}
 
+	if (type == DRM_PLANE_TYPE_PRIMARY &&
+	    drm->client.device.info.chipset >= 0x11)
+		wndw->plane.async_flip = true;
+
 	return 0;
 }
 
-- 
2.45.2

