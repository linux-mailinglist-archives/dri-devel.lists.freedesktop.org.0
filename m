Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16015773121
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 23:19:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7F1E10E37D;
	Mon,  7 Aug 2023 21:19:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ECA910E382
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Aug 2023 21:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1B0Ej7TobdhprMENYb/HfXDNypmNnCAX9hWYxsODeT8=; b=jGDkCtcmm7wgLuDfNLmk98SQZc
 qtyQ6jvaTceJo72i72bfRlCYYoV2JaN8dCtCAnqtBTXLGg4mMd9RnmA2U5zolSCh2wWpnpLkybmnw
 LDyszwa04GXkAdgu/QFa1iC065WZ6wYY3Ct75s2+TdX8HTn3tAd2ng8bgYNblsVE9qhKF83lpUrIh
 C2e11pIeRhPc5O22t8Dh/KrLHTgUJDvGcavJUYAQ3VjL773fjYoM5EafefLnbpa079aFZb9EHwz90
 2R3z7903Lc+30nv3Fv3KoxI1S3FsxE1xS2pQ8I4CK8o/xK5/WPENtyvuL/+TLgow9cr3UujTJ9uLq
 sOUgR+jw==;
Received: from [177.34.168.16] (helo=morissey..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qT7dG-00F1NC-Vc; Mon, 07 Aug 2023 23:19:19 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Emma Anholt <emma@anholt.net>, Melissa Wen <mwen@igalia.com>,
 Chema Casanova <jmcasanova@igalia.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rob Clark <robdclark@gmail.com>
Subject: [PATCH v2 0/2] drm/v3d: Expose GPU usage stats
Date: Mon,  7 Aug 2023 18:12:53 -0300
Message-ID: <20230807211849.49867-1-mcanal@igalia.com>
X-Mailer: git-send-email 2.41.0
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
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>, kernel-dev@igalia.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchset exposes GPU usages stats both globally and per-file
descriptor.

The first patch exposes the accumulated amount of active time per client
through the fdinfo infrastructure. The amount of active time is exposed
for each V3D queue. Moreover, it exposes the number of jobs submitted to
each queue.

The second patch exposes the accumulated amount of active time for each
V3D queue, independent of the client. This data is exposed through the
sysfs interface.

With these patches, it is possible to calculate the GPU usage percentage
per queue globally and per-file descriptor.

* Example fdinfo output:

$ cat /proc/1140/fdinfo/4
pos:    0
flags:  02400002
mnt_id: 24
ino:    209
drm-driver:     v3d
drm-client-id:  44
drm-engine-bin:         1661076898 ns
v3d-jobs-bin:   19576 jobs
drm-engine-render:      31469427170 ns
v3d-jobs-render:        19575 jobs
drm-engine-tfu:         5002964 ns
v3d-jobs-tfu:   13 jobs
drm-engine-csd:         188038329691 ns
v3d-jobs-csd:   250393 jobs
drm-engine-cache_clean:         27736024038 ns
v3d-jobs-cache_clean:   250392 job

* Example gputop output:

DRM minor 128
 PID         bin               render               tfu                csd            cache_clean     NAME
1140 |▎                ||██▋               ||                 ||█████████████▍   ||█▋               | computecloth
1158 |▍                ||████████▉         ||                 ||                 ||                 | gears
1002 |▏                ||█▎                ||                 ||                 ||                 | chromium-browse

Best Regards,
- Maíra
---

v1 -> v2: https://lore.kernel.org/dri-devel/20230727142929.1275149-1-mcanal@igalia.com/T/

* Use sysfs to expose global GPU stats (Tvrtko Ursulin)

Maíra Canal (2):
  drm/v3d: Implement show_fdinfo() callback for GPU usage stats
  drm/v3d: Expose the total GPU usage stats on sysfs

 drivers/gpu/drm/v3d/Makefile    |   3 +-
 drivers/gpu/drm/v3d/v3d_drv.c   |  39 +++++++++++-
 drivers/gpu/drm/v3d/v3d_drv.h   |  30 ++++++++++
 drivers/gpu/drm/v3d/v3d_gem.c   |   6 +-
 drivers/gpu/drm/v3d/v3d_irq.c   |  33 +++++++++++
 drivers/gpu/drm/v3d/v3d_sched.c |  35 +++++++++++
 drivers/gpu/drm/v3d/v3d_sysfs.c | 101 ++++++++++++++++++++++++++++++++
 7 files changed, 244 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/v3d/v3d_sysfs.c

--
2.41.0

