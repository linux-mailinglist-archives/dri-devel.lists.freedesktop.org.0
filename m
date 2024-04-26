Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6AB48B42E7
	for <lists+dri-devel@lfdr.de>; Sat, 27 Apr 2024 01:59:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 978501125BC;
	Fri, 26 Apr 2024 23:59:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="S337E3CL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BDF71125BC
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 23:59:06 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-2ac9b225a91so2214279a91.2
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 16:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714175945; x=1714780745;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Yc634Lsr5zy7OBNgM+b6Aa7FawMZtK0nOD2hPnKDBP4=;
 b=S337E3CLRdiDZyr8PG8C9D4lalbwSy4l+9peyfuxr7RTxrakhPmzipWk4UmpgWQTN8
 1Hp/9VaB9SF5q5fly8UZkXhAHOZaTJU2G3MIYgBTDM0qHangkvlLQqpoHgtnauJKKmDx
 b8rJdE1m2bVJLGphX9/FGpatu8DovWHOPrWow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714175945; x=1714780745;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Yc634Lsr5zy7OBNgM+b6Aa7FawMZtK0nOD2hPnKDBP4=;
 b=Ic3uAlW72OGkmSjk+fhyTa/BwQlsp1Q7XrRnywsb1f0Dug7cuRZgUFQZmKn2CNzUin
 7NXFPIazRdNi7CzgiQd71ndGIyatoOAOYzAYoH1khM9LkC3vdXuGrV01LqW8VsrvqQpS
 u7o0QyQM6vS0YG6z3VT1iTxsnatFbD3fE+V6sh2sPneZs+r8581CBA/+eXCWpm6cXqJ3
 B36NBzZRCcXj6sieJqoFre1Ur8kgHjcqIL3BVUzzdL1rorPikYy+jmpMTkQuCcRkb/HY
 yF92tkN+OS0ufyegGaLaqTV4jOqDRaGmnszXRsK16r/pLSs3LYT9YlEkvFpkKAERLyy1
 A9Ow==
X-Gm-Message-State: AOJu0YxI/TUYJs10WFIk+5bqlDllY9ZAYjUPyaRigNwjNhXFDbWmpeLn
 7NllWqr+sECJTx7xFaFuWckfC4fyuhjZ5uPQQhjlYYwp4HXUvvH8PSqg3h+lA2S6HkYY2eCdCpc
 =
X-Google-Smtp-Source: AGHT+IHzJzJN3xlTGk8hjnbAWYC94QGCUpvG6+ZlC09viFKBb+fw1JAGzZID/Y8klH2Ko2GN72HH0w==
X-Received: by 2002:a17:90a:de17:b0:2a2:5e65:f434 with SMTP id
 m23-20020a17090ade1700b002a25e65f434mr3926650pjv.16.1714175944753; 
 Fri, 26 Apr 2024 16:59:04 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:fca:3ae2:20e6:82bb])
 by smtp.gmail.com with ESMTPSA id
 n4-20020a17090aab8400b002af41bd563esm5111939pjq.33.2024.04.26.16.59.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Apr 2024 16:59:04 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
 lvzhaoxiong@huaqin.corp-partner.google.com,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Hsin-Yi Wang <hsinyi@google.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Joel Selvaraj <jo@jsfamily.in>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 Sam Ravnborg <sam@ravnborg.org>, Douglas Anderson <dianders@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/8] drm/mipi-dsi: Reduce bloat and add funcs for cleaner
 init seqs
Date: Fri, 26 Apr 2024 16:58:33 -0700
Message-ID: <20240426235857.3870424-1-dianders@chromium.org>
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
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

This series converts two drivers over to the new
mipi_dsi_dcs_write_seq_multi() function. I don't have any hardware
that uses the mipi_dsi_generic_write_seq() function to test with, so I
haven't converted anything over to use that. The conversions are
straightforward but I'd appreciate testing.

[1] https://lore.kernel.org/r/20240424172017.1.Id15fae80582bc74a0d4f1338987fa375738f45b9@changeid

Changes in v2:
- drm/mipi-dsi: Fix theoretical int overflow in mipi_dsi_dcs_write_seq()
- drm/mipi-dsi: Fix theoretical int overflow in mipi_dsi_generic_write_seq()
- Add some comments to the macros about printing and returning.
- Modify commit message now that this is part of a series.
- Change the way err value is handled in prep for next patch.
- Rebased upon patches to avoid theoretical int overflow.
- drm/mipi-dsi: Introduce mipi_dsi_*_write_seq_multi()
- drm/mipi-dsi: mipi_dsi_*_write functions don't need to ratelimit prints
- drm/panel: novatek-nt36672e: Switch to mipi_dsi_dcs_write_seq_multi()
- drm/panel: boe-tv101wum-nl6: Don't use a table for initting commands
- drm/panel: boe-tv101wum-nl6: Convert hex to lowercase

Douglas Anderson (8):
  drm/mipi-dsi: Fix theoretical int overflow in mipi_dsi_dcs_write_seq()
  drm/mipi-dsi: Fix theoretical int overflow in
    mipi_dsi_generic_write_seq()
  drm/mipi-dsi: Reduce driver bloat of mipi_dsi_*_write_seq()
  drm/mipi-dsi: Introduce mipi_dsi_*_write_seq_multi()
  drm/mipi-dsi: mipi_dsi_*_write functions don't need to ratelimit
    prints
  drm/panel: novatek-nt36672e: Switch to mipi_dsi_dcs_write_seq_multi()
  drm/panel: boe-tv101wum-nl6: Don't use a table for initting commands
  drm/panel: boe-tv101wum-nl6: Convert hex to lowercase

 drivers/gpu/drm/drm_mipi_dsi.c                |  112 +
 .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 2712 +++++++++--------
 .../gpu/drm/panel/panel-novatek-nt36672e.c    |  524 ++--
 include/drm/drm_mipi_dsi.h                    |   96 +-
 4 files changed, 1818 insertions(+), 1626 deletions(-)

-- 
2.44.0.769.g3c40516874-goog

