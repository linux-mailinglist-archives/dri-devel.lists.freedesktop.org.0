Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E727A355004
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 11:36:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11B376E7DC;
	Tue,  6 Apr 2021 09:36:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4271C6E7DC
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Apr 2021 09:36:22 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id u21so20819758ejo.13
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Apr 2021 02:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tRLcdHp/r22ZZ4PcHh6G508zCxRWigC1OCQlVxPhRIc=;
 b=s3gvTQpBxrBu9HNv8L9ieCPpZvgUZKeJAPZJpiBZw7mMCNS9YOnm7cH3eH0elPVGtZ
 02e0c0ZlVKHvn5ugMbcJyuMMa6CyuINh24Ulae18kyVJtuQqMV+A+/dnyHHXRFoLsjp6
 giOyWLo0fNAGWZMWvGdvgVDBGJ4BP9HkdcXQ5n3VH27jpGya9XS/V2Cn24AgBl8iAVl6
 HngUsXATQzTxfl1Ct5TegEvWW7zFmBGwTEjDWQjC94r4kGMdSGZKbtL7Dfywy8NnrTrU
 GRNnN1BKbvdSRenmyQRZC/G18xgs3QTMhoH7qtCI2kcq7Yos3Rnpz0mHCKeJ3VGcUpoV
 l6VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tRLcdHp/r22ZZ4PcHh6G508zCxRWigC1OCQlVxPhRIc=;
 b=IjppTfnBlIBF8zE3jlE3RUJvIj7A8Cedqwd4+aKxELS5C5jla+xBZPRODkFikyku0Q
 lABpsUoSKJ6UKm519GgT2mBAIcCkKIbIiuVaZoqwylR/RcsZHk1DA2sahKY7QBE/gPui
 I3rXGycpTzJqNql40qZBEst3Z4uJYTlaTUHBDToQLNhY70IXRNVRX/yzrgfWqLDBt6pA
 UQedrTunZTBlxole4bsE9M8Cz9pW8GmB8iqZEozjAOpYa0UiwDTMJIZzGPpn98ujLAM2
 10M0uvch/ZIby4DojP8NrYP2nDzUkSCw0RganiFex10kZFy2qvoTEIYm6Y6h4Oukp+xW
 oNOw==
X-Gm-Message-State: AOAM533ULAYw6Xb2nANE2t7USIOdMm+f8H0RSpKt0spjpH48d9m1c/+R
 vHdFkbAw+3DUbCVdGg13GK8oJg==
X-Google-Smtp-Source: ABdhPJzNhocq5G1WyqA/ps6DJH//95iJfkHV+CXSTISjrncYclhQnP2TePyBu2tH6fxD+TmeW3gVLA==
X-Received: by 2002:a17:906:2793:: with SMTP id
 j19mr5131459ejc.205.1617701780836; 
 Tue, 06 Apr 2021 02:36:20 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2454:3e3:5f00:1e2c:6b54:28c7:31c6])
 by smtp.gmail.com with ESMTPSA id q18sm8782699edw.56.2021.04.06.02.36.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 02:36:20 -0700 (PDT)
From: Robert Foss <robert.foss@linaro.org>
To: a.hajda@samsung.com, narmstrong@baylibre.com, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v1] drm/bridge/sii8620: fix dependency on extcon
Date: Tue,  6 Apr 2021 11:35:36 +0200
Message-Id: <20210406093536.635748-1-robert.foss@linaro.org>
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

Th symptoms are 'undefined reference' errors caused
by the symbols in EXTCON not being available
to the sii8620 driver.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
Reported-by: kernel test robot <lkp@intel.com>
---

LKP reported issue:
https://lore.kernel.org/lkml/202104040604.SSTe2Cxf-lkp@intel.com/

 drivers/gpu/drm/bridge/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 7c15fc170510..204c38e87849 100644
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
