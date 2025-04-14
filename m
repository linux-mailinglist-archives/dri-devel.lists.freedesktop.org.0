Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF50A88BC6
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 20:53:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0671E10E2D6;
	Mon, 14 Apr 2025 18:53:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="Idjva7+N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 925F310E302
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 18:53:24 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20250414185314euoutp01eddaf3d9c8993d5d18d19e84a06e7313~2RBxm1IcZ0766407664euoutp01t
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 18:53:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20250414185314euoutp01eddaf3d9c8993d5d18d19e84a06e7313~2RBxm1IcZ0766407664euoutp01t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1744656794;
 bh=79N7YNqv9Q66PnnxS3ThNfEZmd8804r38ebjHmA2ETY=;
 h=From:Subject:Date:To:Cc:References:From;
 b=Idjva7+Nn4Weil9B2UJGQrGs/9r58U6WiPcViHfieAhgc43k+GdyZDAV/PNAyR2Q0
 knHqY2olN1eeyM7lGjo6X/3uH/q/oyklZjg0IDgm/7CQTZmLIGZT4VmNMdu2ufQ76T
 bvOLrfzAs+HZZWeac95wPZjIILEm7maFv7Fl2/is=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20250414185313eucas1p1883acb9c583cdb21212456eaeb16d4ce~2RBxJkejU3185731857eucas1p1s;
 Mon, 14 Apr 2025 18:53:13 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id AD.8E.20821.9995DF76; Mon, 14
 Apr 2025 19:53:13 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20250414185313eucas1p1c4d13c657f3a3c3e47810955db645ca2~2RBwbyutx3185731857eucas1p1r;
 Mon, 14 Apr 2025 18:53:13 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20250414185313eusmtrp105ea9ceb1fee2bedf389b05a4f395cba~2RBwbBi4B0705407054eusmtrp1e;
 Mon, 14 Apr 2025 18:53:13 +0000 (GMT)
X-AuditID: cbfec7f2-b11c470000005155-76-67fd5999daeb
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 03.64.19654.8995DF76; Mon, 14
 Apr 2025 19:53:13 +0100 (BST)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
 [106.210.136.40]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250414185311eusmtip2570ca62f1c430e3b0a5aeb600ccb1f91~2RBvQeDvV2214922149eusmtip2t;
 Mon, 14 Apr 2025 18:53:11 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Subject: [PATCH v2 0/4] Add GPU clock/reset management for TH1520 in genpd
Date: Mon, 14 Apr 2025 20:52:54 +0200
Message-Id: <20250414-apr_14_for_sending-v2-0-70c5af2af96c@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIZZ/WcC/x3MQQqAIBBA0avErBPUDKurRIjZaLOxGCGC6O5Jy
 7f4/4GCTFhgah5gvKjQkSt020DYfU4oaKsGLXUvjTLCn+yUcfFgVzBvlJPo125UdlDWhwA1PBk
 j3f90Xt73Aywd1PpkAAAA
