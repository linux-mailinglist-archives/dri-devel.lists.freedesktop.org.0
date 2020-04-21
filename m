Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D80161B1DD4
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 07:06:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFD3189E43;
	Tue, 21 Apr 2020 05:06:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8AD389E43
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 05:06:49 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id q18so2689652pgm.11
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 22:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6tjzB8IDNxXjMn/L2OX52d3R04u5HYnbdq7WzuEIBoI=;
 b=Dc9szpGYg/TMF5FeugiPobR7YSgxJmjSHAmcZTqVZLGp1hK2KxuemF5Ni1QATgELjb
 41mP7+aygDk/h9Zjc244kYSW9WSmgGj5WfX+s80DvDH0zkOO4o072+lVyWwylybt1n0S
 WH+CvoiSldcoYQr/OCPu+DSJ2rLAodUm7zij8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6tjzB8IDNxXjMn/L2OX52d3R04u5HYnbdq7WzuEIBoI=;
 b=I0B2/klBlO2Nx5VzLuiCwYmPlAKtQI1CFOG0wzmwJO6/mchrR7AHAnk3haos/Y2Gdn
 t9iWvwUJKpPMN9WImvFeTKiN92gcy++P9nDQoPvecPfRcmGgNIGdwmRLrz34RdhQ7rP9
 8ZA+rjQWfmTrRtOC8Kf4fH56y6WXCCL7COkASANq/jFOCHfhUMmr2/iI2KCRqnQzQlpR
 jgmEpIe+oh9HNLQZ9hVPaFQvul8NVqevAmFBo+SLPgtEKwp5gIWgjKDiTJ+AtLyDIkw5
 cOV8PlkKWTfheRk48k3fWGqkqAPKahEghI9AgddXHurFGzkqmFJ73jTAYJ0Z4fmCIr11
 riFA==
X-Gm-Message-State: AGi0PubKfMj+1lpypxkOJU95nyYy3MtI88x1s026EmC3ATdDU76TUEzD
 DH0t0/jjpIVxF2GxqtMrBnKjb4II8/EQ3g==
X-Google-Smtp-Source: APiQypJCOwQYre1csdfZjks5z/cItwlYMt1/fMfFd4zrIlSTqX4Aw/xU0x4DxUPLoG/oQsCnZ2bQKw==
X-Received: by 2002:a65:4548:: with SMTP id x8mr19697985pgr.223.1587445609328; 
 Mon, 20 Apr 2020 22:06:49 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id p68sm1184780pfb.89.2020.04.20.22.06.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 22:06:48 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: linus.walleij@linaro.org, bgolaszewski@baylibre.com, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, narmstrong@baylibre.com,
 a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com,
 spanda@codeaurora.org
Subject: [PATCH v2 0/6] drm: Prepare to use a GPIO on ti-sn65dsi86 for Hot
 Plug Detect
Date: Mon, 20 Apr 2020 22:06:16 -0700
Message-Id: <20200421050622.8113-1-dianders@chromium.org>
X-Mailer: git-send-email 2.26.1.301.g55bc3eb7cb9-goog
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
Cc: robdclark@chromium.org, devicetree@vger.kernel.org, jernej.skrabec@siol.net,
 jeffrey.l.hugo@gmail.com, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, jonas@kwiboo.se,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, linux-gpio@vger.kernel.org,
 Andy Gross <agross@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, bjorn.andersson@linaro.org,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


As talked about in commit c2bfc223882d ("drm/bridge: ti-sn65dsi86:
Remove the mystery delay"), the normal HPD pin on ti-sn65dsi86 is
kinda useless, at least for embedded DisplayPort (eDP).  However,
despite the fact that the actual HPD pin on the bridge is mostly
useless for eDP, the concept of HPD for eDP still makes sense.  It
allows us to optimize out a hardcoded delay that many panels need if
HPD isn't hooked up.  Panel timing diagrams show HPD as one of the
events to measure timing from and we have to assume the worst case if
we can't actually read HPD.

One way to use HPD for eDP without using the mostly useless HPD pin on
ti-sn65dsi86 is to route the panel's HPD somewhere else in the system,
like to a GPIO.  This works great because eDP panels aren't physically
hotplugged.  That means the debouncing logic that caused us problems
wasn't really needed and a raw GPIO works great.

As per the above, a smart board designer would realize the value of
HPD and choose to route it to a GPIO somewhere on the board to avoid
the silly sn65dsi86 debouncing.  While said "smart designer" could
theoretically route HPD anywhere on the board, a really smart designer
would realize that there are several GPIOs on the bridge itself that
are nearly useless for anything but this purpose and route HPD to one
of those.

This series of patches is intended to allow the scenario described
above.

This patch has been tested on a board that is not yet mainline.  On
the hardware I have:
- Panel spec says HPD could take up to 200 ms to come up, so without
  HPD hooked up we need to delay 200 ms.
- On my board the panel is powered by the same rail as the
  touchscreen.  By chance of probe order the touchscreen comes up
  first.  This means by the time we check HPD in ti_sn_bridge_enable()
  it's already up.  Thus we can use the panel on 200 ms earlier.
- If I measure HPD on this pane it comes up ~56 ms after the panel is
  powered.  This means I can save 144 ms of delay.

Side effects (though not main goals) of this series are:
- ti-sn65dsi86 GPIOs are now exported in Linux.
- ti-sn65dsi86 bindings are converted to yaml.
- Common panel bindings now have "hpd-gpios" listed.
- The simple-panel driver in Linux can delay in prepare based on
  "hpd-gpios"
- ti-sn65dsi86 bindings (and current user) now specifies "no-hpd"
  if HPD isn't hooked up.

Changes in v2:
- ("Export...GPIOs") is 1/2 of replacement for ("Allow...bridge GPIOs")
- ("dt-bindings: display: Add hpd-gpios to panel-common...") new for v2
- ("simple...hpd-gpios") is 1/2 of replacement for ("Allow...bridge GPIOs")
- specification => specifier.
- power up => power.
- Added back missing suspend-gpios.
- data-lanes and lane-polarities are are the right place now.
- endpoints don't need to be patternProperties.
- Specified more details for data-lanes and lane-polarities.
- Added old example back in, fixing bugs in it.
- Example i2c bus is just called "i2c", not "i2c1" now.
- ("dt-bindings: drm/bridge: ti-sn65dsi86: Document no-hpd") new for v2.
- ("arm64: dts: sdm845: Add "no-hpd" to sn65dsi86 on cheza") new for v2.

Douglas Anderson (6):
  drm/bridge: ti-sn65dsi86: Export bridge GPIOs to Linux
  dt-bindings: display: Add hpd-gpios to panel-common bindings
  drm/panel-simple: Support hpd-gpios for delaying prepare()
  dt-bindings: drm/bridge: ti-sn65dsi86: Convert to yaml
  dt-bindings: drm/bridge: ti-sn65dsi86: Document no-hpd
  arm64: dts: sdm845: Add "no-hpd" to sn65dsi86 on cheza

 .../bindings/display/bridge/ti,sn65dsi86.txt  |  87 ------
 .../bindings/display/bridge/ti,sn65dsi86.yaml | 285 ++++++++++++++++++
 .../bindings/display/panel/panel-common.yaml  |   6 +
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi    |   2 +
 drivers/gpu/drm/bridge/ti-sn65dsi86.c         | 165 ++++++++++
 drivers/gpu/drm/panel/panel-simple.c          |  53 ++++
 6 files changed, 511 insertions(+), 87 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.txt
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml

-- 
2.26.1.301.g55bc3eb7cb9-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
