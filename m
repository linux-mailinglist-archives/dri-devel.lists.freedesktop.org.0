Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4A519D867
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 16:00:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2170D6EBDA;
	Fri,  3 Apr 2020 13:59:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42E5B6EBE7
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 13:59:16 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id w10so8693975wrm.4
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Apr 2020 06:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5GgaSanEdwWpgKJFGOpyFJaiF5lia0lpGKnKqBPVUvA=;
 b=g+UpYnLHz2ISycls0YIvmjtT9v4ORGdH6dFfdneuHRd99co4gtflXyQiu615WSr3fQ
 V/I1fSdWaC/eRFcbDwHXQWIA9/5PyPpUAbRxSDv10WwS1SSws+qTJa6I9cDM5MDv4i99
 NmdCAI/cIiBting1ari/RY1Qna2Tj7Bs4WAFI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5GgaSanEdwWpgKJFGOpyFJaiF5lia0lpGKnKqBPVUvA=;
 b=OSS0w3TjqCVJuPse48gfrg9zWfiyJGyAFMArzi45PW6nVpkSJH4YZMNcP0PoGWcDGN
 Pb/kYsm5/gH7aRO3ykOWpMEXMkHKCfeFBYC9hFzkSzAhpGLJaidZA5nneUxkbH341VZb
 dH/1Ml6EcEWnzedlw3DbKDguhnhLUFdiJKmF0ke1EQrkQmpdarf81IjR68xyleXdm7AI
 /qLt5J66CmErWa+C95Jxt22eEJ1i1j46hhG14t2/PpDb5z4MbxL/wkcCU6x/vlVuR7kn
 m28icLTObLyLJqHkrXL6hc+sBbwUbD3tvBD2egwpbJhDs2EXJG75n4zPDVEa/JpN4QEk
 Zflg==
X-Gm-Message-State: AGi0PuYGH+3T9YYUDZKi2KSMV3LK7zySADD4QvJuXFR2jfyMzqBQ3j9j
 FonKPP7Rcdo2+IFLIvLCmu4+Dx07c5mEuQ==
X-Google-Smtp-Source: APiQypJF3sZ8gL4LUqqJHThsPOgWO4OjlsNdH3oGhvzna3Zb8NpXH4DlRrZlu0VhOUgEbs2Jsl15Yw==
X-Received: by 2002:adf:f58c:: with SMTP id f12mr9753914wro.207.1585922354373; 
 Fri, 03 Apr 2020 06:59:14 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f141sm11783919wmf.3.2020.04.03.06.59.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 06:59:13 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 35/44] drm/ingenic: Don't set drm_device->dev_private
Date: Fri,  3 Apr 2020 15:58:19 +0200
Message-Id: <20200403135828.2542770-36-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
References: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
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
Cc: Paul Cercueil <paul@crapouillou.net>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Entirely not used, just copypasta.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/ingenic/ingenic-drm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.c b/drivers/gpu/drm/ingenic/ingenic-drm.c
index bb62d8e93985..3386270cb8a3 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm.c
@@ -622,7 +622,6 @@ static int ingenic_drm_probe(struct platform_device *pdev)
 	priv->soc_info = soc_info;
 	priv->dev = dev;
 	drm = &priv->drm;
-	drm->dev_private = priv;
 
 	platform_set_drvdata(pdev, priv);
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
