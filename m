Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 072661B99B5
	for <lists+dri-devel@lfdr.de>; Mon, 27 Apr 2020 10:19:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 079616E0BF;
	Mon, 27 Apr 2020 08:19:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2220C89F8E
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 08:19:03 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id w20so16626165ljj.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 01:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Wgoy9ohn3hgU6AODUyrEyNotwUltFVCaKF+lVbe8OSs=;
 b=nOFvA4OSL8vpKMEogV9OnrSytd7eGhF4BtMO1U32YVhph5XhisuuXbMX9css4QWMaj
 Pagk+FdPAVW/rgKFaayP7DOwc2jTwAThhP5gi5Rk/tkn7nDjr3wc3/RwFczDZnF7dpq8
 oqqTzrLDMO0q166YQ3mfS/JHQ6JTxBTNzlLbc5qS+l47E8mp57d3gXbepPI8/jdJy3UV
 VPI981Ye1zy6/9a9dBRgDz+Fn3Rz+W2v7Fn8tZWmHudZT+wW2Krx01onC6+hWoCDRp2t
 vyZtoI40FYTq0V1ucMQMbXBnzOvfCE3AqdjnaejvTRe3fRz4soN2Ea/PXHfAClJWc+rY
 GrEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Wgoy9ohn3hgU6AODUyrEyNotwUltFVCaKF+lVbe8OSs=;
 b=jRWLI6grg7gRvWsaztFT9fVu3GzFrDGhUX09iLpF2OozO3ErnfEK3EkXkqsMd92AHL
 jktIi4d1+3WTpfW7D1/eY0fO9b0TGeJ4Hu4xfZYQD3DFoo8PCr/r0KHnsbNFH7UCEOMH
 KXvRoHb9JBm6RU4UGz8kKcNaD/gF+30pK54XoNB2TYyQ+8peSLYXWuIi45So+M9GQJXL
 7HBDcz7lDaQpfa3iLYE0OfFNledDS5Z3J8cqRoM8U7Gkpu79Tx2fwt7YtT9a77jSK0Xc
 Q9q8A6dULJ1o9/oz09XU1o8zHLS3KmtCH89PXa+bCD15dCGA7OHcg/deNdIwSftNoEQ0
 D31Q==
X-Gm-Message-State: AGi0PuZRI9/U5w2tj4wnUzhJqfVvodYQTNWG0IBBhe5yCf5LTSNppBLg
 /yusGaevktOpbk3hPW+/YCSHLQ3J
X-Google-Smtp-Source: APiQypIBlMpwjhBaNBuAELHO3iGwnvnAhJL4YhsJDjc0g52PmjY4vMp8RhTSd155hrIokdsrT3iGAA==
X-Received: by 2002:a2e:920e:: with SMTP id k14mr14203352ljg.288.1587975541048; 
 Mon, 27 Apr 2020 01:19:01 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 c20sm9846301ljk.59.2020.04.27.01.18.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 01:19:00 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 0/21] drm/bridge: support drm bridge connector helper +
 panel updates
Date: Mon, 27 Apr 2020 10:18:29 +0200
Message-Id: <20200427081850.17512-1-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Martyn Welch <martyn.welch@collabora.co.uk>, Jonas Karlman <jonas@kwiboo.se>,
 Peter Senna Tschudin <peter.senna@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Martin Donnelly <martin.donnelly@ge.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Somehow Laurent tricked me into updating a bridge driver.
In reality, having updated a driver yourself makes for much
better understanding of what is going on.
So in order to provide proper review feedback I deciced to give
it a spin.

Second iteration of this patchset covers several drivers,
and a few panel adjustments.

The general approach for the bridge drivers:
- Introduce drm_panel_brigde
- Introduce bridge operations
- Make connector creation optional

v2:
  - Updated bus_flags for boe,hv070wsa-100
  - Collected r-b, but did not apply patches yet
  - On the panel side the panel-simple driver gained a default
    connector type for all the dumb panels that do not
    include so in their description.
    With this change panels always provide a connector type,
    and we have the potential to drop most uses of
    devm_drm_panel_bridge_add_typed().
  - Added conversion of a few more bridge drivers

