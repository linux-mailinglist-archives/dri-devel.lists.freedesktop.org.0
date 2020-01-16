Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 502C013D5E0
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2020 09:21:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 349EB6EC2C;
	Thu, 16 Jan 2020 08:21:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dodo.xh.is (dodo.xh.is
 [IPv6:2001:19f0:8001:184d:5400:2ff:fe7b:e8bd])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A0406EBBA
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2020 03:37:12 +0000 (UTC)
X-Spam: yes
X-Spam-Score: 6.6 / 99999
X-Spam-Symbols: RCVD_VIA_SMTP_AUTH, TO_DN_SOME, FREEMAIL_ENVRCPT,
 SUSPICIOUS_RECIPS, BROKEN_CONTENT_TYPE, MID_CONTAINS_FROM,
 MIME_TRACE, FROM_HAS_DN, R_MISSING_CHARSET, RCPT_COUNT_TWELVE,
 RCVD_NO_TLS_LAST, ASN, RCVD_COUNT_TWO, ARC_NA, TAGGED_RCPT,
 TO_MATCH_ENVRCPT_SOME, FROM_EQ_ENVFROM
Received: by dodo.xh.is (OpenSMTPD) with ESMTPSA id f941aa06
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO); 
 Wed, 15 Jan 2020 19:37:08 -0800 (PST)
Received: from localhost (localhost [127.0.0.1]) (Authenticated sender:
 icenowy@aosc.io)
 by hermes.aosc.io (Postfix) with ESMTPSA id 9001A476BD;
 Thu, 16 Jan 2020 03:37:02 +0000 (UTC)
From: Icenowy Zheng <icenowy@aosc.io>
To: Rob Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 0/5] Add support for Pine64 PineTab
Date: Thu, 16 Jan 2020 11:36:31 +0800
Message-Id: <20200116033636.512461-1-icenowy@aosc.io>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aosc.io; s=dkim;
 t=1579145827;
 h=from:subject:date:message-id:to:cc:mime-version:content-transfer-encoding;
 bh=87YLJpRmWJZe7wdqCNVEOJqDLc0q4dXIL0xBAUd1+uc=;
 b=rLIg6ejDnIPKj2/wuLCe7oV04s+UUjnr9lzxNfVZvngMGL0e9FWjpypJeC+4Yt9og8H3O5
 rPjTvm7h3pt2Ms1F2TGZWJv6KC0vvS3oPzAbYooutYILC0SkIFm0hHl1WS5+wLNxpmFaxR
 INAepk+nLaEPL0GmpOBJDgBVG0M3TMc=
X-Mailman-Approved-At: Thu, 16 Jan 2020 08:21:03 +0000
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

This patchset tries to add support for the PineTab tablet from Pine64.

As it uses a specific MIPI-DSI panel, the support of the panel should be
introduced first, with its DT binding.

Then a device tree is added. Compared to v1 of the patchset, the
accelerometer support is temporarily removed because a DT binding is
lacked (although a proper driver exists).

Icenowy Zheng (5):
  dt-bindings: vendor-prefix: add Shenzhen Feixin Photoelectics Co., Ltd
  dt-bindings: panel: add Feixin K101 IM2BA02 MIPI-DSI panel
  drm/panel: Add Feixin K101 IM2BA02 panel
  dt-bindings: arm: sunxi: add binding for PineTab tablet
  arm64: dts: allwinner: a64: add support for PineTab

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 .../display/panel/feixin,k101-im2ba02.yaml    |  55 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   6 +
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../boot/dts/allwinner/sun50i-a64-pinetab.dts | 460 +++++++++++++++
 drivers/gpu/drm/panel/Kconfig                 |   9 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-feixin-k101-im2ba02.c | 526 ++++++++++++++++++
 9 files changed, 1065 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/feixin,k101-im2ba02.yaml
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a64-pinetab.dts
 create mode 100644 drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c

-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
