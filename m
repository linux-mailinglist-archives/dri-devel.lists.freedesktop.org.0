Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56318A99AE4
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 23:43:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 880B910E2C4;
	Wed, 23 Apr 2025 21:43:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D8B310E26E
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 21:43:41 +0000 (UTC)
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-29-NCx2YT8_M9m2dr-sRLWJhA-1; Wed,
 23 Apr 2025 17:43:35 -0400
X-MC-Unique: NCx2YT8_M9m2dr-sRLWJhA-1
X-Mimecast-MFC-AGG-ID: NCx2YT8_M9m2dr-sRLWJhA_1745444614
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 249F41800368; Wed, 23 Apr 2025 21:43:34 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.64.136.98])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id EF83B19560A3; Wed, 23 Apr 2025 21:43:31 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org, tj@kernel.org, christian.koenig@amd.com
Cc: cgroups@vger.kernel.org
Subject: [PATCH 2/5] memcg: export stat change function
Date: Thu, 24 Apr 2025 07:37:04 +1000
Message-ID: <20250423214321.100440-3-airlied@gmail.com>
In-Reply-To: <20250423214321.100440-1-airlied@gmail.com>
References: <20250423214321.100440-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HChqqQ3mXDrY1_kqdMH33SUFUMo_tTZ-9D17x67jIRE_1745444614
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

In order for modular GPU memory mgmt TTM to adjust the GPU
statistic we need to export the stat change functionality.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 mm/memcontrol.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 25471a0fd0be..68b23a03d2a6 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -709,6 +709,7 @@ void __mod_memcg_state(struct mem_cgroup *memcg, enum m=
emcg_stat_item idx,
 =09memcg_rstat_updated(memcg, val);
 =09trace_mod_memcg_state(memcg, idx, val);
 }
+EXPORT_SYMBOL_GPL(__mod_memcg_state);
=20
 #ifdef CONFIG_MEMCG_V1
 /* idx can be of type enum memcg_stat_item or node_stat_item. */
--=20
2.49.0

