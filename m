Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 066CF7655F8
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 16:30:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86F1410E591;
	Thu, 27 Jul 2023 14:30:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96CA210E58F
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 14:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0iCjhOni/u1jiZ/HGpF3fwz7NRQaQ01ateivGvD5VaY=; b=qbJV0vB5e0yNu7N6n8vf5Lwp6m
 HSV0QQTrJSkLLgj5p9nqgz0la8lBhHOS7LmVp7OpJ2dkrPpP8deLFaHOp0VKIrB7Moo3PHq8oinlE
 wXpkCl0nHHvD/1hC9NeOXeiWUbRPUbYuMjGizXPQ4kQxtv6CHB4hOwLLGtXbRK3hWM/LHO3TJ2gY0
 0va5OBkmKJirx1X5PlleB4BNWDqCYSeYQ0QyZn/wk+dGE9cOkiTwU50O8eEm7W2mORDfjSulTUf53
 hctTB81uabHuGl4wa0R8huMNQx0bOB1WSoL/FcuotXUz2vYl0u+eBkymGXrs5giFhsW0KiVyqIN0T
 X+opQSJQ==;
Received: from [187.36.235.191] (helo=morissey..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qP207-004gQz-Aw; Thu, 27 Jul 2023 16:29:59 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Emma Anholt <emma@anholt.net>, Melissa Wen <mwen@igalia.com>,
 Chema Casanova <jmcasanova@igalia.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 0/2] drm/v3d: Expose GPU usage stats
Date: Thu, 27 Jul 2023 11:23:26 -0300
Message-ID: <20230727142929.1275149-1-mcanal@igalia.com>
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
debugfs interface.

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

Maíra Canal (2):
  drm/v3d: Implement show_fdinfo() callback for GPU usage stats
  drm/v3d: Expose the total GPU usage stats on debugfs

 drivers/gpu/drm/v3d/v3d_debugfs.c | 27 ++++++++++++++++++++++++
 drivers/gpu/drm/v3d/v3d_drv.c     | 30 +++++++++++++++++++++++++-
 drivers/gpu/drm/v3d/v3d_drv.h     | 26 +++++++++++++++++++++++
 drivers/gpu/drm/v3d/v3d_gem.c     |  6 +++++-
 drivers/gpu/drm/v3d/v3d_irq.c     | 33 +++++++++++++++++++++++++++++
 drivers/gpu/drm/v3d/v3d_sched.c   | 35 +++++++++++++++++++++++++++++++
 6 files changed, 155 insertions(+), 2 deletions(-)

--
2.41.0

