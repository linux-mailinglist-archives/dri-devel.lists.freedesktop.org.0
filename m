Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC674A50E7
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 22:07:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEF6010E4A8;
	Mon, 31 Jan 2022 21:06:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2ABA10E4E2
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 21:06:45 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 o30-20020a05600c511e00b0034f4c3186f4so286832wms.3
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 13:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fEFT7RaLl3MIWyBeJu8+YbW4+Kc4zGdBG2ByELA82FY=;
 b=GUAHnoGJ2g60XQIxA1S0UBTEjmAhGsZ5SnXwaSbMm4WguOGFJ080okWbKoG6WuelXb
 voQq0GCXWqeAxlMSnqXUzcMTJe09M5cg5JRDYNy2F4304We++p19+m+1PzPGP4OK3sng
 CMHb0eixfCd0LaM62LMEll+iAEqIn9PA0TosA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fEFT7RaLl3MIWyBeJu8+YbW4+Kc4zGdBG2ByELA82FY=;
 b=dQkm77oNPq7kXbS4ngNr3gy88WgpEalMrHCWJECn/D+oYfisx1+pPYwtkj6iNNJJZI
 bhtFog59Cj4nsIzUXoO220wWPjWhjua1hz6CCeAi900rtKtSktTU/v8SD5AQCS9SoLvn
 DQSckXRPwYWC+emDEEiPqZfs0Ye50MRQtM4CyYAHQBXoaKXuCHcb4+kJQaJsHfBVIEY6
 cmEvT6ELuvaIAdNla4q87j0qxk5Dqp0TQLnciJQey/ViRfA/7TnPadSr/yf83Azmi5R2
 vszxBYq4vH+Bju/PmOA1miZ2cDZ8nmRpJh/kN0Mmr9Q2qh6rpy5iyc9N3CoMGRIFoQp2
 SN3w==
X-Gm-Message-State: AOAM532B+ZQMI243UCmV3kir4rNh3cER1zKQlU0UaCny4/K/zOMz8uON
 4aGkq1kePXgJT1oxetGhu+kEhjY/nmr18Q==
X-Google-Smtp-Source: ABdhPJwadVtgHupBXYfEY4Bh9lTcVc2T1fYq6ymL+YzCfw4JZaBt+O2KULSz2DRwEILgsDakrL0ghg==
X-Received: by 2002:a05:600c:1f15:: with SMTP id
 bd21mr28339002wmb.145.1643663204166; 
 Mon, 31 Jan 2022 13:06:44 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b11sm314961wmq.46.2022.01.31.13.06.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 13:06:43 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 10/21] fb: Delete fb_info->queue
Date: Mon, 31 Jan 2022 22:05:41 +0100
Message-Id: <20220131210552.482606-11-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220131210552.482606-1-daniel.vetter@ffwll.ch>
References: <20220131210552.482606-1-daniel.vetter@ffwll.ch>
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
 Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It was only used by fbcon, and that now switched to its own,
private work.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org
---
 include/linux/fb.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/fb.h b/include/linux/fb.h
index 02f362c661c8..a8a00d2ba1f3 100644
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
2.33.0

