Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id COo5FQ+qgWn0IQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 08:55:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF92BD5E43
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 08:55:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33CFB10E30E;
	Tue,  3 Feb 2026 07:55:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="itt4zHMZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9AB610E30E
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 07:55:54 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4806ce0f97bso44701755e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Feb 2026 23:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1770105353; x=1770710153;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qmHyVEr++wpRSnz4Jn6qt3RgQDZ7+xjd99ZnGXWHUBY=;
 b=itt4zHMZvpcOHd+35mzo9UG7k0fskp7n2zD2vffAUDHx55IRgyG858MfKMDvNEMd9Z
 zQGhPiZqytJ7E9Snsqkrc/6ilytTXcl0Zn6EJ1pd0rmVf30gsFqnO9fQIOyqpq/3Cuy9
 pi5T6vqhnxY8QWyBFxnIubz1h+GZ3VjBkwuIA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770105353; x=1770710153;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qmHyVEr++wpRSnz4Jn6qt3RgQDZ7+xjd99ZnGXWHUBY=;
 b=A81r/lq1g9rBzinkeHmJNHNgE9/h4aOk7+8/uOm+7QmwBdb4orUSfNNWs1Hh3wxYc7
 9xDxLpNCzhSyo3kPyZ7U7kTEF6zkdOm6XisJ4GGpWibvo30ZSVuv5aIoMiRhqvtd8w9S
 YH1ELtERJLFIoXKIakqvDqe8Li/al3X9Mub7ZzzXC2bRaPPBKqedOs3sy5a6Jz9PINjN
 qZMYS9Yj6hxnG9+mvPVQD6tKtrzsBF9Sx7skyam6F5gp7AMKvcsnDmckrx0r8Knxo/nh
 BHSnplknApHTSSpQDGEa0rpfKnf9rlNex5LYs9xN6US8Y236ulN8JpeJ6YotFS0VTKiW
 nNhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmlfXv3ufR7n9zQfuncT63fI/rPe41nhSa7QDxJq8Jj1GY0cs2Dh06ANk/PoB/1dmoUguvjDHVp2M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyCsNi/dR/3xclY7jG6+wxjHjCkOvER4s/186PQlH1mq0BdC9x8
 5KmvXcmFWoYi+9N6C0kZO/cHpreQ3QbQY6RZmFeyAizAtQ1+28zT/g9xZG7acS+QdZk=
X-Gm-Gg: AZuq6aKeALD47ImHdToJbYdvlkn//Elx+7xOCbXhk4RI79DjGlX3sgtzCHl3PiuIJgH
 MEBBlj+wAbL6x+Tl3bc6hbnHsFQyNOxFiUKZXpfOU/g2zHn8Lsi06pDTz/LwjK+xel+DMsDxXM5
 YAzKUpF/KVMAWQgS2VeFc2B9cihDwR0usTx/gb5iOJtnHvLldZcUHwQcILNS3X9B05BTJ6L28F4
 UBj91VNs3jeBDjA+iUZfmRIy5WbdiFaKL+3J754cfkhaYc2vL4QJq4s3RULLXsVQ19U8dJbETtF
 Ll/hAe/mTkuOC+ZkH2Aonl9ZOD3cxknFRujEDPYJRN+vFpQpqEgfPWw02Bdl1vsWDNz+NV9XCZC
 5gDvPAVhFOMI6rGHBP9ainKeLiwt72nZYcR6RMKWDGZNuq1nHN8ZzPLpWpYejsxmHtXem9zDTkr
 ROD8eZT9du+t7c7EndXpO4LU5so7CP7+D1Af4w1PhibquF8AJh//4Nb2oqTRNlo625RLDGvJlO9
 7BBzGD6/ihBBkuxQIXPYEB8ol9qOPS0QyYMGdH4vSi31HqGjYrHXxIFaBNmNh9Ri5ztTM7N6RYK
 URgZaAFxexc=
X-Received: by 2002:a05:600c:4506:b0:47d:8479:78d5 with SMTP id
 5b1f17b1804b1-482db4486demr193813085e9.7.1770105353123; 
 Mon, 02 Feb 2026 23:55:53 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-95-248-31-95.retail.telecomitalia.it. [95.248.31.95])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-482e267b699sm111939885e9.16.2026.02.02.23.55.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Feb 2026 23:55:52 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 David Airlie <airlied@gmail.com>, Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v3 1/4] drm/panel: ilitek-ili9806e: rename to specific DSI
 driver