When bridge drivers no longer create their own connector, the
update of the connector state using drm_helper_hpd_irq_event()
is also left out.
I did not manage to convince myself if this is correct or not.
We somehow needs to trigger that the connector state is updated
but that should not be the repsonsibility of a bridge driver.

Patches can build but no run-time testing.
So both test and review feedback appreciated!


My notes on the status so far - for the bridge drives:

bridge/analogix/analogix-anx6345       todo
bridge/analogix/analogix-anx78xx       todo
bridge/analogix/analogix_dp_core       todo

bridge/sii902x                         todo ? how to deal with outputmode?
i2c/tda998x_drv.c                      todo Needs drm_connector in helper fuctions. In several places.
mediatek/mtk_hdmi.c                    todo Ask: Enric Balletbo i Serra <enric.balletbo@collabora.com> to do it?
omapdrm/dss/dpi.c                      todo, Laurent?
omapdrm/dss/hdmi4.c                    todo, Laurent?
omapdrm/dss/hdmi5.c                    todo, Laurent?
omapdrm/dss/sdi.c                      todo, Laurent?
omapdrm/dss/venc.c                     todo, Laurent?
bridge/nwl-dsi                         todo, Guido

bridge/adv7511                         ongoing, Laurent
bridge/simple-bridge                   ongoing, Laurent
bridge/synopsys/dw-hdmi                ongoing, Laurent
rcar-du/rcar_lvds.c                    ongoing, Laurent
bridge/megachips-stdpxxxx-ge-b850v3-fw ongoing, Sam
bridge/nxp-ptn3460                     ongoing, Sam
bridge/parade-ps8622                   ongoing, Sam
bridge/tc358764                        ongoing, Sam
bridge/tc358767                        ongoing, Sam
bridge/ti-sn65dsi86                    ongoing, Sam. How to get bpc without connector?
bridge/ti-tpd12s015                    ongoing, Sam

bridge/display-connector.c             done
bridge/lvds-codec                      done
bridge/cdns-dsi                        done
bridge/panel.c                         done
bridge/parade-ps8640                   done
bridge/sil-sii8620                     done
bridge/synopsys/dw-mipi-dsi            done
bridge/tc358768                        done
bridge/thc63lvd1024                    done
bridge/ti-tfp410                       done

	Sam


Sam Ravnborg (21):
      drm/panel: add connector type to boe,hv070wsa-100 panel
      drm/panel: panel-simple: add default connector_type
      drm/bridge: tc358764: drop drm_connector_(un)register
      drm/bridge: tc358764: add drm_panel_bridge support
      drm/bridge: tc358764: make connector creation optional
      drm/bridge: tc358767: add drm_panel_bridge support
      drm/bridge: tc358767: add detect bridge operation
      drm/bridge: tc358767: add get_edid bride operation
      drm/bridge: tc358767: make connector creation optional
      drm/bridge: ti-tpd12s015: make connector creation optional
      drm/bridge: parade-ps8622: add drm_panel_bridge support
      drm/bridge: parade-ps8622: make connector creation optional
      drm/bridge: megachips: add helper to create connector
      drm/bridge: megachips: get drm_device from bridge
      drm/bridge: megachips: enable detect bridge operation
      drm/bridge: megachips: add get_edid bridge operation
      drm/bridge: megachips: make connector creation optional
      drm/bridge: nxp-ptn3460: add drm_panel_bridge support
      drm/bridge: nxp-ptn3460: add get_modes bridge operation
      drm/bridge: nxp-ptn3460: make connector creation optional
      drm/bridge: ti-sn65dsi86: add drm_panel_bridge support

 .../drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c   |  92 +++++++++++-------
 drivers/gpu/drm/bridge/nxp-ptn3460.c               | 107 +++++++++------------
 drivers/gpu/drm/bridge/parade-ps8622.c             |  55 ++++-------
 drivers/gpu/drm/bridge/tc358764.c                  |  68 ++++---------
 drivers/gpu/drm/bridge/tc358767.c                  |  98 +++++++++++--------
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |  27 +++---
 drivers/gpu/drm/bridge/ti-tpd12s015.c              |   3 -
 drivers/gpu/drm/panel/panel-simple.c               |  13 ++-
 8 files changed, 219 insertions(+), 244 deletions(-)


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
