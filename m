Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7012B4AE2E8
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 22:09:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2791810E5BB;
	Tue,  8 Feb 2022 21:08:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC2FF10E51B
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 21:08:45 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 k3-20020a1ca103000000b0037bdea84f9cso177104wme.1
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Feb 2022 13:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kxmmBkNFc2e7V4ERjxKal7nxxEacNSK1FsSHDJ/tyIc=;
 b=Z09sK1MIQXvHodEW69pcLwZPAC2Jyh1Yq9ldGqdLR7reUraZE7M6u7jdOOeYRDBf89
 UUxkLMzeLBfxd3O4D0f+4VPHvHICjubc4fPRQHDK7GB4hbBxyg8oSXZLVun1qG1/NbkT
 QOvr5w/LmHavg6G1SUwn1zrJxyAMEJXhXZfiY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kxmmBkNFc2e7V4ERjxKal7nxxEacNSK1FsSHDJ/tyIc=;
 b=wQBVwVk4gebj+ryqeWXnEGoRO2lgj90SUT1zWkcLjhtySzc+gXRrgXBiTABhWcTgCR
 8ISKzcKyDWzkLzPHk2yeUc2a/HZ+w3u/ckG9s7GosBBgt3DJ0lVlmFFBZVKOiD72QFLR
 8o0m0QoIBFHo+VoQ1snfBoVjVD09ZirdR95nH4/vXJExki8aq1N8/3K2yXDOShreiyIg
 E4che38jz1Sx6Y5O7NFCcJ8T2k7bWDYxRmMvDALyTmBtgnlmQFlrbxL6z6RA5Rfygojw
 yX0J8MLr3OWgJkT4/yPpzZCDlIl7Dln511xSD1cBHt0B/4edJiW4C2t/O8389yuZwYu1
 q1kw==
X-Gm-Message-State: AOAM5335p9Xwdr/M8oyrjr76CF/LqDODiVTLpBehtrE8QKoZxDtpYxY4
 r/tSzEiXbihEuuFiOsMMGKpRN2+V6eSwbw==
X-Google-Smtp-Source: ABdhPJx9Pmbs1AtHCBnIRUQUhg6MOdNihnyQs/peWemRHhguZJlE+pEmulNqns55/ByeHXTnphkZ2g==
X-Received: by 2002:a05:600c:3394:: with SMTP id
 o20mr2536218wmp.186.1644354524370; 
 Tue, 08 Feb 2022 13:08:44 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o14sm3033561wmr.3.2022.02.08.13.08.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 13:08:44 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 08/19] fb: Delete fb_info->queue
Date: Tue,  8 Feb 2022 22:08:13 +0100
Message-Id: <20220208210824.2238981-9-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220208210824.2238981-1-daniel.vetter@ffwll.ch>
References: <20220208210824.2238981-1-daniel.vetter@ffwll.ch>
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
 LKML <linux-kernel@vger.kernel.org>, Daniel Vetter <daniel.vetter@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It was only used by fbcon, and that now switched to its own,
private work.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org
---
 include/linux/fb.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/fb.h b/include/linux/fb.h
index 3d7306c9a706..23b19cf8bccd 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -449,7 +449,6 @@ struct fb_info {
 	struct fb_var_screeninfo var;	/* Current var */
 	struct fb_fix_screeninfo fix;	/* Current fix */
 	struct fb_monspecs monspecs;	/* Current Monitor specs */
-	struct work_struct queue;	/* Framebuffer event queue */
 	struct fb_pixmap pixmap;	/* Image hardware mapper */
 	struct fb_pixmap sprite;	/* Cursor hardware mapper */
 	struct fb_cmap cmap;		/* Current cmap */
-- 
2.34.1

