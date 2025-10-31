Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91906C25E4F
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 16:48:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDC7910EB5C;
	Fri, 31 Oct 2025 15:48:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="dmAFNXU1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D95710EB5C
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 15:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1761925712;
 bh=gHumT17DRN7T7jK3X1sLtvXCast2XME5gO3ym/e5+Qk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dmAFNXU15vG1TrOr0Hh3EKsQzcX9CuX+zvoSYAci0rx9GyFEkRiJmplzqYkaAYuhA
 pc2buaT5P+oiOJmQSMK9nh/l/kiwJuq3C8iuhw5oCiNxtk/c7eXiTdo5lspRiuc8dq
 QR77aikVBtYSfzqIKqALraM85Clrn2i+adaNC8TR0LMPs3/o/LiPOz/jjsaZkCobxa
 J6NgxPrMZW/cIBHHXf2lJzmnN6X8fBYfzFLD8mFnv6hnFaupuUTm+f1HnwylPGPxAF
 YXlBA0kh8Xihz/M4zfp4Es0IbWl7szGzvc/MyuRv+3Ew1VcJ5RGokr/pifugoEAzSN
 JK5eOOHwWAA3w==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id C5EB417E140C;
 Fri, 31 Oct 2025 16:48:31 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
 Lars-Ivar Hesselberg Simonsen <lars-ivar.simonsen@arm.com>,
 kernel@collabora.com
Subject: [PATCH v1 4/4] drm/panthor: Relax check in panthor_sched_pre_reset()
Date: Fri, 31 Oct 2025 16:48:18 +0100
Message-ID: <20251031154818.821054-5-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251031154818.821054-1-boris.brezillon@collabora.com>
References: <20251031154818.821054-1-boris.brezillon@collabora.com>
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

A group can become runnable even after reset.in_progress has
been set to true and panthor_sched_suspend() has been called,
because the drm_sched queues are still running at that point,
and ::run_job() might call group_schedule_locked() which moves
the group to the runnable list. And that's fine, because we're
moving those groups to the stopped list anyway when we call
panthor_group_stop(), so just drop the misleading WARN_ON().

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_sched.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index fc0826db8f48..51a8d842a7a3 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -2835,8 +2835,6 @@ void panthor_sched_pre_reset(struct panthor_device *ptdev)
 	 * new jobs while we're resetting.
 	 */
 	for (i = 0; i < ARRAY_SIZE(sched->groups.runnable); i++) {
-		/* All groups should be in the idle lists. */
-		drm_WARN_ON(&ptdev->base, !list_empty(&sched->groups.runnable[i]));
 		list_for_each_entry_safe(group, group_tmp, &sched->groups.runnable[i], run_node)
 			panthor_group_stop(group);
 	}
-- 
2.51.0

