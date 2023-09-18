Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 851187A459D
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 11:13:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 367FF10E230;
	Mon, 18 Sep 2023 09:13:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C67610E22D
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 09:13:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 024EA60B32;
 Mon, 18 Sep 2023 09:13:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DDF5C433C8;
 Mon, 18 Sep 2023 09:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695028415;
 bh=Q1Nlo5rS4kA9jhgQTGt3jiSP5WfvGZ4EYSbJ1TkoS9A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QSNKO3DBRY2YR1m0zZHnJ+2tkA6aSoq7ZhU/daQ14p4YyrVOEpGdWlcKzCVA7BLwh
 JOrugAzfQw6DGq1Hwmu6IvvME1/6Sm9lN+M6rDeIyGBA4yniU9jp/fH8P+tZloq5Pn
 4S2PYt3gHtWHXuP4ds1TI0J/sgxefy8u3OaHIBZ/u5fmoF61qV1zAWO5DgQQ30ZJeP
 YAzW5GG/7s3MdCedWFpRjYEJrEUB1xCw/jXyJSgdmTpdWIwyFo+hm9pS06g+zL/ONX
 T3wHXRyU9+7FyDihx/kO2jYRgkeTR/++5iW90scszqmuz+IgkSQ4vda2T3jIY52Ouc
 Pgf7+QTzDub/w==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 06/14] accel/habanalabs: add tsc clock sampling to clock sync
 info
Date: Mon, 18 Sep 2023 12:13:13 +0300
Message-Id: <20230918091321.855943-6-ogabbay@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230918091321.855943-1-ogabbay@kernel.org>
References: <20230918091321.855943-1-ogabbay@kernel.org>
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
Cc: Hen Alon <halon@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Hen Alon <halon@habana.ai>

Add tsc clock to clock sync info, to enable using this clock for
sampling and sync it with device time.

Signed-off-by: Hen Alon <halon@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/habanalabs_ioctl.c | 1 +
 include/uapi/drm/habanalabs_accel.h                | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/accel/habanalabs/common/habanalabs_ioctl.c b/drivers/accel/habanalabs/common/habanalabs_ioctl.c
index 8c3f1e2de2fe..a428226a0425 100644
--- a/drivers/accel/habanalabs/common/habanalabs_ioctl.c
+++ b/drivers/accel/habanalabs/common/habanalabs_ioctl.c
@@ -320,6 +320,7 @@ static int time_sync_info(struct hl_device *hdev, struct hl_info_args *args)
 
 	time_sync.device_time = hdev->asic_funcs->get_device_time(hdev);
 	time_sync.host_time = ktime_get_raw_ns();
+	time_sync.tsc_time = rdtsc();
 
 	return copy_to_user(out, &time_sync,
 		min((size_t) max_size, sizeof(time_sync))) ? -EFAULT : 0;
diff --git a/include/uapi/drm/habanalabs_accel.h b/include/uapi/drm/habanalabs_accel.h
index e7893b082bf8..dfe47db24ae6 100644
--- a/include/uapi/drm/habanalabs_accel.h
+++ b/include/uapi/drm/habanalabs_accel.h
@@ -991,6 +991,7 @@ struct hl_info_reset_count {
 struct hl_info_time_sync {
 	__u64 device_time;
 	__u64 host_time;
+	__u64 tsc_time;
 };
 
 /**
-- 
2.34.1

