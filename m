Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 112D44D6125
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 13:05:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD56210E266;
	Fri, 11 Mar 2022 12:05:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBE5210E266
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Mar 2022 12:05:00 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id x15so12560074wru.13
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Mar 2022 04:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CluZnJvaFq+gv5SsBEdks07J31iiWkZ5fHpUB0bqBcM=;
 b=qw+ajJ3bas5PbBQI9GqAWDJtr1KHk5lF7RWDvKeZSUWN09yo6r3mVvLnJt7yrUnGGW
 gsvPxknVOA7c9SgZrcdZQk/3ro/18kya2vr/H64cqmcHGXQxwOO4zMEPhYObRUfdsU+B
 BHF2jjdpfoYCSQx+Y5G5ae/u1KXY38+LZrSmg00Q1P9Bhp1G2Fv5zTxiLOTs8MV1fkQf
 tzMlShgQCn6RUx1pGONYHEq+GJV35waRSt1OKKqg69RAF76pyKUdhkHcQFWeNm5ZDGpG
 lW3UVnxzzisq8e4IUJqjB6M3XKZfiAyg0y5Ad1BEA9nbtytriaHHdFj7HFv5BN/nN+yU
 Eqyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CluZnJvaFq+gv5SsBEdks07J31iiWkZ5fHpUB0bqBcM=;
 b=VZYxV5X5BP0CxuuGoPkTQzQj6un2v07wxmXOn35PGajJPkgGMd46J7GNJINhZVHuyn
 PtAIW/VUOLJ0ryLqjCDcNRgedgTFVTboUNPa25db7a53cJ8SP3+VymRKyRv1Fr1zYvIe
 sYWfkoyaOC9snAZKXROjJoNpa3hFBALsYKXDWltsxAt3rMaBPE/llmzKsj+o5YHHFv/v
 Vb0KHoDHVxdn5GOz1kqNXFGtDxLWyAfuZGxtXk/Vc+KrhWiNpC22Oy/lzT1/zgW5zqlY
 +P0QCE7QMFp0BUkyoopnP6z2P/c9DBizSEL9O/U/sVfsGVh/7OJnOGK3GcpLYf0F8wJK
 SUBQ==
X-Gm-Message-State: AOAM5311PY9DN5RPThl6G8BvRcVsNRSCJlqDGIljKBcY96nZTkWTQ/q8
 cj5VknRBXNiwSAEh7OfA+74=
X-Google-Smtp-Source: ABdhPJw60L/wNBZRfT4SbS1AbolE9XQ7lQrIbYwPi4ZXCq4AAqHgcxz8c6qE8LDV5dRnQfyrKPmEMg==
X-Received: by 2002:a05:6000:184e:b0:1f0:3569:ccac with SMTP id
 c14-20020a056000184e00b001f03569ccacmr7235289wri.680.1647000299064; 
 Fri, 11 Mar 2022 04:04:59 -0800 (PST)
Received: from monk.home ([2a01:cb10:430:ec00:4737:d56e:186b:af1])
 by smtp.gmail.com with ESMTPSA id
 r20-20020adfa154000000b001f0326a23e1sm6595223wrr.88.2022.03.11.04.04.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Mar 2022 04:04:58 -0800 (PST)
From: Christophe Branchereau <cbranchereau@gmail.com>
To: Paul Cercueil <paul@crapouillou.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 0/4] Ingenic DRM bridge_atomic_enable proposal
Date: Fri, 11 Mar 2022 13:04:49 +0100
Message-Id: <20220311120453.163297-1-cbranchereau@gmail.com>
X-Mailer: git-send-email 2.35.1
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello, v3 :

Drop -spi in the compatible string, adjust bindings doc accordingly 

KR
Christophe

------------------------

Hello, this is the v2 for my set of patches :

- use dev_err_probe() instead of dev_err() in the newvision panel
driver probe function

- add bindings documentation for the Leadtek ltk035c5444t

Cheers - Christophe

------------------------

Hello, this is a set of patches to allow the upstreaming of the
NV3052C panel found in the Anbernic RG350M mips gaming handheld.

It was never upstreamed so far due to a longstanding graphical
bug, which I propose to solve by introducing ingenic_drm_bridge_atomic_enable
in the drm driver so the CRTC can be enabled after the panel itself slept
out, and not before as it used to.

After the drm change, 2 of the existing panels have to be modified accordingly
to introduce missing .enable and .disable in their code.

Christophe Branchereau (4):
  drm/ingenic : add ingenic_drm_bridge_atomic_enable
  drm/panel: Add panel driver for NewVision NV3052C based LCDs
  drm/panel : innolux-ej030na and abt-y030xx067a : add .enable and
    .disable
  dt-bindings: display/panel: Add Leadtek ltk035c5444t

 .../display/panel/leadtek,ltk035c5444t.yaml   |  59 +++
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c     |  19 +-
 drivers/gpu/drm/panel/Kconfig                 |   9 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-abt-y030xx067a.c  |  23 +-
 drivers/gpu/drm/panel/panel-innolux-ej030na.c |  31 +-
 .../gpu/drm/panel/panel-newvision-nv3052c.c   | 497 ++++++++++++++++++
 7 files changed, 627 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/leadtek,ltk035c5444t.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-newvision-nv3052c.c

-- 
2.35.1

