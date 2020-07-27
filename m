Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0B322F5F8
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jul 2020 19:03:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44A7C89BB0;
	Mon, 27 Jul 2020 17:03:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA93F89BB0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 17:03:28 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id s16so2829576ljc.8
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 10:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=htSFUqN6UimOHy2csnaQnqeDS+fy2OI9eu5jPZZkfAQ=;
 b=Kl2rNhitNJsaApeIB8ps9cBmSj/0G0aGLIbtqg+aoDD4zAEBZQ0KxauO/zRqur26VE
 d2Yz/tuqTpOilSUV0sA6hxS3T3+W+rjsnOIsfPyft745BpUJ/j1GirTTo5UptAUd3CLd
 wg9Z4tSj+k6POBltaK1o3VC+SJL2IJh6CCjs6wfMWVlAzwe2hm6iTRLk5HdDkI1Rvb5E
 ZO7XsQraaUQk3x3SADo5Cp4uVrhwG/OK4HClVPxemwu5tyDp01W+Rl2OdsT3uWt0PpbJ
 OWF0BBhklI4zNg6dYQqqbw7zsvOmlVRyMvjQohVPew48bhPDXFPvMOCB8mXk08DqADMz
 M4OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=htSFUqN6UimOHy2csnaQnqeDS+fy2OI9eu5jPZZkfAQ=;
 b=Uu8SjJWLRkSN/PfBNfOhdDicbTT1rqOL/kv6XcjLX0N7GfUoyfqb55wBzFDDYsR/lt
 Dkp2T75HoTdViwDRRU9atlM1jKdIvI85sDYWowGs/n2b2zujIz+v76vySgELSvOpZMs0
 zUkhDxgAAFwoFjbE17rDNoUw0uj0UxbNWsIVS7D2B7X2QK7Pc/sBZ75SdmkFbUa0xu0I
 1B/GPYEj0CDg6y17xrgtSxjGlxl1eo3JLdJ8gmm7P/BmDYUHH6lTK7H+BZ4ApdgavRm/
 btqZhcUHbheCwBodznEAGjgfN7ppHM2lJrYUh51K6BCZm2Hw272tKg0iLNlgrHlGYS7L
 arGA==
X-Gm-Message-State: AOAM533fPyaOqRq67pwZl6OwNsDQ7ZUURfi/XQuF91lXH5zMh7PAJTMO
 8m7tBYkYX9kfttGmepSQHwFQR+2b5Qc=
X-Google-Smtp-Source: ABdhPJwFC+C+s4IZ3uRaUKOFqo90Pf2zAoOusw38vtZ3WNxaErzUEHsnCydMrCjdVXVo52w50qeLHg==
X-Received: by 2002:a05:651c:115:: with SMTP id
 a21mr1802145ljb.315.1595869406852; 
 Mon, 27 Jul 2020 10:03:26 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:a56d:c972:788a:ba53])
 by smtp.gmail.com with ESMTPSA id l3sm1417470lji.115.2020.07.27.10.03.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 10:03:26 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v5 0/5] drm/bridge: Update tc358767 and nxp-ptn3460 to support
 chained bridges
Date: Mon, 27 Jul 2020 19:03:15 +0200
Message-Id: <20200727170320.959777-1-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
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
Cc: Andrzej Hajda <a.hajda@samsung.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jonas Karlman <jonas@kwiboo.se>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch-set aims to make connector creation optional
and prepare the bridge drivers for use in a chained setup.

The objective is that all bridge drivers shall support a chained setup
connector creation is moved to the display drivers.
This is just one step on this path.

The general approach for the bridge drivers:
- Introduce bridge operations
- Introduce use of panel bridge and make connector creation optional

v5:
  - Applied reviewed patches, so we went from 15 to 5
  - Fixed bug in connector creation in both drivers

v4:
  - Dropped patch for ti-sn65dsi86. Await full conversion
  - Dropped patch for ti-tpd12s015. It was wrong (Laurent)
  - Drop boe,hv070wsa-100 patch, it was applied
  - Combined a few patches to fix connector created twice (Laurent)
  - Fix memory leak in get_edid (Laurent)
  - Added patch to validate panel descriptions in panel-simple
  - Set bridge.type in relevant drivers
 
v3:
  - Rebase on top of drm-misc-next
  - Address kbuild test robot feedback
 
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

Patches can build but no run-time testing.
So both test and review feedback appreciated!

	Sam


Sam Ravnborg (5):
      drm/bridge: tc358767: add detect bridge operation
      drm/bridge: tc358767: add get_edid bridge operation
      drm/bridge: tc358767: add drm_panel_bridge support
      drm/bridge: nxp-ptn3460: add get_edid bridge operation
      drm/bridge: nxp-ptn3460: add drm_panel_bridge support

 drivers/gpu/drm/bridge/nxp-ptn3460.c | 103 +++++++++++++---------------
 drivers/gpu/drm/bridge/tc358767.c    | 126 +++++++++++++++++++----------------
 2 files changed, 114 insertions(+), 115 deletions(-)


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
