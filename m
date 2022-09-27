Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B895EB762
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 04:10:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF51E10E02A;
	Tue, 27 Sep 2022 02:10:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D8CB10E02A
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Sep 2022 02:10:27 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id v4so8129352pgi.10
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 19:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quanta-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=RqV1Hbuu6wcO4ooNHmBZaaI6MHnaZ7i2cKw6jALZgyE=;
 b=5TLvVYrNxjEB05HrB7sPM+a6/ItoGDgMafZRzE7yY64ZNdiOLnJd8N/OvVLP3lEXQj
 uI7USCTYbd9NumN78GffTp2U4jBde15Fl1HsxlBlFm4F1eEgb0Mc6D9Xq0Xt88CffsGU
 4+/MMd70MltsuXRU7vpSLjqbEdxE8wCpp2d0DAlSFAVJvCeUl2Io8l99zN/vOnovxuGH
 qbevKibqrYxQ/e3naB2qYwMcNPZeD3rJKtGl49ISGsCjnFQdzwpPjTV6LQvFvgfkesQA
 Fx/8qmL2kMBjuoqP4vXH4ygMBK3nalgRPulFsseC+/brSuIxOVNDyaQUEPd7FcjrOJgL
 6sLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=RqV1Hbuu6wcO4ooNHmBZaaI6MHnaZ7i2cKw6jALZgyE=;
 b=MfZ1/jfdXulyaRnWO7Zj/GEO2bDc5ZQAAPNpDSHpztUL2a1+OvuionqRXHKH6Oteuu
 lBoVHVp9T7uNQ0570wSHuY58E7E62JZ69Z2dFpfYxTNudKCLw/O+jYjssqGLxur/otxl
 VFnD2Hl8OLHX69FLtBt9dQ0pIeLAW0r+5xSo7E1iJ8OFNXJ8BJIHzsm6etAB9YMah1Gt
 fiJjL92b2yF+3xdNJOhYhvYJTQ4aav3G8p2+QbEIWdlZo4ZVfmdm+YLkdjIj4rBZdgJS
 q/uTNQXhBjE7yEKHEx4e88/IvKXj6CbPoEIIt5OKmrY9RsXoWMC8uhOpddAT159swy9I
 DuMQ==
X-Gm-Message-State: ACrzQf03N5QYsGPfZNCWIPCJhV1vTzUkkl9cRWci3jo8fnE1l78AUDBW
 s5hkZVtOoAmXsDYnTvpK1MJlVg==
X-Google-Smtp-Source: AMsMyM4RgktzAMpVRb2H8xPwvR3a84o5pWKh2GpH6QJ/iUQL1gyJM4vwz4eBFquvfgJRhFuF6iGVhA==
X-Received: by 2002:aa7:888f:0:b0:544:7429:b07c with SMTP id
 z15-20020aa7888f000000b005447429b07cmr26565917pfe.15.1664244626670; 
 Mon, 26 Sep 2022 19:10:26 -0700 (PDT)
Received: from sean-biuld-server.itotolink.net
 (1-34-200-211.hinet-ip.hinet.net. [1.34.200.211])
 by smtp.gmail.com with ESMTPSA id
 185-20020a6205c2000000b0053e5ebafd5csm196748pff.189.2022.09.26.19.10.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 19:10:26 -0700 (PDT)
From: Sean Hong <sean.hong@quanta.corp-partner.google.com>
To: dianders@chromium.org, thierry.reding@gmail.com, sam@ravnborg.org,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm/panel-edp: Fix delays for INX N116BCN-EA1 (HW: C4)
Date: Tue, 27 Sep 2022 10:10:21 +0800
Message-Id: <20220927021021.488295-1-sean.hong@quanta.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Sean Hong <sean.hong@quanta.corp-partner.google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This panel has the same delay timing as N116BCA-EA1. So, fix the
delay timing from delay_200_500_p2e80 to delay_200_500_e80_d50.

Signed-off-by: Sean Hong <sean.hong@quanta.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 102ab9f5d40a..3e502d318de3 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1892,7 +1892,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0a5d, &delay_200_500_e50, "NV116WHM-N45"),
 
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x114c, &innolux_n116bca_ea1.delay, "N116BCA-EA1"),
-	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1152, &delay_200_500_p2e80, "N116BCN-EA1"),
+	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1152, &delay_200_500_e80_d50, "N116BCN-EA1"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1154, &delay_200_500_p2e80, "N116BCA-EA2"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1247, &delay_200_500_e80_d50, "N120ACA-EA1"),
 
-- 
2.25.1

