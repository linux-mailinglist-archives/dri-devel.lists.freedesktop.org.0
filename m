Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F92139AFF6
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 03:41:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5689B6F556;
	Fri,  4 Jun 2021 01:41:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F2EA6F556
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jun 2021 01:40:59 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id k7so4688814pjf.5
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jun 2021 18:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XiCEBFYQs1wHoBsBq8qZHCHeWtBmY7GOb/awBPWsVM0=;
 b=hbR43tKlLsrx/D3uOQI9CXZlXNW70odw9gD6sUiwz/hnGkNBRz7RCKWP1KPxE7IVX0
 USzfmD0O7brF4DU3eI2z8LVM8cxTC6CQIZ3JV1J8xU7X8RWb1v6v9LyjxZgmMv37VudU
 yrF39zW/TcU4NhYz5DqbTCS8/lhN71tLLpGvk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XiCEBFYQs1wHoBsBq8qZHCHeWtBmY7GOb/awBPWsVM0=;
 b=Dhgg3OenPOt0wuiZUyz8Lyi6whcNGXrZPnlqRIJSdhh/eQOarg4SSkdDB5Nw+X7cn+
 nllvng+NIpoIl6bKt+gM9dpp3CmlcEXxy3Ff596rwOuoYlDZsdQfOUm2dP0LshNj0vG1
 zscFmUroamHt8lar30d5ehzvmoXhmYo7VS9P6XlQr1cHaaTaN+XToHcKq9cgNeIkEeTS
 AH8ZO9LO3EVUS7ZOwbow/NwGbyWSwejtaVwOUbYJA7wwFuvm48LDgSclYtVTdSc+w68y
 6zJm+QL7LwW2y+kAc89R7Kc07IHz7VrCsvX3b1g58hEEOFd4zRZdmZIgaBrE4rqLaaRJ
 vxAw==
X-Gm-Message-State: AOAM531FkjpUz3Py5omgpPvpCgaxAhwuOY6wS8o+4ulJT7u+OTtTSSv3
 eqbhpqMaaZvcgBxhYjzpbjCcSg==
X-Google-Smtp-Source: ABdhPJy6vUfFFweAQh1fJ/gd2t/8skp7dOMu1If6hoqtSK41KY3KdYZDUbkW/1Rw0btPE7HztchCYQ==
X-Received: by 2002:a17:90a:e541:: with SMTP id
 ei1mr2181414pjb.189.1622770858832; 
 Thu, 03 Jun 2021 18:40:58 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id d22sm261601pfn.147.2021.06.03.18.40.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 18:40:57 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2] drm/pl111: Actually fix CONFIG_VEXPRESS_CONFIG depends
Date: Thu,  3 Jun 2021 18:40:55 -0700
Message-Id: <20210604014055.4060521-1-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; g=14c1e26a99e7a5c0826947861880974d3dec799c;
 i=DwQ2M6JPPIp1aqGMVRBW/n1FD/gTXx2QUVMc6SXkj4M=;
 m=E+lJDbe/6hLH7r7M/V+C+IdMvMSqFV7vypoHLWtjYP4=;
 p=KlVnos6MMZObwZsBAYHQc0hRN6QGRSQebq9sCHvfiro=
X-Patch-Sig: m=pgp; i=keescook@chromium.org; s=0x0x8972F4DFDC6DC026;
 b=iQIzBAABCgAdFiEEpcP2jyKd1g9yPm4TiXL039xtwCYFAmC5hKYACgkQiXL039xtwCYwKg//SiS
 PhS38XmQqoSASnS9fIRyRodfKTHbNzV4rtVnziiv7X1ZPPQ0tsp0nW5/CJB1Pf5VCvjRJO5rXiq/8
 lvD9INTOkWCGCkiiCy08m2p3d0gQiwJlk/X5GLb3qmfeFiruJD+fIHUKwPaRl7EOsVbMxZurlHrdl
 Si92Z/PBMWreYp8SeUXFyGjS2+TzSIfGNlMrhhxbtqYH9MIwZPuCN5GN58Y34kpn7MqwV2x2NCXLZ
 d78SyRzgIo0Qd4PRUrjrKrtSS31fOgO+gMTkWf6+8zTpZEivcMkodr8gb+gZALDm/ku2FIHJqaLsE
 Ho7MWVmUhi5B9cAiQc/cFsu3vbYhvBW/1nbHn9VITSQ6PfeR/tICFzkLRA4KG1xsxVkhlVB91HxgM
 IqGOYSh4KmTupDsFhbwVmMD/fVxSqUzlNP2DNFkdZ8+0jV+gGVRJAFaFRgshXx0tpSQefsVt/Fxxh
 Pmx5CwPdjKN05pnqtDM3vJz0TATQ/a3nUZpOPhovCZRYQy1/TjrTdCfj92TVMeASn1ziO4UVcorw0
 Dnq1deOCgrD8xkfRmUMXm4WQfV+fVlHhW5MBI1/m4ygHdBYRRQBzGjPaYnyoqWmJRh0wf9UZnH6g5
 uReNa0xN2nF1uQZlLDWxSnDKQvEO4degSHTK5Qf4BZi50yQNGMDW29EfjqTMcNkA=
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
Cc: Kees Cook <keescook@chromium.org>, Emma Anholt <emma@anholt.net>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VEXPRESS_CONFIG needs to either be missing, built-in, or modular when
pl111 is modular. Update the Kconfig to reflect the need.

Fixes: 4dc7c97d04dc ("drm/pl111: depend on CONFIG_VEXPRESS_CONFIG")
Signed-off-by: Kees Cook <keescook@chromium.org>
---
v2: use expected Kconfig style to express this. :)
v1: https://lore.kernel.org/lkml/20210603215819.3904733-1-keescook@chromium.org
---
 drivers/gpu/drm/pl111/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/pl111/Kconfig b/drivers/gpu/drm/pl111/Kconfig
index c5210a5bef1b..3aae387a96af 100644
--- a/drivers/gpu/drm/pl111/Kconfig
+++ b/drivers/gpu/drm/pl111/Kconfig
@@ -2,7 +2,8 @@
 config DRM_PL111
 	tristate "DRM Support for PL111 CLCD Controller"
 	depends on DRM
-	depends on VEXPRESS_CONFIG
+	depends on ARM || ARM64 || COMPILE_TEST
+	depends on VEXPRESS_CONFIG || VEXPRESS_CONFIG=n
 	depends on COMMON_CLK
 	select DRM_KMS_HELPER
 	select DRM_KMS_CMA_HELPER
-- 
2.25.1

