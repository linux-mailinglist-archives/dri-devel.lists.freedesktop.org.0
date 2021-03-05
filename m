Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A3732EBA8
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 13:54:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A6AD6EB75;
	Fri,  5 Mar 2021 12:54:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E7216EB6C
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 12:43:59 +0000 (UTC)
Received: from guri.fritz.box
 (p200300c7cf38380008df3f9b2ff1d151.dip0.t-ipconnect.de
 [IPv6:2003:c7:cf38:3800:8df:3f9b:2ff1:d151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 67D611F46A71;
 Fri,  5 Mar 2021 12:43:57 +0000 (GMT)
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v5 0/2] Add support for ANX7688
Date: Fri,  5 Mar 2021 13:43:49 +0100
Message-Id: <20210305124351.15079-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Fri, 05 Mar 2021 12:54:32 +0000
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
Cc: chunkuang.hu@kernel.org, jernej.skrabec@siol.net, drinkcat@chromium.org,
 dafna.hirschfeld@collabora.com, jonas@kwiboo.se, airlied@linux.ie,
 dafna3@gmail.com, narmstrong@baylibre.com, a.hajda@samsung.com,
 robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com, hsinyi@chromium.org,
 enric.balletbo@collabora.com, kernel@collabora.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ANX7688 is a typec port controller that also converts HDMI to DP.
ANX7688 is found on Acer Chromebook R13 (elm) and on Pine64 PinePhone.

On Acer Chromebook R13, the device is powered-up and controller by the
Embedded Controller. Therefore the dt-bindings requires
only the 'compatible' and 'reg' properties.

In v4 of this set, the device was added as an 'mfd' device
and an additional 'bridge' device for the HDMI-DP conversion, see [1].
In this version we add the device as a typec controller.

[1] https://lkml.org/lkml/2020/3/18/64

Changes from v4:
Send the device as a typec controller instead of mfd.
The bridge driver should therefore convert from a platform
driver to an i2c driver.

Dafna Hirschfeld (1):
  dt-bindings: usb: add analogix,anx7688.yaml

Enric Balletbo i Serra (1):
  drm/bridge: anx7688: Add ANX7688 bridge driver support

 .../bindings/usb/analogix,anx7688.yaml        | 177 +++++++++++++++++
 drivers/gpu/drm/bridge/analogix/Kconfig       |  11 ++
 drivers/gpu/drm/bridge/analogix/Makefile      |   1 +
 .../drm/bridge/analogix/analogix-anx7688.c    | 186 ++++++++++++++++++
 4 files changed, 375 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/analogix,anx7688.yaml
 create mode 100644 drivers/gpu/drm/bridge/analogix/analogix-anx7688.c

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
