Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 392A811E925
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 18:26:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76F3E6EB67;
	Fri, 13 Dec 2019 17:26:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59B7D6EB64
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 17:26:23 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id w15so281394wru.4
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 09:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k37i2rf0mrZ5PJBC1jYZXYaxxFfiB3iLMNAh4njzQbQ=;
 b=kzPdtp7JSMUx3Zngnb/0mSHBSVnlQiPG7HKMb8VAcPBhARKG5gd2fjFKOTGMsyZNpb
 OzkkaNb70V8zrtQMaRhpigBgwFToYKS/KlcAW6Qx1aqR0m/Po4RflLJHKfQB6BfoBTNX
 m1s3pGfg3l94wvz64lDNsXj2mIjGn82Hd34RY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k37i2rf0mrZ5PJBC1jYZXYaxxFfiB3iLMNAh4njzQbQ=;
 b=iiykeVdmC7cm607MwcrCg9I6+QMH3L2zgH6mSgCDEhQwUuRIwWv/OGLTfhVERt0DND
 kGKjVfMouVYBfwqYgHmkPcj/lasiqsEX8ZwRhjPDQKm0KspkIOEj7ZBdjIMekibh1nTh
 H2HGjJ/3XIMu+BuOtf8ruTGhOgJl9AFqsIJgl/HuaasWn1IL0IVHx/DoixQDQBMEhw5Q
 Rg2cau2OaOB701kzsXFPbRFqh6U36BN+c+GSzvGmgnLPIHz62A2gAZHa2luU6ufP08rW
 fc3ODPrkc3mbc215ySBtXABqGctfFSYnB2hhtALaRs0Ui0PhiaruGbkGDz1PV2hSQ2Sl
 YLJg==
X-Gm-Message-State: APjAAAW4SbUezyCzpzjbGSkLx7KBewIT6vxu2Si1cYyDur+Jnma8yUm6
 Nt6a3Hf1ImljCRlWtu7ZUI+HdWwGvKo=
X-Google-Smtp-Source: APXvYqzF2mlRiwvCpAy00FAu9v/gdbejfjXHVa3jmhV2/faBiJCG4X7d07oMgDmgeJTfaiBQafdsIg==
X-Received: by 2002:adf:d4ca:: with SMTP id w10mr13329482wrk.53.1576257981725; 
 Fri, 13 Dec 2019 09:26:21 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:564b:0:7567:bb67:3d7f:f863])
 by smtp.gmail.com with ESMTPSA id q15sm10689669wrr.11.2019.12.13.09.26.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2019 09:26:21 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 04/10] drm/malidp: plane_state->fb iff plane_state->crtc
Date: Fri, 13 Dec 2019 18:26:06 +0100
Message-Id: <20191213172612.1514842-4-daniel.vetter@ffwll.ch>
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
 Sascha Hauer <s.hauer@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Checking both is one too much, so wrap a WARN_ON around it to stope
the copypasta.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/imx/ipuv3-plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv3-plane.c
index 28826c0aa24a..6776ebb3246d 100644
--- a/drivers/gpu/drm/imx/ipuv3-plane.c
+++ b/drivers/gpu/drm/imx/ipuv3-plane.c
@@ -359,7 +359,7 @@ static int ipu_plane_atomic_check(struct drm_plane *plane,
 	if (!fb)
 		return 0;
 
-	if (!state->crtc)
+	if (WARN_ON(!state->crtc))
 		return -EINVAL;
 
 	crtc_state =
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
