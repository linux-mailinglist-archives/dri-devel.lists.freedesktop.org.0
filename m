Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0226911E922
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 18:26:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 016356EB62;
	Fri, 13 Dec 2019 17:26:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A7976EB62
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 17:26:21 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id w8so423024wmd.3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 09:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kPYaV0ooGhLXYbcX5Z9t9TmPcXtkLBtZ/r66PMo7XPA=;
 b=Om1tn+8L0RfQlHrat4IbVdRSxZ2dE7SQsUtqx1U+g+eI7sYfS9rv9MSTI7l3abwwev
 50FCbIsJsepQB/hGqwHZHCMmox1OaxrU5AKtYkuDDwDVFcw4UusocMYZZZjKl9hs0smd
 WGI/jdk1QQ8MDeQUWkmNTKj09UZ/J9LgFch0s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kPYaV0ooGhLXYbcX5Z9t9TmPcXtkLBtZ/r66PMo7XPA=;
 b=ingRzLh+QuL3BPHTko9CYRfsfCuRmhSmHcompZG9N0meO6Cnb2KRUv7cHapn4f7Uv3
 yMWvI7yow8ClL9YV50Fi/vvgOtkrhgvcfNtp1wsKguG1Lcffg+l6vPMpKuDDu8Cd1yRU
 NAmY45fgOWw5y04BQX57x6NmJT3Rnv6ti9vLaTFBSURRucJSUYZIhNyUfxrfNyR2BoLr
 ceY8GeP1qVE1ulzWGhgy1Qha8kUdfYSee8YyUx8wYBIZFfSPuNI5lRqnxK3e72WfTscj
 ZbG9pRkmkR69IZnSR1uqnuqCkHCIfLTCKj9T6G6KFaTZsT3rcCbM1ArZFrKm81WGCgij
 AvTA==
X-Gm-Message-State: APjAAAVlqdqu4wl58Fs1BUkooOtcja5PyAkEvhHOIK/hTggxtvDHWQ82
 1sAvehPKrVlm26Cmkgur20sby9yntr4=
X-Google-Smtp-Source: APXvYqxv60zDfzUkmwc6e9UmmH10SwWQvmsPSI+9izrpz9s7CjsZEMyKM3luhCIW69BOduFA2LhCdQ==
X-Received: by 2002:a1c:ed09:: with SMTP id l9mr15746072wmh.101.1576257979443; 
 Fri, 13 Dec 2019 09:26:19 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:564b:0:7567:bb67:3d7f:f863])
 by smtp.gmail.com with ESMTPSA id q15sm10689669wrr.11.2019.12.13.09.26.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2019 09:26:18 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 02/10] drm/malidp: plane_state->fb iff plane_state->crtc
Date: Fri, 13 Dec 2019 18:26:04 +0100
Message-Id: <20191213172612.1514842-2-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Liviu Dudau <liviu.dudau@arm.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Checking both is one too much, so wrap a WARN_ON around it to stope
the copypasta.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Brian Starkey <brian.starkey@arm.com>
Cc:
---
 drivers/gpu/drm/arm/malidp_planes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/arm/malidp_planes.c b/drivers/gpu/drm/arm/malidp_planes.c
index 3c70a53813bf..37715cc6064e 100644
--- a/drivers/gpu/drm/arm/malidp_planes.c
+++ b/drivers/gpu/drm/arm/malidp_planes.c
@@ -512,7 +512,7 @@ static int malidp_de_plane_check(struct drm_plane *plane,
 	int i, ret;
 	unsigned int block_w, block_h;
 
-	if (!state->crtc || !state->fb)
+	if (!state->crtc || WARN_ON(!state->fb))
 		return 0;
 
 	fb = state->fb;
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
