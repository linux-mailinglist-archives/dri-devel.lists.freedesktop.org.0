Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4E68C05E0
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 22:53:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78D3F10E641;
	Wed,  8 May 2024 20:53:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="VPnCR5XX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FE2E10E641
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 20:53:15 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-2ac9b225a91so178600a91.2
 for <dri-devel@lists.freedesktop.org>; Wed, 08 May 2024 13:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1715201594; x=1715806394;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YqkxFBwBCIjXspjTXUzXTZ3b9F2ADVTFncXrWGlr3RY=;
 b=VPnCR5XXMsew9QNo+s3DI45EAro/vsvLNV4Jn3esU7nUgmpdniJ+2YzxIjE8M9bTCK
 QHSZK9OPLrV6yzsBT1HmxanUw7q4AwzxNZqOAI6zjZJ/H1M5tyjPL3zrfgmgnMms5UO/
 w9LwNtSVldZkh9ZkNi1VB7sD1u9mhY8cW1G1U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715201594; x=1715806394;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YqkxFBwBCIjXspjTXUzXTZ3b9F2ADVTFncXrWGlr3RY=;
 b=CC9ZhC4BCPMrCeH4NcLPM8SyB2LiDqbo41Z+fdBgYygGGWyNBSibCgJaFjk61Uo0q2
 QVawEZibQg5tuu1+05VLSXQA4BYRV0oeHONvOvGts3ccBCa/aUvb6d5nBdg7HPT5xWMg
 YLoM7wtJjf+rGmdyD2zcJXkR11XZDKf8vr5qNW/l/MNVeTqcUUHX2P4DE6jtud+Rm2Qm
 E4rVSsSgilLIZv06nsS4DXUOtUxnc493ve6I619J8t3VUfpW3NyNii7/g3dGUoW01jAN
 c2ELlB0St/Wni1TGXGW3vZnCWokpk4q4rGmtzURxmiUucD9aFQXkLlsjyiQDkf5aoR1d
 GwwA==
X-Gm-Message-State: AOJu0Yw8Ws1Wvwfd3dcQO+99hu1E+82SQQaUwrqXn1/O0gNbAL1yk5Kx
 e3Nb+vsZBU9AFM1y0mUD57EN1Is29nnZNJZC41OSzSVfqlQ1Zl5fCoCd1q5Ixge36S+1gia5RLs
 =
X-Google-Smtp-Source: AGHT+IGiUf19nbv8mVQARWFwlILcfxotMoUSFRx1h7bsJtjkb0vbvYocGef5+88IYl9SHmfxsT4U6w==
X-Received: by 2002:a17:90b:603:b0:2ac:5a93:636b with SMTP id
 98e67ed59e1d1-2b61649d74amr3509508a91.2.1715201593783; 
 Wed, 08 May 2024 13:53:13 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:40f4:feca:59e0:d3ca])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2b67126ad51sm6887a91.25.2024.05.08.13.53.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 May 2024 13:53:13 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Cc: lvzhaoxiong@huaqin.corp-partner.google.com,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Hsin-Yi Wang <hsinyi@google.com>, Linus Walleij <linus.walleij@linaro.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Joel Selvaraj <jo@jsfamily.in>, Brian Norris <briannorris@chromium.org>,
 Douglas Anderson <dianders@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/9] drm/mipi-dsi: Reduce bloat and add funcs for cleaner
 init seqs
Date: Wed,  8 May 2024 13:51:42 -0700
Message-ID: <20240508205222.2251854-1-dianders@chromium.org>
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The consensus of many DRM folks is that we want to move away from DSI
drivers defining tables of init commands. Instead, we want to move to
init functions that can use common DRM functions. The issue thus far
has been that using the macros mipi_dsi_generic_write_seq() and
mipi_dsi_dcs_write_seq() bloats the driver using them.

While trying to solve bloat, we realized that the majority of the it
was easy to solve. This series solves the bloat for existing drivers
by moving the printout outside of the macro.

During discussion of my v1 patch to fix the bloat [1], we also decided
that we really want to change the way that drivers deal with init
sequences to make it clearer. In addition to being cleaner, a side
effect of moving drivers to the new style reduces bloat _even more_.

