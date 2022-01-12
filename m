Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4554148C036
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 09:48:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63385112D3F;
	Wed, 12 Jan 2022 08:48:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8722D112D3C
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 08:48:35 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id r28so2858151wrc.3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 00:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RSPnyrRswexikOyiWIHNeiaTOVsRKfEItQusWN5Uic8=;
 b=cDMMDbCjvMkpAxzjaDysSyRi3J0mJWxBU8rnfU5xn/dVUh+6WSPICfuVzEJcG9nlky
 38tpSLHGG8kubFVdh4SSaeFYgs+IyNi4feq+gZOzz+xvG+iLaQNG5RzzxsHRlZ1spDwJ
 yz2JNiaHdGpeM8jjTlrVLWc49gsm3eB1AoiUME2T4e6POFKRwqFvWJ+t3YHglt9uOCr4
 SEdWvqG7iF/9Ond5Ktxex9VCillYxvWcsxwg5IMVA98l+qCeJTM8mZXVoUobqaixIrbn
 uYWbT6FZ1OiE4Ohekt5/VER0hQLXj7OZ0fHNeQIRfs3ySwxEZQmRv9akjCae4Vb+XWaF
 stbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RSPnyrRswexikOyiWIHNeiaTOVsRKfEItQusWN5Uic8=;
 b=Ag+Z28wb/YrW97Js1Pun066CKUhH2cHB+8UXIJInh++iXYxq3qlrNPNRZ/+J1mGojs
 gUl5Vfcgl3RO5S7EkoCb0vz1VXPAHup8lAvEcex/AtmS0ZTkZ2GIWCohv3niAojpYBYr
 S8LhmXTmmsGe7rZrsypAFURTTgf6u7xMUvhkaOmKZt3PTr9bvYgY51v0ECXnngelHQ5R
 eCjamOlGEVZq5DrxfE7SSTC7s/TlvoXMjbZUqUkSzx96WtcAhl0o4baR1D/4lpX5XCiy
 6r+b3QvyHwEPaseHbaJKlHRxhcVHR2bhNv3PZ5U+5P8GZUWOK53/EOyUDxfyUzbhstLq
 884g==
X-Gm-Message-State: AOAM5327sNIuFKNXV9EF2GsJaRp5I4riR6FqqBIzovot8LikfOLJgliT
 leXhz0Jf+UUTQhnrofV9jGJVptsKHCjV2w==
X-Google-Smtp-Source: ABdhPJxA/TepMw2dd111vuDL70ElA1lcEhts9RoXOBo6RLQFkDyLXMy0etqdaiTSWp8S9Kj4PmqCPg==
X-Received: by 2002:a5d:5342:: with SMTP id t2mr6438232wrv.215.1641977314138; 
 Wed, 12 Jan 2022 00:48:34 -0800 (PST)
Received: from localhost ([193.209.96.43])
 by smtp.gmail.com with ESMTPSA id p62sm3686207wmp.10.2022.01.12.00.48.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 00:48:33 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 1/2] drm/tegra: Fix planar formats on Tegra186 and later
Date: Wed, 12 Jan 2022 09:48:27 +0100
Message-Id: <20220112084828.230780-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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
Cc: Maniraj D <md@nvidia.com>, linux-tegra@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

Use the correct pitch when programming the DC_WIN_PLANAR_STORAGE_UV
register's PITCH_U field to ensure the correct value is used in all
cases. This isn't currently causing any problems because the pitch
for both U and V planes is always the same.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/hub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
index b910155f80c4..fc9813e6b2c9 100644
--- a/drivers/gpu/drm/tegra/hub.c
+++ b/drivers/gpu/drm/tegra/hub.c
@@ -673,7 +673,7 @@ static void tegra_shared_plane_atomic_update(struct drm_plane *plane,
 		tegra_plane_writel(p, upper_32_bits(base), DC_WINBUF_START_ADDR_HI_V);
 		tegra_plane_writel(p, lower_32_bits(base), DC_WINBUF_START_ADDR_V);
 
-		value = PITCH_U(fb->pitches[2]) | PITCH_V(fb->pitches[2]);
+		value = PITCH_U(fb->pitches[1]) | PITCH_V(fb->pitches[2]);
 		tegra_plane_writel(p, value, DC_WIN_PLANAR_STORAGE_UV);
 	} else {
 		tegra_plane_writel(p, 0, DC_WINBUF_START_ADDR_U);
-- 
2.34.1