Date: Tue,  3 Feb 2026 08:54:48 +0100
Message-ID: <20260203075548.14907-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203075548.14907-1-dario.binacchi@amarulasolutions.com>
References: <20260203075548.14907-1-dario.binacchi@amarulasolutions.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amarulasolutions.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amarulasolutions.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[amarulasolutions.com,gmail.com,linux.intel.com,kernel.org,linaro.org,ffwll.ch,suse.de,lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:linux-amarula@amarulasolutions.com,m:dario.binacchi@amarulasolutions.com,m:airlied@gmail.com,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:mwalle@kernel.org,m:neil.armstrong@linaro.org,m:simona@ffwll.ch,m:tzimmermann@suse.de,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[dario.binacchi@amarulasolutions.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dario.binacchi@amarulasolutions.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amarulasolutions.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amarulasolutions.com:email,amarulasolutions.com:dkim,amarulasolutions.com:mid,dlh.de:email,edgeble.ai:email]
X-Rspamd-Queue-Id: DF92BD5E43
X-Rspamd-Action: no action

The Ilitek ILI9806E controller can support different transport buses,
such as MIPI-DSI and SPI. The current implementation is specific to
the MIPI-DSI interface.

In preparation for adding SPI support, rename the current Kconfig
symbol and files to be DSI-specific, clarifying the current scope
of the code.

Since DRM_PANEL_ILITEK_ILI9806E is not used in any in-tree defconfig,
the symbol is renamed directly to DRM_PANEL_ILITEK_ILI9806E_DSI without
providing a legacy compatibility alias.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 MAINTAINERS                                                 | 2 +-
 drivers/gpu/drm/panel/Kconfig                               | 6 +++---
 drivers/gpu/drm/panel/Makefile                              | 2 +-
 ...{panel-ilitek-ili9806e.c => panel-ilitek-ili9806e-dsi.c} | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)
 rename drivers/gpu/drm/panel/{panel-ilitek-ili9806e.c => panel-ilitek-ili9806e-dsi.c} (99%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0efa8cc6775b..46941413ed5c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7917,7 +7917,7 @@ F:	drivers/gpu/drm/panel/panel-ilitek-ili9805.c
 DRM DRIVER FOR ILITEK ILI9806E PANELS
 M:	Michael Walle <mwalle@kernel.org>
 S:	Maintained
-F:	drivers/gpu/drm/panel/panel-ilitek-ili9806e.c
+F:	drivers/gpu/drm/panel/panel-ilitek-ili9806e-dsi.c
 
 DRM DRIVER FOR JADARD JD9365DA-H3 MIPI-DSI LCD PANELS
 M:	Jagan Teki <jagan@edgeble.ai>
diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 7a83804fedca..692cd474910d 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -257,14 +257,14 @@ config DRM_PANEL_ILITEK_ILI9805
 	  Say Y if you want to enable support for panels based on the
 	  Ilitek ILI9805 controller.
 
-config DRM_PANEL_ILITEK_ILI9806E
-	tristate "Ilitek ILI9806E-based panels"
+config DRM_PANEL_ILITEK_ILI9806E_DSI
+	tristate "Ilitek ILI9806E-based DSI panels"
 	depends on OF
 	depends on DRM_MIPI_DSI
 	depends on BACKLIGHT_CLASS_DEVICE
 	help
 	  Say Y if you want to enable support for panels based on the
-	  Ilitek ILI9806E controller.
+	  Ilitek ILI9806E controller using DSI.
 
 config DRM_PANEL_ILITEK_ILI9881C
 	tristate "Ilitek ILI9881C-based panels"
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index b9562a6fdcb3..00071a983242 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -26,7 +26,7 @@ obj-$(CONFIG_DRM_PANEL_HYDIS_HV101HD1) += panel-hydis-hv101hd1.o
 obj-$(CONFIG_DRM_PANEL_ILITEK_IL9322) += panel-ilitek-ili9322.o
 obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9341) += panel-ilitek-ili9341.o
 obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9805) += panel-ilitek-ili9805.o
-obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9806E) += panel-ilitek-ili9806e.o
+obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9806E_DSI) += panel-ilitek-ili9806e-dsi.o
 obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9881C) += panel-ilitek-ili9881c.o
 obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9882T) += panel-ilitek-ili9882t.o
 obj-$(CONFIG_DRM_PANEL_INNOLUX_EJ030NA) += panel-innolux-ej030na.o
diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9806e.c b/drivers/gpu/drm/panel/panel-ilitek-ili9806e-dsi.c
similarity index 99%
rename from drivers/gpu/drm/panel/panel-ilitek-ili9806e.c
rename to drivers/gpu/drm/panel/panel-ilitek-ili9806e-dsi.c
index 18aa6222b0c5..c337c4f1a1c7 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9806e.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9806e-dsi.c
@@ -561,5 +561,5 @@ module_mipi_dsi_driver(ili9806e_dsi_driver);
 
 MODULE_AUTHOR("Gunnar Dibbern <gunnar.dibbern@lht.dlh.de>");
 MODULE_AUTHOR("Michael Walle <mwalle@kernel.org>");
-MODULE_DESCRIPTION("Ilitek ILI9806E Controller Driver");
+MODULE_DESCRIPTION("Ilitek ILI9806E Controller DSI Driver");
 MODULE_LICENSE("GPL");
-- 
2.43.0

