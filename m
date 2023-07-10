Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8B974DC9F
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 19:40:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DAE510E2B9;
	Mon, 10 Jul 2023 17:40:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
 [209.85.166.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0313110E2B9
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 17:40:17 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id
 ca18e2360f4ac-78372b895d6so243423139f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 10:40:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689010816; x=1691602816;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pJ0X7LH8Y32+25vFKtVfefQZ8VxfYOg+I+aDeHwgaRg=;
 b=UQxQ4h0LaniGa/7PKWWCw/YFj17YERn6y9w2vGMLexy1hRswqvGLInmCv0W8eQo7HW
 WPdTr3CgB5A/7sVQgLS+q7VMFPbmnTa2m3pKEEla/Qvwy8ZkQLBxQuBiGLu5G+1CUdUq
 3drZm/C7/BfmI0IxsQuLjfoF4a16aiYBMHg7/6e+63408h2/gk0H02AwpLBZVj7kE86f
 Ng/djsvk5y/K4ADLTWKFX8B4HCn7u9zb6JeXw68HszhWHTn/gbd9V5Hfr1mUxQ/wPcNI
 4YXmT1i/BSCrbPgT2Jc2Axi+LG/hF80QUbKWc0mMgGFpfz8CDFZ1AqzGHIpsSa5mJaRs
 wGmA==
X-Gm-Message-State: ABy/qLZcca8LI5wDu95QFBJoDSp56JVlc/A2FpzA9BsMwD8r4/PkZT83
 AtcY6qI/a8sNW9BfbdI2/w==
X-Google-Smtp-Source: APBJJlE0oA73gYUIwMelcM8z0408U22yjSo8RUGJb2rqGjtGdswxkKCC9nABPtEoktryHkXAAacu7A==
X-Received: by 2002:a92:4b08:0:b0:33b:dcbf:e711 with SMTP id
 m8-20020a924b08000000b0033bdcbfe711mr15060887ilg.8.1689010816389; 
 Mon, 10 Jul 2023 10:40:16 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id
 w18-20020a029692000000b0042036f06b24sm3449146jai.163.2023.07.10.10.40.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jul 2023 10:40:15 -0700 (PDT)
Received: (nullmailer pid 2291150 invoked by uid 1000);
 Mon, 10 Jul 2023 17:40:13 -0000
From: Rob Herring <robh@kernel.org>
To: Frank Rowand <frowand.list@gmail.com>, Michal Suchanek <msuchanek@suse.de>
Subject: [PATCH] of: Preserve "of-display" device name for compatibility
Date: Mon, 10 Jul 2023 11:40:07 -0600
Message-Id: <20230710174007.2291013-1-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Cyril Brulebois <cyril@debamax.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since commit 241d2fb56a18 ("of: Make OF framebuffer device names unique"),
as spotted by Frédéric Bonnard, the historical "of-display" device is
gone: the updated logic creates "of-display.0" instead, then as many
"of-display.N" as required.

This means that offb no longer finds the expected device, which prevents
the Debian Installer from setting up its interface, at least on ppc64el.

Fix this by keeping "of-display" for the first device and "of-display.N"
for subsequent devices.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=217328
Link: https://bugs.debian.org/1033058
Fixes: 241d2fb56a18 ("of: Make OF framebuffer device names unique")
Cc: stable@vger.kernel.org
Cc: Cyril Brulebois <cyril@debamax.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Helge Deller <deller@gmx.de>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/of/platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index 051e29b7ad2b..0c3475e7d2ff 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -552,7 +552,7 @@ static int __init of_platform_default_populate_init(void)
 			if (!of_get_property(node, "linux,opened", NULL) ||
 			    !of_get_property(node, "linux,boot-display", NULL))
 				continue;
-			dev = of_platform_device_create(node, "of-display.0", NULL);
+			dev = of_platform_device_create(node, "of-display", NULL);
 			of_node_put(node);
 			if (WARN_ON(!dev))
 				return -ENOMEM;
-- 
2.40.1

