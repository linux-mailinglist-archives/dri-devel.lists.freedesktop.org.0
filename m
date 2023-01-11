Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FC9665F73
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 16:41:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32F3210E779;
	Wed, 11 Jan 2023 15:41:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16C3010E771
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 15:41:31 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 m26-20020a05600c3b1a00b003d9811fcaafso12970696wms.5
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 07:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=okH8AsNmtLn+Xev5OTCMqwCCcQgJeFP0KaGCnceKOFQ=;
 b=e3QgYRhA/FauY7S29GhmvTbp6mhIVjL3kUKyk/aiNJTXGHtP9m5oMyVm5h+bchf5VB
 5Ozpe8kode9PPOMtykJJWS4wCtMq4JeTqLZWhNsrNNrrwUmqJgCj6729094+1wKf7qV8
 SfwbZApVC/cUEh7SexrqejM4npd5PFpvVRP4I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=okH8AsNmtLn+Xev5OTCMqwCCcQgJeFP0KaGCnceKOFQ=;
 b=Elq33OhqsjqvxRrqnvvuokD4hBdtlNLYxYTFOYKpZJpAAw8fAKNMAVemSX5RBKdWK7
 /0AqO1KBgGHXvOSdYrgI49WCDoJz1OaXPlv4HoISi7/bI7wixX7toYlzPIyyQ7Mf60WP
 SToW+zMZNyTbtEyIQTgP/DiikhcogkgyG2czK9oj6GunrPQ8xZjyAPo2fFtN8CMLvifI
 6udlLan7/OAykZaFmJMPYaJR1OkPXjW8SegdT+PR/Tn/1dAMygljJqHom3oMY060gk7b
 5/i7mkvCvAbkxJ3nwu5+txSW0m0uoRIoli4HFCDAkCtprGAU6dOXDSPpyo90jJ0pcstU
 bsWA==
X-Gm-Message-State: AFqh2kpBfGH1Hws8Ndn3Rzpwhm2/SiQLneGomnsoeMqAAiXZfk8k5qNK
 CgZ2otvjTBpvwpFyKlUkevUMzW+EZA5NLlsm
X-Google-Smtp-Source: AMrXdXv1xjpTqbp3o72Jk+q/9NKQX+TzVLexEvL4brcebjiwodaMtz9/eJQ29HVAzKVNvEUGaR8qtg==
X-Received: by 2002:a05:600c:3d05:b0:3d3:5c21:dd94 with SMTP id
 bh5-20020a05600c3d0500b003d35c21dd94mr54680019wmb.9.1673451689538; 
 Wed, 11 Jan 2023 07:41:29 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 t9-20020a05600c198900b003d9e74dd9b2sm15936149wmq.9.2023.01.11.07.41.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jan 2023 07:41:28 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 07/11] fbdev/radeon: use pci aperture helpers
Date: Wed, 11 Jan 2023 16:41:08 +0100
Message-Id: <20230111154112.90575-7-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111154112.90575-1-daniel.vetter@ffwll.ch>
References: <20230111154112.90575-1-daniel.vetter@ffwll.ch>
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
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's not exactly the same since the open coded version doesn't set
primary correctly. But that's a bugfix, so shouldn't hurt really.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: linux-fbdev@vger.kernel.org
---
 drivers/video/fbdev/aty/radeon_base.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/video/fbdev/aty/radeon_base.c b/drivers/video/fbdev/aty/radeon_base.c
index 657064227de8..972c4bbedfa3 100644
--- a/drivers/video/fbdev/aty/radeon_base.c
+++ b/drivers/video/fbdev/aty/radeon_base.c
@@ -2238,14 +2238,6 @@ static const struct bin_attribute edid2_attr = {
 	.read	= radeon_show_edid2,
 };
 
-static int radeon_kick_out_firmware_fb(struct pci_dev *pdev)
-{
-	resource_size_t base = pci_resource_start(pdev, 0);
-	resource_size_t size = pci_resource_len(pdev, 0);
-
-	return aperture_remove_conflicting_devices(base, size, false, KBUILD_MODNAME);
-}
-
 static int radeonfb_pci_register(struct pci_dev *pdev,
 				 const struct pci_device_id *ent)
 {
@@ -2296,7 +2288,7 @@ static int radeonfb_pci_register(struct pci_dev *pdev,
 	rinfo->fb_base_phys = pci_resource_start (pdev, 0);
 	rinfo->mmio_base_phys = pci_resource_start (pdev, 2);
 
-	ret = radeon_kick_out_firmware_fb(pdev);
+	ret = aperture_remove_conflicting_pci_devices(pdev, KBUILD_MODNAME);
 	if (ret)
 		goto err_release_fb;
 
-- 
2.39.0

