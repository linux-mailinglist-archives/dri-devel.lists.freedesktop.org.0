Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E266322A93C
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jul 2020 09:03:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F413B89739;
	Thu, 23 Jul 2020 07:03:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A2196E067
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jul 2020 18:14:33 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id w6so3252449ejq.6
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jul 2020 11:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=9YXzBu5CzF+ORy2slLhhzsC7TGMl1ab46whl8Gc0jIE=;
 b=YZT+wLdJt81DIoI1eEOPyqj1ApstGxBDSFtKpxwA9aFw78rHiaPtz1o5R5aWPA7mJV
 zmNy+2woINSM+h80UBALJOtOA5Upoq2morXnjWFdTQ+Wtq6buPJsqYcpPDzzaESTPck8
 tqZXYqMilV+HuupNqSOpFSxS29xvqMO9EENURQIGqLlabe8vJ8zb3/5WKCe6akTx6gDA
 SUp6DhxR16CeNKMBUPluYu+Z6vVdb83WgEs8iYvA+T5Qj20InAeKKUMLFkdk+OmiOKLc
 LL+k+HbMYlgqkEwBrDHamrOmKY1UgM1OIJAGO7wZjw+h6mM9gTK41HYB0dM36Eqxdsr9
 pJvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=9YXzBu5CzF+ORy2slLhhzsC7TGMl1ab46whl8Gc0jIE=;
 b=dgk2S+LgJL07DvtsU6l/g16aGbPMlQ8z4JOn9AYzNLQ0KOSiosI+u1JIEFPNLuFA3L
 CXZx6afuZVanjXf2SC16QqzlddHc/otmsZP0ZoHiG/oxq9IgS3N6+K/lidODnl3WNOdd
 PT6Y2Trh7YfapTrSCKDqEG3028HPnyh7mIdPvK3pEXHKWK/LLzouJgyYxdUzFF3Ym1MI
 4acJ1thnmWrc0Ew9vdHo0JL5gzdR+ekzaYbodFLLkmwsoUsi9BCkiI8xziahYSXD0X/p
 QG42+C3uKip3fPrPMGCCg33hCEFmgVqKAxi94Chphusi+ZeVUmm7CGgbVMttGiWNs4oK
 a08w==
X-Gm-Message-State: AOAM533GsvgYjv+zD8YLne0KP204fEmz5NtTY93dSxRRVTibwu2iByXH
 c08LyM8YVju85/I6YfOi7g==
X-Google-Smtp-Source: ABdhPJw3iiCki6IlU7m1rxI1/D3e8gIWcFUfyjOXBSfZ5zryqeraDoQ2XJLCt9CzAECYRrmd99AhNA==
X-Received: by 2002:a17:906:6406:: with SMTP id d6mr810152ejm.30.1595441671712; 
 Wed, 22 Jul 2020 11:14:31 -0700 (PDT)
Received: from localhost.localdomain ([2a02:810b:f40:e00:922b:34ff:fe38:6455])
 by smtp.googlemail.com with ESMTPSA id
 x64sm372954edc.95.2020.07.22.11.14.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 11:14:31 -0700 (PDT)
From: Alex Bee <knaerzche@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner=20?= <heiko@sntech.de>
Subject: [PATCH v2 4/5] drm: rockchip: set alpha_en to 0 if it is not used
Date: Wed, 22 Jul 2020 20:13:31 +0200
Message-Id: <20200722181332.26995-5-knaerzche@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200722181332.26995-1-knaerzche@gmail.com>
References: <20200722181332.26995-1-knaerzche@gmail.com>
X-Mailman-Approved-At: Thu, 23 Jul 2020 07:03:15 +0000
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
Cc: David Airlie <airlied@linux.ie>, Alex Bee <knaerzche@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

alpha_en should be set to 0 if it is not used, i.e. to disable alpha
blending if it was enabled before and should be disabled now.

Fixes: 2aae8ed1f390 ("drm/rockchip: Add per-pixel alpha support for the PX30 VOP")

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---

Changes in v2:
- capitalize "F" of "Fixes" in the commit message

 drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index c80f7d9fd13f..0f23144491e4 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -1013,6 +1013,7 @@ static void vop_plane_atomic_update(struct drm_plane *plane,
 		VOP_WIN_SET(vop, win, alpha_en, 1);
 	} else {
 		VOP_WIN_SET(vop, win, src_alpha_ctl, SRC_ALPHA_EN(0));
+		VOP_WIN_SET(vop, win, alpha_en, 0);
 	}
 
 	VOP_WIN_SET(vop, win, enable, 1);
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