This series also contains a few minor fixes / cleanups that I found
along the way.

This series converts four drivers over to the new
mipi_dsi_dcs_write_seq_multi() function. Not all conversions have been
tested, but hopefully they are straightforward enough. I'd appreciate
testing.

NOTE: In v3 I tried to incorporate the feedback from v2. I also
converted the other two panels I could find that used table-based
initialization.

v4 just has a tiny bugfix and collects tags. Assuming no other
problems are found the plan is to land this series sometime roughly
around May 16 [2]. Note that unless I get a review/Ack for the patch
("drm/panel: novatek-nt36672e: Switch to
mipi_dsi_dcs_write_seq_multi()") then I'll land the series without
that patch.

[1] https://lore.kernel.org/r/20240424172017.1.Id15fae80582bc74a0d4f1338987fa375738f45b9@changeid
[2] https://lore.kernel.org/r/35b899d2-fb47-403a-83d2-204c0800d496@linaro.org

Changes in v4:
- Test to see if init is non-NULL before using it.
- Update wording as per Linus W.

Changes in v3:
- ("mipi_dsi_*_write functions don't need to ratelimit...") moved earlier.
- Add a TODO item for cleaning up the deprecated macros/functions.
- Fix spacing of init function.
- Inline kerneldoc comments for struct mipi_dsi_multi_context.
- Rebased upon patch to remove ratelimit of prints.
- Remove an unneeded error print.
- Squash boe-tv101wum-nl6 lowercase patch into main patch
- Use %zd in print instead of casting errors to int.
- drm/panel: ili9882t: Don't use a table for initting panels
- drm/panel: innolux-p079zca: Don't use a table for initting panels

Changes in v2:
- Add some comments to the macros about printing and returning.
- Change the way err value is handled in prep for next patch.
- Modify commit message now that this is part of a series.
- Rebased upon patches to avoid theoretical int overflow.
- drm/mipi-dsi: Fix theoretical int overflow in mipi_dsi_dcs_write_seq()
- drm/mipi-dsi: Fix theoretical int overflow in mipi_dsi_generic_write_seq()
- drm/mipi-dsi: Introduce mipi_dsi_*_write_seq_multi()
- drm/mipi-dsi: mipi_dsi_*_write functions don't need to ratelimit prints
- drm/panel: boe-tv101wum-nl6: Convert hex to lowercase
- drm/panel: boe-tv101wum-nl6: Don't use a table for initting commands
- drm/panel: novatek-nt36672e: Switch to mipi_dsi_dcs_write_seq_multi()

Douglas Anderson (9):
  drm/mipi-dsi: Fix theoretical int overflow in mipi_dsi_dcs_write_seq()
  drm/mipi-dsi: Fix theoretical int overflow in
    mipi_dsi_generic_write_seq()
  drm/mipi-dsi: mipi_dsi_*_write functions don't need to ratelimit
    prints
  drm/mipi-dsi: Reduce driver bloat of mipi_dsi_*_write_seq()
  drm/mipi-dsi: Introduce mipi_dsi_*_write_seq_multi()
  drm/panel: novatek-nt36672e: Switch to mipi_dsi_dcs_write_seq_multi()
  drm/panel: boe-tv101wum-nl6: Don't use a table for initting panels
  drm/panel: ili9882t: Don't use a table for initting panels
  drm/panel: innolux-p079zca: Don't use a table for initting panels

 Documentation/gpu/todo.rst                    |   18 +
 drivers/gpu/drm/drm_mipi_dsi.c                |  112 +
 .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 2792 +++++++++--------
 drivers/gpu/drm/panel/panel-ilitek-ili9882t.c |  794 +++--
 drivers/gpu/drm/panel/panel-innolux-p079zca.c |  284 +-
 .../gpu/drm/panel/panel-novatek-nt36672e.c    |  576 ++--
 include/drm/drm_mipi_dsi.h                    |  101 +-
 7 files changed, 2452 insertions(+), 2225 deletions(-)

-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

