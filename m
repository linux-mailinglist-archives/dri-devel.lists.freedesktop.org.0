Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1A935842A
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 15:08:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCB156EA99;
	Thu,  8 Apr 2021 13:08:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B62AB6EA99
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Apr 2021 13:08:26 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id mh7so2904928ejb.12
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Apr 2021 06:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5exdKRCsF2K4PXIw6d81pZy/xw7djq4cWgROPZxTAk8=;
 b=Nl0s25l5X8itmVUheFUnCgSuowcv1/yp0zA1y/YMBbgllKIobZK4nMivhQcQD4yZ16
 oRzOG9daL9N69Uu8s5vxjW8HsOgJHZvaezCz6C/UKcr/OXkoqo7IHcA9jedV3WvBDo/q
 fnomhjkzf85xntrL6860oENHsamBrFzCW/ZgKjjcl+KgCTumJPMgh6IyY++BZyjEdOZ+
 bNsP9tEpEkdPPXhdmTNNC/rd5/HHSixKnqxdIgWEr/JV+jncLOCEejj8BiukP5/ABYQq
 yRxNuJgi/DQ51dCaOKtidC5fs5WALXzrR0ua515HMSgvSjI57EJNCYj743QXo3pFFPYD
 szhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5exdKRCsF2K4PXIw6d81pZy/xw7djq4cWgROPZxTAk8=;
 b=T6MuSuhXDs1Tr18Nnctw1jaFu8VOXJByOrwfOpmYCtlXvaoXyImBL4+gfomwsmDOso
 uraO5qLGUd3jy5qKOkDguxhnBH5SA7np5OqgEJsoV/RI4OtO77Lyf8wNg0hi2s0zd/Eg
 XbblqBN2t0FerG69OxTKId6TPDaKELOFzOoyPNoqtI43z4/WdZaGn2DUG07UrXHJPPgk
 b59nkbh8OM40nXaPTL8IMx9k5PIavwT/PEzk+D/T5UY3O0Zb/FVkNiP4GKBCMx0J0/Wp
 kPhsqxGsPL/bvQPWjCjVRLQcBskDbi2ysGZQKEnBoUa2PV5s+wicXwN400yS0qzMazgw
 gamw==
X-Gm-Message-State: AOAM531ZRt2yZVPgz0hK7uwUNn9qyh41NJpSfMubv5G2+Ade0dkNSQzZ
 21HMLdHAuA/eQJ7jzq8XAcS7ww==
X-Google-Smtp-Source: ABdhPJzwRDkQpD/aOazIwsyHErfvxEl6JLS8G/cPiWQj9wnvWAeA/fHyCuKNDxGRpnHKfH/NEntH2A==
X-Received: by 2002:a17:906:814a:: with SMTP id
 z10mr10324785ejw.476.1617887305361; 
 Thu, 08 Apr 2021 06:08:25 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2454:3e3:5f00:1381:463f:8d12:2777])
 by smtp.gmail.com with ESMTPSA id a27sm46674ejk.80.2021.04.08.06.08.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 06:08:24 -0700 (PDT)
From: Robert Foss <robert.foss@linaro.org>
To: a.hajda@samsung.com, narmstrong@baylibre.com, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v2] drm/bridge/sii8620: fix dependency on extcon
Date: Thu,  8 Apr 2021 15:07:46 +0200
Message-Id: <20210408130746.175358-1-robert.foss@linaro.org>
X-Mailer: git-send-email 2.31.0.30.g398dba342d.dirty
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
Cc: kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DRM_SIL_SII8620 kconfig has a weak `imply` dependency
on EXTCON, which causes issues when sii8620 is built
as a builtin and EXTCON is built as a module.

The symptoms are 'undefined reference' errors caused
by the symbols in EXTCON not being available
to the sii8620 driver.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
Reported-by: kernel test robot <lkp@intel.com>
---

Changes since v1:
 - Fix typo on comment

 drivers/gpu/drm/bridge/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 22a467abd3e9..2289b44613af 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -169,7 +169,7 @@ config DRM_SIL_SII8620
 	tristate "Silicon Image SII8620 HDMI/MHL bridge"
 	depends on OF
 	select DRM_KMS_HELPER
-	imply EXTCON
+	depends on EXTCON || !EXTCON # if EXTCON=m, this cannot be built-in
 	depends on RC_CORE || !RC_CORE
 	help
 	  Silicon Image SII8620 HDMI/MHL bridge chip driver.
-- 
2.31.0.30.g398dba342d.dirty

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
