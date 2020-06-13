Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A47D01F85A9
	for <lists+dri-devel@lfdr.de>; Sun, 14 Jun 2020 00:30:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E37F36E48D;
	Sat, 13 Jun 2020 22:30:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C74B76E48D
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jun 2020 22:30:38 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id s1so15004188ljo.0
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jun 2020 15:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FzAJhGZfJiBSb9p+is0pbxXE5BziQFr+Nhe+PHcOYR4=;
 b=TjwCM6P1n68Q47GQjOq65qJkd1Ay81L7arLF7RCzt0hiMckHCmqN3WZ9XlAERRnzFl
 +RHLK08gCF7pYL7er8z7x5gA2HR4Bhdj1HmhVKDhkf0ZEIFXoth4ZcVnAXtMz1jk/a4B
 bxi+r6EeDH+w3NgzwB4OI7u0YcjBrTMZjB8PcS/tH6S+vW6pCI6BwV1aCj11TewuwoKp
 XRNOeRLToLWfA2PM/+L5zwJw02r8+E8+YC5CmQGneDEvX+6SiGiIEjdguXFRSgXqeuBJ
 6PJVgc9L0MUG6NJBbwMtnvJIbpSHz19WIsaTkqjXor1GF4wuOZEC9QcLcaYJaUIMdtVb
 kOBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FzAJhGZfJiBSb9p+is0pbxXE5BziQFr+Nhe+PHcOYR4=;
 b=e0HK8x5xyRfcDBzEqmWHj+oIGqBzCiz3Q5s1C2eTvS8jbXyygx5HoxkKbpngPPXtTr
 Vxkl5bYFD8RVpXsjVIaSPcBi9RGFd1x8dbygAj+OfYP9vpcTvbYAZAbropGO8J7K0FTk
 8HSer8s9Wa6g3M75r3SUOQiBf6b2faFzTRW6V8x+SyBT81Xeoa9O0zNq13tgFJB6XfsS
 tJ0/06yQ6EdqI09Fyk0bdl+zgDe/chXOxfTnLmD+FI8zQ5WhnhpFE63XfS+Ko9enWZug
 uQFTgq6rvZaH4dutzcQItP2pdF8HeKBEURjbG7D6WPJ1WEKly0pAeUDPWgi+Y+Ew+qRt
 qCKw==
X-Gm-Message-State: AOAM5308brLeSJTVdyRzHzvisy04ihwNJ2eObxrkQDvS7ZK1x2z6SPau
 Iv+jfF3Y/GBC2IpdVg/7gHfcIeX+Q4X41Q==
X-Google-Smtp-Source: ABdhPJzauTuCb/B4dM7ikR/2Hs1ksRVcmYgu1KxjqMiw8W6wcGUWxBWOxzvTay2o0MTZztb7CcRydw==
X-Received: by 2002:a2e:860f:: with SMTP id a15mr10231173lji.127.1592087436933; 
 Sat, 13 Jun 2020 15:30:36 -0700 (PDT)
Received: from localhost.bredbandsbolaget
 (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
 by smtp.gmail.com with ESMTPSA id 15sm2888027ljw.46.2020.06.13.15.30.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jun 2020 15:30:36 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>
Subject: [PATCH 2/2] drm: mcde: Fix forgotten user of drm->dev_private
Date: Sun, 14 Jun 2020 00:30:27 +0200
Message-Id: <20200613223027.4189309-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200613223027.4189309-1-linus.walleij@linaro.org>
References: <20200613223027.4189309-1-linus.walleij@linaro.org>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We forgot one call site directly using drm->dev_private.
This leads to a crash like this:

8<--- cut here ---
Unable to handle kernel NULL pointer dereference at virtual address 00000918
pgd = (ptrval)
[00000918] *pgd=00000000
Internal error: Oops: 5 [#1] SMP ARM
Modules linked in:
CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.7.0-15001-gfa384b50b96b-dirty #514
Hardware name: ST-Ericsson Ux5x0 platform (Device Tree Support)
PC is at mcde_display_enable+0x78/0x7c0
LR is at mcde_display_enable+0x78/0x7c0

Fix this by using to_mcde() as in other functions.

Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Fixes: fd7ee85cfe7b ("drm/mcde: Don't use drm_device->dev_private")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/mcde/mcde_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mcde/mcde_display.c b/drivers/gpu/drm/mcde/mcde_display.c
index b319a474f801..212aee60cf61 100644
--- a/drivers/gpu/drm/mcde/mcde_display.c
+++ b/drivers/gpu/drm/mcde/mcde_display.c
@@ -838,7 +838,7 @@ static void mcde_display_enable(struct drm_simple_display_pipe *pipe,
 	struct drm_crtc *crtc = &pipe->crtc;
 	struct drm_plane *plane = &pipe->plane;
 	struct drm_device *drm = crtc->dev;
-	struct mcde *mcde = drm->dev_private;
+	struct mcde *mcde = to_mcde(drm);
 	const struct drm_display_mode *mode = &cstate->mode;
 	struct drm_framebuffer *fb = plane->state->fb;
 	u32 format = fb->format->format;
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
