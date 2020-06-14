Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 375B11F8FDE
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 09:29:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E8866E2AF;
	Mon, 15 Jun 2020 07:28:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E30C88985A;
 Sun, 14 Jun 2020 07:05:38 +0000 (UTC)
Received: by mail-il1-x141.google.com with SMTP id 9so12454031ilg.12;
 Sun, 14 Jun 2020 00:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=0XuYLXE5LXbZw3w+xu/hegikrINLkb1ZDvcbBdL0ayM=;
 b=LpaxFuy0s9GL1das7axADmDQ6Y1YqWAaWu1hxP1r1ZBSYNJpSrMug1KhN4q+TZvseA
 7EOd510jkNdZmnilgAEOcAOag30TLmRIMFyNaC28MKtS92uKCMwH5YPwr2KLKrxjA+KV
 7AMPBAiqfyWrCSV6Bkz4HekY6xGvVh0HSkrQBo9EZWnJERzqcG+jZSstD067A3CneKFG
 D5MDWKZ3HozR1wjSWVLubkRq0yUXkPqV5kTSttF4AGXhX/J7bG7muzBSe+ybPdh9gXwk
 jd/B50nQz8rjRmndlA4BPTIDx7DC3v43BruUxo3d3LpAL3mlY+eCMx9nz5ID7yUGQlkw
 a1GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=0XuYLXE5LXbZw3w+xu/hegikrINLkb1ZDvcbBdL0ayM=;
 b=IJw+WJ/x9uAqT0Wib+wH7x5aDlxlgoBscXmsXraBhtycmQIq93y0fwjWLjXc5Q0Lpk
 oAXrUXaSfwSCbamsJ+GAE8QyYNEBJ5sqzbKu4WpL/mTMJ4Spy7IoXq5xH8pieXuVUlWG
 GoH4KsBB8LTrR6uwshwQhC7goMCWWum3cJoLF+DlKtoquGRyQKXL5m/zhNa8Khhbh1J5
 I6pDaPSPa1liVl7C9gWAGavrZwjS9qrIVeHkUneM6qmu/dhXKfIxpMtiXSJ1P5/F5K5r
 Z2fQogCEhRZ74HAsiZgBGkn7jqi5Wjln1hsn6NG71NHIsrDqLDka0356Fx8fRepWZrA9
 6ugQ==
X-Gm-Message-State: AOAM531aIfcfHPf5T7WIF4rEky3HO846bw3+HqOlrMMRi2gI8iInF8F/
 /o1yfELttqiYIscD76Zu+ew=
X-Google-Smtp-Source: ABdhPJy24po3ZTlu9/GPx5XVlvsADFJvpxCf44M5BuTfT1nO7/H8lWeq4lUmzcuJYTAkE5nprNwvcg==
X-Received: by 2002:a92:2454:: with SMTP id k81mr20064215ilk.24.1592118338299; 
 Sun, 14 Jun 2020 00:05:38 -0700 (PDT)
Received: from cs-u-kase.dtc.umn.edu (cs-u-kase.cs.umn.edu. [160.94.64.2])
 by smtp.googlemail.com with ESMTPSA id c62sm6132702ill.62.2020.06.14.00.05.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jun 2020 00:05:37 -0700 (PDT)
From: Navid Emamdoost <navid.emamdoost@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Lyude Paul <lyude@redhat.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Navid Emamdoost <navid.emamdoost@gmail.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amdgpu/display: fix ref count leak when
 pm_runtime_get_sync fails
Date: Sun, 14 Jun 2020 02:05:28 -0500
Message-Id: <20200614070530.56366-1-navid.emamdoost@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 15 Jun 2020 07:27:17 +0000
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
Cc: emamd001@umn.edu, kjlu@umn.edu, wu000273@umn.edu, smccaman@umn.edu
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The call to pm_runtime_get_sync increments the counter even in case of
failure, leading to incorrect ref count.
In case of failure, decrement the ref count before returning.

Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
index f355d9a752d2..a1aec205435d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
@@ -716,8 +716,10 @@ amdgpu_connector_lvds_detect(struct drm_connector *connector, bool force)
 
 	if (!drm_kms_helper_is_poll_worker()) {
 		r = pm_runtime_get_sync(connector->dev->dev);
-		if (r < 0)
+		if (r < 0) {
+			pm_runtime_put_autosuspend(connector->dev->dev);
 			return connector_status_disconnected;
+		}
 	}
 
 	if (encoder) {
@@ -854,8 +856,10 @@ amdgpu_connector_vga_detect(struct drm_connector *connector, bool force)
 
 	if (!drm_kms_helper_is_poll_worker()) {
 		r = pm_runtime_get_sync(connector->dev->dev);
-		if (r < 0)
+		if (r < 0) {
+			pm_runtime_put_autosuspend(connector->dev->dev);
 			return connector_status_disconnected;
+		}
 	}
 
 	encoder = amdgpu_connector_best_single_encoder(connector);
@@ -977,8 +981,10 @@ amdgpu_connector_dvi_detect(struct drm_connector *connector, bool force)
 
 	if (!drm_kms_helper_is_poll_worker()) {
 		r = pm_runtime_get_sync(connector->dev->dev);
-		if (r < 0)
+		if (r < 0) {
+			pm_runtime_put_autosuspend(connector->dev->dev);
 			return connector_status_disconnected;
+		}
 	}
 
 	if (!force && amdgpu_connector_check_hpd_status_unchanged(connector)) {
@@ -1328,8 +1334,10 @@ amdgpu_connector_dp_detect(struct drm_connector *connector, bool force)
 
 	if (!drm_kms_helper_is_poll_worker()) {
 		r = pm_runtime_get_sync(connector->dev->dev);
-		if (r < 0)
+		if (r < 0) {
+			pm_runtime_put_autosuspend(connector->dev->dev);
 			return connector_status_disconnected;
+		}
 	}
 
 	if (!force && amdgpu_connector_check_hpd_status_unchanged(connector)) {
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
