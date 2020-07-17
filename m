Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3502237B1
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jul 2020 11:05:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E03696ED77;
	Fri, 17 Jul 2020 09:04:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D65F6ED6A
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jul 2020 09:04:48 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id s10so10137321wrw.12
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jul 2020 02:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PM+GxM/lV46gJD6RsTGqviR3KLKvT4VxUg6rgM4uzu0=;
 b=GsT+igCu0nDndp3kmVTvwAzCs8C1Ww9LCERgOYPXlXSb27cpLZJCuEFHv+8nabqoQJ
 w2xpc+Kgu+CB7FM+TpTxj/6QJAq2MYGBuNgjPjiJSHBNmFOeKBH+8NajJe6ZRFAJD+17
 jm03sObOkeQPZTXpk/aPUZD9LO6M77M+VHd58=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PM+GxM/lV46gJD6RsTGqviR3KLKvT4VxUg6rgM4uzu0=;
 b=nxFsrwnBREtdabpV2exy2Ebk8gyi28VvB36aL2R7yUkDSe609dIr8Tz1ZFyKB0RNuQ
 UHK1HQaRJo3lIrv9ZFtV/s/ex4V9kBln3jMsv7nD78nOjPWk7/2Zm+Q493DuUUOh8aJ8
 kuoq0EnVzSLY+CT0GEDqvg6DF5fjKdCFfZX2sQQGwz74dROPyqagHks0MhNsFB7kGpx6
 3UokkuFo4gP+FYgDCfUBH/xFXBEE4ffu8zU2hND4P7tBN9ep77xq9m4+pohtBZbvLI6Z
 eu9RFbWEeuGk9VxQqySwQSu9sdVReMJEibCCU0T55L7d6R9wFf2bkQqDgrm/D/n/Gi/b
 LzBA==
X-Gm-Message-State: AOAM532IqGWb8plN9IMg3lAEE0fSVCCWoJPYX4NzhDcLl3Wbl0Hg9V3X
 acVSQFfSXXQPuZueHkiIUx9D1ES3VLw=
X-Google-Smtp-Source: ABdhPJwWOBeIVMDFMKlZoJC19ismEn6ErZj1ineMpCf+0aKs4RF15egnR4NnD1PFk1offsJmfq1jeQ==
X-Received: by 2002:a5d:6802:: with SMTP id w2mr8899472wru.88.1594976686710;
 Fri, 17 Jul 2020 02:04:46 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l67sm14520833wml.13.2020.07.17.02.04.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2020 02:04:46 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 12/18] drm/arc: Drop crtc check in arc_pgu_update
Date: Fri, 17 Jul 2020 11:04:24 +0200
Message-Id: <20200717090430.1146256-12-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200717090430.1146256-1-daniel.vetter@ffwll.ch>
References: <20200717090430.1146256-1-daniel.vetter@ffwll.ch>
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
 Alexey Brodkin <abrodkin@synopsys.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's redundant, drm core guarantees that state->fb is set iff
state->crtc is set.

v2: I had a misconception about simple helpers here and thought they
filter this out. They don't. Issue reported by Eugeniy.

Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
---
 drivers/gpu/drm/arc/arcpgu_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/arc/arcpgu_crtc.c b/drivers/gpu/drm/arc/arcpgu_crtc.c
index 5c6d7e34ca73..a72136ee4e46 100644
--- a/drivers/gpu/drm/arc/arcpgu_crtc.c
+++ b/drivers/gpu/drm/arc/arcpgu_crtc.c
@@ -143,7 +143,7 @@ static void arc_pgu_update(struct drm_simple_display_pipe *pipe,
 	struct arcpgu_drm_private *arcpgu;
 	struct drm_gem_cma_object *gem;
 
-	if (!pipe->plane.state->crtc || !pipe->plane.state->fb)
+	if (!pipe->plane.state->fb)
 		return;
 
 	arcpgu = pipe_to_arcpgu_priv(pipe);
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
