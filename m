Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 529935F7742
	for <lists+dri-devel@lfdr.de>; Fri,  7 Oct 2022 13:15:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F34010E00F;
	Fri,  7 Oct 2022 11:15:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9840310E00F
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Oct 2022 11:15:28 +0000 (UTC)
Received: from mx0.riseup.net (mx0-pn.riseup.net [10.0.1.42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mx0.riseup.net", Issuer "R3" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4MkQhc2TDKzDrwr
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Oct 2022 11:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1665141328; bh=ZeojxkKR8glYm7+VvnPQLktuz8n8YHSN+KZs3axH5YA=;
 h=From:To:Cc:Subject:Date:From;
 b=IPEKC78cJWxEz59uGHrfRBKiAv5SnEM0SyJIRNg6vPpknb0fzicxh4r45mu7t2jo+
 /PPUdesQr4m1q8TwENAoqeLzPjiGIeYID2pIGMW92ZpJIPAACrMRsAgdpunB2j14G3
 sGDwMJV9qFQh2vEf/6Flx2uwxhMkOLpAfw3GFEfA=
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx0.riseup.net (Postfix) with ESMTPS id 4MkQhb4D5Vz9t2L;
 Fri,  7 Oct 2022 11:15:27 +0000 (UTC)
X-Riseup-User-ID: 5C5D09C6D4573B5476A2F60EF092E2F9B852A9EB55C810406BBF89C1073B3968
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews1.riseup.net (Postfix) with ESMTPSA id 4MkQhX75BLz5vRK;
 Fri,  7 Oct 2022 11:15:24 +0000 (UTC)
From: Nia Espera <a5b6@riseup.net>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/2] Samsung s6e3fc2x01 panel driver for OnePlus 6T
Date: Fri,  7 Oct 2022 13:14:41 +0200
Message-Id: <20221007111442.51481-1-a5b6@riseup.net>
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
Cc: linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, Nia Espera <a5b6@riseup.net>
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
 .../gpu/drm/panel/panel-samsung-s6e3fc2x01.c  | 396 ++++++++++++++++++
 drivers/gpu/drm/panel/panel-samsung-sofef00.c |  18 -
 5 files changed, 416 insertions(+), 21 deletions(-)
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-s6e3fc2x01.c

-- 
2.38.0

