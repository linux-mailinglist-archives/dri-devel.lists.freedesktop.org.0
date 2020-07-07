Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CF8218060
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 09:08:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 665376E882;
	Wed,  8 Jul 2020 07:06:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x563.google.com (mail-ed1-x563.google.com
 [IPv6:2a00:1450:4864:20::563])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB8D889CC1
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 15:58:49 +0000 (UTC)
Received: by mail-ed1-x563.google.com with SMTP id dg28so38896648edb.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jul 2020 08:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=flowbird.group; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=hGGzB42iFy6ghF2u4QUqQFvdM4Y3ZVYyPzuZ+b6j5U8=;
 b=SQauLQ9kLevGI1sjapbckHVSOl/rItba2jDiiEVbyk6vgD+ekaU79GMgdlUfeg7csN
 k3FdKEQUQbUTZHGuSDJ6Hc1TCopRcYom+7PnjG012s215/7xWz96ysJjtfamTV2vBUIk
 GTH3Tt9sXgLdclGWvy/420eUO0eSeRH3Lj7hEo1jcNtzrhX3DFCuZgX20Lw6tJLifJ/y
 5lFyyEB9m8vy15HwlJmM9Fmxyw8y1jMDeQMUWteqGLSYd3fPNmPoVdfmM28eLKdieewY
 Un2WtQzZYAELNz1E0JK3TaPSXrIkbgrzYXuv2CcIW/dhpW5JgfdO4BL74R7Q2uxoCwXE
 XZdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=hGGzB42iFy6ghF2u4QUqQFvdM4Y3ZVYyPzuZ+b6j5U8=;
 b=t5d+PBykFSVWzNxSWBOm/40Uod9Fes96jc9NTeRAloQ1f7OwHzYFfTd4ZdTp+UvOlV
 BH/JgYT6L3lhPITOt/OhrUhYv3Jo8ROTbwdnw1D/AahmYiYfU77Do6aLsFyy9oyNXgWw
 ONClLLr41YR43Q5ELYkUETS1g+roSeuI0YxAxIPk8Ux6fofJUDipHq2IeuoM/3pFkbPJ
 TS7ormIY3RB/BqHYr2Tt/JjTfrdV7YcSpuBezutLXHZysPXIKXkYpX5yc6PO/vBxYHFf
 hpiU9KAfQQb1vy6ErAZou5FJJyT29fVteXCzBk+lGMbGKLsnC20S+Rfu8Fnr4n+11Hq5
 1mPg==
X-Gm-Message-State: AOAM532Bp2ca5t687bFcu9XtZENcgfF0ma20MRoGy1hJVZpUSBCEc6Sd
 KXUPI9zB1v/gq1uHvZ/NL0rYSFt3BdNAtZNOe6OfOCYeqDTy
X-Google-Smtp-Source: ABdhPJw3Tm43QgiqUvFQKRBYj1WOXo2yPNyh9gnBzpc4EcPlPdfH4671tIhDdJpTzLcWR0pDV42EoW7gLio1
X-Received: by 2002:a50:acc5:: with SMTP id x63mr39384755edc.99.1594137528113; 
 Tue, 07 Jul 2020 08:58:48 -0700 (PDT)
Received: from mta1.parkeon.com ([185.149.63.251])
 by smtp-relay.gmail.com with ESMTPS id dn20sm5596ejc.142.2020.07.07.08.58.48
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Tue, 07 Jul 2020 08:58:48 -0700 (PDT)
X-Relaying-Domain: flowbird.group
Received: from [172.16.14.70] (port=54136
 helo=PC12445-BES.dynamic.besancon.parkeon.com)
 by mta1.parkeon.com with esmtp (Exim 4.71)
 (envelope-from <martin.fuzzey@flowbird.group>)
 id 1jspzb-00069x-Mi; Tue, 07 Jul 2020 17:58:47 +0200
From: Martin Fuzzey <martin.fuzzey@flowbird.group>
To: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH] drm: imx: Fix occasional screen corruption on modeset.
Date: Tue,  7 Jul 2020 17:56:59 +0200
Message-Id: <1594137527-15201-1-git-send-email-martin.fuzzey@flowbird.group>
X-Mailer: git-send-email 1.9.1
X-Mailman-Approved-At: Wed, 08 Jul 2020 07:06:31 +0000
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
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When performing a modeset the atomic core calls
ipu_crtc_atomic_disable() which switches off the DC and DI.

When we immediately restart as in the modeset case this sometimes
leads to corruption at the bottom of the screen looking like a mirror
image of the top.

The exact reason isn't understood but it seems timing related.

This was observed on i.MX6DL on a system that does 2 mode
transitions on boot (fbcon->android boot animation->android homescreen)
then no more during normal operation resulting in corruption
about once every 10 boots that lasted for variable durations
from a few seconds to several hours.

Dumping the buffers confirmed that they were correct in memory,
just the display was wrong.

For tests the problem was reproduced systematically by forcing
a full modeset every 10 frames even if when not required.

Leaving the DC and DI on if the CRTC is staying on fixes this.

Signed-off-by: Martin Fuzzey <martin.fuzzey@flowbird.group>
---
 drivers/gpu/drm/imx/ipuv3-crtc.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3-crtc.c b/drivers/gpu/drm/imx/ipuv3-crtc.c
index 63c0284..9137b64 100644
--- a/drivers/gpu/drm/imx/ipuv3-crtc.c
+++ b/drivers/gpu/drm/imx/ipuv3-crtc.c
@@ -84,8 +84,15 @@ static void ipu_crtc_atomic_disable(struct drm_crtc *crtc,
 	struct ipu_crtc *ipu_crtc = to_ipu_crtc(crtc);
 	struct ipu_soc *ipu = dev_get_drvdata(ipu_crtc->dev->parent);
 
-	ipu_dc_disable_channel(ipu_crtc->dc);
-	ipu_di_disable(ipu_crtc->di);
+	/*
+	 * If we are just doing a modeset don't disable dc/di as that
+	 * sometimes leads to corruption at the bottom of the screen
+	 */
+	if (!crtc->state->active) {
+		ipu_dc_disable_channel(ipu_crtc->dc);
+		ipu_di_disable(ipu_crtc->di);
+	}
+
 	/*
 	 * Planes must be disabled before DC clock is removed, as otherwise the
 	 * attached IDMACs will be left in undefined state, possibly hanging
-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
