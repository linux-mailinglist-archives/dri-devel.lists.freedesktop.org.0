Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8844F3F84
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 23:04:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08B1110EEC1;
	Tue,  5 Apr 2022 21:03:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7DCA10EEBF
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 21:03:50 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 v64-20020a1cac43000000b0038cfd1b3a6dso2390953wme.5
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Apr 2022 14:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UCMwHF3uk919Wx1ZFBokmmNohbFfAzQpLpge8K0yLz0=;
 b=gmXHelE4Rj7vy22zgP55hLEh9RsElk3Dlkapg2DeMXKxO1Riu+3loZKo4vDEr15wdT
 PgjSUvzqWgTy1QVi8KUPYQuV0In4ANqCne62OMaxvORk6lNQZvFmkQjZhN4T38K0Kstt
 pKOf7h9QJI7cs46T4dRgLCCDRRYJBVBgLq/yQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UCMwHF3uk919Wx1ZFBokmmNohbFfAzQpLpge8K0yLz0=;
 b=C+dd59RBDQAVoHZ+ruiRRh/R0HCWODCoOCWrNo6TvRS09DMeYNo52yKMK1QOJJfiSG
 NdU+zV6K1J0oH3pBhdZR+/I9uhwP/70CV+YwK2NuDQcKEXUw9Z3b5uLk5U2Gy2p52Wwd
 LAroj5WP5nBFWoVywOIuYsnySMJM8bzu9Dk/KADSH2Xm9SFkz98f7NQzGeIPC6Tl/nRD
 eVT9HWOmasjbGJ6M4dEP5xqCg2kRMjNtarTA7GT0Sje16uKRIGhqOmrU2NQZwshccu1s
 TqGIVuc5M6tObxPLAP4az/Uwyi4enHwTOMfVDvAKGWv72p6AdoP0YuBlkU8DZBVgVjWk
 Rxhg==
X-Gm-Message-State: AOAM531N+6/bL2Xsd6xkkhHnY/yVA04QNnAvypWJwSM7tG1c5VlVXslG
 jw1RCtwtZxGNfGglK8OF0PqCCSd6EYC5tlb6QwY=
X-Google-Smtp-Source: ABdhPJzGuI7sDox55NXIDF1CsyAOGKpFf1LM70EWTffJxN0QpYSrQtWR+/bEYbhl3D+OAoPEvh/X6w==
X-Received: by 2002:a05:600c:354d:b0:38c:e71a:c230 with SMTP id
 i13-20020a05600c354d00b0038ce71ac230mr4579966wmq.86.1649192629155; 
 Tue, 05 Apr 2022 14:03:49 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 az19-20020a05600c601300b0038cadf3aa69sm4858569wmb.36.2022.04.05.14.03.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 14:03:48 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 08/17] fb: Delete fb_info->queue
Date: Tue,  5 Apr 2022 23:03:26 +0200
Message-Id: <20220405210335.3434130-9-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220405210335.3434130-1-daniel.vetter@ffwll.ch>
References: <20220405210335.3434130-1-daniel.vetter@ffwll.ch>
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
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It was only used by fbcon, and that now switched to its own,
private work.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org
---
 include/linux/fb.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/fb.h b/include/linux/fb.h
index 9a77ab615c36..f95da1af9ff6 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -450,7 +450,6 @@ struct fb_info {
 	struct fb_var_screeninfo var;	/* Current var */
 	struct fb_fix_screeninfo fix;	/* Current fix */
 	struct fb_monspecs monspecs;	/* Current Monitor specs */
-	struct work_struct queue;	/* Framebuffer event queue */
 	struct fb_pixmap pixmap;	/* Image hardware mapper */
 	struct fb_pixmap sprite;	/* Cursor hardware mapper */
 	struct fb_cmap cmap;		/* Current cmap */
-- 
2.34.1

