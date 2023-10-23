Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 378357D3094
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 13:00:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC3DB10E1AE;
	Mon, 23 Oct 2023 11:00:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D4EE10E1AC
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 11:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kjlw/hFajWEkad4BTTJuNeTTMo5oMTr0YLm0Dd5Fys0=; b=RKHx6fOF1tgfzsIJTHbGTI9ajN
 gyqdwkhTv+cgaTnCbeLB/Zqft9PKJGnszMH0R+FYD2XY8XEsezqVkY4tZC4Fi75GDUsAfHeqDc/Ha
 woKmOahBx7HNF7RN6lsjPj1Sx3GHK68xXSNdvptDYdTwBjGmuJvEMqfbhwZ3oE+5mbqKqLzveVOVl
 nnW2U3m3qLTHJCKquR6/z74PREBEFXTtRVUJ2GpaUWZL5k+WCrD2tZHvT0Eh7eyODSKeUG5i2NMeU
 9iUVD0wLCNGCKLsZmNVALrswmOK4eo0tdznh3xf3MycFWKLXKMiEzb4g3K85tMTvWjd8bm6RwM2D5
 XSBXiXgg==;
Received: from [177.34.168.16] (helo=morissey..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qusf2-005YGM-Jx; Mon, 23 Oct 2023 12:59:53 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Emma Anholt <emma@anholt.net>, Melissa Wen <mwen@igalia.com>,
 Iago Toral <itoral@igalia.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/2] drm/v3d: assure that the job is NULL after being freed
Date: Mon, 23 Oct 2023 07:58:34 -0300
Message-ID: <20231023105927.101502-2-mcanal@igalia.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231023105927.101502-1-mcanal@igalia.com>
References: <20231023105927.101502-1-mcanal@igalia.com>
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

After the job is finished and freed, we need to make sure that the job is
NULL. Otherwise, we would get a warning when unloading the driver, as it
would look like the job still exists. Therefore, after freeing the job,
let's assign it to NULL in order to indicate that the job has finished.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_gem.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index afa7d170d1ff..61a7f36fc8e2 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -333,6 +333,7 @@ v3d_job_free(struct kref *ref)
 		v3d_perfmon_put(job->perfmon);

 	kfree(job);
+	job = NULL;
 }

 static void
--
2.41.0