X-Change-ID: 20250414-apr_14_for_sending-5b3917817acc
To: "Rafael J. Wysocki" <rafael@kernel.org>,  Danilo Krummrich
 <dakr@kernel.org>, Pavel Machek <pavel@kernel.org>,  Drew Fustini
 <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,  Fu Wei <wefu@redhat.com>, Rob
 Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  Michal Wilczynski <m.wilczynski@samsung.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,  Philipp Zabel
 <p.zabel@pengutronix.de>,  Frank Binns <frank.binns@imgtec.com>, Matt Coster
 <matt.coster@imgtec.com>,  Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,  David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,  m.szyprowski@samsung.com
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
X-Mailer: b4 0.15-dev
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0xTVxzOuff23tKs5FLYPII4VoMbLtKygDuKcXMQvWEjQbdlssSMDu+K
 4+VaYeBmeKwyHpWHPMZzxc4JljEUSkdrgaXpqAxsiSKwBBAnpo7HGA9FwcdWLtv87/t93/c7
 3/lODh8XlZLe/KNJx1lFkixBTAoIQ89Dx/aq6Mdy6aOnEnRlWIuhHzrtGJqu+ItEGqudh8av
 6TE0eG+ORD/eGaDQ3c4sAv1RPU6i66ZaEi2etgJkWFSRqNk6RqGWexoMnZ1vJ9C5DhNAOXnn
 eWhs/AqBcucycVS3VI6jp+YOCtX82U0h/UwJD9maP0Cq7jLizY1M5/16gjFWj1GM2tgPmFZd
 HsmMDplJ5tveA8zNAhvGtJ3LYFTNPRhT9FjKzHXdIJlCvQ4wbX1fMIutm6PcPxTsPsImHE1l
 FZI9MYK4bH02deyST1pBxR0qE2S/kA/4fEgHw77pyHwg4IvoRgAdFdcwblgCsGn5AckNiwAu
 3Tbi+cBtbeNUxV3gwiK6AcD6yy9zphwMztSXEi6BpF+DEw0angt70hHwof63NZ6g/WFLyQLl
 ihbS++GwJsxFC2kP2Fs1uWbB6RfhT7O1uOtMSF8E0Fw5h3HBIbBsuRK4BC96lQdzs3vWXDhd
 B6DF8BXBuZ6Hq6UmglsvF8CvpwzrQjjsWp3lcdgTTtn0FIc3wb5S9bonGU60L6z3/BIa1bZ1
 HApH7Suk69o4HQBbTBKO3gsnH90iuId0hyOzHlwDd3jG8A3O0UKYmyPi3Fthufr0f6H2RgNW
 DMTVz/SvfqZ/9f9Z9QDXgQ1sijJRziqDktjPA5WyRGVKkjwwNjmxFfzzb/ue2BY6QN3UfKAF
 YHxgAZCPi72EgrAVuUh4RJZ+glUkf6RISWCVFuDDJ8QbhNruU3IRLZcdZ+NZ9hir+FfF+G7e
 mdgn0shuprL1FdA7tLlEnVG4w1ns1+2YOdgfOimR/iwN1lUcAtbLu94YzXLXha+ejKn15enf
 WVpuetcR4nfhdb+FmsG6yrrD+5QFsbqgeP/9qpzvHKnKLfGpYMJtqLAm7JZz50Hc28Pc88sD
 avrV9I03tW7DLc/FjoQ0iN+O20GNFQdcyOqfP3k19a33nsTuEVTd9ogc3HniQHCGbxF2WLsv
 yDBwyNfutTf9omXXx/cDRmK+/938qR1E+Qxsq/W8NNxY9qszNRdFoy79pvDo4aAYK7nkNG4x
 561EvG9yRlyVqNoD8xMmo9I+uxHaU5N5Puv6eG3bbk3u9jRTb9NL/lq4XCQmlHGyoG24Qin7
 G+hP89EmBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJKsWRmVeSWpSXmKPExsVy+t/xe7ozI/+mG7THW5y4vojJYs3ec0wW
 r6d9YLOYf+Qcq8W9S1uYLK58fc9mse7pBXaLF3sbWSxezrrHZnF51xw2i8+9Rxgttn1uYbNY
 e+Quu8X6r/OZLBZ+3MpisWTHLkaLts5lrBZ3751gseh438BsMffLVGaL/3t2sFvMfref3WLL
 m4msFsfXhlu07J/C4iDpsffbAhaPnbPusnv07DzD6LFpVSebx51re9g85p0M9LjffZzJY/OS
 eo+WtceYPPr/Gni833eVzaNvyypGj82nqz0+b5IL4IvSsynKLy1JVcjILy6xVYo2tDDSM7S0
 0DMysdQzNDaPtTIyVdK3s0lJzcksSy3St0vQy2ja0sResFG6onvaU/YGxiaxLkZODgkBE4nW
 aS8Yuxi5OIQEljJKfO86wQaRkJG41v2SBcIWlvhzrYsNoqiFSeJO+yuwBJuAkcSD5fNZQWxh
 AS+Jn1tugsVZBFQl1k/8xN7FyMHBK+AucX2+M0iYV0BQ4uTMJywgYWYBTYn1u/RBwswC8hLb
 385hBhkvIbCBUeLXhz5GiL2mElO+zwA7TkSgiU3i2/bPYEcwC8xjlPg0bwLUdaISvyfvYpnA
 KDgLyZJZCEtmIVmygJF5FaNIamlxbnpusZFecWJucWleul5yfu4mRmAa2Xbs55YdjCtffdQ7
 xMjEwXiIUYKDWUmEl8v5V7oQb0piZVVqUX58UWlOavEhRlOgPycyS4km5wMTWV5JvKGZgamh
 iZmlgamlmbGSOC/blfNpQgLpiSWp2ampBalFMH1MHJxSDUyLJZT+X7lgeumn274/epuUvLuS
 jgg9FXllH/hyfZ2eBGeZaOCVf5Z2sw5YcYqsYp+4dX/leaOJz0+dfn5jsiyTZtbMPQlugreU
 i1/yHpo1Z8ZnueQnrmdWRmi9iOtwTTvof+2o4cZpNm80/vlv/Do1+1nZ0ouzSpyPLazewZDQ
 KN2e+NAhW1yFq1R5Wsztd6nH76xuOPLszcK1mz/vVn7bVsARvbRHq0GzPjxXeuX2qdOC3Vcp
 V+6QUTpRKOK3+frFPjYm76xqw5S+lxGvby7sDL4Xv9yg7f1T/e8q976/3vBWbv3X83NYjUPW
 OckesXdnf+57YOWMDbzLf/5+vejEC4O7DmuW2728fWDr0xWWa5RYijMSDbWYi4oTAT6JRkes
 AwAA
