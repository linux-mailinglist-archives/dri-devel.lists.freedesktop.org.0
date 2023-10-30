Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3EE7DB4CA
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 09:06:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07FDF10E22C;
	Mon, 30 Oct 2023 08:06:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com
 [IPv6:2001:41d0:203:375::b3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AEC310E212
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 07:24:22 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
 t=1698650660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=iPJfSX51Ov+WGn0bxAkaRt0Zl4iWxaNa6Rvl7jWJpR4=;
 b=Aa0Otn+t/VEndDsmkq9+3DXSDyhM0RF5cF9KQ8wftAM3x4bYxAgIXwRdUUCqQFEh9MLsp+
 w/q+ROmDovuW+4XX1uAcme6Xmu/JTr13DUDCIWFy2PDboGMGgJxIEEVf3uq/cwo7YYbzQ2
 pyvY8DUOwWZ7FOvOnYpPo8KUjVNKSqMYYwNGofRqFNNqH4qPigQgcbtHcHa/HhFD7Emc9p
 9r3xaAmclEXOLjZG/RLIIHJYrAUGhDp4XPTXvqVbd8MyiHR2njpPqMD+jmo4+AU/PO7ey0
 bpeTbLSiKi6oISz8KPTRfEAJxf7K5uVn/Ywjn6RM6dYejj/oA3grScwH9FCjeg==
From: John Watts <contact@jookia.org>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH v4 0/7] Add FS035VG158 panel
Date: Mon, 30 Oct 2023 18:23:31 +1100
Message-ID: <20231030072337.2341539-2-contact@jookia.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Mon, 30 Oct 2023 08:06:21 +0000
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chris Morgan <macromorgan@hotmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Jagan Teki <jagan@edgeble.ai>, John Watts <contact@jookia.org>,
 Rob Herring <robh+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Paul Cercueil <paul@crapouillou.net>, Sam Ravnborg <sam@ravnborg.org>,
 Christophe Branchereau <cbranchereau@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello there,

This RFC introduces support for the FS035VG158 LCD panel, cleaning up
the nv3052c driver on the way and documentating existing panel code.

This patch series is at a bit of a standstill: I have gotten feedback
that it should instead use the Leadtek LTK035C5444T panel init sequence
instead of Fascontek's provided sequence which is almost identical.

I don't feel comfortable providing a patch that does this unless someone
can explain why the changes Fascontek have made aren't critical.

I would like feedback to know if this is a blocker for this patch set,
or otherwise what needs to be done to get it merged.

John.

v3 -> v4:
- Mark panel_regs_len as unsigned

v2 -> v3:
- Dropped patches that add extra sleep time

v1 -> v2:
- Fixed a variable declaration style error
- Cleaned up device tree yaml

John Watts (7):
  drm/panel: nv3052c: Document known register names
  drm/panel: nv3052c: Add SPI device IDs
  drm/panel: nv3052c: Allow specifying registers per panel
  drm/panel: nv3052c: Add Fascontek FS035VG158 LCD display
  dt-bindings: display: panel: Clean up leadtek,ltk035c5444t properties
  dt-bindings: vendor-prefixes: Add fascontek
  dt-bindings: display: panel: add Fascontek FS035VG158 panel

 .../display/panel/fascontek,fs035vg158.yaml   |  56 ++
 .../display/panel/leadtek,ltk035c5444t.yaml   |   8 +-
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 .../gpu/drm/panel/panel-newvision-nv3052c.c   | 515 +++++++++++++-----
 4 files changed, 437 insertions(+), 144 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/fascontek,fs035vg158.yaml

-- 
2.42.0

