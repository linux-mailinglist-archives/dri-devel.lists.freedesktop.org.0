Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC49850C1C
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 00:09:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65C3210E7AF;
	Sun, 11 Feb 2024 23:09:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="L0LeVVLv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D92CB10E7A2
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Feb 2024 23:09:40 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id
 af79cd13be357-785d5b3ad29so15301185a.3
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Feb 2024 15:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707692979; x=1708297779; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fDZSdShs6vj/lWP/S7/E1GOAK4CmrS93rbjOgt/s+9E=;
 b=L0LeVVLvSaFk4oZT2sD0j9UTyFUNgvOl2erD2+aY8OJfRNAF6c2+9AW8+UtggVbYXw
 qAt78ggp7AKUtlQ1k7RmGZCB8xgKOKOdat3CMu21HgaRalyeAKW9KhkhwHhHNNc9WDDs
 YEfAlCD7Lf+i3XPF+uCGsZ3gADpUGLUOpqzzADpnrAnucvGaqEVJPvVkv9DwmeOc8AIV
 QprQp6oldleTTuGDneTGDfjRiPQnvbQtwdin7A7oxkcvkx2rLRapcdDGdr0uZ8kjzkAl
 /lkXHKvfuekRJV0qpt/F8lNoJpB4sFTHgU7dnVTzIIdxkP1uhuUB94ttdAO4M3E4XeQ0
 WssQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707692979; x=1708297779;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fDZSdShs6vj/lWP/S7/E1GOAK4CmrS93rbjOgt/s+9E=;
 b=Rj4X+fLL0QVwagiNRKGm2NteD39pj2aIq6IfRwQrBzKDp1zH/AAStZ633FtY7TYAEB
 hSxnb0RxwKqJbMwhp8MowRI1fEcqqLSROCB+AImIhlXIEF4sewoYH0yxzJ4ZpMcL1/Ly
 nrxV1NMga6gbmamdpIcIEyN6MpfDKpiwa4DstNZYWgcSZGhP1myaM4/HZRbAdKqus4/q
 E8c0aNGyGSG4f5Hj80srSD6ESHumZo8VDXzDlZc5ya/S8HaHB5OiPayHaZuv8BK4eDF+
 DS6AXw0SZPBbntEip/mlItCdhOlq03h1l394ua1R8PNG9Te7mOidVEbcrGm14Ojnl80U
 dTGw==
X-Gm-Message-State: AOJu0YyuFPz8jTeYxWIiV7Wqd1Scivsn5EGSlOLbuth9BTIbJOYLTUd4
 O0zY+P7XnDcDDFfTLOkKLF2MhgijExFieo6NGYPyvrPuANIEFXysHqX3xdFlMnA=
X-Google-Smtp-Source: AGHT+IEB/0itn55YYOtAkQi6ez+VIx6nfzo099ZocfgyOQH11IHH5G9m1PD1LiZCZIz3bQBU1RY8wA==
X-Received: by 2002:a05:620a:530e:b0:785:bfc9:d293 with SMTP id
 oo14-20020a05620a530e00b00785bfc9d293mr5507721qkn.38.1707692979388; 
 Sun, 11 Feb 2024 15:09:39 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWGqurWOl57x9bgNJRz6cyWvOTe4crDyX9WLpj2s+URspqY2130GspQbY0lgSSrNKecEX+267I+s4HcJQp/nSjzhOzT/zHFKirIb1lx4UmYZ23pSoSGJFXlN3W4/Aq7TA8EPSaZGQOIGI4yqwXuvvuTEuwXyPN6xkbfl/0J7ens2FgoKo3Ru4B1kECV6KrS2j5Vg+b0jkDlWX7hP4nc7je7tseF4NcVZr1CMgoiRkZYqiAx4dAeWCN03DKN9rw2m19ge3ukDif6x/DjywyC2SuFA4zNVdXlNglwWQFoRE/md3SNgUWfU2AKMR8dpSTvP9NKpRA1Wxd/7EKJK1mbfG/ekUsbTCQ3eIJwZX8e0Ojwuk8KMjRuAK8wpkgkf43Pa+m+X8LXiODAs+ivI3uM47gmgFK2YqZOwcy0SoL0gc92BUfel/EfO+LejKf3ghNcxKR15GDJbg+IwjuhjAt1q1flwqbX/Gego+wfo/KZKvFJ8d5GuruyUB/uJJMkgc7qNboz/4vxIIXgXas0aeO33hdSkMPZY4fldYiSd5YLxKjS3WjZR3t8EjESL8q1sficyJraCEl+FqmdvER4kY7KyKMzpws0EH5S1of+E/Y910xz09OQX774Qv/5G58NxIncZNPc7jw1V5Su0eCf6V0IRxgM3X+0HkzPOqsNlvQFDe2g622ojM3Qctbs1MzzvCM5W1l2atGkeVk1YuXQ
Received: from aford-System-Version.lan
 ([2601:447:d002:5be:c8c4:8542:9142:2184])
 by smtp.gmail.com with ESMTPSA id
 a25-20020a05620a103900b007855bec5da8sm1589773qkk.16.2024.02.11.15.09.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Feb 2024 15:09:38 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: marex@denx.de, aford@beaconembedded.com, Adam Ford <aford173@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Marco Felsch <m.felsch@pengutronix.de>,
 Michael Tretter <m.tretter@pengutronix.de>, linux-kernel@vger.kernel.org
Subject: [PATCH V2 1/2] drm/bridge: samsung-dsim: Set P divider based on
 min/max of fin pll
Date: Sun, 11 Feb 2024 17:09:29 -0600
Message-ID: <20240211230931.188194-1-aford173@gmail.com>
X-Mailer: git-send-email 2.43.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The P divider should be set based on the min and max values of
the fin pll which may vary between different platforms.
These ranges are defined per platform, but hard-coded values
were used instead which resulted in a smaller range available
on the i.MX8M[MNP] than what was possible.

As noted by Frieder, there are descripencies between the reference
manuals of the Mini, Nano and Plus, so I reached out to my NXP
rep and got the following response regarding the varing notes
in the documentation.

"Yes it is definitely wrong, the one that is part of the NOTE in
MIPI_DPHY_M_PLLPMS register table against PMS_P, PMS_M and PMS_S is
not correct. I will report this to Doc team, the one customer should
be take into account is the Table 13-40 DPHY PLL Parameters and the
Note above."

With this patch, the clock rates now match the values used in NXP's
downstream kernel.

Fixes: 846307185f0f ("drm/bridge: samsung-dsim: update PLL reference clock")
Signed-off-by: Adam Ford <aford173@gmail.com>
Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
V2:  Only update the commit message to reflect why these values
     were chosen.  No code change present

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 95fedc68b0ae..8476650c477c 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -574,8 +574,8 @@ static unsigned long samsung_dsim_pll_find_pms(struct samsung_dsim *dsi,
 	u16 _m, best_m;
 	u8 _s, best_s;
 
-	p_min = DIV_ROUND_UP(fin, (12 * MHZ));
-	p_max = fin / (6 * MHZ);
+	p_min = DIV_ROUND_UP(fin, (driver_data->pll_fin_max * MHZ));
+	p_max = fin / (driver_data->pll_fin_min * MHZ);
 
 	for (_p = p_min; _p <= p_max; ++_p) {
 		for (_s = 0; _s <= 5; ++_s) {
-- 
2.43.0

