Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F4D41B960
	for <lists+dri-devel@lfdr.de>; Tue, 28 Sep 2021 23:36:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A3BA6E9C1;
	Tue, 28 Sep 2021 21:36:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9267F6E9C1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 21:36:04 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id q23so127872pfs.9
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 14:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5lAhEZS11LpnIzc7KynPjRxiAb+PLMH/7bgGJPagJjE=;
 b=QdcmfJ/qSoowWbOPbMWVW/bQNIsR4/5kP2vt1OphFKkG11kzG4kPRJldG1S2xUqt4G
 4J5Hga2V7YSQwxs2qS+93eWwf2ot5DXO7ROHAwVwifmu7ZUjA/pZAMDpzIrJWfVQIDGL
 1y2rm2Wiu89koEtTmWthN1Q1lK2gqElQoX830=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5lAhEZS11LpnIzc7KynPjRxiAb+PLMH/7bgGJPagJjE=;
 b=flBelIL+maKHUXROddWqavWsfYWHiCIP0+4+MiRzI4TeGcjpQDYEd16l9LC1pauvtv
 rwH0WskMWeO/YPV1AWfpS0wpr3t9PO4GA0MplcforJO3xearg1IR9KGA8fOHqVIX62Y/
 MQv+W0JWtpjvIOvFCYAJjNZCQCaL9zh6aaT/40FVCxNOd4+eSiEIpyNOjoWJk0F1UukI
 tnsYgVzrwQ6W+y7Me1CdkrDlZMVV7N45v53EeEeveGzz/9NALh/lpzjBDg5CbunC9mQZ
 tymQYVzUr0+upifkwB9HJkmrqI/vb8A6OQ6Xt8Cr/auZfnRS/zJNOwQxbBmE8kRQIumh
 8o9A==
X-Gm-Message-State: AOAM531gSM2Db+k6OP06Ri84snsHnMn6wS+gweLwLYf1l9ae0FL0nuQJ
 u8bxQhBj8ou2jsaTQmHQv1ylyQ==
X-Google-Smtp-Source: ABdhPJywInmIIvWE43lWuKer/3uSKHLxj/LfTYQvFzSRtg3uj2Dg+SYa1UT9GlC6jKYZR1llpkUCcQ==
X-Received: by 2002:a65:5c85:: with SMTP id a5mr6559490pgt.126.1632864964181; 
 Tue, 28 Sep 2021 14:36:04 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:d7ca:580:94ab:8af8])
 by smtp.gmail.com with UTF8SMTPSA id z4sm108545pfz.99.2021.09.28.14.36.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Sep 2021 14:36:03 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, Sandy Huang <hjc@rock-chips.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Thomas Hebb <tommyhebb@gmail.com>,
 Brian Norris <briannorris@chromium.org>, aleksandr.o.makarov@gmail.com
Subject: [PATCH v3 0/4] Fix Rockchip MIPI DSI display init timeouts
Date: Tue, 28 Sep 2021 14:35:48 -0700
Message-Id: <20210928213552.1001939-1-briannorris@chromium.org>
X-Mailer: git-send-email 2.33.0.685.g46640cef36-goog
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Rockchip DSI driver has had a number of bugs over time and has
usually only worked by chance. A number of users have noticed that
things regressed with commit 43c2de1002d2 ("drm/rockchip: dsi: move all
lane config except LCDC mux to bind()"), although it was fixing several
real issues of its own that had been present forever in the upstream
driver (but notably, not in the downstream/BSP driver).

Patch 1 and 2 are the most important fixes here. See their description
for more info.

While I'm at it, fix a few error handling and cleanup issues too.

Changes in v3:
 - New patch, to fix related PM issue discovered after patch 1

Changes in v2:
- Clean up pm-runtime state in error cases.
- Correct git hash for Fixes.

Brian Norris (4):
  drm/rockchip: dsi: Hold pm-runtime across bind/unbind
  drm/rockchip: dsi: Reconfigure hardware on resume()
  drm/rockchip: dsi: Fix unbalanced clock on probe error
  drm/rockchip: dsi: Disable PLL clock on bind error

 .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   | 82 +++++++++++++------
 1 file changed, 59 insertions(+), 23 deletions(-)

-- 
2.33.0.685.g46640cef36-goog

