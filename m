Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A801AC04E2
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 08:56:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81C9D9B00F;
	Thu, 22 May 2025 06:56:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E5E299DD5
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 06:55:39 +0000 (UTC)
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-647-j-ZVubgWMCqL8tOq-4EzIg-1; Thu,
 22 May 2025 02:55:33 -0400
X-MC-Unique: j-ZVubgWMCqL8tOq-4EzIg-1
X-Mimecast-MFC-AGG-ID: j-ZVubgWMCqL8tOq-4EzIg_1747896932
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id A8BBA1955D83; Thu, 22 May 2025 06:55:32 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.64.136.70])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id C7AB71958014; Thu, 22 May 2025 06:55:30 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org,
	tzimmermann@suse.de
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 3/9] firmware/tegra: avoid accessing iosys_map internals.
Date: Thu, 22 May 2025 16:52:12 +1000
Message-ID: <20250522065519.318013-4-airlied@gmail.com>
In-Reply-To: <20250522065519.318013-1-airlied@gmail.com>
References: <20250522065519.318013-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mBJv4H8MESpQ4mPevSp4nP9elVWVN7Igi2TS5W7BWho_1747896932
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

Use the new accessor interfaces to avoid directly accessing the
internals.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/firmware/tegra/ivc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/tegra/ivc.c b/drivers/firmware/tegra/ivc.c
index 8c9aff9804c0..eb59acb08065 100644
--- a/drivers/firmware/tegra/ivc.c
+++ b/drivers/firmware/tegra/ivc.c
@@ -629,18 +629,18 @@ static inline void iosys_map_copy(struct iosys_map *d=
st, const struct iosys_map
=20
 static inline unsigned long iosys_map_get_address(const struct iosys_map *=
map)
 {
-=09if (map->is_iomem)
-=09=09return (unsigned long)map->vaddr_iomem;
+=09if (iosys_map_is_iomem(map)
+=09=09return (unsigned long)iosys_map_ioptr(map);
=20
-=09return (unsigned long)map->vaddr;
+=09return (unsigned long)iosys_map_ptr(map);
 }
=20
 static inline void *iosys_map_get_vaddr(const struct iosys_map *map)
 {
-=09if (WARN_ON(map->is_iomem))
+=09if (WARN_ON(iosys_map_is_iomem(map)))
 =09=09return NULL;
=20
-=09return map->vaddr;
+=09return iosys_map_ptr(map);
 }
=20
 int tegra_ivc_init(struct tegra_ivc *ivc, struct device *peer, const struc=
t iosys_map *rx,
--=20
2.49.0

