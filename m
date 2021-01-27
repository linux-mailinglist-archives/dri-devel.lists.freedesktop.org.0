Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F203070FA
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 09:17:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A4306E91D;
	Thu, 28 Jan 2021 08:16:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EECCB6E83C;
 Wed, 27 Jan 2021 15:26:11 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id s11so2918913edd.5;
 Wed, 27 Jan 2021 07:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pProH2wUvDU/L6Oy5JoRN6CX/iVYV45okQ7VNurEBHI=;
 b=DA56AqEE1dVOWdLv4UMqlIoVhbx4+hUcBmOZGbV2UT1agSTJfJjaXzJt/OLn3274Tc
 eQNjHgaT25fZlC8G/WdWj20PJbYv4VojU7z+p6iXWYM9a0L6r8SyO0K3XOSQ8p9yoOuC
 H4BoBcQOsca+capI7VR+/O6AoGwauoTJokQjv13BlZ2U7S73SaROA5GKcx1W/T2Pgy4S
 KqMJtKGI8Gi2S1ktoVOa4sh1bi68li0lgCTusB/4yQn7v1luS5iVigHuYBpwyhjSZbia
 kQQT2WB7LyZ8bxcRClubqHLOd4vmpKcc1k5mfMAuipbum0b3oBc3mRyEnhFRQTp1aPRL
 CW7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pProH2wUvDU/L6Oy5JoRN6CX/iVYV45okQ7VNurEBHI=;
 b=oACa+u+UVT/OZs0IOV1n18b/vvxr4LCzZLUdgUgSYK8BfKq7XD5TIhxWz5Y/FLhJFg
 2AWTgdPR8tCuubVNBlI/+45GGM+n38UWCcUM6lq9qv9zAvZ8F5QXMOZcCt+RZujAnF3c
 HtTeYvfB9V3Z8DbdVvznmnrs85fPMwcX5HNyXUVL0fU4We9s38/5S8HIqgwrA7LZaon3
 WO66k3zFrEoXlyPNngjeW2i8ANAfxsSnk7/o7sg5DajFPqLYjUCDMQu3ziSoeuk+csSx
 mX7XkKg2y3JK895kZSZJektXYIZMOjoJobp69GYsX1FVOfUR1ItBWnpWxT71ks21DHUS
 YScg==
X-Gm-Message-State: AOAM532IJEIz0y8/I6hTJqmv/PFBfA6LFKlLlf0zsW3Bx8Jdk+qkXdNR
 JqFNE0Qo2eBekMfbILpjLjI=
X-Google-Smtp-Source: ABdhPJyou9+WGYqXXV8lZe5yc1353A+y2zdvINKmaSI37Hv9KVGyud7cCZrN5EF+nrh/ZqGEcbPbIw==
X-Received: by 2002:a05:6402:149a:: with SMTP id
 e26mr9856788edv.254.1611761170607; 
 Wed, 27 Jan 2021 07:26:10 -0800 (PST)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com.
 [178.169.161.196])
 by smtp.gmail.com with ESMTPSA id s18sm1547750edw.66.2021.01.27.07.26.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jan 2021 07:26:09 -0800 (PST)
From: Iskren Chernev <iskren.chernev@gmail.com>
To: Rob Clark <robdclark@gmail.com>
Subject: [PATCH] drm/msm/mdp5: Fix wait-for-commit for cmd panels
Date: Wed, 27 Jan 2021 17:24:40 +0200
Message-Id: <20210127152442.533468-1-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 28 Jan 2021 08:15:36 +0000
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
Cc: freedreno@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Lee Jones <lee.jones@linaro.org>,
 dri-devel@lists.freedesktop.org, Brian Masney <masneyb@onstation.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, linux-kernel@vger.kernel.org,
 Iskren Chernev <iskren.chernev@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht, linux-arm-msm@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Emil Velikov <emil.velikov@collabora.com>, Sean Paul <sean@poorly.run>,
 Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Before the offending commit in msm_atomic_commit_tail wait_flush was
called once per frame, after the commit was submitted. After it
wait_flush is also called at the beginning to ensure previous
potentially async commits are done.

For cmd panels the source of wait_flush is a ping-pong irq notifying
a completion. The completion needs to be notified with complete_all so
multiple waiting parties (new async committers) can proceed.

Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
Suggested-by: Rob Clark <robdclark@gmail.com>
Fixes: 2d99ced787e3d ("drm/msm: async commit support")
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
index 0c8f9f88301fa..f5d71b2740793 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
@@ -1180,7 +1180,7 @@ static void mdp5_crtc_pp_done_irq(struct mdp_irq *irq, uint32_t irqstatus)
 	struct mdp5_crtc *mdp5_crtc = container_of(irq, struct mdp5_crtc,
 								pp_done);
 
-	complete(&mdp5_crtc->pp_completion);
+	complete_all(&mdp5_crtc->pp_completion);
 }
 
 static void mdp5_crtc_wait_for_pp_done(struct drm_crtc *crtc)

base-commit: 59fa6a163ffabc1bf25c5e0e33899e268a96d3cc
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
