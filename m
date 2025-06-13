Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B311AD8009
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 03:11:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0377110E382;
	Fri, 13 Jun 2025 01:11:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hPb2oWeF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EEF610E004;
 Fri, 13 Jun 2025 01:11:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2BDDF5C6A58;
 Fri, 13 Jun 2025 01:09:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 71885C4CEEA;
 Fri, 13 Jun 2025 01:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749777091;
 bh=+kWzTcHBzf1aWzkd8t80rJRxvNyHpEOLoaEfIgMWrfE=;
 h=From:Subject:Date:To:Cc:Reply-To:From;
 b=hPb2oWeFVG8dKQbU2erkeM8+hIMHVmowAsObzeH5kExdTva0+mRByMsoEKAJLesF3
 Ji0JM4cgxdb3QD3V4nWMooiy3WurcoErStrHFMKjngeSZLUTzclws4khnBscBBMSZC
 itHdk0Dcqe1yiWhkXeGx0agCp7ccWLdKb+6j/V1lkY7Rm3VcV629UM1SPqHQpzfW4Y
 0v6XNkubFoF38AechTv/eZgVvZmp7r0VF7tC9As7UVU0YwFNfCgwIgPj7mNX9nguGI
 joPW2GA//Az+b9452IQBoa5zyyFt/stB7JyHamdtRIVAIX92FMylYNtkj2tWH1+JPK
 Z2txkZvyO/Zsw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 65C21C61CE8;
 Fri, 13 Jun 2025 01:11:31 +0000 (UTC)
From: Mingcong Bai via B4 Relay <devnull+jeffbai.aosc.io@kernel.org>
Subject: [PATCH v2 0/5] drm/xe: enable driver usage on non-4KiB kernels
Date: Fri, 13 Jun 2025 09:11:28 +0800
Message-Id: <20250613-upstream-xe-non-4k-v2-v2-0-934f82249f8a@aosc.io>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAMB6S2gC/3WNwQqDMBBEf0X23C1hjbX21P8oHmJc61KaSGLFI
 vn3pkKPhbm8gXmzQeQgHOFSbBB4kSjeZaBDAXY07s4ofWYgRZU6qRJfU5wDmyeujM471A9cCLW
 xA1Wlbbqhh7ydAg+y7t5bm3mUOPvw3m8W+rY/o/5jzFFouW5U1Zu6U+er8dEexUObUvoA6Y9wD
 rgAAAA=
X-Change-ID: 20250603-upstream-xe-non-4k-v2-4acf253c9bfd
To: Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Francois Dugast <francois.dugast@intel.com>, 
 =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>, 
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>, 
 Matthew Brost <matthew.brost@intel.com>, 
 Zhanjun Dong <zhanjun.dong@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>, 
 Alan Previn <alan.previn.teres.alexis@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Mateusz Naklicki <mateusz.naklicki@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Kexy Biscuit <kexybiscuit@aosc.io>, Shang Yatsen <429839446@qq.com>, 
 Mingcong Bai <jeffbai@aosc.io>, Wenbin Fang <fangwenbin@vip.qq.com>, 
 Haien Liang <27873200@qq.com>, Jianfeng Liu <liujianfeng1994@gmail.com>, 
 Shirong Liu <lsr1024@qq.com>, Haofeng Wu <s2600cw2@126.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749777090; l=6957;
 i=jeffbai@aosc.io; s=20250604; h=from:subject:message-id;
 bh=+kWzTcHBzf1aWzkd8t80rJRxvNyHpEOLoaEfIgMWrfE=;
 b=sfMadsBOWvQZtHJFbzFINzmXJbqQH4BLkmDZrXblOs826TkG3/RgX7wPcSGvm974KzswWO2d/
 2qaYfONfchqCY1E3n92Yt9lZY+2KYRZPhc2CYNiG59fZLyI/hz1qVOc
X-Developer-Key: i=jeffbai@aosc.io; a=ed25519;
 pk=MJdgklflDF+Xz9x2Lp+ogEnEyk8HRosMGiqLgWbFctY=
