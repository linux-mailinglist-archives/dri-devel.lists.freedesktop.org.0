Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E993BB0359B
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 07:23:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5722B10E21D;
	Mon, 14 Jul 2025 05:23:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43E3C10E21D
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 05:23:24 +0000 (UTC)
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-665-PfNXZXlROSGtk2g2Pj-SXw-1; Mon,
 14 Jul 2025 01:23:20 -0400
X-MC-Unique: PfNXZXlROSGtk2g2Pj-SXw-1
X-Mimecast-MFC-AGG-ID: PfNXZXlROSGtk2g2Pj-SXw_1752470598
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 4D21C1801207; Mon, 14 Jul 2025 05:23:18 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.67.32.31])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 45D6C1977000; Mon, 14 Jul 2025 05:23:12 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Johannes Weiner <hannes@cmpxchg.org>,
 Christian Koenig <christian.koenig@amd.com>
Cc: Dave Chinner <david@fromorbit.com>, Kairui Song <kasong@tencent.com>,
 Dave Airlie <airlied@redhat.com>, Shakeel Butt <shakeel.butt@linux.dev>
Subject: [PATCH 03/18] mm/list_lru: export list_lru_add.
Date: Mon, 14 Jul 2025 15:18:18 +1000
Message-ID: <20250714052243.1149732-4-airlied@gmail.com>
In-Reply-To: <20250714052243.1149732-1-airlied@gmail.com>
References: <20250714052243.1149732-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ymUBJqaG26cwlb2B1B-YpOnNHzKbMH-Px5K-KtuYzjI_1752470598
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

