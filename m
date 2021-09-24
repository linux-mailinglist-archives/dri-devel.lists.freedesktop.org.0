Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FE74168F4
	for <lists+dri-devel@lfdr.de>; Fri, 24 Sep 2021 02:34:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DEF76E12E;
	Fri, 24 Sep 2021 00:34:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27E2E6E12E
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Sep 2021 00:34:05 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id t11so5109335plq.11
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Sep 2021 17:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wBds1209QF1z+nVsiiM4qRmbmC7cbF+FEIw3lHoYGtU=;
 b=Kf2Vmhk/2dt9qb+/V976czb5kimbAJ60AV/FhT7PiESWhjOypVvOnbkZ3kcgopY7EG
 MZh8TlfeKuJG1xSZnGXlsF015BWEXhGvpFjkzppCCSrNgwyCYADwFtr2t9TK7Quk3Vm8
 iVt/4gT9vxnz3xJvPcDP02r0Pl8yl6PgItmD4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wBds1209QF1z+nVsiiM4qRmbmC7cbF+FEIw3lHoYGtU=;
 b=AhjnaG33BMVFNa2KM1GUKliFkgNRrCNg6r1bw3CDQbB11XWhfUhT+p2llpbuSR3dpQ
 W96/xBLdB9avGmtkLBUq6RXPVX2BKYmnkHH6FssWzCQFyCHPB5fP3KqZcrMP1mGiuWzl
 GR1IewjjW8GCOAidBa1C5qbAb6/bCh+ZrQcHc6JUEh5RyVuRbJQXzAfuvfBQV82hfX9s
 xXypTj+8lZ1BJrBXcvyk67knlMg5CQ4qgQL/NBlJKpbU8njUVX25NeQx/EvxtctHfP8x
 nfuOR51/k4zCR7TX7fB9PhNWKgiCxuLWZcd58ZuX2Zclu4HlAt7OOQw7z/vHpBL0HkRK
 bUiw==
X-Gm-Message-State: AOAM531nsgOnHQ18YZaswC1IrbyiTlbjhT/UssAuh387bRg9BBxc64Ua
 y55o5U+/sq+HZkEn+PAfkAVgPA==
X-Google-Smtp-Source: ABdhPJyN772GEe8KfQixCUxePZ0AlT/1P8uSb37qfIbvMHownMWtbQ9SCDgYmKGc15Cbf3BX1Tp/1A==
X-Received: by 2002:a17:90b:4b82:: with SMTP id
 lr2mr20911175pjb.94.1632443644726; 
 Thu, 23 Sep 2021 17:34:04 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:74de:c8b7:3a35:1063])
 by smtp.gmail.com with UTF8SMTPSA id g8sm6555217pfv.51.2021.09.23.17.34.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Sep 2021 17:34:03 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Sam Ravnborg <sam@ravnborg.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Heiko Stuebner <heiko@sntech.de>, Sumit Semwal <sumit.semwal@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Brian Norris <briannorris@chromium.org>
Subject: [PATCH 0/3] drm/panel: Proper cleanup after mipi_dsi_attach()
Date: Thu, 23 Sep 2021 17:33:52 -0700
Message-Id: <20210924003355.2071543-1-briannorris@chromium.org>
X-Mailer: git-send-email 2.33.0.685.g46640cef36-goog
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

I've tested a few dual-DSI panel drivers which choke if they PROBE_DEFER
at the wrong time, so I patched those up in patch 1 and 2. Patch 3 fixes
the other drivers that I couldn't test, but seem to have all the same
problem.


Brian Norris (3):
  drm/panel: kingdisplay-kd097d04: Delete panel on attach() failure
  drm/panel: innolux-p079zca: Delete panel on attach() failure
  drm/panel: Delete panel on mipi_dsi_attach() failure

 drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c  |  8 +++++++-
 drivers/gpu/drm/panel/panel-innolux-p079zca.c          | 10 +++++++++-
 drivers/gpu/drm/panel/panel-jdi-lt070me05000.c         |  8 +++++++-
 drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c     |  8 +++++++-
 drivers/gpu/drm/panel/panel-novatek-nt36672a.c         |  8 +++++++-
 drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c   |  8 +++++++-
 drivers/gpu/drm/panel/panel-ronbo-rb070d30.c           |  8 +++++++-
 .../gpu/drm/panel/panel-samsung-s6e88a0-ams452ef01.c   |  1 +
 drivers/gpu/drm/panel/panel-samsung-sofef00.c          |  1 +
 drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c        |  8 +++++++-
 10 files changed, 60 insertions(+), 8 deletions(-)

-- 
2.33.0.685.g46640cef36-goog

