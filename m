Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C62347ED1F
	for <lists+dri-devel@lfdr.de>; Fri, 24 Dec 2021 09:28:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1FC210E409;
	Fri, 24 Dec 2021 08:28:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17D3410E3E9
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Dec 2021 05:23:42 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id j11so15143519lfg.3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Dec 2021 21:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3vLn3V8hakrMnbWh9eTJX5Ws7e/fiZzoe10eOrTOCq8=;
 b=FHrkXdgcVJ6I4Cr7CEfnkrWcfzhb5v4om4TFV9enflli5haSp9odJBhecbmC0B6AxC
 KhnWcCb5UIRr97Mz8M9vGJrPmONYz1N/M5slOOb13NiXTQ3Y1NDq8kz2GYav6Q2dl6Gh
 Swfa1I2I1CGrFdWpDd4mghTZ4OrSM+NwvmWs4kl7dX8smza3jVzszNAsyxLzCfAZCc7R
 wSmZg0Vao3qr3XblzmeDyVm0Z/ziLWxLk1zdXJEzkqIOoZczP/ePCMKYCokEz+xI6Zw8
 BhSJggBkaTjwZqLz44xkUebaHLarLYH5rAncMhcVLfSk5+2aEny3N/Rm9VMP/bCC9jz4
 ZD9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3vLn3V8hakrMnbWh9eTJX5Ws7e/fiZzoe10eOrTOCq8=;
 b=Y8+EX0TrOgU+9aU77h9hD8WqSj8YSg7KBZiM+oeeGWHDAk3FfbR4I4glqVmU4r8BaK
 hblhjnLMpfAThUlN7nZglTs55mcpkE2c43MMtyXoW+yij+DuL8Duu+N7AYoFmmncNQnk
 BTto7t+ddJCoAcWVNdG0ht09xYhDNk6VpJ2gJv5BD65MRIWw6JpTz9TX+6Pa+CIdZ1xI
 HjwavvEbsbfczY8iR50/d9SDANs69WPsC7t9bubAf9DJpDoj3IARYU3OPAbLPJsnUYSG
 ygaZ8n73OODNFblf/CM+VeAaG6jqPF/D7T5cLbpOCiZ+461QPANMaMnkF4a+rPEk5qGS
 F1UQ==
X-Gm-Message-State: AOAM531xC9C1geQTRD6FiiSR12zSSBwxDtQWNdtlS6r8UQH7sNh8VYcS
 x9uRb8vipHy6/pOCL2VJemzzmf1qBiTXNhhI
X-Google-Smtp-Source: ABdhPJycx87ictKT8G0oaGXYgKX3KGQb93rTh2lVD1X1vPRpPeQuD1GsvVvaBwhKLFj/JYCBabnhFw==
X-Received: by 2002:a19:f241:: with SMTP id d1mr3883660lfk.131.1640323420407; 
 Thu, 23 Dec 2021 21:23:40 -0800 (PST)
Received: from cobook.home (nikaet.starlink.ru. [94.141.168.29])
 by smtp.gmail.com with ESMTPSA id e13sm702858lfs.306.2021.12.23.21.23.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 21:23:40 -0800 (PST)
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 1/3] drm: rcar-du: lvds: Add r8a77961 support
Date: Fri, 24 Dec 2021 08:23:07 +0300
Message-Id: <20211224052309.1997096-2-nikita.yoush@cogentembedded.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211224052309.1997096-1-nikita.yoush@cogentembedded.com>
References: <20211224052309.1997096-1-nikita.yoush@cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 24 Dec 2021 08:28:15 +0000
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
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The M3-W+ SoC has the same LVDS encoder as other R-Car Gen3 chips.
Add support for M3-W+ (R8A77961) SoC to the LVDS encoder driver.

Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
---
 drivers/gpu/drm/rcar-du/rcar_lvds.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
index 72a272cfc11e..8dbfbbd3cad1 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
@@ -901,6 +901,7 @@ static const struct of_device_id rcar_lvds_of_table[] = {
 	{ .compatible = "renesas,r8a7793-lvds", .data = &rcar_lvds_gen2_info },
 	{ .compatible = "renesas,r8a7795-lvds", .data = &rcar_lvds_gen3_info },
 	{ .compatible = "renesas,r8a7796-lvds", .data = &rcar_lvds_gen3_info },
+	{ .compatible = "renesas,r8a77961-lvds", .data = &rcar_lvds_gen3_info },
 	{ .compatible = "renesas,r8a77965-lvds", .data = &rcar_lvds_gen3_info },
 	{ .compatible = "renesas,r8a77970-lvds", .data = &rcar_lvds_r8a77970_info },
 	{ .compatible = "renesas,r8a77980-lvds", .data = &rcar_lvds_gen3_info },
-- 
2.30.2

