Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DAD21F8F96
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 09:27:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D4CA89FF9;
	Mon, 15 Jun 2020 07:27:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 443C189E0D
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jun 2020 17:23:20 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id e4so16431690ljn.4
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jun 2020 10:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DoRr46QhZzu0HYtQht+6OOn/uSyoSM/yNa2CkMx8bbU=;
 b=f8Oh+lSoSCkVY/0YlicukXiWjUqLz/HYxP0U6jvwdYBi5gDOGiBl/oELXD49rw8YzR
 E1qNDohgiFrb3XNcxlfWa/uzuVGnZHXd+ak8Uca1njRJaNmreEcmqY6v/sYDk90r+jpG
 IeLL8EcukkC49BqJAHe8raVvYo5NjKs2xqDfOKGuAFine6bRWuvu/+0CtMO+wyHaKjo4
 BaQOaMVGLAHi4bexKQuznFlg8QgLI6W2iOMGMlkllCLySgBrfeo7bSgKTZfqM1GIVuiT
 Rw1eLxAg2V8tlWhxKuQl0t98kdYWR+hedXsk0TlMwrQev7a64vBT9ZtjeQFxzPMcdcUD
 1OvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DoRr46QhZzu0HYtQht+6OOn/uSyoSM/yNa2CkMx8bbU=;
 b=DoC3Gg7nWi0FRqNzCVnWzIm5KsAdqVM/wxC4RgFInq0Ap3/ExlvCOpTji7exm3s2un
 C48X1pryjuiv1AeVadCg+3iinRXP7yEjQptzQ+M4w3PK7KCVSmQvmzBfuNK95C8Nbzs9
 4HTeXcPVpa7NsLhWQ1NyUezzARJLQTU7uHpCwmEO4S+a9nVkgSVmtDiFsEizYTa7M/+s
 JCnN/u4r2odyUg++ahwQSYYfoV2+p0TvJvTwUPuHPriF6wVlmkS40GhvmMZYGmv2OJ+5
 djTL8x+rPL5pd5JYIO0tWt2aGkhag9kyORSDr+r0qcjFGg0o8e7dw691nwFF8KKcDVWb
 YIQg==
X-Gm-Message-State: AOAM530guQ4EWULRhp2Y54oxsry1Mp3ChyXR4J3wrzaisBARankSJ7Vl
 +Ufq0jJA8YClnrhNZagPdHo=
X-Google-Smtp-Source: ABdhPJynr0Oqx6i5Cq+XWwMGVpYqQ9pToiSFkSouw+lixWm0qm2sn+p2xRDaApoDSVO8nh2oCCbdAQ==
X-Received: by 2002:a2e:b8c2:: with SMTP id s2mr12065988ljp.368.1592155398456; 
 Sun, 14 Jun 2020 10:23:18 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id m14sm55144lfp.18.2020.06.14.10.23.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jun 2020 10:23:17 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH v7 0/6] Support DRM bridges on NVIDIA Tegra
Date: Sun, 14 Jun 2020 20:22:28 +0300
Message-Id: <20200614172234.8856-1-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 15 Jun 2020 07:27:17 +0000
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

This series adds initial support for the DRM bridges to NVIDIA Tegra DRM
driver. This is required by newer device-trees where we model the LVDS
encoder bridge properly.

Changelog:

v7: - Removed the obscure unused structs (which GCC doesn't detect, but CLANG
      does) in the patch "Wrap directly-connected panel into DRM bridge",
      which was reported by kernel test robot for v6.

v6: - Added r-b and acks from Rob Herring and Sam Ravnborg.

    - Rebased on a recent linux-next, patches now apply without fuzz.

v5: - Added new patches that make drm_of_find_panel_or_bridge() more usable
      if graph isn't defined in a device-tree:

        of_graph: add of_graph_get_local_port()
        drm/of: Make drm_of_find_panel_or_bridge() to check graph's presence

    - Updated "Support DRM bridges" patch to use drm_of_find_panel_or_bridge()
      directly and added WARN_ON(output->panel || output->bridge) sanity-check.

    - Added new "Wrap directly-connected panel into DRM bridge" patch, as
      was suggested by Laurent Pinchart.

v4: - Following review comments that were made by Laurent Pinchart to the v3,
      we now create and use the "bridge connector".

v3: - Following recommendation from Sam Ravnborg, the new bridge attachment
      model is now being used, i.e. we ask bridge to *not* create a connector
      using the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag.

    - The bridge is now created only for the RGB (LVDS) output, and only
      when necessary. For now we don't need bridges for HDMI or DSI outputs.

    - I noticed that we're leaking OF node in the panel's error code path,
      this is fixed now by the new patch "Don't leak OF node on error".

v2: - Added the new "rgb: Don't register connector if bridge is used"
      patch, which hides the unused connector provided by the Tegra DRM
      driver when bridge is used, since bridge provides its own connector
      to us.

Dmitry Osipenko (6):
  of_graph: add of_graph_get_local_port()
  drm/of: Make drm_of_find_panel_or_bridge() to check graph's presence
  drm/tegra: output: Don't leak OF node on error
  drm/tegra: output: Support DRM bridges
  drm/tegra: output: rgb: Support LVDS encoder bridge
  drm/tegra: output: rgb: Wrap directly-connected panel into DRM bridge

 drivers/gpu/drm/drm_of.c       |  13 ++++-
 drivers/gpu/drm/tegra/drm.h    |   2 +
 drivers/gpu/drm/tegra/output.c |  21 +++++--
 drivers/gpu/drm/tegra/rgb.c    | 102 +++++++++++++++++----------------
 drivers/of/property.c          |  32 ++++++++---
 include/linux/of_graph.h       |   7 +++
 6 files changed, 114 insertions(+), 63 deletions(-)

-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
