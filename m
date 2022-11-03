Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D3F618BCE
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 23:47:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B456110E660;
	Thu,  3 Nov 2022 22:47:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F06410E64E
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Nov 2022 22:47:02 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id o7so3021870pjj.1
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Nov 2022 15:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=r0/NL8UAcocVV5ehp/plcYGqKjt4DMIirOXHBCu5MlQ=;
 b=G0/bQToU7tPN8mLGPnPkz6Ur7I2LMjiUMq0+UpOLlSN9bl0h2iIDUESYHeMy0nnW34
 EHjKfNL7gK4yBvrAfnWRU6y2KunueO6e64i9Ukolxq8ez8e7FenMg4ZeDW7WyWZSj/Ym
 pU3IT0XvDhmkWPll03bsxr5lEEdxcNgl7bxEUlv0p+c745ZfZ6gPjTLcGwWK9hag7TK6
 Nx9OXjeTdNZ174FUQ8R5mtgPoJgWsBYdx0Vz3AEW0rMtPZNvUbtWC04q0LgpaqmS3zeI
 ZcZDUyXax9BzfR7IuugEUkZ8Z75X13iSMOeCn+JGVop66UHhwaKRT54vI0l/ndW1NNdO
 dgvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r0/NL8UAcocVV5ehp/plcYGqKjt4DMIirOXHBCu5MlQ=;
 b=hSgEc+tDQ4Ac40YETnJr3YT85Jr/MXaU3T7xogOoSREaPTjFM7uzk67QKv5fpAIltU
 xw/ZMLIwQDV1kjgf0IzWDTte60rwMuM0W8B776JIV6FxdqS9xIU9fySVfjArC4B1nXSl
 Tl/4P1mw53f0FYBB+rsPoHPw0idgu8e6NN+lvI3TkCZd2RcOTqWrA8sg9q7ks6dC24Nc
 Gr0NwReL3/4oMA9eu5jgkpYadb8gYpwnB6bbx9TcCbb0v0aNNlch0OxAGsts33xKF7hZ
 8R1PkzW0+fHN8GJ+RUYQ+6eN7cSy8SPr4tfxr0JA1jCWELcnRuM0O7MR0MBAc8dbTGe0
 ocww==
X-Gm-Message-State: ACrzQf0UAs+no1r3nso1LUokCOwYk/YYrmM1MjQTWE0Tb8giO1gIqTTZ
 wQ+Zbk844F4dUhCIPFeh2Wg=
X-Google-Smtp-Source: AMsMyM4Oa4HbEfbZNjCJqoJpiijPlXGyFGhnNO0rP23WjhKll5VMKaNJJknY32yyG1fCc7i4wCm/aQ==
X-Received: by 2002:a17:902:e54a:b0:186:a3ba:232a with SMTP id
 n10-20020a170902e54a00b00186a3ba232amr32022870plf.77.1667515621647; 
 Thu, 03 Nov 2022 15:47:01 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com
 ([2620:15c:9d:2:a6ae:11ff:fe11:fcc3])
 by smtp.gmail.com with ESMTPSA id
 g13-20020aa796ad000000b0056be1d7d4a3sm1280421pfk.73.2022.11.03.15.47.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 15:47:00 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Helge Deller <deller@gmx.de>, Tony Lindgren <tony@atomide.com>,
 Sebastian Reichel <sre@kernel.org>
Subject: [PATCH 00/13] Convert omapfb drivers to gpiod API
Date: Thu,  3 Nov 2022 15:46:35 -0700
Message-Id: <20221103-omapfb-gpiod-v1-0-c3d53ca7988f@gmail.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.11.0-dev-5166b
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series converts various OMAPFB drivers to use the newer gpiod API=0D
that respects line polarity specified in DTS.=0D
=0D
Unfortunately existing DTS files specify incorrect (active high) polarity=0D
for reset lines. As discussed in [1] we will not try to correct existing=0D
DTSes, but instead follow the path established by DRM drivers for the same=
=0D
components, and continue using inverted polarity in the FB drivers.=0D
=0D
[1] https://lore.kernel.org/all/20221004213503.848262-1-dmitry.torokhov@gma=
il.com/=0D
=0D
To: Helge Deller <deller@gmx.de>=0D
To: Tony Lindgren <tony@atomide.com>=0D
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>=0D
To: Sebastian Reichel <sre@kernel.org>=0D
Cc: linux-omap@vger.kernel.org=0D
Cc: linux-fbdev@vger.kernel.org=0D
Cc: dri-devel@lists.freedesktop.org=0D
Cc: linux-kernel@vger.kernel.org=0D
=0D
---=0D
Dmitry Torokhov (13):=0D
      omapfb: connector-hdmi: switch to using gpiod API=0D
      omapfb: panel-sony-acx565akm: remove support for platform data=0D
      omapfb: panel-sony-acx565akm: switch to using gpiod API=0D
      omapfb: encoder-tfp410: switch to using gpiod API=0D
      omapfb: panel-dsi-cm: switch to using gpiod API=0D
      omapfb: panel-tpo-td043mtea1: switch to using gpiod API=0D
      omapfb: panel-nec-nl8048hl11: switch to using gpiod API=0D
      omapfb: panel-dpi: remove support for platform data=0D
      omapfb: connector-analog-tv: remove support for platform data=0D
      omapfb: encoder-opa362: fix included headers=0D
      omapfb: panel-lgphilips-lb035q02: remove backlight GPIO handling=0D
      omapfb: panel-tpo-td028ttec1: stop including gpio.h=0D
      omapfb: panel-sharp-ls037v7dw01: fix included headers=0D
=0D
 .../omap2/omapfb/displays/connector-analog-tv.c    |  60 ++---------=0D
 .../fbdev/omap2/omapfb/displays/connector-hdmi.c   |  49 +++------=0D
 .../fbdev/omap2/omapfb/displays/encoder-opa362.c   |   4 +-=0D
 .../fbdev/omap2/omapfb/displays/encoder-tfp410.c   |  67 ++++--------=0D
 .../video/fbdev/omap2/omapfb/displays/panel-dpi.c  |  83 ++-------------=0D
 .../fbdev/omap2/omapfb/displays/panel-dsi-cm.c     | 116 ++++++++---------=
----=0D
 .../omapfb/displays/panel-lgphilips-lb035q02.c     |  21 +---=0D
 .../omap2/omapfb/displays/panel-nec-nl8048hl11.c   |  72 ++++---------=0D
 .../omapfb/displays/panel-sharp-ls037v7dw01.c      |   3 +-=0D
 .../omap2/omapfb/displays/panel-sony-acx565akm.c   | 105 ++++++-----------=
--=0D
 .../omap2/omapfb/displays/panel-tpo-td028ttec1.c   |   1 -=0D
 .../omap2/omapfb/displays/panel-tpo-td043mtea1.c   |  59 +++--------=0D
 include/video/omap-panel-data.h                    |  71 -------------=0D
 13 files changed, 170 insertions(+), 541 deletions(-)=0D
---=0D
base-commit: 61c3426aca2c71052ddcd06c32e29d92304990fd=0D
change-id: 20221103-omapfb-gpiod-87ca2550bd90=0D
=0D
-- =0D
Dmitry=0D
=0D
