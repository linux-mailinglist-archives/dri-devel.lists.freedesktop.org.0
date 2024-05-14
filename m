Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B858C5A32
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2024 19:22:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFD3F10E03A;
	Tue, 14 May 2024 17:21:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="ZpHxPiRU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FE2710E03A
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2024 17:21:54 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id
 41be03b00d2f7-5d8b887bb0cso4727894a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2024 10:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1715707313; x=1716312113;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ssdyg8CCGX3LIJke97/Daf2m8VAxcmXAY7Al2Agin+M=;
 b=ZpHxPiRUWFOui0I0HsVuF03pGYKATG1n1x9nasI5D2HErVRGp4ceBL+8a/vUN31ic6
 CPT00ZZCouGmUYx9xY1Clvjcg44aU9zrCxlcQrI8GSY+XsD0BnBQhqqimcooQOiMAzej
 7EsUk3CMJk2DU5lbu3fUH44ERG9loa0qcNe2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715707313; x=1716312113;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ssdyg8CCGX3LIJke97/Daf2m8VAxcmXAY7Al2Agin+M=;
 b=EfbZj/kJLCz2tCqFgt/NxkC6mSJEb2sV2qofGt0rrpmTx3laMlyr2Cmy7v6NYJAoeB
 o81QvTRq2fRA7/ic8lKPyYIhiw7/B9alPtdwXoYTys8aj1ABhdEqcQntVCx66IDo3l9x
 Y2d9InYDXLt7qCsVscR139ve9ikxvpOKYudwf8f4tijxuZkI7j7Lg0gi17rNKwY6EXV7
 t/7E5CU9hVU78vtDxhMl/Nq15UAVoJnwxupCnzBSZeAvs33ZBZuW4lNZbug6hY1izO2I
 5zT66e1wcnQ58mjalB4nwClqtZo3XtYqRlExfGFKi4o591lLTZY0/fJE3hBELoVw2TqC
 H/dg==
X-Gm-Message-State: AOJu0Yz8RikQMB62h+BAZGVzeUD0qlhhblGPRjSL+AG2nNChKtee5GMb
 xXVWflKWhUEaJRgWVdGjtUJkhLcCvoD8RpOdycguJssYwoBnh+4a4Sa+VQgBj/T1hSJ48P99Egs
 =
X-Google-Smtp-Source: AGHT+IEdkNHfIF4J+VOvPXSXkd1kac81F8OYFYQWIaEBgRlg2k0P2Wfxxy1Qni+Ukv55u3HtLQE+5Q==
X-Received: by 2002:a17:90a:4c84:b0:2b6:3034:4ae6 with SMTP id
 98e67ed59e1d1-2b6ccd93d4dmr14814191a91.33.1715707313086; 
 Tue, 14 May 2024 10:21:53 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:ef10:6fdf:5041:421f])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ef0bf3101csm100147575ad.121.2024.05.14.10.21.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 May 2024 10:21:52 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 lvzhaoxiong@huaqin.corp-partner.google.com,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Brian Norris <briannorris@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maxime Ripard <mripard@kernel.org>, Joel Selvaraj <jo@jsfamily.in>,
 Hsin-Yi Wang <hsinyi@google.com>,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Douglas Anderson <dianders@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/9] drm/mipi-dsi: Reduce bloat and add funcs for cleaner
 init seqs
Date: Tue, 14 May 2024 10:20:50 -0700
Message-ID: <20240514172136.1578498-1-dianders@chromium.org>
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

v4 just has a tiny bugfix and collects tags. v5 has another tiny
bugfix. Assuming no other problems are found the plan is to land this
series sometime roughly around May 16 [2].

[1] https://lore.kernel.org/r/20240424172017.1.Id15fae80582bc74a0d4f1338987fa375738f45b9@changeid
[2] https://lore.kernel.org/r/35b899d2-fb47-403a-83d2-204c0800d496@linaro.org

Changes in v5:
- Fix comment dev_err_ratelimited() => dev_err().

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

