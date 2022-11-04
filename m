Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D70618EA9
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 04:17:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B656A10E048;
	Fri,  4 Nov 2022 03:16:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A53B410E048
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 03:16:47 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id l2so3708532pld.13
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Nov 2022 20:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ErMeJ3/N/lU6gG8CjwNQFs+A5aKgySMTRdfeG+Egqbs=;
 b=FEEJPlJPYUREMw1w2MxcaST1IyKa4MxHkgJeNeJjaWJYeeR6EjTODo7oAewdL0XeTB
 Uua2msSMqdLnBrfyRjTvNgXs0ypyw+ER2IsjAjzO2ToH4haL8BRiABXkWaQ9JscT2WiY
 LyIPycSrKkzkqTCiESZooUV9bA5jZi1UwScPN5li75jEEiX9JjGmvnfDnUAAjyhyfYh5
 065dIWklhOj8YdJKq+f+4D2gumQnCgz/7i0IaOTvS/C9f66vNmcLmnOPl2pupQFEbGnN
 VgaDHIhuOrK+pHJVP0L4vgp18rIDr74fv2IrRbumn/ZLH5jk70OEf52YGFZmg2Zp9cVt
 NCYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ErMeJ3/N/lU6gG8CjwNQFs+A5aKgySMTRdfeG+Egqbs=;
 b=n6NJtu9V8u2IofbG4q4Eg5IR6zpdTDR6WT4IoNCuyQ6x/dGGMzNBjVd/hGQsRmCvPv
 pq4SZb3SHeBqCGBKRcwrkQU/DlwNJ3fjXYGncIWvjZ5c3iZRvRKJWdW+AKdNb1nFkmJ2
 BsRIGa748hmmYWRFLAXRWCaKaxa+OTb9t7H59yN4W7fLHoFxJKj7O/1pZjF7AICzLJ68
 rfacyX3VCefnRivD9CAbiTcDYAavRl01bN0HVTBfVTIiE1zL0Ue8CLWWaGPlPa6K4xJO
 XkXd2cKnsU2TR6iE43JAFTJpFf26Rgvns3QrL8C0vltc7fFYH3QdhwPhcOPrCaNkj9tl
 nNAQ==
X-Gm-Message-State: ACrzQf15ddD9VgRxlUvu/tdaRQBlVCXpY8K4iDBG0AGH+WIpyD8T94uk
 y2q/7pqKUMXCWbJPplnTBpk=
X-Google-Smtp-Source: AMsMyM7vh79PCyZMFQuT/KKZHGeAwlNjaPyLoj7VC+4pfmidI1y+REGGVZVpsmuRn0q/HdqDtozZWw==
X-Received: by 2002:a17:902:d3cc:b0:186:9720:b19b with SMTP id
 w12-20020a170902d3cc00b001869720b19bmr33182884plb.3.1667531806883; 
 Thu, 03 Nov 2022 20:16:46 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com
 ([2620:15c:9d:2:a6ae:11ff:fe11:fcc3])
 by smtp.gmail.com with ESMTPSA id
 s3-20020a63ff43000000b004702eca61fcsm1078655pgk.36.2022.11.03.20.16.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 20:16:46 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Helge Deller <deller@gmx.de>, Tony Lindgren <tony@atomide.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Sebastian Reichel <sre@kernel.org>
Subject: [PATCH RESEND 00/13] Convert omapfb drivers to gpiod API
Date: Thu,  3 Nov 2022 20:16:29 -0700
Message-Id: <20221103-omapfb-gpiod-v1-0-cba1fae5a77c@gmail.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.11.0-dev-28747
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
