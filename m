Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1633711E927
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 18:26:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CC076EB66;
	Fri, 13 Dec 2019 17:26:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44DA26EB62
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 17:26:22 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id t2so304281wrr.1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 09:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZKp83AbaxIS+4w7GqVdl0VoZ9O2XyHrFAUMYGF70UwE=;
 b=OfSrV5Vil2g/TEwGoE+9+3zrqIds/h9UcxYpcO1Rn6hlmJQNDcktKtFsUPESJyEuWw
 +44liXSdOqrdzz8uO3ia8fbjHat8SVJOYBEhnMsHPYuljCSpeHGKY96EolZPtUKyC2xk
 Q84vr2pn+WG67t6AEv1w/BZ7r2BjZKVc3qLDo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZKp83AbaxIS+4w7GqVdl0VoZ9O2XyHrFAUMYGF70UwE=;
 b=TIGP+PH9Zo48GWedGuG0gzh7CO8Js2yPfrZ7FNhMV4UlmzhcXdU9eXcfAm5XMyBm7T
 6L4jcQdlAcmxa9ZOEhc4nYg5lxvMm8saawkCQWZ20ZO37Mnux87M9GFUe7kjwqyKm2fv
 NpnzXovC4gYH8Bh3y6SxMDOlWwbMb64k8biZ03+w9acUJkGl7iDR6zM4C0dr22hazDzo
 vF+lXT1ffVLgdenNFsaj7pCp44U0uijcVdLrVkYwP/AIvcdkt0B4nQDIH7Q54SuQHwy/
 WuiZsz2acBqans7PcFO4QHGuTxlrOjvDoe1sM1Iq5Tr3ZMYnYrvspriIig//E0qJw0k4
 lZxQ==
X-Gm-Message-State: APjAAAUXgaAtHNYk0vEc2Hc5RVp5ePUvwIaBaInuV86ampHLqLy+9L2F
 BFTj/zdeve93y+EdKStz5d+PB53BlEQ=
X-Google-Smtp-Source: APXvYqxvAUdSOy0yUEjbwxNRm3JdVfrjHXjQ+h8EaoHNogxjjVS/vLJfUI+ItOofVgpZ02EmtD3iaw==
X-Received: by 2002:adf:ef8b:: with SMTP id d11mr13513872wro.45.1576257980601; 
 Fri, 13 Dec 2019 09:26:20 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:564b:0:7567:bb67:3d7f:f863])
 by smtp.gmail.com with ESMTPSA id q15sm10689669wrr.11.2019.12.13.09.26.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2019 09:26:19 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 03/10] drm/atmel: plane_state->fb iff plane_state->crtc
Date: Fri, 13 Dec 2019 18:26:05 +0100
Message-Id: <20191213172612.1514842-3-daniel.vetter@ffwll.ch>
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Checking both is one too much, so wrap a WARN_ON around it to stope
the copypasta.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Boris Brezillon <bbrezillon@kernel.org>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
index 034f202dfe8f..40800ec5700a 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
@@ -604,7 +604,7 @@ static int atmel_hlcdc_plane_atomic_check(struct drm_plane *p,
 	int ret;
 	int i;
 
-	if (!state->base.crtc || !fb)
+	if (!state->base.crtc || WARN_ON(!fb))
 		return 0;
 
 	crtc_state = drm_atomic_get_existing_crtc_state(s->state, s->crtc);
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
