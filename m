Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF8E2A3EA0
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 09:16:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83B4A6EC2F;
	Tue,  3 Nov 2020 08:14:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 456E46E117
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 18:11:47 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id g12so11470208pgm.8
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 10:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6mKswq1EcQgawu6pr6GZR0kttWxeflecqxlBNI4Tvcs=;
 b=Umy+fG4ASnzoA6nohdwI4QpXNeVaQfmLP+bhI1tuoNFZh6aqJ2DWxVvSVoAKTO7IZA
 gFSUARhs7Eo18H1nhgRaONFTdXED+o0E58W218F/VcDbpD72f7RaYB4582uqROy2zoLh
 W0F8pzmodFpQPln9JDyqcfeovGLTLq6oJsHsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6mKswq1EcQgawu6pr6GZR0kttWxeflecqxlBNI4Tvcs=;
 b=pWfxW2YCc2+6qdE7ZAgCEpWywliTNd9VFg8lwYqLN/M4IErzjDGb+UrP1XOMho3Jal
 Nz5KRLOhLbF+oiC15jCORlomxc+iZhwziIlpc9U14Jny9UkbBlExNzn7KkI2YF0xph0x
 fPTbX2sw4JKgxDNirMl+NTHMz/oyH+tzMgKMb9GCHmwackCutxBZcs3h/TPLMfix6Ph8
 aPWSibJ3plY3bcSWiM/wBvxvmUCZZaHrCPXuIPkfKqfzTM8u0pE40TQgOjgh2Iwar8P5
 fiURFnzSqpbzrVisVR/899TWzhhoDRZFbSG5uvNWfbkzcNTwKfTN36M9Lkj0TbPn0C4H
 6BtA==
X-Gm-Message-State: AOAM530Mv0JJCgkejM0EPaN3+O1IQ3ZrN/yjctpPsI2J9jidH82YJ0mj
 Nz4XG0TrnFfChgsGhUP792Vl/g==
X-Google-Smtp-Source: ABdhPJzz+yYdn92n7Vwuhp6X6hWBm6B93LUR1QT/i1SP+y9OKejWJfRWPWKq34KEdgPelLNEeW5wMg==
X-Received: by 2002:a17:90a:5d11:: with SMTP id
 s17mr17500721pji.107.1604340706897; 
 Mon, 02 Nov 2020 10:11:46 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id b17sm13175640pgb.94.2020.11.02.10.11.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 10:11:46 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v3 0/4] drm/bridge: ti-sn65dsi86: Support EDID reading
Date: Mon,  2 Nov 2020 10:11:40 -0800
Message-Id: <20201102181144.3469197-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.29.1.341.ge80a0c044ae-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 03 Nov 2020 08:14:24 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series cleans up the DDC code a little bit so that
it is more efficient time wise and supports grabbing the EDID
of the eDP panel over the aux channel. I timed this on a board
I have on my desk and it takes about 20ms to grab the EDID out
of the panel and make sure it is valid.

The first two patches seem less controversial so I stuck them at
the beginning. The third patch does the EDID reading and caches
it so we don't have to keep grabbing it over and over again. And
finally the last patch updates the reply field so that short
reads and nacks over the channel are reflected properly instead of
treating them as some sort of error that can't be discerned.

Stephen Boyd (4):
  drm/bridge: ti-sn65dsi86: Combine register accesses in
    ti_sn_aux_transfer()
  drm/bridge: ti-sn65dsi86: Make polling a busy loop
  drm/bridge: ti-sn65dsi86: Read EDID blob over DDC
  drm/bridge: ti-sn65dsi86: Update reply on aux failures

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 103 ++++++++++++++++++--------
 1 file changed, 71 insertions(+), 32 deletions(-)

Cc: Douglas Anderson <dianders@chromium.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: Sean Paul <seanpaul@chromium.org>

base-commit: 3650b228f83adda7e5ee532e2b90429c03f7b9ec
-- 
Sent by a computer, using git, on the internet

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
