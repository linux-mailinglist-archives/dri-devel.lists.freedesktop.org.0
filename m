Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 665DFAD83DE
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 09:15:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF9A310E8CB;
	Fri, 13 Jun 2025 07:15:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 007FA10E8CF;
 Fri, 13 Jun 2025 07:15:45 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 55D7FdDT701591; Fri, 13 Jun 2025 12:45:39 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 55D7Fcfo701590;
 Fri, 13 Jun 2025 12:45:38 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v1 0/2] debugfs support for pt base for each vm 
Date: Fri, 13 Jun 2025 12:45:35 +0530
Message-Id: <20250613071537.701563-1-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

root@amd-X570-AORUS-ELITE:~# cat /sys/kernel/debug/dri/0/clients
             command  tgid dev master a   uid      magic                                                             name client-id
      systemd-logind  1056   0   y    y     0          0                                                          <unset>     5
            Xwayland  1733 128   n    n   120          0                                                          <unset>     8
     mutter-x11-fram  2048 128   n    n   120          0                                                          <unset>     9
            ibus-x11  2071 128   n    n   120          0                                                          <unset>    10
root@amd-X570-AORUS-ELITE:~# cat /sys/kernel/debug/dri/0/client
client-1/  client-10/ client-2/  client-5/  client-8/  client-9/  clients
root@amd-X570-AORUS-ELITE:~# cat /sys/kernel/debug/dri/0/client-1
client-1/  client-10/
root@amd-X570-AORUS-ELITE:~# cat /sys/kernel/debug/dri/0/client-1
client-1/  client-10/
root@amd-X570-AORUS-ELITE:~# cat /sys/kernel/debug/dri/0/client-1/pt_base
81febf3000
root@amd-X570-AORUS-ELITE:~# cat /sys/kernel/debug/dri/0/client-5/pt_base
81febe9000
root@amd-X570-AORUS-ELITE:~# cat /sys/kernel/debug/dri/0/client-8/pt_base
81febdc000
root@amd-X570-AORUS-ELITE:~# cat /sys/kernel/debug/dri/0/client-9/pt_base
81febb2000
root@amd-X570-AORUS-ELITE:~# cat /sys/kernel/debug/dri/0/client-10/pt_base
81febaf000


Sunil Khatri (2):
  drm: add debugfs support per client-id
  amdgpu: add debugfs file for pt-base per client-id

 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c  | 14 +++++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h  |  4 +++-
 drivers/gpu/drm/drm_file.c              | 13 +++++++++++++
 include/drm/drm_file.h                  |  7 +++++++
 5 files changed, 37 insertions(+), 3 deletions(-)

-- 
2.34.1

