Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3FF7D3092
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 13:00:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A37D610E1AA;
	Mon, 23 Oct 2023 11:00:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E81510E1AD
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 11:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UM4hz8FlQFD9fzAMIHsfTKLURP0ILRuo7/0sQnIbBrk=; b=Zv1itfwiCYhA5vRaT3iWIraE6/
 YsOqeqiVfwtrr//2gKDTBkyfeHdGb/ZZkxSVRK4I/gx95FrLnAJolypCKsND+pUgJCMaz+uh8iB3k
 FKJNEkeS9LRvjRSCcMZeNVEXaS/TqvfXglfoyJzWOaI07WEjE1g3o8GuL0u4ASnqttDCXE3FUEjr3
 BXPTeAemJcwbuLNbJvqkhlMY91MocO/jM1Vku4ylq+4Mzn+xsGKj8/pxi0Xyd6f7VK5lM9WjJXcQ6
 8Tuv4mWcSTFSns/tOLQX9JpbTynNglHDBcWPFoFtfs3Zci5daDy4RmK5T8Y4OSD/VD2mINDEMaBpC
 KgH2P4kg==;
Received: from [177.34.168.16] (helo=morissey..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qusey-005YGM-KA; Mon, 23 Oct 2023 12:59:49 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Emma Anholt <emma@anholt.net>, Melissa Wen <mwen@igalia.com>,
 Iago Toral <itoral@igalia.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 1/2] drm/v3d: wait for all jobs to finish before unregistering
Date: Mon, 23 Oct 2023 07:58:33 -0300
Message-ID: <20231023105927.101502-1-mcanal@igalia.com>
X-Mailer: git-send-email 2.41.0
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
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, we are only warning the user if the BIN or RENDER jobs don't
finish before we unregister V3D. We must wait for all jobs to finish
before unregistering. Therefore, warn the user if TFU or CSD jobs
are not done by the time the driver is unregistered.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_gem.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index 2e94ce788c71..afa7d170d1ff 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -1072,6 +1072,8 @@ v3d_gem_destroy(struct drm_device *dev)
 	 */
 	WARN_ON(v3d->bin_job);
 	WARN_ON(v3d->render_job);
+	WARN_ON(v3d->tfu_job);
+	WARN_ON(v3d->csd_job);
 
 	drm_mm_takedown(&v3d->mm);
 
-- 
2.41.0

