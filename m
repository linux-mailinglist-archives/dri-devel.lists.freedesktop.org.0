Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8C6282CF7
	for <lists+dri-devel@lfdr.de>; Sun,  4 Oct 2020 21:21:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA94289E9B;
	Sun,  4 Oct 2020 19:21:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59BA289E9B;
 Sun,  4 Oct 2020 19:21:09 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id j8so2267486pjy.5;
 Sun, 04 Oct 2020 12:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FnpkgYe/O9d4AYRxVVe1vBP2PhvVSTJl2AUFDqH2Sr0=;
 b=uPzD5q/NxoE6HKNg2DFVLhsSXAZj0DE+mtFzQRf6G2zWukz4iQSzK9wUbdC0TJm3Ef
 ZcdAgaySLaTGI+egOnLuIYt7zGMMNcIC08NYLySh2d9xXf0DHKLDT6M0xBg5bFAuEBAl
 4EgLfm7iGvcXpyUd+aP+J2eBy0IdF43H+l73+OmYDi+I2Pbgm84sTA0eqKkBmT0GwsWf
 r9lQ5qzPWFi9f682LcpKC1hmcZUcNOdqWR52nBobQOcxi9iP+YKQ1wqMHr/CKUDQ5m3F
 XTIZ6qvKzy5DQmYVjLmoHRHv23fYZHLYwP5xEW1u71TMjQta/UHiIY03dL54s1qt5z0T
 q7bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FnpkgYe/O9d4AYRxVVe1vBP2PhvVSTJl2AUFDqH2Sr0=;
 b=eDVPNiDYQgiE4ftlenEzWJZZzpWYaVO21e3pTvUNKF1Y7Gkh7KS2uXiJkgeN88VmWm
 neTlthl4xeDaAJ8KOHalHnltmfs4XRbu1ic4+G3K/2p3rWJ2w/1QYPpzgwI6RCPh9NTB
 33q7tynY23pxJr+PWhudi7ye5NcH7A7r3Dqzd4EyNnkmMHILUrZLzJdYhYIeNdga+iTn
 +RI9AxJzH1VIZsfvBhAB9TJG0StRclbUqoNmLIGrPNZxMk6dx+DDL34Cd5Ew0uQa9CLh
 ngr1NufF/vA8oAaaOzUKn/SWz8I+KAV6nHsGFOcp1WAdU0HKZJr/4G5v/kG/x8hSZ6ns
 Of9Q==
X-Gm-Message-State: AOAM531Nmhuk9adZWuJuPusGnHSUbAojHspuO/FlCL0PdapDzYgx/tiJ
 KwVDk/Tw92dFV8RJF7RsSUzQDeWpkuoKfxHb
X-Google-Smtp-Source: ABdhPJyvMoILH6fXhmvKYFY3fZRjizG0TlgbGLt5UeUM7ybLbxyQePkCzvg/Qnastn4ThulWDj2NDQ==
X-Received: by 2002:a17:90b:3103:: with SMTP id
 gc3mr11011474pjb.158.1601839268350; 
 Sun, 04 Oct 2020 12:21:08 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 m13sm9436279pfd.65.2020.10.04.12.21.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Oct 2020 12:21:07 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 01/14] drm/msm: Use correct drm_gem_object_put() in fail case
Date: Sun,  4 Oct 2020 12:21:33 -0700
Message-Id: <20201004192152.3298573-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201004192152.3298573-1-robdclark@gmail.com>
References: <20201004192152.3298573-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

We only want to use the _unlocked() variant in the unlocked case.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 14e14caf90f9..a870b3ad129d 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -1115,7 +1115,11 @@ static struct drm_gem_object *_msm_gem_new(struct drm_device *dev,
 	return obj;
 
 fail:
-	drm_gem_object_put(obj);
+	if (struct_mutex_locked) {
+		drm_gem_object_put_locked(obj);
+	} else {
+		drm_gem_object_put(obj);
+	}
 	return ERR_PTR(ret);
 }
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