X-Endpoint-Received: by B4 Relay for jeffbai@aosc.io/20250604 with auth_id=422
X-Original-From: Mingcong Bai <jeffbai@aosc.io>
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
Reply-To: jeffbai@aosc.io
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series attempts to enable the use of xe DRM driver on non-4KiB
kernel page platforms. This involves fixing the ttm/bo interface, as well
as parts of the userspace API to make use of kernel `PAGE_SIZE' for
alignment instead of the assumed `SZ_4K', it also fixes incorrect usage of
`PAGE_SIZE' in the GuC and ring buffer interface code to make sure all
instructions/commands were aligned to 4KiB barriers (per the Programmer's
Manual for the GPUs covered by this DRM driver).

This issue was first discovered and reported by members of the LoongArch
user communities, whose hardware commonly ran on 16KiB-page kernels. The
patch series began on an unassuming branch of a downstream kernel tree
maintained by Shang Yatsen.[^1]

It worked well but remained sparsely documented, a lot of the work done
here relied on Shang Yatsen's original patch.

AOSC OS then picked it up[^2] to provide Intel Xe/Arc support for users of
its LoongArch port, for which I worked extensively on. After months of
positive user feedback and from encouragement from Kexy Biscuit, my
colleague at the community, I decided to examine its potential for
upstreaming, cross-reference kernel and Intel documentation to better
document and revise this patch.

Now that this series has been tested good (for boot up, OpenGL, and
playback of a standardised set of video samples[^3] on the following
platforms (motherboard + GPU model):

- x86-64, 4KiB kernel page:
    - MS-7D42 + Intel Arc A580
    - COLORFIRE B760M-MEOW WIFI D5 + Intel Arc B580
- LoongArch, 16KiB kernel page:
    - XA61200 + GUNNIR DG1 Blue Halberd (Intel DG1)
    - XA61200 + GUNNIR Iris Xe Index 4 (Intel DG1)
    - XA61200 + GUNNIR Intel Iris Xe Max Index V2 (Intel DG1)
    - XA61200 + GUNNIR Intel Arc A380 Index 6G (Intel Arc A380)
    - XA61200 + ASRock Arc A380 Challenger ITX OC (Intel Arc A380)
    - XA61200 + Intel Arc A580
    - XA61200 + GUNNIR Intel Arc A750 Photon 8G OC (Intel Arc A750)
    - XA61200 + Intel Arc B580
    - XB612B0 + GUNNIR Intel Iris Xe Max Index V2 (Intel DG1)
    - XB612B0 + GUNNIR Intel Arc A380 Index 6G (Intel Arc A380)
    - ASUS XC-LS3A6M + GUNNIR Intel Arc B580 INDEX 12G (Intel Arc B580)

On these platforms, basic functionalities tested good but the driver was
unstable with occasional resets (I do suspect however, that this platform
suffers from PCIe coherence issues, as instability only occurs under heavy
VRAM I/O load):

- AArch64, 4KiB/64KiB kernel pages:
    - ERUN-FD3000 (Phytium D3000) + GUNNIR Intel Iris Xe Max Index V2
      (Intel DG1)
    - ERUN-FD3000 (Phytium D3000) + GUNNIR Intel Arc A380 Index 6G
      (Intel Arc A380)
    - ERUN-FD3000 (Phytium D3000) + GUNNIR Intel Arc A750 Photon 8G OC
      (Intel Arc A750)

I think that this patch series is now ready for your comment and review.
Please forgive me if I made any simple mistake or used wrong terminologies,
but I have never worked on a patch for the DRM subsystem and my experience
is still quite thin.

But anyway, just letting you all know that Intel Xe/Arc works on non-4KiB
kernel page platforms (and honestly, it's great to use, especially for
games and media playback)!

[^1]: https://github.com/FanFansfan/loongson-linux/tree/loongarch-xe
[^2]: We maintained Shang Yatsen's patch until our v6.13.3 tree, until
      we decided to test and send this series upstream,
      https://github.com/AOSC-Tracking/linux/tree/aosc/v6.13.3
[^3]: Delicious hot pot!
      https://repo.aosc.io/ahvl/sample-videos-20250223.tar.zst

---
Matthew(s), Lucas, and Francois:

Thanks again for your patience and review.

I recently had a job change and it put me off this series for months, but
I'm back (and should be a lot more responsive now) - sorry! Let's get this
ball rolling again.

I was unfortunately unable to revise 1/5 from v1 as you requested, neither
of your suggestions to allow allocation of VRAM smaller than page size
worked... So I kept that part as is.

As for the your comment in 5/5, I'm not sure about what the right approach
to implement a SZ_64K >= PAGE_SIZE assert was, as there are many other
instances of similar ternary conditional operators in the xe code. Correct
me if I'm wrong but I felt that it might be better handled in a separate
patch series?

---
Changes in v2:

- Define `GUC_ALIGN' and use them in GuC code to improve clarity.
- Update documentation on `DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT'.
- Rebase, and other minor changes.
- Link to v1:
  https://lore.kernel.org/all/20250226-xe-non-4k-fix-v1-0-80f23b5ee40e@aosc.io/

To: Lucas De Marchi <lucas.demarchi@intel.com>
To: Thomas Hellström <thomas.hellstrom@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: José Roberto de Souza <jose.souza@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
To: Alan Previn <alan.previn.teres.alexis@intel.com>
To: Zhanjun Dong <zhanjun.dong@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
To: Mateusz Naklicki <mateusz.naklicki@intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Suggested-by: Kexy Biscuit <kexybiscuit@aosc.io>
Co-developed-by: Shang Yatsen <429839446@qq.com>
Signed-off-by: Shang Yatsen <429839446@qq.com>
Signed-off-by: Mingcong Bai <jeffbai@aosc.io>

---
Mingcong Bai (5):
      drm/xe/bo: fix alignment with non-4KiB kernel page sizes
      drm/xe/guc: use GUC_SIZE (SZ_4K) for alignment
      drm/xe/regs: fix RING_CTL_SIZE(size) calculation
      drm/xe: use 4KiB alignment for cursor jumps
      drm/xe/query: use PAGE_SIZE as the minimum page alignment

 drivers/gpu/drm/xe/regs/xe_engine_regs.h |  2 +-
 drivers/gpu/drm/xe/xe_bo.c               |  8 ++++----
 drivers/gpu/drm/xe/xe_guc.c              |  4 ++--
 drivers/gpu/drm/xe/xe_guc.h              |  3 +++
 drivers/gpu/drm/xe/xe_guc_ads.c          | 32 ++++++++++++++++----------------
 drivers/gpu/drm/xe/xe_guc_capture.c      |  8 ++++----
 drivers/gpu/drm/xe/xe_guc_ct.c           |  2 +-
 drivers/gpu/drm/xe/xe_guc_log.c          |  5 +++--
 drivers/gpu/drm/xe/xe_guc_pc.c           |  4 ++--
 drivers/gpu/drm/xe/xe_migrate.c          |  4 ++--
 drivers/gpu/drm/xe/xe_query.c            |  2 +-
 include/uapi/drm/xe_drm.h                |  7 +++++--
 12 files changed, 44 insertions(+), 37 deletions(-)
---
base-commit: 546b1c9e93c2bb8cf5ed24e0be1c86bb089b3253
change-id: 20250603-upstream-xe-non-4k-v2-4acf253c9bfd

Best regards,
-- 
Mingcong Bai <jeffbai@aosc.io>


