Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B008623C181
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 23:32:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ACB66E0AA;
	Tue,  4 Aug 2020 21:32:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 789556E067
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 21:32:11 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id x5so3968715wmi.2
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Aug 2020 14:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen-nl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i7RjU3C/5Tb6jLW/v4DIQIukxcUqY46qUqpQsce2gQs=;
 b=fMhaVVSURSGWXG/bmV+V+DtMYP5sBT9lppI7KPJnWoHE4YZWDzQL/H8oORCRccpm4T
 1fgaLyQJCx+Af+v2ydGWiWvTG3VBk7nxEzPHultgVle/GhDYxLmTGTD6cWH6+My4wluz
 mrRRJLLVDABB4jC0FKGyMJlwiL2QawwAPnitPz1hHeQg5sQPyeMeotTp+rPM9qZkzqTh
 RLwQDhj5UasVaxTCq6yOvoNE0ivvv41HNBU36cSO8A8mpELFJj3WJ9U1pyeCalyepGyO
 hrCQQM53Le4yGQEgv7WF9sWsp7VMs4HvxJAl1c5+3pQ/TySoInAqnF8DzQYoe3tZVY3o
 Xv8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i7RjU3C/5Tb6jLW/v4DIQIukxcUqY46qUqpQsce2gQs=;
 b=q165X4NKTHjLLwpjZfUOqwocFh3hqiBNld7u28gLRB7j/xH0pZOKG5JV7MCpY9NgJI
 6qPjhz5/rte9EWImISIoRFmiKdZmEgbDNwtwbJffFo7Xpy/sCK5RrOKYxQ3rqjReg4dr
 L6fl9+0IJwHk/Xq/p5MLqdvc1K38gsL/9gTfPghjXcyn2fBCKQ0dm7mRyuIZUkqyX9gr
 T/N+egNslCIBbpqSylRe718FVhxGhDiZCNKPkkIOjYytxoZT3uxYTZNSmV9c3Xk4swHx
 YbrBRwcjKkH3Dzkzzx8acijrgx5t9mv1IcrmqxSxsKGmVEeuIcsWmTuIdimfjYrAAgFS
 TN6A==
X-Gm-Message-State: AOAM5317P5iqDQaury45MzjK3X/SWdZo3Z0co9+CrMehbhcvYtTfoikk
 uIePabGhwyDsKr18iZPpq1WTBqZ8WJ907A==
X-Google-Smtp-Source: ABdhPJzyUZOS+6tMx3qeSYu6/OugEV3exrgg4HeWaOAqb/J9wpthzl7ajkvtheUuG/IuIEcTE5fA6A==
X-Received: by 2002:a1c:bd04:: with SMTP id n4mr356338wmf.83.1596576730183;
 Tue, 04 Aug 2020 14:32:10 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:aa12:a77f:2000:ce92:471f:873f:fc56])
 by smtp.gmail.com with ESMTPSA id x11sm97612wmc.33.2020.08.04.14.32.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2020 14:32:09 -0700 (PDT)
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/8] drm/amd: Init modifier field of helper fb.
Date: Tue,  4 Aug 2020 23:31:13 +0200
Message-Id: <20200804213119.25091-3-bas@basnieuwenhuizen.nl>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200804213119.25091-1-bas@basnieuwenhuizen.nl>
References: <20200804213119.25091-1-bas@basnieuwenhuizen.nl>
MIME-Version: 1.0
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
Cc: maraeo@gmail.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Otherwise the field ends up being used uninitialized when
enabling modifiers, failing validation with high likelihood.

Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c
index 25ddb482466a..c2d6952d0a7d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c
@@ -201,7 +201,7 @@ static int amdgpufb_create(struct drm_fb_helper *helper,
 	struct amdgpu_device *adev = rfbdev->adev;
 	struct fb_info *info;
 	struct drm_framebuffer *fb = NULL;
-	struct drm_mode_fb_cmd2 mode_cmd;
+	struct drm_mode_fb_cmd2 mode_cmd = {0};
 	struct drm_gem_object *gobj = NULL;
 	struct amdgpu_bo *abo = NULL;
 	int ret;
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
