Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B863665F72
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 16:41:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BABA210E777;
	Wed, 11 Jan 2023 15:41:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DEEE10E772
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 15:41:31 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so14682160wmb.2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 07:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G2sqw4liQtpNZ++ehK/ijyVQMT7dm9/yDDOGWgKM06Q=;
 b=QFSULLmMVFFwJ3kPRo04bI+cTmjJnjfKH40bscRWkka9KWLPADsKgemIa4JXzvMkeK
 v49Cp1Za1fPlLnKdgCl4jKo453bf3sIRTGpbcHpGl7KAbEP0dJP61vP0ovBnnh98zN2z
 7FfdaXLc80KuSpk0fZAE3Tu5F7hg8nJd6DWYU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G2sqw4liQtpNZ++ehK/ijyVQMT7dm9/yDDOGWgKM06Q=;
 b=Ui82JNBFqGP9CxyY1BiudeW/ZABpFDI7VG22iMN5qsT6+oL+aFI2mHG5fa/9EG/1Cf
 DDsGwy0G/7dyyIhNAu36O5NO246WrwciCWISd4mkeT2/TpPa3KO3MGpLeLsuk4EWHhsU
 OVezgOHYBXMdTHyGeig4O4qD2qhpU/o691WnrFALMkAe95Hi7djWAPkCdg9AAlXApayE
 cM+a0h6AoVWjN8EMt9rcX/GZBTAAVPYd1w0jhWAgb3wAmxKWdZn+4bohha9DaN02ljxk
 MzajEPD2WiuwYWq6Wikd3jYUg4QVDmOPBC/DHBKUWl9k//pCGOjxqYFJ9y95sA06rxvg
 T9fg==
X-Gm-Message-State: AFqh2kpU99Xe2fmGJqE8o10r9kRqovdXsrC1SANd8qw8Ufw8Dzdwivq/
 cvhxqIEZgjAZZHQ5gX8ekGnZw/WEEldb2yoy
X-Google-Smtp-Source: AMrXdXu2HH4k8cKyE1wj9+khkbKIw1YYqzdu1nSgmTp1TRqQ4OuVM4kG1tuO5FQh+wMSZkKbA60TGA==
X-Received: by 2002:a05:600c:54c2:b0:3d3:3c74:dbd0 with SMTP id
 iw2-20020a05600c54c200b003d33c74dbd0mr52401995wmb.13.1673451690779; 
 Wed, 11 Jan 2023 07:41:30 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 t9-20020a05600c198900b003d9e74dd9b2sm15936149wmq.9.2023.01.11.07.41.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jan 2023 07:41:30 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 08/11] fbdev/hyperv: use pci aperture helpers
Date: Wed, 11 Jan 2023 16:41:09 +0100
Message-Id: <20230111154112.90575-8-daniel.vetter@ffwll.ch>
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
Cc: Wei Liu <wei.liu@kernel.org>, linux-hyperv@vger.kernel.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Dexuan Cui <decui@microsoft.com>, LKML <linux-kernel@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Again this just gets setting the primary parameter right, which might
help in some case (but then I guess the hyperv display isn't vga
compatible, I have no idea). It's more consistent for sure.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: "K. Y. Srinivasan" <kys@microsoft.com>
Cc: Haiyang Zhang <haiyangz@microsoft.com>
Cc: Wei Liu <wei.liu@kernel.org>
Cc: Dexuan Cui <decui@microsoft.com>
Cc: linux-hyperv@vger.kernel.org
---
 drivers/video/fbdev/hyperv_fb.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyperv_fb.c
index fdbf02b42723..1067a64bbdf3 100644
--- a/drivers/video/fbdev/hyperv_fb.c
+++ b/drivers/video/fbdev/hyperv_fb.c
@@ -1076,9 +1076,7 @@ static int hvfb_getmem(struct hv_device *hdev, struct fb_info *info)
 	info->screen_size = dio_fb_size;
 
 getmem_done:
-	aperture_remove_conflicting_devices(info->apertures->ranges[0].base,
-					    info->apertures->ranges[0].size,
-					    false, KBUILD_MODNAME);
+	aperture_remove_conflicting_pci_devices(pdev, KBUILD_MODNAME);
 
 	if (gen2vm) {
 		/* framebuffer is reallocated, clear screen_info to avoid misuse from kexec */
-- 
2.39.0

