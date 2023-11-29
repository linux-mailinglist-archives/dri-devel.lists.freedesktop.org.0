Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8657FDA9D
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 15:58:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EAAD10E605;
	Wed, 29 Nov 2023 14:58:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A02110E1F6
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 14:39:58 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::229])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 74B95CA9E5
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 14:29:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E9F0DFF806;
 Wed, 29 Nov 2023 14:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1701268153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=FBe4Dzvbp9G6y5FdkNNaW8c1rBGR1yDYU7Bf04zl9co=;
 b=D3+fsK8PuCZ+x5Brl5D2kD+/MRaCPqjrL47+jeHSJzpbBIOcDEWwr9G8KQYnH8KlIno5E3
 IP2/s10jfrs+LW38zVGmGjjwkn5cnm7uBNWoRcumD8tISBsbA74JXM6AG6I6DD53wr7AHq
 lmrgE2NUAcBqdQ+Xf5xNqb8KRaYkz4qQra7tueBpZGSEjhp9RLN9B1o+oy9dEqQgb1vJPR
 0A0ovsicJanfwhodeSyPAT4l7eE7DNs30pYAF+RL3ovfIpbEQesQF14WjLO9JM/U/8vghF
 1XTRJLRZYmCwRc8xU9Ku40fXIWZlRMlDoAZlgVxbhacdvDSVO0GRw9xFFMhNFg==
From: Mehdi Djait <mehdi.djait@bootlin.com>
To: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, krzysztof.kozlowski+dt@linaro.org,
 robh+dt@kernel.org, conor+dt@kernel.org
Subject: [PATCH 0/2] drm/tiny: Add driver for the sharp LS027B7DH01 Memory LCD
Date: Wed, 29 Nov 2023 15:29:08 +0100
Message-ID: <cover.1701267411.git.mehdi.djait@bootlin.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: mehdi.djait@bootlin.com
X-Mailman-Approved-At: Wed, 29 Nov 2023 14:58:47 +0000
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
Cc: devicetree@vger.kernel.org, alexandre.belloni@bootlin.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 paul.kocialkowski@bootlin.com, geert@linux-m68k.org,
 thomas.petazzoni@bootlin.com, Mehdi Djait <mehdi.djait@bootlin.com>,
 luca.ceresoli@bootlin.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series adds a DRM driver for the sharp LS027B7DH01 memory display:
a 2.7" 400x240 monochrome 1 bit per pixel display SPI device.

This controller uses SPI both for control and for pixel data. Pixel data can be
sent either as one line per SPI frame or multiple lines (up to the entire picture)
in a single SPI frame. This driver implements the latter.

The Sharp Memory LCD requires an alternating signal to prevent the buildup of
a DC bias that would result in a Display that no longer can be updated. Two
modes for the generation of this signal are supported:

- Software, EXTMODE = Low: toggling the BIT(1) of the Command and writing it at
  least once a second to the display.

- Hardware, EXTMODE = High: the alternating signal should be supplied on the
  EXTCOMIN pin.

the Hardware mode is implemented with a PWM signal.

The driver announces the commonly supported XRGB8888 to userspace and
uses the drm_fb_xrgb8888_to_mono() function to convert the format.

Mehdi Djait (2):
  dt-bindings: display: Add Sharp LS027B7DH01 Memory LCD
  drm/tiny: Add driver for the sharp LS027B7DH01 Memory LCD

 .../bindings/display/sharp,ls027b7dh01.yaml   |  71 +++
 MAINTAINERS                                   |   7 +
 drivers/gpu/drm/tiny/Kconfig                  |   8 +
 drivers/gpu/drm/tiny/Makefile                 |   1 +
 drivers/gpu/drm/tiny/sharp-ls027b7dh01.c      | 411 ++++++++++++++++++
 5 files changed, 498 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/sharp,ls027b7dh01.yaml
 create mode 100644 drivers/gpu/drm/tiny/sharp-ls027b7dh01.c

-- 
2.41.0

