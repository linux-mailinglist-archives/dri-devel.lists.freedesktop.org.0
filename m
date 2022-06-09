Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E71A55444C1
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 09:27:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 732D610F927;
	Thu,  9 Jun 2022 07:27:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D4AB10FA97
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 07:27:36 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 w13-20020a17090a780d00b001e8961b355dso8753418pjk.5
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jun 2022 00:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1na78G+WYnf+bDU7BFeNQ72mHl3X9VY6UTeZz/scWws=;
 b=dxaeejukIjJiySX01gLIqKev5aQJJwNLrHV58fbo4DG9P6QF2p6Kji3n6hUcepaFLA
 usWl2HCL75kVDDyV2zNZwWPqAYwPV8uLnruCzinCg8fmJi0T+UlkAxbpspPelswch61n
 0FpgmZpv8zr9gt9LWaxwPY3/gnF2ll4Wy5y74=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1na78G+WYnf+bDU7BFeNQ72mHl3X9VY6UTeZz/scWws=;
 b=grSgZd4eIe08ReV490ITnrOri8EeAvX9wFBUiuyDupVZmpHjDhhjhSg3FFKjQCobnL
 iNaTOp2yZU8t7fRqXZ9OgdkttTEZnUVk6qCcILxPJeWu+JWL4/W9kX9UdMDRQZkEo74P
 DmTuBvPK9ff45z6SDSZEzG2+xR7H+AFUpcl5j6qTcAOu+4ezCAvu+ctf9BYzFatQ562G
 +Lbvj+qiD5OeTWpCOtNtg1SZvjUvngOThNHMObyi2/8joG1NgDca9WV7Y7cu3uBQ+KgV
 J7GYYs4zPqRQfZQ10C3OerQmnobx0ikeLnagfN0Be69h+xgD5LPPCaFI5r3EyN22OHPV
 a48Q==
X-Gm-Message-State: AOAM530SmsHHnJqNZ0AZVzv3CJ+W5kKgx9S2C8+Jx+SX0ox+f3o130sL
 RTZIoXV4cqGKylaA69pdwlJzUw==
X-Google-Smtp-Source: ABdhPJweM0KK9iVhSZ8fBaZxUAiJUsiXSH2sG/EeYGjG+JHL8lvAGJbrav8zVhmsuoRbvr0UlIh0KQ==
X-Received: by 2002:a17:903:22cb:b0:167:992f:60c3 with SMTP id
 y11-20020a17090322cb00b00167992f60c3mr11306012plg.59.1654759655956; 
 Thu, 09 Jun 2022 00:27:35 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:5119:d95b:c6cd:77fb])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a1709027ed000b0016403cae7desm15312221plb.276.2022.06.09.00.27.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 00:27:35 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Hans de Goede <hdegoede@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v7 0/8] Add a panel API to set orientation properly
Date: Thu,  9 Jun 2022 15:27:14 +0800
Message-Id: <20220609072722.3488207-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
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
Cc: Rob Clark <robdclark@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Panels usually call drm_connector_set_panel_orientation(), which is
later than drm/kms driver calling drm_dev_register(). This leads to a
WARN()[1].

The orientation property is known earlier. For example, some panels
parse the property through device tree during probe.

The series add a panel API drm_connector_set_orientation_from_panel()
for drm/kms drivers. The drivers can call the API to set panel's
orientation before drm_dev_register().

Panel needs to implement .get_orientation callback to return the property.

[1] https://patchwork.kernel.org/project/linux-mediatek/patch/20220530081910.3947168-2-hsinyi@chromium.org/

Hsin-Yi Wang (8):
  drm/panel: Add an API to allow drm to set orientation from panel
  drm/panel: boe-tv101wum-nl6: Implement .get_orientation callback
  drm/panel: panel-edp: Implement .get_orientation callback
  drm/panel: lvds: Implement .get_orientation callback
  drm/panel: panel-simple: Implement .get_orientation callback
  drm/panel: ili9881c: Implement .get_orientation callback
  drm/panel: elida-kd35t133: Implement .get_orientation callback
  drm: Config orientation property if panel provides it

 drivers/gpu/drm/bridge/panel.c                | 34 +++++++++++++++++++
 drivers/gpu/drm/drm_bridge_connector.c        |  8 ++++-
 drivers/gpu/drm/drm_connector.c               | 31 +++++++++++++++++
 .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 12 +++++++
 drivers/gpu/drm/panel/panel-edp.c             | 13 ++++++-
 drivers/gpu/drm/panel/panel-elida-kd35t133.c  | 12 +++++++
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 12 +++++++
 drivers/gpu/drm/panel/panel-lvds.c            | 13 +++++++
 drivers/gpu/drm/panel/panel-simple.c          | 14 +++++++-
 include/drm/drm_bridge.h                      | 14 ++++++++
 include/drm/drm_connector.h                   |  4 +++
 include/drm/drm_panel.h                       |  9 +++++
 12 files changed, 173 insertions(+), 3 deletions(-)

-- 
2.36.1.255.ge46751e96f-goog

