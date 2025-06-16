Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C693ADACE9
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 12:05:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EAF910E309;
	Mon, 16 Jun 2025 10:05:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 105E110E309;
 Mon, 16 Jun 2025 10:05:11 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 55GA54UB1204188; Mon, 16 Jun 2025 15:35:04 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 55GA54G51204187;
 Mon, 16 Jun 2025 15:35:04 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v2 0/2] Support for debugfs directory for each client-id in
 /dri directory
Date: Mon, 16 Jun 2025 15:35:01 +0530
Message-Id: <20250616100503.1204166-1-sunil.khatri@amd.com>
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

Add support of debugfs for client-id so information specific to each
client could be added by corresponding driver such as page table and
queues associted etc.

For amdgpu below is the information and data stucture added:

----------------------------------------------------------------------------------------------------------------------------------
root@amd-X570-AORUS-ELITE:/sys/kernel/debug/dri# cat 128/clients
             command  tgid dev master a   uid      magic                                                             name client-id
      systemd-logind  1049   0   y    y     0          0                                                          <unset>     5
            Xwayland  1706 128   n    n   120          0                                                          <unset>     8
     mutter-x11-fram  2019 128   n    n   120          0                                                          <unset>     9
            ibus-x11  2046 128   n    n   120          0                                                          <unset>    10
root@amd-X570-AORUS-ELITE:/sys/kernel/debug/dri# cat client-5/
0/            pt_base_info
root@amd-X570-AORUS-ELITE:/sys/kernel/debug/dri# cat client-5/pt_base_info
pid: 1049
comm: systemd-logind
pt_base: 0x81febe9000
root@amd-X570-AORUS-ELITE:/sys/kernel/debug/dri# cat client-8/pt_base_info
pid: 1706
comm: Xwayland
pt_base: 0x81febdc000
-------------------------------------------------------------------------------------------------------------------------------------

Sunil Khatri (2):
  drm/debugfs: add client-id to the debugfs entry
  drm: add debugfs support on per client-id basis

 drivers/gpu/drm/drm_debugfs.c | 10 ++++++----
 drivers/gpu/drm/drm_file.c    | 26 ++++++++++++++++++++++++++
 include/drm/drm_device.h      |  4 ++++
 include/drm/drm_file.h        |  7 +++++++
 4 files changed, 43 insertions(+), 4 deletions(-)

-- 
2.34.1

