Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 154939C17BE
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 09:21:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 112DA10E373;
	Fri,  8 Nov 2024 08:20:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="PJjcwpYg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35C9110E36F
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2024 08:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1731054055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mZoaRFNucW8/vSTTo4IXqqRzuuRIBqeFEE4/Iywql7c=;
 b=PJjcwpYgC8Alw9MyUpnO7uFfoylC1ai6Z+WOm6Ii32IchSboc94rwIRhQovBFlNzXd25VA
 mM1BeEj7mF69gwEt8B+2e9aCC8nNzlF0dEvfYEC0rc8FeUlxWatLZk8Cb8goRRnkMzEuZ7
 mdyHVRvetv6Y4o1iFkrQLgUninBrkKk=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-441-yVksGHYYOE2-5Nmh3aAW8A-1; Fri,
 08 Nov 2024 03:20:51 -0500
X-MC-Unique: yVksGHYYOE2-5Nmh3aAW8A-1
X-Mimecast-MFC-AGG-ID: yVksGHYYOE2-5Nmh3aAW8A
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 8E8781955DCE; Fri,  8 Nov 2024 08:20:48 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.51])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 39CDF1955F3D; Fri,  8 Nov 2024 08:20:43 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, John Ogness <john.ogness@linutronix.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
 bluescreen_avenger@verizon.net, Caleb Connolly <caleb.connolly@linaro.org>,
 Petr Mladek <pmladek@suse.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH v7 2/7] drm/client: Always select DRM_CLIENT_LIB
Date: Fri,  8 Nov 2024 09:10:20 +0100
Message-ID: <20241108082025.1004653-3-jfalempe@redhat.com>
In-Reply-To: <20241108082025.1004653-1-jfalempe@redhat.com>
References: <20241108082025.1004653-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
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

DRM_CLIENT_LIB has the code to select the client at runtime, so it should be
always selected by DRM_CLIENT_SELECTION.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---

v7:
 * Added in v7, to fix a build issue, if DRM_LOG is enabled but DRM_CLIENT_LIB is not.
 
 drivers/gpu/drm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 3f16dca0b6643..eabedfc11061c 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -234,7 +234,7 @@ config DRM_CLIENT_LIB
 config DRM_CLIENT_SELECTION
 	tristate
 	depends on DRM
-	select DRM_CLIENT_LIB if DRM_FBDEV_EMULATION
+	select DRM_CLIENT_LIB
 	help
 	  Drivers that support in-kernel DRM clients have to select this
 	  option.
-- 
2.47.0

