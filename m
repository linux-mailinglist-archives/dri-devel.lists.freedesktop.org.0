Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22AE6576F74
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jul 2022 16:44:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97C5B113302;
	Sat, 16 Jul 2022 14:37:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAAEA10E246
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Jul 2022 08:13:17 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id o15so7534051pjh.1
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Jul 2022 01:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1P8qGPqtLup1zCD2NBNT17hEogDJpB8QEo6UaLfvv0o=;
 b=Za/r1Bas6Hj9UBtwuo1lLNZ3ZyZMtKO+l1B9Y0JYO7wB6rPOvBrxmZC8IX8TnRNS8v
 x7lSB2226nubmuT3SYS5phSH95jSvUzuzbA8O1tKfLC/7Ia+WX4yzYZohO9nHYdKTlmr
 jNBrYKmTekEUUT1f8yXjZgliQfOZzLMhuKVuf552osnUwA5V8Hjd75t1e1GPfr3Cq6oX
 T0E1NQDefyIAZ04o8WgzQWtirp/wi27NY55bOxrxzvhyGpJwBzqMvV2i/TREbDeMT2rJ
 NWElPZqYguenrKXiJQfiarT56ACITUw3qfAju5hkp7b9cbME9MvNScQnIYV5Wx/5FJpT
 qsBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1P8qGPqtLup1zCD2NBNT17hEogDJpB8QEo6UaLfvv0o=;
 b=yUwZztv2d7kOWulLx8+kEw5pO6tOH1lGvQ5QEyNf5psgrio4oVkBfNyN3PSewPfcKD
 cL6xzjNxV09UG8fSOIPOkl/4J80K8FPPKtBExApCuhUNLwAwEL9jwBlo6Ti1JCe3ftF4
 DqLrSGGU78/xHQK1tsHt6c1jKKKG76NYy92ZHU5wuvmn5grI/ztnKJTv0HTAxqOGahSs
 B4yElNHy6RF2O8YX0S0wyfn8q9pxdCdJpKBxA1Td1NswG9UA5RVDKJZ2pPC8OsAlAjbr
 8/U1bis58Qkb5igMrqHy1FtCycriMk5eSOPh/vccov/VhZ5nTSEk6UlSODkPVScuh+MR
 GNrA==
X-Gm-Message-State: AJIora9C8grKKyhMwoSDe5LX6zG9TtRic/yrP+a32/YfxE5Ys8ZDe9G8
 VJKEQ1yBGICkPe2WuBiygQ==
X-Google-Smtp-Source: AGRyM1tnZq+/bLJYqGjgFo6Lzwy5BZtlWW05MsVDzdFLwTY1up1XNNTabOhGYPk+qtDSvW9aUsFfJg==
X-Received: by 2002:a17:90a:7ac4:b0:1ef:a606:4974 with SMTP id
 b4-20020a17090a7ac400b001efa6064974mr27026041pjl.51.1657959197244; 
 Sat, 16 Jul 2022 01:13:17 -0700 (PDT)
Received: from localhost.localdomain ([144.202.91.207])
 by smtp.gmail.com with ESMTPSA id
 o62-20020a625a41000000b0052b4f4c6a8fsm645838pfb.209.2022.07.16.01.13.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Jul 2022 01:13:16 -0700 (PDT)
From: Zheyu Ma <zheyuma97@gmail.com>
To: peter.senna@gmail.com, martin.donnelly@ge.com,
 martyn.welch@collabora.co.uk, andrzej.hajda@intel.com,
 narmstrong@baylibre.com, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm/bridge: megachips: Fix a null pointer dereference bug
Date: Sat, 16 Jul 2022 16:13:04 +0800
Message-Id: <20220716081304.2762135-1-zheyuma97@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Zheyu Ma <zheyuma97@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When removing the module we will get the following warning:

[   31.911505] i2c-core: driver [stdp2690-ge-b850v3-fw] unregistered
[   31.912484] general protection fault, probably for non-canonical address 0xdffffc0000000001: 0000 [#1] PREEMPT SMP KASAN PTI
[   31.913338] KASAN: null-ptr-deref in range [0x0000000000000008-0x000000000000000f]
[   31.915280] RIP: 0010:drm_bridge_remove+0x97/0x130
[   31.921825] Call Trace:
[   31.922533]  stdp4028_ge_b850v3_fw_remove+0x34/0x60 [megachips_stdpxxxx_ge_b850v3_fw]
[   31.923139]  i2c_device_remove+0x181/0x1f0

The two bridges (stdp2690, stdp4028) do not probe at the same time, so
the driver does not call ge_b850v3_resgiter() when probing, causing the
driver to try to remove the object that has not been initialized.

Fix this by checking whether both the bridges are probed.

Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
---
 drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
index cce98bf2a4e7..c68a4cdf4625 100644
--- a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
+++ b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
@@ -296,7 +296,9 @@ static void ge_b850v3_lvds_remove(void)
 	 * This check is to avoid both the drivers
 	 * removing the bridge in their remove() function
 	 */
-	if (!ge_b850v3_lvds_ptr)
+	if (!ge_b850v3_lvds_ptr ||
+		!ge_b850v3_lvds_ptr->stdp2690_i2c ||
+		!ge_b850v3_lvds_ptr->stdp4028_i2c)
 		goto out;
 
 	drm_bridge_remove(&ge_b850v3_lvds_ptr->bridge);
-- 
2.25.1

