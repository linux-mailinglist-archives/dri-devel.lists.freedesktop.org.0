Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 134A435A2E9
	for <lists+dri-devel@lfdr.de>; Fri,  9 Apr 2021 18:20:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 905766E4B7;
	Fri,  9 Apr 2021 16:20:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3A406E4C9
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Apr 2021 16:20:01 +0000 (UTC)
Received: from guri.fritz.box (unknown
 [IPv6:2a02:810a:880:f54:19b8:b5db:beab:c68c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id B13BC1F46987;
 Fri,  9 Apr 2021 17:19:59 +0100 (BST)
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v6 0/2] Add support for ANX7688
Date: Fri,  9 Apr 2021 18:19:49 +0200
Message-Id: <20210409161951.12365-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
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
Cc: megous@megous.com, chunkuang.hu@kernel.org, jernej.skrabec@siol.net,
 drinkcat@chromium.org, dafna.hirschfeld@collabora.com, jonas@kwiboo.se,
 airlied@linux.ie, dafna3@gmail.com, linux-usb@vger.kernel.org,
 narmstrong@baylibre.com, a.hajda@samsung.com, robh+dt@kernel.org,
 Laurent.pinchart@ideasonboard.com, hsinyi@chromium.org,
 enric.balletbo@collabora.com, kernel@collabora.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ANX7688 is a typec port controller that also converts HDMI to DP.
ANX7688 is found on Acer Chromebook R13 (elm) and on Pine64 PinePhone.

On Acer Chromebook R13 (elm), the device is powered-up and controller by the
Embedded Controller. Therefore its operation is transparent
to the SoC. It is used in elm only as a display bridge driver.
The bridge driver only reads some values using i2c and use them to
implement the mode_fixup cb.

On v5 we added the full dt-binding of the generic Analogix anx7688 device.
The problem is that for elm, most of the fields are not needed since
the anx7688 sits behind the EC. After a discussion on v5 (see [1])
we decided to go back to the original approach and send the dt binding
as specific to the elm. So in this version we rename the device to cros_ec_anx7688
and use the compatible 'google,cros-ec-anx7688'.

[1] https://patchwork.kernel.org/project/dri-devel/patch/20210305124351.15079-3-dafna.hirschfeld@collabora.com/

Changes since v5:
* treat the device as a specific combination of an ANX7688 behind the EC and
call it 'cros-ec-anx7688'

Changes since v4:
In v4 of this set, the device was added as an 'mfd' device
and an additional 'bridge' device for the HDMI-DP conversion, see [2].

[2] https://lkml.org/lkml/2020/3/18/64

Dafna Hirschfeld (1):
  dt-bindings: display: add google,cros-ec-anx7688.yaml

Enric Balletbo i Serra (1):
  drm/bridge: Add ChromeOS EC ANX7688 bridge driver support

 .../bridge/google,cros-ec-anx7688.yaml        |  82 ++++++++
 drivers/gpu/drm/bridge/Kconfig                |  12 ++
 drivers/gpu/drm/bridge/Makefile               |   1 +
 drivers/gpu/drm/bridge/cros-ec-anx7688.c      | 191 ++++++++++++++++++
 4 files changed, 286 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml
 create mode 100644 drivers/gpu/drm/bridge/cros-ec-anx7688.c

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
