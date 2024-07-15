Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 697AD930EF9
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 09:42:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D36C310E132;
	Mon, 15 Jul 2024 07:42:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D575010E132
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 07:42:01 +0000 (UTC)
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-515-hQwXsMs6OYeClxwyXH7yvA-1; Mon,
 15 Jul 2024 03:40:31 -0400
X-MC-Unique: hQwXsMs6OYeClxwyXH7yvA-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 5F6D41955D4C
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 07:40:30 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.64.136.25])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 258C6300018E
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 07:40:28 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/test: fix the gem shmem test to map the sg table.
Date: Mon, 15 Jul 2024 17:40:26 +1000
Message-ID: <20240715074026.777378-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252; x-default=true
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

The test here creates an sg table, but never maps it, when
we get to drm_gem_shmem_free, the helper tries to unmap and this
causes warnings on some platforms and debug kernels.

For now, set the dma mask (to avoid swiotlb) and map the sgtable.

Fixes: 93032ae634d4 ("drm/test: add a test suite for GEM objects backed by =
shmem")
Cc: stable@vger.kernel.org
---
 drivers/gpu/drm/tests/drm_gem_shmem_test.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_gem_shmem_test.c b/drivers/gpu/drm/t=
ests/drm_gem_shmem_test.c
index 91202e40cde9..eb3a7a84be90 100644
--- a/drivers/gpu/drm/tests/drm_gem_shmem_test.c
+++ b/drivers/gpu/drm/tests/drm_gem_shmem_test.c
@@ -102,6 +102,17 @@ static void drm_gem_shmem_test_obj_create_private(stru=
ct kunit *test)
=20
 =09sg_init_one(sgt->sgl, buf, TEST_SIZE);
=20
+=09/*
+=09 * Set the DMA mask to 64-bits and map the sgtables
+=09 * otherwise drm_gem_shmem_free will cause a warning
+=09 * on debug kernels.
+=09 * */
+=09ret =3D dma_set_mask(drm_dev->dev, DMA_BIT_MASK(64));
+=09KUNIT_ASSERT_EQ(test, ret, 0);
+
+=09ret =3D dma_map_sgtable(drm_dev->dev, sgt, DMA_BIDIRECTIONAL, 0);
+=09KUNIT_ASSERT_EQ(test, ret, 0);
+
 =09/* Init a mock DMA-BUF */
 =09buf_mock.size =3D TEST_SIZE;
 =09attach_mock.dmabuf =3D &buf_mock;
--=20
2.45.0

