Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5BD435660
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 01:17:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF3EB89F6E;
	Wed, 20 Oct 2021 23:17:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 304DF89F6E
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 23:17:47 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 ls14-20020a17090b350e00b001a00e2251c8so3518557pjb.4
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 16:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xmAxhqZ/qDXN3jl5uUqBa40we4vavlccN8HRNtmRBjo=;
 b=DPDaH/RkezXtN0idzH4Syc1+SsqMzr4yMjUZzdfeRXscRQPBE5okTja97VBkR4Sy8v
 dUX1gTvgvHkm1HUmvc0LBJJlgQLXrwbvVztlIHrL82E/ew9TAgSJ6C0s1nf1lpyPMH98
 EozvhWu7w2JyGQJO6ZDIU0j/j/Xb9ZFbE9VbI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xmAxhqZ/qDXN3jl5uUqBa40we4vavlccN8HRNtmRBjo=;
 b=rA3vfVanOU7uVhrqylSp5p+gciT7Gj+g/mMCHtdk8SLvz4KZuSL+PlTKDoPcmZ/zSl
 IRZTVRy7dPjcJPU+9uOLRInzCitVRwh2FPk9v6dQ4YMKcaa36MB8tzjER+Y2zk/Z2cCN
 BTRxKGnnM3+gNMO1/DJhabzcyjW+UYVWncbDTB+DMI6o3A/MoyzBEpMkkhHxX9jxTXCs
 xFiv80/4PeMo0u2Txdzw2hVNAAjx1VxNpIoI3PksBifped0EDNsns5JEKCo/nRSbITj9
 ifzUMCWCrkMHtrS7N0d07FVOjT6OWkoMd3aHqG0oNyGOsRHCUMXWCDlk/c+6fXrpPn/U
 I7VQ==
X-Gm-Message-State: AOAM533PgVjZ7ZiyycRDmTAkT+Zm9ae+NRD1cADpLmk/KEsd0/po+AGC
 diZlRclG45aovkGYpmfJ/yTG9A==
X-Google-Smtp-Source: ABdhPJy10j1PNwa7XNz+7pTguI6ICQBzzgQiMZZp5X2pn58l45H2/Rq64w/vkIsJdW2IpL1mtRa3OA==
X-Received: by 2002:a17:90b:1646:: with SMTP id
 il6mr2042453pjb.129.1634771866681; 
 Wed, 20 Oct 2021 16:17:46 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:ee8c:e73a:3f5e:717a])
 by smtp.gmail.com with UTF8SMTPSA id kb10sm7856013pjb.18.2021.10.20.16.17.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 16:17:46 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>
Cc: Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Brian Norris <briannorris@chromium.org>, stable@vger.kernel.org,
 Zain Wang <wzz@rock-chips.com>, Tomasz Figa <tfiga@chromium.org>,
 Heiko Stuebner <heiko@sntech.de>, Sean Paul <seanpaul@chromium.org>
Subject: [PATCH] drm/bridge: analogix_dp: Make PSR-disable non-blocking
Date: Wed, 20 Oct 2021 16:17:28 -0700
Message-Id: <20211020161724.1.I67612ea073c3306c71b46a87be894f79707082df@changeid>
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
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

Prior to commit 6c836d965bad ("drm/rockchip: Use the helpers for PSR"),
"PSR disable" used non-blocking analogix_dp_send_psr_spd(). The refactor
accidentally (?) set blocking=true.

This can cause upwards of 60-100ms of unneeded latency when exiting
self-refresh, which can cause very noticeable lag when, say, moving a
cursor.

Presumbaly it's OK to let the display finish exiting refresh in parallel
with clocking out the next video frames, so we shouldn't hold up the
atomic_enable() step. This also brings behavior in line with the
downstream ("mainline-derived") variant of the driver currently deployed
to Chrome OS Rockchip systems.

Tested on a Samsung Chromebook Plus (i.e., Rockchip RK3399 Gru Kevin).

Fixes: 6c836d965bad ("drm/rockchip: Use the helpers for PSR")
Cc: <stable@vger.kernel.org>
Cc: Zain Wang <wzz@rock-chips.com>
Cc: Tomasz Figa <tfiga@chromium.org>
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: Sean Paul <seanpaul@chromium.org>
Signed-off-by: Brian Norris <briannorris@chromium.org>
---
CC list is partially constructed from the commit message of the Fixed
commit

 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index b7d2e4449cfa..fbe6eb9df310 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1055,7 +1055,7 @@ static int analogix_dp_disable_psr(struct analogix_dp_device *dp)
 	psr_vsc.db[0] = 0;
 	psr_vsc.db[1] = 0;
 
-	return analogix_dp_send_psr_spd(dp, &psr_vsc, true);
+	return analogix_dp_send_psr_spd(dp, &psr_vsc, false);
 }
 
 /*
-- 
2.33.0.1079.g6e70778dc9-goog

