Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5CF2E6F72
	for <lists+dri-devel@lfdr.de>; Tue, 29 Dec 2020 10:42:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A943892E5;
	Tue, 29 Dec 2020 09:42:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E83128999C
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Dec 2020 15:49:40 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id m12so24767287lfo.7
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Dec 2020 07:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mM9en9kLcp++QJKTEEtXoFc1OKK5IPrdvT5nKnLAg5c=;
 b=WRqRhLPI56aNRbOGN5TcIK6xLDfq4h/Rkd7/CHGgJnJ5e/v79/0QUZb5Vl9a13B0xz
 g8lYhzNFK1gdnhzWMx5pQbdwZD5xp6otyh3rmNE8asBkwiCTMFReL1k8Df2g+52hfRRc
 b0Ld25pdFJcpr/OZlLk169SfzlJCKdi2EWs5iXBGBDw991Iz4TcTEhl9ZUfy3vgaRbB+
 Bf9vZEaiRuqQrIvJmi0X+WzmjDheTGi/NvYnEschKWLsSx/4ZlQt+wAM1+/jMvcsUOw9
 gUqenSwTr55yMxtb9EmrpRFyKEhLwZtCY1QJ1bsb4lPzXUKswzIvKKyF4/1E9RJq7qOf
 k+1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mM9en9kLcp++QJKTEEtXoFc1OKK5IPrdvT5nKnLAg5c=;
 b=StJ4sSgZORsPmt8m8trRA9kFfwqtJVuT9/H9qNrJTXgVhgnN+k41ul6ZsUi0fTSnb4
 aym4S5NsHHrSAAUw3eY/zGHVBZrk76u/xDSBKdpODVq98SHKM+Cng3pmPaijLuXtsQCC
 VLU4zIvUjEUKc+h650HsgnJoBCY0Y4s2RK8scBP9tVQnRrrB561nkEM1fV1ZhuTq/lXp
 lfTTMBABKh6tTavtDwQ0xdmdSpM6wzX5Q/cIV4BjM+d30f3CLX1tmqbqeNuoAW51CyPz
 Gs7zcIdFHvoZfXjRUAtJomdU++xMyb++hlRlaWx0U72E2vCrwke1eVMNZbqNAfrYfMal
 Uxeg==
X-Gm-Message-State: AOAM530SX8qdF9j6OEeIOSbY6tZAQNg2rY3tg8b8Q/79oZDf8ZZZxMiB
 Trum7+NIvTBiSgNAs/Xv0c8=
X-Google-Smtp-Source: ABdhPJwFtnDhDgQztrn8TaUWje7svXW0Hk0Mlgc4uR1KPhQKrr0QArdg3/rR8A+bLW8kDv9cisfG5Q==
X-Received: by 2002:a19:4907:: with SMTP id w7mr6094774lfa.198.1609170579445; 
 Mon, 28 Dec 2020 07:49:39 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.gmail.com with ESMTPSA id s27sm6502262ljd.25.2020.12.28.07.49.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Dec 2020 07:49:38 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Mikko Perttunen <cyndis@kapsi.fi>,
 Viresh Kumar <vireshk@kernel.org>, Peter Geis <pgwipeout@gmail.com>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v12 0/5] Introduce memory interconnect for NVIDIA Tegra SoCs
Date: Mon, 28 Dec 2020 18:49:15 +0300
Message-Id: <20201228154920.18846-1-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 29 Dec 2020 09:42:26 +0000
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
Cc: linux-tegra@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add interconnect support to Tegra124 EMC and display controller drivers.

Changelog:

v12: - This is a re-send of the remaining v11 patches [1] that didn't make
       into v5.11 kernel. No code changes.

       [1] https://lore.kernel.org/lkml/20201203192439.16177-1-digetx@gmail.com/

Dmitry Osipenko (5):
  memory: tegra124-emc: Make driver modular
  memory: tegra124-emc: Continue probing if timings are missing in
    device-tree
  memory: tegra124: Support interconnect framework
  drm/tegra: dc: Support memory bandwidth management
  drm/tegra: dc: Extend debug stats with total number of events

 drivers/clk/tegra/Kconfig            |   3 +
 drivers/clk/tegra/Makefile           |   2 +-
 drivers/clk/tegra/clk-tegra124-emc.c |  41 ++-
 drivers/clk/tegra/clk-tegra124.c     |  26 +-
 drivers/clk/tegra/clk.h              |  18 +-
 drivers/gpu/drm/tegra/Kconfig        |   1 +
 drivers/gpu/drm/tegra/dc.c           | 359 +++++++++++++++++++++++++
 drivers/gpu/drm/tegra/dc.h           |  19 ++
 drivers/gpu/drm/tegra/drm.c          |  14 +
 drivers/gpu/drm/tegra/hub.c          |   3 +
 drivers/gpu/drm/tegra/plane.c        | 121 +++++++++
 drivers/gpu/drm/tegra/plane.h        |  15 ++
 drivers/memory/tegra/Kconfig         |   4 +-
 drivers/memory/tegra/tegra124-emc.c  | 377 ++++++++++++++++++++++++---
 drivers/memory/tegra/tegra124.c      |  82 +++++-
 include/linux/clk/tegra.h            |   8 +
 include/soc/tegra/emc.h              |  16 --
 17 files changed, 1038 insertions(+), 71 deletions(-)
 delete mode 100644 include/soc/tegra/emc.h

-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
