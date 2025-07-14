Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80619B035A7
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 07:24:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D050F10E396;
	Mon, 14 Jul 2025 05:24:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0919210E396
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 05:24:26 +0000 (UTC)
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-682-vq_rRUO6PtmqjX6xO_I5Dg-1; Mon,
 14 Jul 2025 01:24:24 -0400
X-MC-Unique: vq_rRUO6PtmqjX6xO_I5Dg-1
X-Mimecast-MFC-AGG-ID: vq_rRUO6PtmqjX6xO_I5Dg_1752470663
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 30E85180028B; Mon, 14 Jul 2025 05:24:23 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.67.32.31])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id B93F31977000; Mon, 14 Jul 2025 05:24:18 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Johannes Weiner <hannes@cmpxchg.org>,
 Christian Koenig <christian.koenig@amd.com>
Cc: Dave Chinner <david@fromorbit.com>, Kairui Song <kasong@tencent.com>,
 Dave Airlie <airlied@redhat.com>
Subject: [PATCH 15/18] memcontrol: allow objcg api when memcg is config off.
Date: Mon, 14 Jul 2025 15:18:30 +1000
Message-ID: <20250714052243.1149732-16-airlied@gmail.com>
In-Reply-To: <20250714052243.1149732-1-airlied@gmail.com>
References: <20250714052243.1149732-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YicDnG43JRNSpKGXZjpmAvKlRppu-Zrzu9fb8pbb6jU_1752470663
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

amdgpu wants to use the objcg api and not have to enable ifdef
around it, so just add a dummy function for the config off path.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 include/linux/memcontrol.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
index 21328f207d38..55f7ab318eef 100644
--- a/include/linux/memcontrol.h
+++ b/include/linux/memcontrol.h
@@ -1756,6 +1756,11 @@ static inline void __memcg_kmem_uncharge_page(struct=
 page *page, int order)
 {
 }
=20
+static inline struct obj_cgroup *get_obj_cgroup_from_current(void)
+{
+=09return NULL;
+}
+
 static inline struct obj_cgroup *get_obj_cgroup_from_folio(struct folio *f=
olio)
 {
 =09return NULL;
--=20
2.49.0

