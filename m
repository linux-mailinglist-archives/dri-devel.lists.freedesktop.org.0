Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3F36EBFED
	for <lists+dri-devel@lfdr.de>; Sun, 23 Apr 2023 16:12:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D9E510E3C4;
	Sun, 23 Apr 2023 14:12:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CFA310E2E9;
 Sun, 23 Apr 2023 14:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=t2oXYPnyQYeafj80rDPPBk4DJ8Bih7Zw8inrjzwVK2k=; b=aP6aQ5wQasUVq+wLWIjGodQt00
 LxejcRVm0NGApRky08NWdEeUpFtwqFGXZfG1nFO+TauDItvUKPJRf4yCfAHbqZI8qYIEhweQNuAZs
 e2PLcbfp7TVVKU3ZcyHGOl72JvMeTc5Qm5FPNTzGdGWbDtWZ8XSr2FqwIykOJrbQz2CaR9WsQma54
 5DUODHpMMNwr+CNxJPFDVcIAq0sWsEWcq2cASJvjU51Dt697lL0odeA0v97oRsyGj3YvynKp/EeG8
 3CGyaECE2hrwsRGd1wZtCOcoA67uI+hnGrVSX2jH5VuebhzdRABy7cjpsiXFDDSU//wlF63/I3guE
 WxIN7RFQ==;
Received: from nat-wifi.fi.muni.cz ([147.251.43.9] helo=killbill.fi.muni.cz)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pqaRe-00ANVs-Kv; Sun, 23 Apr 2023 16:12:02 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [RFC PATCH 03/40] drm/amd/display: introduce Steam Deck color
 features to AMD display driver
Date: Sun, 23 Apr 2023 13:10:15 -0100
Message-Id: <20230423141051.702990-4-mwen@igalia.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230423141051.702990-1-mwen@igalia.com>
References: <20230423141051.702990-1-mwen@igalia.com>
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Shashank Sharma <Shashank.Sharma@amd.com>, Alex Hung <alex.hung@amd.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, linux-kernel@vger.kernel.org,
 Melissa Wen <mwen@igalia.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We are enabling a large set of color calibration features to enhance KMS
color mgmt but these properties are specific of AMD display HW, and
cannot be provided by other vendors. Therefore, set a config option to
enable AMD driver-private properties used on Steam Deck color mgmt
pipeline.

Co-developed-by: Joshua Ashton <joshua@froggi.es>
Signed-off-by: Joshua Ashton <joshua@froggi.es>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/amd/display/Kconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/Kconfig b/drivers/gpu/drm/amd/display/Kconfig
index 06b438217c61..c45a8deb1098 100644
--- a/drivers/gpu/drm/amd/display/Kconfig
+++ b/drivers/gpu/drm/amd/display/Kconfig
@@ -53,5 +53,11 @@ config DRM_AMD_SECURE_DISPLAY
             of crc of specific region via debugfs.
             Cooperate with specific DMCU FW.
 
+config STEAM_DECK
+	bool "Enable color calibration features for Steam Deck"
+	depends on DRM_AMD_DC
+	help
+	  Choose this option if you want to use AMDGPU features for broader
+	  color management support on Steam Deck.
 
 endmenu
-- 
2.39.2

