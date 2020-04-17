Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF9D1AEB40
	for <lists+dri-devel@lfdr.de>; Sat, 18 Apr 2020 11:27:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 306506EC6C;
	Sat, 18 Apr 2020 09:26:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D5E46E124
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 17:54:49 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id q22so2968904ljg.0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 10:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kUgkvGxwUTj//f5ZA1Y2QPcTYYMvVcKNmfn7DC/ae88=;
 b=jAGzA03gM2tyI7DEuYLXPYxmhX75m/zzh07gPgQHCIBoFLlx3ef2hZO69f4ELyWmGD
 qZuCUePvuYuj3zjMUphXMqz/Wbd20m8rQHudTDWMXKxvxrcnHbWT3qDwBPWWhmbfy2qm
 +KpD3KMOza8QKHR+pkLxNTSBQ5vtWHsIjAlNf3YUvXPLxpseeXcyY3BxEFYfASVUPUG5
 XjngArpReFSx4M+Y5GHki3xpTKn+hM0bWBIWxDbddGlVafcMCPZEoNUerHU9IsMUzw56
 COU8sMWkVeyUN9aJJwUO3BhTaZ/UEW45XUJlR7Pq57cIxQDOxdbOYUTZbe0CX4+2CwRK
 u4Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kUgkvGxwUTj//f5ZA1Y2QPcTYYMvVcKNmfn7DC/ae88=;
 b=fhO2hRJn1D1vNcK8syOfXSEXMYynMkg0CYV38CWKMT9abV88FVMmXcucxGEGe7qflV
 lCM4HPhlrJSJ/KZFGh8OtYwrxa3x9VFjw/ETJcvszWHP+NOKgLBfozS9bZs3M4HaMMLy
 a+utlI73HJ+GNEZ6d/SwJLEivIsS/x/eyASVZLSXqPB5MjaljqsNiRNCWsdSABCRXqnA
 Nnog4lhvwiy31kq8rl947HsGqi2Np+gNAs3RFhfBR2YMhYWKvx+382S1dkQBuYSnKHYo
 XCbr1uJJLHycZTVecNE9GM97ydm1wdrI1ctQ54jybMkGQlmHxQSvTHp8olDhNfV2GZ5z
 yfXw==
X-Gm-Message-State: AGi0PuZolUa8WjyFMq2R4gmEpYpaLB699bTQ5LVTxk0IPt5yMjmkwQJq
 e5gDsgHTw1jTTo5zZyxZQ6E=
X-Google-Smtp-Source: APiQypLvbpu1aJkpmbh9/md97PH+AYM6G8tvU1+7muvQuvQKdNG5OyeLYJ/z2UlpiwPJoY88DjmCgw==
X-Received: by 2002:a2e:7004:: with SMTP id l4mr2911157ljc.55.1587146087930;
 Fri, 17 Apr 2020 10:54:47 -0700 (PDT)
Received: from localhost.localdomain (ppp91-78-208-152.pppoe.mtu-net.ru.
 [91.78.208.152])
 by smtp.gmail.com with ESMTPSA id j15sm7204358lja.71.2020.04.17.10.54.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2020 10:54:46 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v4 0/3] Support DRM bridges on NVIDIA Tegra
Date: Fri, 17 Apr 2020 20:52:35 +0300
Message-Id: <20200417175238.27154-1-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 18 Apr 2020 09:26:15 +0000
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

This small series adds initial support for the DRM bridges to NVIDIA Tegra
DRM driver. This is required by newer device-trees where we model the LVDS
encoder bridge properly.

Changelog:

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

    - Please notice that the first "Support DRM bridges" patch was previously
      sent out as a standalone v1 change.

Dmitry Osipenko (3):
  drm/tegra: output: Don't leak OF node on error
  drm/tegra: output: Support DRM bridges
  drm/tegra: output: rgb: Support LVDS encoder bridge

 drivers/gpu/drm/tegra/drm.h    |  2 ++
 drivers/gpu/drm/tegra/output.c | 22 +++++++++----
 drivers/gpu/drm/tegra/rgb.c    | 58 ++++++++++++++++++++++++++++------
 3 files changed, 67 insertions(+), 15 deletions(-)

-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
