Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0646B5E9429
	for <lists+dri-devel@lfdr.de>; Sun, 25 Sep 2022 18:03:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41FD110E1EE;
	Sun, 25 Sep 2022 16:02:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9758910E0BE
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Sep 2022 20:36:49 +0000 (UTC)
Received: from mx0.riseup.net (mx0-pn.riseup.net [10.0.1.42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mx0.riseup.net", Issuer "R3" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4MZgmK2BL5zDqFf
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Sep 2022 20:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1664051809; bh=XKuz2LOAJmatn3dRdqOoRzj+9Y6o2PCdA2KB3+5c/8Y=;
 h=From:To:Cc:Subject:Date:From;
 b=b46cy5wzRuWD6bJhq1SBY1gRNCRSwtTyifOFd91IgrNcrR2T/lzoxdtgdbr0AWq/k
 Cj58QSwpmE9ObSdwPTsKBVvXSRTwc3FUKGluDOv6GLCZLB9hX9/21HgBtIzYJjHiSz
 0V8yKY+EH1iEOkqXkUf45/uv1Mu5qWpkw1uHxzLs=
Received: from fews2.riseup.net (fews2-pn.riseup.net [10.0.1.84])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx0.riseup.net (Postfix) with ESMTPS id 4MZgmJ3FPKz9rxl;
 Sat, 24 Sep 2022 20:36:48 +0000 (UTC)
X-Riseup-User-ID: 71826594FBD7587B59CB49689B9D6271079D7E3E55DFD90AA35B694E52D96464
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews2.riseup.net (Postfix) with ESMTPSA id 4MZgmF4nTgz20Rm;
 Sat, 24 Sep 2022 20:36:45 +0000 (UTC)
From: Nia Espera <a5b6@riseup.net>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] Samsung s6e3fc2x01 panel driver for OnePlus 6T
Date: Sat, 24 Sep 2022 22:36:14 +0200
Message-Id: <20220924203616.63325-1-a5b6@riseup.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 25 Sep 2022 16:02:49 +0000
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
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 Nia Espera <a5b6@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series adds proper support for the panel used in OnePlus 6T
smartphones (s6e3fc2x01). Previously, the panel relied on the driver
used by the sofef00 panel which failed to properly initialise it after
a reset.

Nia Espera (2):
  drivers: gpu: drm: add driver for samsung s6e3fc2x01 cmd mode panel
  drivers: gpu: drm: remove support for sofef00 driver on s6e3fc2x01
    panel

 MAINTAINERS                                   |   5 +
 drivers/gpu/drm/panel/Kconfig                 |  17 +-
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-samsung-s6e3fc2x01.c  | 395 ++++++++++++++++++
 drivers/gpu/drm/panel/panel-samsung-sofef00.c |  18 -
 5 files changed, 415 insertions(+), 21 deletions(-)
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-s6e3fc2x01.c

-- 
2.37.3