X-CMS-MailID: 20250414185313eucas1p1c4d13c657f3a3c3e47810955db645ca2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250414185313eucas1p1c4d13c657f3a3c3e47810955db645ca2
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250414185313eucas1p1c4d13c657f3a3c3e47810955db645ca2
References: <CGME20250414185313eucas1p1c4d13c657f3a3c3e47810955db645ca2@eucas1p1.samsung.com>
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

This small patch series adds clock and reset management for the GPU in
the T-HEAD TH1520 SoC through the generic power domain (genpd)
framework.

The TH1520 GPU requires a special sequence involving multiple clocks and
resets to safely bring it up. Coordinating this sequence properly is
necessary for correct GPU operation. Following discussions on the
mailing list with kernel maintainers [1], the recommended approach is to
model this complexity inside a power domain driver, keeping SoC specific
details out of the GPU driver, clock framework, and reset framework.

This series consists of four patches:
- Patch 1 introduces a new dev_pm_info flag to allow device drivers
  to detect when platform PM domains manage clocks or resets
- Patch 2 updates the AON firmware bindings to describe the GPU clkgen
  reset
- Patch 3 extends the TH1520 PM domain driver to handle GPU-specific
  clock and reset sequencing at runtime, using genpd start/stop and
  attach/detach callbacks
- Patch 4 updates the Imagination DRM driver to skip direct clock
  management when platform PM ownership is detected

This approach aligns with recent efforts to treat PM domains as
SoC-specific power management drivers, as presented at OSSEU 2024 [2].

This patchset continues the work started in bigger series [3] by moving
the GPU initialization sequence for the TH1520 SoC into a generic PM
domain driver, specifically handling clock and reset management as part
of GPU bring-up.

v2:

Extended the series by adding two new commits:
 - introduced a new platform_resources_managed flag in dev_pm_info along
   with helper functions, allowing drivers to detect when clocks and resets
   are managed by the platform
 - updated the DRM Imagination driver to skip claiming clocks when
   platform_resources_managed is set

Split the original bindings update:
 - the AON firmware bindings now only add the GPU clkgen reset (the GPU
   core reset remains handled by the GPU node)

Reworked the TH1520 PM domain driver to:
 - acquire GPU clocks and reset dynamically using attach_dev/detach_dev
   callbacks
 - handle clkgen reset internally, while GPU core reset is obtained from
   the consumer device node
 - added a check to enforce that only a single device can be attached to
   the GPU PM domain

[1] - https://lore.kernel.org/all/CAPDyKFqsJaTrF0tBSY-TjpqdVt5=6aPQHYfnDebtphfRZSU=-Q@mail.gmail.com/
[2] - https://osseu2024.sched.com/event/1ej38/the-case-for-an-soc-power-management-driver-stephen-boyd-google
[3] - https://lore.kernel.org/all/20250219140239.1378758-1-m.wilczynski@samsung.com/

---
Michal Wilczynski (4):
      PM: device: Introduce platform_resources_managed flag
      dt-bindings: firmware: thead,th1520: Add resets for GPU clkgen
      pmdomain: thead: Add GPU-specific clock and reset handling for TH1520
      drm/imagination: Skip clocks if platform PM manages resources

 .../bindings/firmware/thead,th1520-aon.yaml        |  11 ++
 drivers/gpu/drm/imagination/pvr_device.c           |  14 +-
 drivers/pmdomain/thead/th1520-pm-domains.c         | 199 +++++++++++++++++++++
 include/linux/device.h                             |  11 ++
 include/linux/pm.h                                 |   1 +
 5 files changed, 232 insertions(+), 4 deletions(-)
---
base-commit: 7c89da246c1268c8dbfc1c7f1edc55aabce45b43
change-id: 20250414-apr_14_for_sending-5b3917817acc

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>

