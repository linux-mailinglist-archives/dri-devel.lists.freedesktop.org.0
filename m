Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7199D379AB5
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 01:27:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 028F76E95E;
	Mon, 10 May 2021 23:27:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3095C6E95E
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 23:27:32 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id a2so4877284lfc.9
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 16:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p/hD7X1jxbNKIMZLjI4qd/QOlc+AoEvIWQQDsxFLaMg=;
 b=cFPpmm7z9+guC3U9hNO0K8s3a3FQtexzt4LAU0q9bPIj70X9tuPzKfDC29dVTQY2yc
 8axyeOCZjjo2kZeXCTocHWmx+QBcze6pZw94+0oGnFl9VMMnmHiILRsGeJ/cuvN2PYd/
 871X2X2AI8DEe4JOkuYdHq/76l50ftCWqzQXc1YPyPONnuJGi2yyybw73mxgKZtgKeOX
 vmiNBedWR++LHHqZ58tyiJA2VUrcwHmCeSjS7YtUv3gdUFfVCz95RkDCZYkWbvg+L4oN
 2nhKO0Wfb+SVxYYYBBENyHbs/HtIeF4XHQl28zfzmPNTVYIEvt6C+TyeTKWNzublzO+x
 qtRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p/hD7X1jxbNKIMZLjI4qd/QOlc+AoEvIWQQDsxFLaMg=;
 b=WIhz7UG0ONAAa6XCUd9Srbp5UnwkSvdqJE4hcIapBaybC6cRobspWzKsdVuO2acV09
 nzy8oGChE2vYm8EJ6NGJUOrQ8NtBoIgWICM9JvgC7Y+t5uwrR4LxWVQMjWH7re550Od9
 4anyd9YS0z5RRLMoa44mxnHISQcxt6dalP74PYR+Lbm1PLE33Hqzp9v9Zb/Jken6FFbu
 Xrpea4YQ/4R+vmgzmveFyeXQqsu6b0m+YPvdPXJjJ8dtVUpNXtTL+a8OTlQb2Iz3Ubpo
 PSa3OHLUXiVrmHa1Fh8Zz51hHKqYdt/x6N1XGt9as4Z+fZeAYB/jSaQfgMW0nglw6H29
 w12A==
X-Gm-Message-State: AOAM530zPCCJIhW64T2xqu3HrkkqaFKIEO4XQ2SBsNvo092JHDPOubou
 ZSh0V4kb0rdmhgXtnVJnY6U=
X-Google-Smtp-Source: ABdhPJx+Hhr9CpWnsQQ9nxO7xiBcgt0Ru42RZfBUAag3gPYRlwtdIOoT/EQHr68t1le+iAJi/lZjlg==
X-Received: by 2002:a19:4cd7:: with SMTP id z206mr4510093lfa.487.1620689250586; 
 Mon, 10 May 2021 16:27:30 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-91.dynamic.spd-mgts.ru.
 [109.252.193.91])
 by smtp.gmail.com with ESMTPSA id f29sm3354203ljo.69.2021.05.10.16.27.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 16:27:30 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Matt Merhar <mattmerhar@protonmail.com>, Peter Geis <pgwipeout@gmail.com>,
 Nicolas Chauvet <kwizart@gmail.com>,
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH v17 0/2] Add memory bandwidth management to NVIDIA Tegra DRM
 driver
Date: Tue, 11 May 2021 02:27:07 +0300
Message-Id: <20210510232709.1349-1-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series adds memory bandwidth management to the NVIDIA Tegra DRM driver,
which is done using interconnect framework. It fixes display corruption that
happens due to insufficient memory bandwidth.

Changelog:

v17: - No changes, re-sending for v5.14.

v16: - Implemented suggestions that were given by Michał Mirosław to v15.

     - Added r-b from Michał Mirosław to the debug-stats patch.

     - Rebased on top of a recent linux-next.

     - Removed bandwidth scaling based on width difference of src/dst
       windows since it's not actual anymore. Apparently the recent memory
       driver changes fixed problems that I witnessed before.

     - Average bandwidth calculation now won't overflow for 4k resolutions.

     - Average bandwidth calculation now uses the size of the visible
       area instead of the src area since debug stats of the memory
       controller clearly show that downscaled window takes less bandwidth,
       proportionally to the scaled size.

     - Bandwidth calculation now uses "adjusted mode" of the CRTC, which
       is what used for h/w programming, instead of the mode that was
       requested by userspace, although the two usually match in practice.

v15: - Corrected tegra_plane_icc_names[] NULL-check that was partially lost
       by accident in v14 after unsuccessful rebase.

v14: - Made improvements that were suggested by Michał Mirosław to v13:

       - Changed 'unsigned int' to 'bool'.
       - Renamed functions which calculate bandwidth state.
       - Reworked comment in the code that explains why downscaled plane
         require higher bandwidth.
       - Added round-up to bandwidth calculation.
       - Added sanity checks of the plane index and fixed out-of-bounds
         access which happened on T124 due to the cursor plane index.

v13: - No code changes. Patches missed v5.12, re-sending them for v5.13.

Dmitry Osipenko (2):
  drm/tegra: dc: Support memory bandwidth management
  drm/tegra: dc: Extend debug stats with total number of events

 drivers/gpu/drm/tegra/Kconfig |   1 +
 drivers/gpu/drm/tegra/dc.c    | 362 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/tegra/dc.h    |  19 ++
 drivers/gpu/drm/tegra/drm.c   |  14 ++
 drivers/gpu/drm/tegra/hub.c   |   3 +
 drivers/gpu/drm/tegra/plane.c | 116 +++++++++++
 drivers/gpu/drm/tegra/plane.h |  15 ++
 7 files changed, 530 insertions(+)

-- 
2.30.2

