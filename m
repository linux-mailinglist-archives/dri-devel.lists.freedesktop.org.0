Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D20E379C80D
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 09:19:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ED9410E38D;
	Tue, 12 Sep 2023 07:19:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Mon, 11 Sep 2023 09:09:31 UTC
Received: from out-224.mta0.migadu.com (out-224.mta0.migadu.com
 [91.218.175.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9648D10E1A0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 09:09:31 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
 t=1694422942;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=ncMOdzmNge2dDHCrVx7yTH1c7a8W2V4JG4MDc4VOKkU=;
 b=z3iyY7ndOuW/FUIIBXdRnFOdp9wfaw9gmT1bCa2W30gMzXqJMIIyErsHBSgxs0FLur0BFL
 1gvz0JJ1jUBeGYvxsh0cBm3IztN10B3UTRzOzWvGdMX5+0WjDkNz0VzPnu7t6++P87W7RD
 E53rNR2IN2bQzpadeGj7eZpLep3xKmWE/1/gYepn1Yy+aghiQ/OBzROUnl5t20FdW9h/u2
 B0IlclixsKj0wKcixKfKt45d008w1w2j0IxklcjNu82lXRF5/9raYl19XFLvTb8OSDd/i3
 s0UjmLAM1eH0306WEODRhnAkJ4LskKZydU3udWRLnodAVdt4KU+u8KHJ6gTYMA==
From: John Watts <contact@jookia.org>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 0/8] Add FS035VG158 panel
Date: Mon, 11 Sep 2023 19:01:58 +1000
Message-ID: <20230911090206.3121440-1-contact@jookia.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Tue, 12 Sep 2023 07:19:12 +0000
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
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, Chris Morgan <macromorgan@hotmail.com>,
 linux-kernel@vger.kernel.org, Jagan Teki <jagan@edgeble.ai>,
 John Watts <contact@jookia.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello there,

I have recently done some work to get a new panel running on the kernel.

I am completely new to this kind of work so I don't know how to split my
patches up, especially as I did some light refactoring and fixing on the way.
These changes affect these existing LCD panel but should work.

I'm also not sure if this device tree yaml should be merged with the existing
leadtek,ltk035c5444t device tree yaml.

checkpatch has also warned me about updating MAINTAINERS for the device tree
documentation but I'm not sure if that's relevant here as I have put my name
in the documentation itself.

Thanks for your time,
John.

John Watts (8):
  drm/panel: nv3052c: Document known register names
  drm/panel: nv3052c: Add SPI device IDs
  drm/panel: nv3052c: Sleep for 150ms after reset
  drm/panel: nv3052c: Wait before entering sleep mode
  drm/panel: nv3052c: Allow specifying registers per panel
  drm/panel: nv3052c: Add Fascontek FS035VG158 LCD display
  dt-bindings: vendor-prefixes: Add fascontek
  dt-bindings: display: panel: add Fascontek FS035VG158 panel

 .../display/panel/fascontek,fs035vg158.yaml   |  60 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 .../gpu/drm/panel/panel-newvision-nv3052c.c   | 521 +++++++++++++-----
 3 files changed, 444 insertions(+), 139 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/fascontek,fs035vg158.yaml

-- 
2.42.0

