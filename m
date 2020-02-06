Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1F1154BD8
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2020 20:18:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DF2F6FB1F;
	Thu,  6 Feb 2020 19:18:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3E896FB1D
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2020 19:18:42 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id t2so8599447wrr.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2020 11:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0g5Mh0a78aE+slLRezbmkDONRPTkqMWKBMePAh+3KlQ=;
 b=jIEgyffuVibQCcxof6bK7UZux67UyEapZihOaFD5RcCLtYAM415gbl+b2IgTkEJEvq
 /CHcnb8leeCz/qGnFD7VawZJ35dzdM15lB3ifg2Tq/NqTXsgfyX2fsj9t5C494aNJhYE
 pe6Hs0gknoOBaQWpSi95SPt8YSRGCteP5kQFil5/rm3CVo1DpH/nziVTbk33LzlpZIt9
 td0yuhnM20waWn/D+BS0sFJMnMPglTEcmh25grwiBCULI8TECk/l0vnsN1E/JOuOF+TO
 8yXFgbNApsOqeamcvi+UI4Y279iHxaQPPiPYKPEYoQVnuv7nT0esLBfMGnmCrYSoaisB
 DjRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0g5Mh0a78aE+slLRezbmkDONRPTkqMWKBMePAh+3KlQ=;
 b=t4LnQ47FGC5Kgsqae7r4VMJGs2YzApyBlksp4JLUfd6z4tLBPIvKbxiOgXO/ezAsC8
 8YIltt82Btxm4h6S6FJSiBloMIC3HMaMo73fslyccZIXO1ixbcAI2WukWhEe3sNXiGSJ
 tbVeBqrq0OUkKbeb7cmtTcMjMyrZjQ6osSEl4o3379c0jStaC42btEgr7+Arp1crmGWB
 ojEPOGNGLIf/MdDQDDVMB5+KIBurS1tgUfcy4641ev1uJbyDjtcPZUlD5NkArtcGX8br
 SSh5WIUeUJz0qHw9z1rSzWdSOq6zIQIaI1HiGjJ1YVDoaRLtjIVOqWI4FHZdA8BC0JLU
 dkGw==
X-Gm-Message-State: APjAAAVqyScSEqmBAzK3+SfLSdMhh7U2lKJKtuQBsFjvMSpF0b25lccu
 bUxcH+Myf/n/IOes1OweO4hiW/s4olGH1g==
X-Google-Smtp-Source: APXvYqy1Eu383ojtVuMTe4GlaMccR2VzKV14GruGHGYGabKmoxhKDRG84mifGs+gI/xchtHoZecR9A==
X-Received: by 2002:adf:9b87:: with SMTP id d7mr5552131wrc.64.1581016721267;
 Thu, 06 Feb 2020 11:18:41 -0800 (PST)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:7d33:17f7:8097:ecc7])
 by smtp.gmail.com with ESMTPSA id m3sm272662wrs.53.2020.02.06.11.18.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 11:18:40 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, boris.brezillon@collabora.com
Subject: [PATCH v4 03/11] drm/bridge: dw-hdmi: Plug atomic state hooks to the
 default implementation
Date: Thu,  6 Feb 2020 20:18:26 +0100
Message-Id: <20200206191834.6125-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200206191834.6125-1-narmstrong@baylibre.com>
References: <20200206191834.6125-1-narmstrong@baylibre.com>
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 051001f77dd4..fec4a4bcd1fe 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2494,6 +2494,9 @@ static void dw_hdmi_bridge_enable(struct drm_bridge *bridge)
 }
 
 static const struct drm_bridge_funcs dw_hdmi_bridge_funcs = {
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
 	.attach = dw_hdmi_bridge_attach,
 	.detach = dw_hdmi_bridge_detach,
 	.enable = dw_hdmi_bridge_enable,
-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
