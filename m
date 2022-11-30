Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B29063E0C6
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 20:27:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A299F10E4C5;
	Wed, 30 Nov 2022 19:27:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B680510E4BF
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 19:26:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 58B01B81CB9;
 Wed, 30 Nov 2022 19:26:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 03E5FC433D7;
 Wed, 30 Nov 2022 19:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669836417;
 bh=eGxCBq4O41tTc8mDmCMEenf4+pdEKzXIQVDsrXmmHGk=;
 h=From:Date:Subject:References:In-Reply-To:To:Reply-To:From;
 b=iz1wT935Q2y9Us9G47tu/AGAMnOuZNSOtAFvHJORpvQNDbUE2YTjC6gXaK1JhPulS
 ODrPeJ5A3M2M0d3QJU9gkcs1tK1iaxcYX502GwGFudEi14cL5EC8qtJagSv+61+3uU
 dFJ5yrqDt5LG/UmeITZswnSgKOqFbqpF5Ij3maHfy39B7iHXKI7bhwHUQtaMny0DSu
 HSJqyaVtzsWM3IhUend0TFT7HZAZmA/RZ9VKBVPEWYRxBa61tHr6kJMpl2Sz0TzPG0
 xDZ/1bGqrqcoE8C7q2//RChUZuBNMfHy0OeD25YbX0eBTXH7RepXBl2yG7f4YpnAfk
 vqwYskVjylk6Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id D4D4AC47089;
 Wed, 30 Nov 2022 19:26:56 +0000 (UTC)
From: Noralf =?utf-8?q?Tr=C3=B8nnes?= via B4 Submission Endpoint
 <devnull+noralf.tronnes.org@kernel.org>
Date: Wed, 30 Nov 2022 20:26:49 +0100
Subject: [PATCH v2 1/6] drm/gud: Fix UBSAN warning
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221122-gud-shadow-plane-v2-1-435037990a83@tronnes.org>
References: <20221122-gud-shadow-plane-v2-0-435037990a83@tronnes.org>
In-Reply-To: <20221122-gud-shadow-plane-v2-0-435037990a83@tronnes.org>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 stable@kernel.org,
 Noralf =?unknown-8bit?q?Tr=C3=B8nnes?= <noralf@tronnes.org>
X-Mailer: b4 0.11.0-dev-cc6f6
X-Developer-Signature: v=1; a=ed25519-sha256; t=1669836415; l=3300;
 i=noralf@tronnes.org; s=20221122; h=from:subject:message-id;
 bh=PzSe1nnPqjEXoHU8M/VpXxhI5a+C9xTR6TXu27/NDkc=; =?utf-8?q?b=3DyT+ErcyFJVZW?=
 =?utf-8?q?9kNrwpFsB7sGEK2idvseX80LS5xiton+0aVSKQvSkxz9uyTQM1uDW1zsy1FNJk14?=
 D6VkzGFLA0S7E0+SRZ0zpj2JGnrjiIpHJAHLMzuEgsNeTr5Ouq+i
X-Developer-Key: i=noralf@tronnes.org; a=ed25519;
 pk=0o9is4iddvvlrY3yON5SVtAbgPnVs0LfQsjfqR2Hvz8=
X-Endpoint-Received: by B4 Submission Endpoint for noralf@tronnes.org/20221122
 with auth_id=8
X-Original-From: Noralf =?utf-8?q?Tr=C3=B8nnes?= <noralf@tronnes.org>
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
Reply-To: noralf@tronnes.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Noralf Trønnes <noralf@tronnes.org>

UBSAN complains about invalid value for bool:

[  101.165172] [drm] Initialized gud 1.0.0 20200422 for 2-3.2:1.0 on minor 1
[  101.213360] gud 2-3.2:1.0: [drm] fb1: guddrmfb frame buffer device
[  101.213426] usbcore: registered new interface driver gud
[  101.989431] ================================================================================
[  101.989441] UBSAN: invalid-load in linux/include/linux/iosys-map.h:253:9
[  101.989447] load of value 121 is not a valid value for type '_Bool'
[  101.989451] CPU: 1 PID: 455 Comm: kworker/1:6 Not tainted 5.18.0-rc5-gud-5.18-rc5 #3
[  101.989456] Hardware name: Hewlett-Packard HP EliteBook 820 G1/1991, BIOS L71 Ver. 01.44 04/12/2018
[  101.989459] Workqueue: events_long gud_flush_work [gud]
[  101.989471] Call Trace:
[  101.989474]  <TASK>
[  101.989479]  dump_stack_lvl+0x49/0x5f
[  101.989488]  dump_stack+0x10/0x12
[  101.989493]  ubsan_epilogue+0x9/0x3b
[  101.989498]  __ubsan_handle_load_invalid_value.cold+0x44/0x49
[  101.989504]  dma_buf_vmap.cold+0x38/0x3d
[  101.989511]  ? find_busiest_group+0x48/0x300
[  101.989520]  drm_gem_shmem_vmap+0x76/0x1b0 [drm_shmem_helper]
[  101.989528]  drm_gem_shmem_object_vmap+0x9/0xb [drm_shmem_helper]
[  101.989535]  drm_gem_vmap+0x26/0x60 [drm]
[  101.989594]  drm_gem_fb_vmap+0x47/0x150 [drm_kms_helper]
[  101.989630]  gud_prep_flush+0xc1/0x710 [gud]
[  101.989639]  ? _raw_spin_lock+0x17/0x40
[  101.989648]  gud_flush_work+0x1e0/0x430 [gud]
[  101.989653]  ? __switch_to+0x11d/0x470
[  101.989664]  process_one_work+0x21f/0x3f0
[  101.989673]  worker_thread+0x200/0x3e0
[  101.989679]  ? rescuer_thread+0x390/0x390
[  101.989684]  kthread+0xfd/0x130
[  101.989690]  ? kthread_complete_and_exit+0x20/0x20
[  101.989696]  ret_from_fork+0x22/0x30
[  101.989706]  </TASK>
[  101.989708] ================================================================================

The source of this warning is in iosys_map_clear() called from
dma_buf_vmap(). It conditionally sets values based on map->is_iomem. The
iosys_map variables are allocated uninitialized on the stack leading to
->is_iomem having all kinds of values and not only 0/1.

Fix this by zeroing the iosys_map variables.

Fixes: 40e1a70b4aed ("drm: Add GUD USB Display driver")
Cc: <stable@vger.kernel.org> # v5.18+
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
---
 drivers/gpu/drm/gud/gud_pipe.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
index 7c6dc2bcd14a..61f4abaf1811 100644
--- a/drivers/gpu/drm/gud/gud_pipe.c
+++ b/drivers/gpu/drm/gud/gud_pipe.c
@@ -157,8 +157,8 @@ static int gud_prep_flush(struct gud_device *gdrm, struct drm_framebuffer *fb,
 {
 	struct dma_buf_attachment *import_attach = fb->obj[0]->import_attach;
 	u8 compression = gdrm->compression;
-	struct iosys_map map[DRM_FORMAT_MAX_PLANES];
-	struct iosys_map map_data[DRM_FORMAT_MAX_PLANES];
+	struct iosys_map map[DRM_FORMAT_MAX_PLANES] = { };
+	struct iosys_map map_data[DRM_FORMAT_MAX_PLANES] = { };
 	struct iosys_map dst;
 	void *vaddr, *buf;
 	size_t pitch, len;

-- 
2.34.1
