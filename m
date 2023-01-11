Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CCF665F62
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 16:41:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3EAE10E770;
	Wed, 11 Jan 2023 15:41:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 545E910E767
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 15:41:27 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id bk16so15430454wrb.11
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 07:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3apArcl7OMNeWOL87XhRmEIILQii5IFqm3oMsEY2uTQ=;
 b=TWS3RJUGnec7HJ8IdThWihyacAzGTfgOMMVKgAJ3sP5gvHzb6Hv2fQ8yYcj9IsnVVA
 o219u3LYZ8uCnmmEdWK9E++vy2du8AWTGfafd+vHo4u8SlnZt/LoMDlKNNioYzUIuXPf
 TJ6xYHvwDOSOn4s2j1NLyLLyiRMiLhKLjL0bQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3apArcl7OMNeWOL87XhRmEIILQii5IFqm3oMsEY2uTQ=;
 b=rKl2yjNnM7+bAmG5pESUNwewyZ+eaGGbSVopgiRaTz4pOvBQvP+cAvSn5+j37dN400
 nVtuqrJ+WyO6gQn8MFZiO57YUOepKA3GAVq+MRKaN43fD3lk+kmHTqSmMj8HoWXp96hv
 YzLwpGcLp7CG5FcbELx6VFsFOiNg+X7GUS7vggpo+Y5CBG4P0P/l+sIy0WgZ+V3hlLRp
 95aZ+6MNWSdEvUJuzsB9OkfEnVoQTGN7mpGaVKQniqz0PlMyxElfPOrPQuJYWWIhRFGe
 1yiGq9XxVXkHDDWj6rdypYcguy2EW6dlMaaslEuBQ7DPfCd8xN7HeTZuMJU7j9nfAzhd
 +LBQ==
X-Gm-Message-State: AFqh2kpPNqlGHxM210LQCm/787rPYA64erFEINquop9ZKmfThbSDVO2O
 4ronL4xb9ocn2sB+DJgFLDqQyg4lK0CefEwr
X-Google-Smtp-Source: AMrXdXsZQQb90TZBhyIGbWCTV3hGh5NVwdW1rv7mMEKuwv41FW1zTUhYSl2ws/vK/PGYSdPl/U3j9w==
X-Received: by 2002:a5d:664c:0:b0:281:b594:c716 with SMTP id
 f12-20020a5d664c000000b00281b594c716mr39704840wrw.36.1673451685621; 
 Wed, 11 Jan 2023 07:41:25 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 t9-20020a05600c198900b003d9e74dd9b2sm15936149wmq.9.2023.01.11.07.41.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jan 2023 07:41:24 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 04/11] video/aperture: use generic code to figure out the vga
 default device
Date: Wed, 11 Jan 2023 16:41:05 +0100
Message-Id: <20230111154112.90575-4-daniel.vetter@ffwll.ch>
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
 Javier Martinez Canillas <javierm@redhat.com>,
 LKML <linux-kernel@vger.kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since vgaarb has been promoted to be a core piece of the pci subsystem
we don't have to open code random guesses anymore, we actually know
this in a platform agnostic way, and there's no need for an x86
specific hack. See also 1d38fe6ee6a8 ("PCI/VGA: Move vgaarb to
drivers/pci")

This should not result in any functional change, and the non-x86
multi-gpu pci systems are probably rare enough to not matter (I don't
know of any tbh). But it's a nice cleanup, so let's do it.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org
---
 drivers/video/aperture.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/video/aperture.c b/drivers/video/aperture.c
index 41e77de1ea82..3d8c925c7365 100644
--- a/drivers/video/aperture.c
+++ b/drivers/video/aperture.c
@@ -324,13 +324,11 @@ EXPORT_SYMBOL(aperture_remove_conflicting_devices);
  */
 int aperture_remove_conflicting_pci_devices(struct pci_dev *pdev, const char *name)
 {
-	bool primary = false;
+	bool primary;
 	resource_size_t base, size;
 	int bar, ret;
 
-#ifdef CONFIG_X86
-	primary = pdev->resource[PCI_ROM_RESOURCE].flags & IORESOURCE_ROM_SHADOW;
-#endif
+	primary = pdev == vga_default_device();
 
 	for (bar = 0; bar < PCI_STD_NUM_BARS; ++bar) {
 		if (!(pci_resource_flags(pdev, bar) & IORESOURCE_MEM))
-- 
2.39.0

