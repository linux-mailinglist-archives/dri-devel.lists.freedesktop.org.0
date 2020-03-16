Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3D4188711
	for <lists+dri-devel@lfdr.de>; Tue, 17 Mar 2020 15:17:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4F7B6E147;
	Tue, 17 Mar 2020 14:16:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dodo.xh.is (dodo.xh.is
 [IPv6:2001:19f0:8001:184d:5400:2ff:fe7b:e8bd])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F1586E44B
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 13:35:41 +0000 (UTC)
X-Spam: yes
X-Spam-Score: 6.6 / 99999
X-Spam-Symbols: TO_MATCH_ENVRCPT_SOME, RCPT_COUNT_TWELVE, FROM_EQ_ENVFROM,
 ARC_NA, RCVD_VIA_SMTP_AUTH, FROM_HAS_DN, ASN, TO_DN_SOME,
 FREEMAIL_ENVRCPT, FREEMAIL_TO, RCVD_NO_TLS_LAST,
 RCVD_COUNT_TWO, SUSPICIOUS_RECIPS, R_MISSING_CHARSET,
 TAGGED_RCPT, BROKEN_CONTENT_TYPE, MID_CONTAINS_FROM, MIME_TRACE
Received: by dodo.xh.is (OpenSMTPD) with ESMTPSA id 9e917f25
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO); 
 Mon, 16 Mar 2020 06:35:39 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1]) (Authenticated sender:
 icenowy@aosc.io)
 by hermes.aosc.io (Postfix) with ESMTPSA id 24B284C196;
 Mon, 16 Mar 2020 13:35:15 +0000 (UTC)
From: Icenowy Zheng <icenowy@aosc.io>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Ondrej Jirman <megous@megous.com>
Subject: [PATCH v2 0/5] Add support for PinePhone LCD panel
Date: Mon, 16 Mar 2020 21:34:58 +0800
Message-Id: <20200316133503.144650-1-icenowy@aosc.io>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aosc.io; s=dkim;
 t=1584365737;
 h=from:subject:date:message-id:to:cc:mime-version:content-transfer-encoding;
 bh=UogBDqyfcy6/qNkgFYCFMrYkAAGyI8Dc8r8lCwA5buc=;
 b=nTTzHm/2tCiQJ1hlgBvq2jrR9y68BrpXG7y3X5HoIL3pxcrktUbDg3eleVVT22r9nPlAcO
 39HgVIRA00TxiaQYG7RXlnj9wrXfTGV1xlBwbeHPOizEOx3gvAJN6Syp8iKlHpXEMOc/Dq
 wdeGMDusw1SRlkvFWQZ/ns6IPGBDC+c=
X-Mailman-Approved-At: Tue, 17 Mar 2020 14:16:40 +0000
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com,
 linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchset adds support for the LCD panel of PinePhone.

The first 3 patches are for the panel itself, and the last 2 patches are
for enabling it on PinePhone.

PATCH 4 is the fix of a bug in sun6i_mipi_dsi which will gets triggered
on XBD599.

Icenowy Zheng (5):
  dt-bindings: vendor-prefixes: Add Xingbangda
  dt-bindings: panel: add binding for Xingbangda XBD599 panel
  drm: panel: add Xingbangda XBD599 panel
  drm/sun4i: sun6i_mipi_dsi: fix horizontal timing calculation
  arm64: allwinner: dts: a64: add LCD-related device nodes for PinePhone

 .../display/panel/xingbangda,xbd599.yaml      |  50 +++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 .../dts/allwinner/sun50i-a64-pinephone.dtsi   |  37 ++
 drivers/gpu/drm/panel/Kconfig                 |   9 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-xingbangda-xbd599.c   | 366 ++++++++++++++++++
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c        |  10 +-
 7 files changed, 470 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/xingbangda,xbd599.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-xingbangda-xbd599.c

-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
