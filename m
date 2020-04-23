Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE451B60C0
	for <lists+dri-devel@lfdr.de>; Thu, 23 Apr 2020 18:26:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FB7E6E93C;
	Thu, 23 Apr 2020 16:26:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A2366E93C
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 16:26:11 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id p8so3136568pgi.5
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 09:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4dPW9lg0yEN6UpDTKstylSuvl3OH/2pBPj9LaxkywyA=;
 b=G8lOVeP0qxvOsyFHiAAWlAcfYFdO3DFRD0auCPHDOmN+3bjo+IGRmeQgbYIwjCdk+t
 vMLhHo8Fg8Hh5z1SVY+do5Vkly0bRcLVJoLkW8SlLPrQD4KpbuSnqSfJGTX76Xdz5MFE
 RTVGUgnoa97/Vnz+e3+757gFQK3WH57ovzkOQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4dPW9lg0yEN6UpDTKstylSuvl3OH/2pBPj9LaxkywyA=;
 b=M16BW8DWWVJ1Yzi/LblYkvimvBt3huPU/XLZEhhYZwEmEL6ME2UUCRxliYnAqlOi3R
 5VPn8nvDeNV8RA++dc5hT3ocNLQEBiLHNQZMNjF1PY+N/daSA25I9NMwTfoXK5raFZlM
 Jjf3AUlJmkVC8PueCDW3a5+AhzzGRRmodJImF4C0hwZrg1NSWmGOd3pFbj3Mu1a1azRU
 AYV0yOCQj6Qr2lPH0Ta3ZT2QdtbCQbEDxV+lSIAXTVHBXWBq/+e+J4hQzGeT61o0hzs6
 oTtf39BfMGpjFIChD8wcJLXAhJhlTcutE2OsL7L6yFamvD5CzDC0vps3+d7NT4c6FDp3
 Mjzw==
X-Gm-Message-State: AGi0PuZooatike2dcYggR4zxcjO7Y556qZMJEf/oIYuz4eHRC6C5Rgpk
 sIGzwwFizY7tnYMrMZWeQolOdA==
X-Google-Smtp-Source: APiQypJdiYDUHi+oU12ax0Gqxa3QS23u1ChWBrvQSZw3vTUsJak7uOfgLrTMHq4j4e1RNVV3QevUBw==
X-Received: by 2002:aa7:8a9a:: with SMTP id a26mr4225683pfc.77.1587659170761; 
 Thu, 23 Apr 2020 09:26:10 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id d12sm2841927pfq.36.2020.04.23.09.26.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2020 09:26:10 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: linus.walleij@linaro.org, bgolaszewski@baylibre.com, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, narmstrong@baylibre.com,
 a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com,
 spanda@codeaurora.org
Subject: [PATCH v3 0/6] drm: Prepare to use a GPIO on ti-sn65dsi86 for Hot
 Plug Detect
Date: Thu, 23 Apr 2020 09:25:42 -0700
Message-Id: <20200423162548.129661-1-dianders@chromium.org>
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

Changes in v3:
- Becaue => Because
- Add a kernel-doc to our pdata to clarify double-duty of gchip_output.
- More comments about how powering off affects us (get_dir, dir_input).
- Cleanup tail of ti_sn_setup_gpio_controller() to avoid one "return".
- Use a bitmap rather than rolling my own.
- Remind how gpio_get_optional() works in the commit message.
- useful implement => useful to implement

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
 drivers/gpu/drm/bridge/ti-sn65dsi86.c         | 194 ++++++++++++
 drivers/gpu/drm/panel/panel-simple.c          |  53 ++++
 6 files changed, 540 insertions(+), 87 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.txt
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml

-- 
2.26.1.301.g55bc3eb7cb9-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
