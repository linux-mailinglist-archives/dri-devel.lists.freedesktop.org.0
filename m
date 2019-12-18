Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2D3123BC2
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 01:48:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 669A96E0FB;
	Wed, 18 Dec 2019 00:48:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F5946E0FB
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 00:48:25 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id k25so252799pgt.7
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 16:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DrIzy5/3+qkJlfpz8zly2ElwPJDQSn8JS7CVJj6CmpA=;
 b=JWFEQFsiP9BZC5HbLcv7+tioUvurGoS6OgIQC2MaUnDA64JkWBCBk610oHn+V0vr8N
 PDRCLaQ5jYucZEkmdQLB91uGNP2fgXlrhrrsH84luz+qRJkTfaIKf6FXAH4FlWAMk3bZ
 cNm7bnuAgLqnn5XJzzPEJa8R+iBtoIcKkD+NM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DrIzy5/3+qkJlfpz8zly2ElwPJDQSn8JS7CVJj6CmpA=;
 b=t4Vi+JjDzKMi/3w1l8mIodIyrC1bbhmS947mB5ZHVmo4CVuyhTIwLuXwlkOKQ2tAmv
 bbzHi7LEbgpQweVPXyKFZhG+H6JTXepd5+lzxAn4F7ly1+gjIVeF8zbAJe54jCrmDsbQ
 x/BjNd/CLrHhkgvJKlsKX4gsPpaaOvqGhUSXxbylaADLI0YriPD2aRPBOt1fgYLga1pg
 QZZ+FjS39jfg6O/dPigk5LxLBfpOB282/RDYPVcOjI/lC5psZFTrzXhnCWmrDXUgTiWQ
 I9jCE5q3YwabHryTag6zgHSQiOFTjHBhlvoishvB5x+DdjPecf2p0hxixrJOnJcT3/HY
 37ug==
X-Gm-Message-State: APjAAAVkeqCBqZ/AjS/k9lI2uXHGOb1i8OuTAaXo8G8Mdn9VAZoyG/I6
 hgTQDVhKUQqWUXtZY2fppOEShQ==
X-Google-Smtp-Source: APXvYqxgKMKNXSTeOoH7rDK5JVWi87oIv+P52BpWmaSqjQua5pSstDNqLp+GxjHfJWeE4vbc2mC6dg==
X-Received: by 2002:a63:bc01:: with SMTP id q1mr300743pge.442.1576630105100;
 Tue, 17 Dec 2019 16:48:25 -0800 (PST)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id v72sm139885pjb.25.2019.12.17.16.48.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2019 16:48:24 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 0/9] drm/bridge: ti-sn65dsi86: Improve support for AUO
 B116XAK01 + other DP
Date: Tue, 17 Dec 2019 16:47:32 -0800
Message-Id: <20191218004741.102067-1-dianders@chromium.org>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
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
Cc: robdclark@chromium.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, seanpaul@chromium.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series contains a pile of patches that was created to support
hooking up the AUO B116XAK01 panel to the eDP side of the bridge.  In
general it should be useful for hooking up a wider variety of DP
panels to the bridge, especially those with lower resolution and lower
bits per pixel.

The overall result of this series:
* Allows panels with fewer than 4 DP lanes hooked up to work.
* Optimizes the link rate for panels with 6 bpp.
* Supports trying more than one link rate when training if the main
  link rate didn't work.
* Avoids invalid link rates.

It's not expected that this series will break any existing users but
testing is always good.

To support the AUO B116XAK01, we could actually stop at the ("Use
18-bit DP if we can") patch since that causes the panel to run at a
link rate of 1.62 which works.  The patches to try more than one link
rate were all developed prior to realizing that I could just use
18-bit mode and were validated with that patch reverted.

These patches were tested on sdm845-cheza atop mainline as of
2019-12-13 and also on another board (the one with AUO B116XAK01) atop
a downstream kernel tree.

This patch series doesn't do anything to optimize the MIPI link and
only focuses on the DP link.  For instance, it's left as an exercise
to the reader to see if we can use the 666-packed mode on the MIPI
link and save some power (because we could lower the clock rate).

I am nowhere near a display expert and my knowledge of DP and MIPI is
pretty much zero.  If something about this patch series smells wrong,
it probably is.  Please let know and I'll try to fix it.

Changes in v2:
- Squash in maybe-uninitialized fix from Rob Clark.
- Patch ("Avoid invalid rates") replaces ("Skip non-standard DP rates")

Douglas Anderson (9):
  drm/bridge: ti-sn65dsi86: Split the setting of the dp and dsi rates
  drm/bridge: ti-sn65dsi86: zero is never greater than an unsigned int
  drm/bridge: ti-sn65dsi86: Don't use MIPI variables for DP link
  drm/bridge: ti-sn65dsi86: Config number of DP lanes Mo' Betta
  drm/bridge: ti-sn65dsi86: Read num lanes from the DP sink
  drm/bridge: ti-sn65dsi86: Use 18-bit DP if we can
  drm/bridge: ti-sn65dsi86: Group DP link training bits in a function
  drm/bridge: ti-sn65dsi86: Train at faster rates if slower ones fail
  drm/bridge: ti-sn65dsi86: Avoid invalid rates

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 277 ++++++++++++++++++++++----
 1 file changed, 234 insertions(+), 43 deletions(-)

-- 
2.24.1.735.g03f4e72817-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
