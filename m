Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AFD11E928
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 18:26:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB0DF6EB6D;
	Fri, 13 Dec 2019 17:26:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D287F6EB67
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 17:26:26 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id y17so272566wrh.5
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 09:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4KSJrNnZyJA5dnfCvf672onDAdJxTNtoy4RQd/XzpGA=;
 b=Lffmppnc9XlntIHSORKwXfPjW7HmrHD4I9ENhDIGfIgPZz3Grc1g8GPUda1NbtfiFB
 AwYPXI53mn82/XbubDsjf+hhk1kDSjttjjXgdd0LaXtvxh6wu680O+ml97XQI/2a84h1
 5oUJ/fatp2gZnk6Jkq0likj7vqszTF/q5PkMA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4KSJrNnZyJA5dnfCvf672onDAdJxTNtoy4RQd/XzpGA=;
 b=KTa2Z+bP9dSGYffYcn30y2o7yZlBDCV/ieRqif4+tHVWdWaOihzNYUNjog/E97yBI2
 ZiipH9w3U+mgosYNx3bxIf4w2OD7L7B+YBZLJ1+ZFuWaZkdWDc4btKBuOG1T+zADzTcJ
 kZjh5PXFZ0PsnzZfBiSHitu+ekNLxOD3FMmS/9vb0WTtlNxF1T1WJ6b5qJThqC8II3xY
 8SNi3fg53LyuDTpqLLVk/tHtZcCNEyUCFKajX5UGSswCzoIkZ8seQ5w0Wba/ErAu2rY1
 RMMHp6zhWwTaXfB6Og+WY3GppCDNhlyznDQNbDY5YhzRfg7pQNDYBfvXWLwzRxVC6IxC
 KEkA==
X-Gm-Message-State: APjAAAVFnp3MxKKO+rzlB5KoMwNTLJndkm9+Bse6YEZYmqqB8R6zGAr5
 iZfia0xMqWY2KULn1WmI+KtisKx7pw0=
X-Google-Smtp-Source: APXvYqyKaVLdfwPR173FfaP1we/4Op+V6Bkpu04dFY+S+6F4NxFZGR/WhAMhjsP3YMRPNGAOvpKOlQ==
X-Received: by 2002:adf:eb51:: with SMTP id u17mr14151473wrn.29.1576257985278; 
 Fri, 13 Dec 2019 09:26:25 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:564b:0:7567:bb67:3d7f:f863])
 by smtp.gmail.com with ESMTPSA id q15sm10689669wrr.11.2019.12.13.09.26.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2019 09:26:24 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 07/10] drm/vc4: plane_state->fb iff plane_state->crtc
Date: Fri, 13 Dec 2019 18:26:09 +0100
Message-Id: <20191213172612.1514842-7-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191213172612.1514842-1-daniel.vetter@ffwll.ch>
References: <20191213172612.1514842-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Checking both is one too much, so wrap a WARN_ON around it to stope
the copypasta.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/vc4/vc4_plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index 4934127f0d76..91e408f7a56e 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -139,7 +139,7 @@ static enum vc4_scaling_mode vc4_get_scaling_mode(u32 src, u32 dst)
 
 static bool plane_enabled(struct drm_plane_state *state)
 {
-	return state->fb && state->crtc;
+	return state->fb && !WARN_ON(!state->crtc);
 }
 
 static struct drm_plane_state *vc4_plane_duplicate_state(struct drm_plane *plane)
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
