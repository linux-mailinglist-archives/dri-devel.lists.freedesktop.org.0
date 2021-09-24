Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C984418044
	for <lists+dri-devel@lfdr.de>; Sat, 25 Sep 2021 10:25:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 183AF6E3AE;
	Sat, 25 Sep 2021 08:25:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A71F6E247
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Sep 2021 21:45:02 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id q23so9987884pfs.9
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Sep 2021 14:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=Uv269OeTJg43AaEPwcf5zcDpdZuLffPrpQspT2ye6xU=;
 b=GDRkBLmdWxaRhCXbBu7YhAYbfeYGcttFcqZQUt4XlBxNUK35YdxbQMwpUalFFLPftH
 Npc4pW8vwy2T0BUtB9pnp8eJ1Go3CeniD143fA19dgSaDVrKgakxqr02gpM0ABF94Epo
 ugCS6I49c5dluUva4M873P7YRlcsrt+u7TmzTOOBOTlcmd0VodEXJ262iat5DD1UKMXw
 xsRwnWYl492lGYSigCXYojczyGTF6DjE0VQMPttEUwPzTCCJvUDQwVlFR6dGy09ioG7i
 CHaFaSPF1Oyi/g0YhR7QngZ1GewB0EIUwp7Xlsg5wj8jQrGGeHTjIX7raIwL9LsdQR/a
 tu3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Uv269OeTJg43AaEPwcf5zcDpdZuLffPrpQspT2ye6xU=;
 b=1as2QXzkf/XcsLPy4Pb4yZhh3LOTK8uk/ygMCWEJQHhApKQG3Kd0EquenT96wCgSbA
 Ng8IbGkUdLGtGleVlfPqsChmRVdieobFHOMEPeXwTDRG9Vt9kUJ9UfL7+A0LSpYWo8TQ
 erxgL7XKoyahhlgnRiprHAETsxeZnAoAqTLk/CgKnU4jlzR1SEWHsyaEoFDYzlaKL79s
 Uz4dnrvVWztY2KSEWes+AE4xnAj0TyETO37X9qP79QfZcNUpqz0rKOiW7+8aEQyOEoHv
 7e/XvXugy210CIQq4+6Q4sBT4AFvLAcZYb/451JGXFmcVoFA+s1hTovpEvYKTXbCA/VQ
 Jz7Q==
X-Gm-Message-State: AOAM531JW0nAAArg2+tox+emqqRMtgqCoW4sBJaY1iDUoHona9I3pEOO
 ENNUaH1Uzo7duUptQCZoqQs=
X-Google-Smtp-Source: ABdhPJwDrhd5pnOFu92NgEERf8Zbyl9RvTTpSJvTXTv8hkVyuO2rcisRSR+OExbhjh244F0cDZqWNg==
X-Received: by 2002:a63:155d:: with SMTP id 29mr5600716pgv.118.1632519901868; 
 Fri, 24 Sep 2021 14:45:01 -0700 (PDT)
Received: from stbirv-lnx-2.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id n66sm9842029pfn.142.2021.09.24.14.44.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 Sep 2021 14:45:01 -0700 (PDT)
From: Justin Chen <justinpopo6@gmail.com>
To: netdev@vger.kernel.org
Cc: bcm-kernel-feedback-list@broadcom.com, Justin Chen <justinpopo6@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Doug Berger <opendmb@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
 Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
 Michael Chan <michael.chan@broadcom.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS), linux-kernel@vger.kernel.org (open list),
 linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK),
 dri-devel@lists.freedesktop.org (open list:DMA BUFFER SHARING FRAMEWORK),
 linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING FRAMEWORK)
Subject: [PATCH net-next 0/5] brcm ASP 2.0 Ethernet controller
Date: Fri, 24 Sep 2021 14:44:46 -0700
Message-Id: <1632519891-26510-1-git-send-email-justinpopo6@gmail.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Sat, 25 Sep 2021 08:25:39 +0000
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

This patch set adds support for Broadcom's ASP 2.0 Ethernet controller.

Florian Fainelli (1):
  dt-bindings: net: Brcm ASP 2.0 Ethernet controller

Justin Chen (4):
  dt-bindings: net: brcm,unimac-mdio: Add asp-v2.0
  net: bcmasp: Add support for ASP2.0 Ethernet controller
  net: phy: mdio-bcm-unimac: Add asp v2.0 support
  MAINTAINERS: ASP 2.0 Ethernet driver maintainers

 .../devicetree/bindings/net/brcm,asp-v2.0.yaml     |  147 ++
 .../devicetree/bindings/net/brcm,unimac-mdio.yaml  |    1 +
 MAINTAINERS                                        |    9 +
 drivers/net/ethernet/broadcom/Kconfig              |   11 +
 drivers/net/ethernet/broadcom/Makefile             |    1 +
 drivers/net/ethernet/broadcom/asp2/Makefile        |    2 +
 drivers/net/ethernet/broadcom/asp2/bcmasp.c        | 1351 +++++++++++++++++++
 drivers/net/ethernet/broadcom/asp2/bcmasp.h        |  565 ++++++++
 .../net/ethernet/broadcom/asp2/bcmasp_ethtool.c    |  628 +++++++++
 drivers/net/ethernet/broadcom/asp2/bcmasp_intf.c   | 1414 ++++++++++++++++++++
 .../net/ethernet/broadcom/asp2/bcmasp_intf_defs.h  |  187 +++
 drivers/net/mdio/mdio-bcm-unimac.c                 |    1 +
 12 files changed, 4317 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml
 create mode 100644 drivers/net/ethernet/broadcom/asp2/Makefile
 create mode 100644 drivers/net/ethernet/broadcom/asp2/bcmasp.c
 create mode 100644 drivers/net/ethernet/broadcom/asp2/bcmasp.h
 create mode 100644 drivers/net/ethernet/broadcom/asp2/bcmasp_ethtool.c
 create mode 100644 drivers/net/ethernet/broadcom/asp2/bcmasp_intf.c
 create mode 100644 drivers/net/ethernet/broadcom/asp2/bcmasp_intf_defs.h

-- 
2.7.4

