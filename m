Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C62F211CBC
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 09:25:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C64E86EA4C;
	Thu,  2 Jul 2020 07:24:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B01D36E7FE
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 07:43:01 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id o4so13030348lfi.7
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jul 2020 00:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a4snypAVj1f2VNcK/6wRbxe6KtPA5KToxVeTmWhPjJU=;
 b=M851pTqc4c2ogJ5gYxfK4uOWvSzycFPaZ9aAwL0A8qbCjx/cBFGs5v8oV+vfa6oEts
 htKKU0nx8TG4qiK8J6D6AWWHfgmVGrIpQgeBA+Ou5fZ12/kGa3m571cBnaydZzUR4GG6
 oDjaygrIVRo/kgULJRnpkvsYGykYwgl8diODwFjllP3Fo1YJeCpXHCJ99h+XDQOhrc0h
 HaB5/X6KZGr31Vy14wFuzE49gI1IZK9lBiqoWaTfefdrXecx2+TgAEpzgt7WI0wKrW67
 cEZS0eaeOceFPfHaXeZ2ptUr7cH2sziS21ErJBwfv+JUS97W/yvCuKY3geFy+ypDH/Bt
 ZOcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a4snypAVj1f2VNcK/6wRbxe6KtPA5KToxVeTmWhPjJU=;
 b=Vnp3K9miIQYLX5/+fceG0ob2xYwE+BKKVe20dFCGSgnDKgpmL51lhXMbHnrOtmQnSX
 KdEG57olKNFsYmc01sjB+SmckzGrv9Im6eLb9j2Hztn7LwmO8yIMR8uTal8KbXWoOw3/
 TGFx/7BgSOJU4u9NZ0KP3HlrRr3P2ZqZ3gTNfOyd4m9VaczpT0E7hlLF65n2suTIaSiW
 5jqIJLVm7WhJgNa0wMELrjG6hLj0DXHbRmDs8ApRLTDK0M6d3S2seKKs1pVKxGnIJpN2
 D/mHLh2MthTUpEOzcsHQgcbdhxcbXUlLxuMKKLAMUWYPYriaWGSrldF5y6QiPQ5MPPZt
 iaKg==
X-Gm-Message-State: AOAM531B1IpkPodxE58oyZz+icItf279p+Yy4sy5K67fUX8Hvxis9AAF
 ORtEEMAMxWdOdIT2he+2Q84=
X-Google-Smtp-Source: ABdhPJxn9pilY0l7dKhtPzUDxK+ZvEWyFDHSiQSc1jsTxQqvtuOxYC1rWi9vlPWrh4GodwtgHPP2hQ==
X-Received: by 2002:a19:4bd1:: with SMTP id y200mr14361981lfa.60.1593589380107; 
 Wed, 01 Jul 2020 00:43:00 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id e10sm1520881ljb.118.2020.07.01.00.42.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2020 00:42:59 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH v10 0/2] Silence missing-graph error for DRM bridges
Date: Wed,  1 Jul 2020 10:42:30 +0300
Message-Id: <20200701074232.13632-1-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 02 Jul 2020 07:24:22 +0000
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

Hi!

This small series improves DRM bridges code by silencing a noisy error
coming from of-graph code for the device-trees that are missing a
display bridge graph.

  graph: no port node found in ...

One example where this error happens is an older bridge-less DTB used
in conjunction with a newer kernel which has a display controller driver
that supports DRM bridges.

Changelog:

v10:- Corrected doc-comment, unbroke the of_graph_get_next_endpoint() and
      improved commit's message in the "add of_graph_is_present()" patch.
      Thanks to Laurent Pinchart for spotting the problems!

v9: - These two patches are factored out from [1] in order to ease applying
      of the patches.

    - The of_graph_presents() is renamed to of_graph_is_present() like it
      was requested by Rob Herring in the review comment to [1].

    - Added Rob's r-b.

    [1] https://patchwork.ozlabs.org/project/linux-tegra/list/?series=184102

Dmitry Osipenko (2):
  of_graph: add of_graph_is_present()
  drm/of: Make drm_of_find_panel_or_bridge() to check graph's presence

 drivers/gpu/drm/drm_of.c |  9 +++++++++
 drivers/of/property.c    | 23 +++++++++++++++++++++++
 include/linux/of_graph.h |  6 ++++++
 3 files changed, 38 insertions(+)

-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
