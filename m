Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E67C502CC
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 02:09:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1345210E673;
	Wed, 12 Nov 2025 01:09:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="tGYZVEYq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCC3110E170
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 01:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=NsS59IXSj5jegneAivwBeGXSqjVrZ5mDRtYxdYZ1Jo8=; b=tGYZVEYq0OFwayEg3NVYqBotLZ
 bAGNvCdhdFctJjmZVcGVN2vdiXklm6VJUuPghMyRwzEqVRhosqxMvf5V1WG4Tz8wXRuSZgpoRgmm4
 EbcfrbYR+Bepxdx5dhLTeaMHunsrhwwCIzSNjLsOsJmCNaTaXgeo5Vv90ekMOxljrHaNMaOWPaqoE
 a05/AzEJCqUC7qXpSrc3e+kMCKzEIe1i8MG4ZeOayYeM58G/UX3ekMKewMju33eNVUTQ9YQH0991d
 CreCEC4NrDBfCqvDIaJWvxuYpYXMsbiZfjm3YGGv1MzaGnPICOF7bOl/oRZnUWvflr/PwiMGOY3Pb
 SDtApoxw==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vIzMP-00000007wnd-0uHr; Wed, 12 Nov 2025 01:09:21 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: dri-devel@lists.freedesktop.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jocelyn Falempe <jfalempe@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>
Subject: [PATCH] drm/client: fix MODULE_PARM_DESC string for "active"
Date: Tue, 11 Nov 2025 17:09:20 -0800
Message-ID: <20251112010920.2355712-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.51.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The MODULE_PARM_DESC string for the "active" parameter is missing a
space and has an extraneous trailing ']' character. Correct these.

Before patch:
$ modinfo -p ./drm_client_lib.ko
active:Choose which drm client to start, default isfbdev] (string)

After patch:
$ modinfo -p ./drm_client_lib.ko
active:Choose which drm client to start, default is fbdev (string)

Fixes: f7b42442c4ac ("drm/log: Introduce a new boot logger to draw the kmsg on the screen")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/clients/drm_client_setup.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linux-next-20251110.orig/drivers/gpu/drm/clients/drm_client_setup.c
+++ linux-next-20251110/drivers/gpu/drm/clients/drm_client_setup.c
@@ -13,8 +13,8 @@
 static char drm_client_default[16] = CONFIG_DRM_CLIENT_DEFAULT;
 module_param_string(active, drm_client_default, sizeof(drm_client_default), 0444);
 MODULE_PARM_DESC(active,
-		 "Choose which drm client to start, default is"
-		 CONFIG_DRM_CLIENT_DEFAULT "]");
+		 "Choose which drm client to start, default is "
+		 CONFIG_DRM_CLIENT_DEFAULT);
 
 /**
  * drm_client_setup() - Setup in-kernel DRM clients
