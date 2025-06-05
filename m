Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E80ACEA0B
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 08:20:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C92A310E266;
	Thu,  5 Jun 2025 06:20:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BF5810E266
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 06:20:13 +0000 (UTC)
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-646-nJUD-KwOOJW-4DuoSDoKsQ-1; Thu,
 05 Jun 2025 02:20:03 -0400
X-MC-Unique: nJUD-KwOOJW-4DuoSDoKsQ-1
X-Mimecast-MFC-AGG-ID: nJUD-KwOOJW-4DuoSDoKsQ_1749104401
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 89E83195608C; Thu,  5 Jun 2025 06:20:01 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.64.136.101])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 9D58F19560B8; Thu,  5 Jun 2025 06:19:57 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Christian Koenig <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, Dave Airlie <airlied@redhat.com>,
 Kairui Song <kasong@tencent.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Shakeel Butt <shakeel.butt@linux.dev>
Subject: [PATCH 1/5] mm/list_lru: export list_lru_add.
Date: Thu,  5 Jun 2025 16:19:21 +1000
Message-ID: <20250605061951.1234583-2-airlied@gmail.com>
In-Reply-To: <20250605061951.1234583-1-airlied@gmail.com>
References: <20250605061951.1234583-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1k4KECuXRTYAOSSQR1UdJ5IUPASWQe3gvs44zJU5ZVU_1749104401
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
content-type: text/plain; charset=WINDOWS-1252; x-default=true
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

From: Dave Airlie <airlied@redhat.com>

DRM/TTM wants to use this for it's page pool
LRU tracking.

This effective is a revert of
78c0ed09131b772f062b986a2fcca6600daa6285
Author: Kairui Song <kasong@tencent.com>
Date:   Tue Nov 5 01:52:53 2024 +0800

    mm/list_lru: don't export list_lru_add

Cc: Kairui Song <kasong@tencent.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>
Cc: Shakeel Butt <shakeel.butt@linux.dev>
Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 mm/list_lru.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/list_lru.c b/mm/list_lru.c
index 490473af3122..315362e3df3d 100644
--- a/mm/list_lru.c
+++ b/mm/list_lru.c
@@ -175,6 +175,7 @@ bool list_lru_add(struct list_lru *lru, struct list_hea=
d *item, int nid,
 =09unlock_list_lru(l, false);
 =09return false;
 }
+EXPORT_SYMBOL_GPL(list_lru_add);
=20
 bool list_lru_add_obj(struct list_lru *lru, struct list_head *item)
 {
--=20
2.49.0

