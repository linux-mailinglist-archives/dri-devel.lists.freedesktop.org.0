Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 258F2329EFE
	for <lists+dri-devel@lfdr.de>; Tue,  2 Mar 2021 13:45:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 669EB6E185;
	Tue,  2 Mar 2021 12:45:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAA436E185
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Mar 2021 12:45:15 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id u18so10109449ljd.3
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Mar 2021 04:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RODns9c8niEuo2cR8Tivcksr+gvQ6B3mB5cKu2wOr5k=;
 b=sHlezPC1K+hQ2MvLnVoZTzrGOimIYa8oVDmfP4r4C4JOXwQGq+gkbMFn8966V11zVa
 2nmO5IkDvXtncMumYS7YEyVoNKBl7rigd6JGEUKKLI/M/NqvQhpVmr/Lc1ZiHf10t7by
 kb7jZZMhcEHqLa6aAaf/LOnKcKfxi7kocDp8dcBeZI1LWTs1REvkZHyNP3IS2AnJy4nu
 h9X8Kg3XI/UCcb/ciaqOI5HArHPD8EblMwWnBhfFyNbV6oopQ94x9KrYDHjK9cMhcSdS
 Isw4r/ERYp5zZ+8GqBSGjbnXU8CjDfMjMNkXPCrbM9oJQf9OsBimXzwQf1nuFwq5gF+W
 Yh9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RODns9c8niEuo2cR8Tivcksr+gvQ6B3mB5cKu2wOr5k=;
 b=gl2Kz8STLhaXIlzyLEBcSyhh7b0rdNoQYk5wG/cpuMz7vBOlGtNC107pMxvvK/dBFr
 wtvStR2tC2v896ec1g8ceog4qFQcxBacLeqmZY+U5UdCMrHPMySFwvAt4goflqBz1euQ
 jC4x8mJOi/jtI2PbyQLD4949wyio7PTyxmhgeyQWvF5ta7CAATHcTQgaphnIR92RHRY/
 JnHXZ90ipQUffART5PogHEYjZjGQ9ciIJxTaSTM8V/5wVqw+BOPXzadvuXpIf7b+2AQ4
 nIPd9C78S6pHqqHS5FK+gD+3VH1msWfsaTGJi/o1VD8KTHasL/300w+KlBMlzU666XX6
 /Vew==
X-Gm-Message-State: AOAM532KvFWO+JqglgMaM5ee/CfqN0QCklae0GEHmfKQ9IH6ubi9jw6o
 fUgr0SHtbzsQekoiO9Qdzj4=
X-Google-Smtp-Source: ABdhPJyu8IppM2jrWh9AXXl+HFGQgEQ6h8mGp7coHcqpb6q77syOlTkR6BmPxcAqrLBBq24PC/N9qw==
X-Received: by 2002:a2e:7604:: with SMTP id r4mr12550406ljc.60.1614689114186; 
 Tue, 02 Mar 2021 04:45:14 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru.
 [109.252.193.52])
 by smtp.gmail.com with ESMTPSA id m16sm2634705lfh.109.2021.03.02.04.45.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 04:45:13 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Matt Merhar <mattmerhar@protonmail.com>, Peter Geis <pgwipeout@gmail.com>,
 Nicolas Chauvet <kwizart@gmail.com>
Subject: [PATCH v13 0/2] Add memory bandwidth management to NVIDIA Tegra DRM
 driver
Date: Tue,  2 Mar 2021 15:44:43 +0300
Message-Id: <20210302124445.29444-1-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series adds memory bandwidth management to the NVIDIA Tegra DRM driver,
which is done using interconnect framework. It fixes display corruption that
happens due to insufficient memory bandwidth.

Tegra memory drivers already got the interconnect API support and DRM patches
were a part of the series that added ICC support to the memory drivers, but
the DRM patches were left out unreviewed and unapplied. Hence I'm re-sending
the DRM changes in this new standalone series.

Changelog:

v13: - No code changes. Patches missed v5.12, re-sending them for v5.13.

Dmitry Osipenko (2):
  drm/tegra: dc: Support memory bandwidth management
  drm/tegra: dc: Extend debug stats with total number of events

 drivers/gpu/drm/tegra/Kconfig |   1 +
 drivers/gpu/drm/tegra/dc.c    | 359 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/tegra/dc.h    |  19 ++
 drivers/gpu/drm/tegra/drm.c   |  14 ++
 drivers/gpu/drm/tegra/hub.c   |   3 +
 drivers/gpu/drm/tegra/plane.c | 121 ++++++++++++
 drivers/gpu/drm/tegra/plane.h |  15 ++
 7 files changed, 532 insertions(+)

-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
