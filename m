Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCD5488BB6
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jan 2022 19:42:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E99BB10E47F;
	Sun,  9 Jan 2022 18:42:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F1AB10E47F;
 Sun,  9 Jan 2022 18:42:52 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id k18so22603514wrg.11;
 Sun, 09 Jan 2022 10:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jn0u+te7zIQxHFsF/4HQOfQXP/h46v9vhoCHXHHc57E=;
 b=L/ToGy2JVc45aN1S8otB5yM6xrY1DVo+YF/OQVC9ftRg+4uFnESrbUPYVILiJaC/B+
 rzDCcAVJggQOraAbFF0xl3hSrrGPF4JmYPc9tacKG7GnHh2H0k22hYI3X+kqkaMiOMXr
 F/J5VzVBzRRE9FokJ6KITmDi/tSaz4YOTSiePwd2YjCV4ZFhenTrgUTd59W2ZCiUsUIb
 ml3t6WtA1fyU614c8eyLKCaTxG0PcQISBz6lJmnwgvczDFKp3Yf+M3wMgZ2Epk3i/MtZ
 /u2YR/rkhQcYPAj+jBinCBnbz8VREojF5MJiDuby98V8bywN1oeJ9ANrtc93Uy2zvx6H
 MwVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jn0u+te7zIQxHFsF/4HQOfQXP/h46v9vhoCHXHHc57E=;
 b=LOI9Zifcdj9nZGEIxZmbGuK7EGqoCf+zp/fIbITnbR8HFXG8YvapMH6JSSHiBVuCLZ
 0lq0aTPs5U/JjXVwTfsuiBTANtgMT8QLJQSfNUEk2lbAOyGXxTTJj6EeLkrl3MGmThHy
 TppWAw5wuekm64RvjcSImR1f6v5InVVikbrZG6QYZI5rzR48Ndq2s5EhHaPL6PwSXHMM
 G6OjBCmuSDZX4VRpN7yIkCXdGkvqLrVAyeFNE6yBLiinjPQS1kVWNuRorx7CUdnwaQ1p
 WAIIRUytmoCQIPkI9mSGRts2PwHYBFfo8/W0WSSB4vxK6DR8y5eSKLODfqs0O8FzGttk
 oOpA==
X-Gm-Message-State: AOAM530d2ZVRzpbxcvR9P4PW/6Y0nEgKI6E1aRz93RuDr3a6oxWFu970
 dW3gDyBdZQ9vaD39XdZGMZI=
X-Google-Smtp-Source: ABdhPJym1kK0j3QoImwCAJUPh+lD8ErRuOsuUOU8oVTIbJXjQsEJPs04GUvk1T0BBf+0bSuRaJVoJg==
X-Received: by 2002:adf:ab59:: with SMTP id r25mr9771207wrc.321.1641753771561; 
 Sun, 09 Jan 2022 10:42:51 -0800 (PST)
Received: from localhost.localdomain ([217.113.240.86])
 by smtp.gmail.com with ESMTPSA id n15sm5570075wmc.0.2022.01.09.10.42.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 10:42:51 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: shenshih@amd.com
Subject: [PATCH] drm/amd/display: invalid parameter check in dmub_hpd_callback
Date: Sun,  9 Jan 2022 19:42:45 +0100
Message-Id: <20220109184245.124850-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Anson.Jacob@amd.com, sunpeng.li@amd.com, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, nicholas.kazlauskas@amd.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The function performs a check on the "adev" input parameter, however, it
is used before the check.

Initialize the "dev" variable after the sanity check to avoid a possible
NULL pointer dereference.

Fixes: e27c41d5b0681 ("drm/amd/display: Support for DMUB HPD interrupt handling")
Addresses-Coverity-ID: 1493909 ("Null pointer dereference")
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index e727f1dd2a9a..7fbded7a6d9c 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -656,7 +656,7 @@ void dmub_hpd_callback(struct amdgpu_device *adev, struct dmub_notification *not
 	struct drm_connector_list_iter iter;
 	struct dc_link *link;
 	uint8_t link_index = 0;
-	struct drm_device *dev = adev->dm.ddev;
+	struct drm_device *dev;
 
 	if (adev == NULL)
 		return;
@@ -673,6 +673,7 @@ void dmub_hpd_callback(struct amdgpu_device *adev, struct dmub_notification *not
 
 	link_index = notify->link_index;
 	link = adev->dm.dc->links[link_index];
+	dev = adev->dm.ddev;
 
 	drm_connector_list_iter_begin(dev, &iter);
 	drm_for_each_connector_iter(connector, &iter) {
-- 
2.25.1

