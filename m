Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B08E4E6FA1
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 09:49:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 427DB10E9C6;
	Fri, 25 Mar 2022 08:49:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7832110E8D8
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 13:40:38 +0000 (UTC)
Received: by mail-yb1-xb4a.google.com with SMTP id
 j133-20020a25d28b000000b006337bb01016so3577571ybg.11
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 06:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=C/BnJKMJEeV8BFoBzBXZm96RIax/W1fb5Ij7o/AsFUY=;
 b=I5r3XueZuY2fFEJBQooGi7gGjzI2M6XTWZJbSSqpBHqZEDBRjs23ELQv+MaLam20gS
 HOUvaKIvKTzfDuxnGlhWHV1awOQClZC13qC5dYMPd6LdPodeULLxGTuIykA4wXX8DKPT
 t5CDgvB3VSiLzr4FTuibjgE3YNSQ9WeikcXR1mD1GBmZI8JqNdFBG/wyO9AFpvG2qv6e
 EjiewN5jQCS4w6yTZRu0uFg29AprjobE7MxGZLR5e3f11tpuOXDqu4LFZ1TQR0wPtoMV
 Nhf+WkQSCcPhfzmx91IPOQedBHGJhzcnFoJ3RoAKIygBAplidLdh8VikpiAYWZYVIhBN
 swAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=C/BnJKMJEeV8BFoBzBXZm96RIax/W1fb5Ij7o/AsFUY=;
 b=jsEJvRhswN3ENxYX5/PCz+7MySzmT1wSta5JLmpwxAxCmgXwdHscNuO4aihEn+I9F8
 wxqTZqQWCs/N7OtfWxFf/QUpQDj1NJghuAcXOiavCuKKwbaM96Roc1U3qHZnXi30YAMj
 MGGxkJm91ji7qUQDBCzsA8pfA/s/A1yhaVu0hIC4zzQqcbOKv9nLovYiaCXwg8Uwvt8H
 5L/BELtgJu8qblGtWD3idGDsEGY6UzJoVMQyyYzgi9KdGYgZflIKLowP7VxHfW+Lglys
 wKMMeBUyMBBrq5O8QkoN2H3yeLBpv50tVBD5GDQn+1m1n9xEV+++V4jvkF5eglYWpfEw
 Nb/g==
X-Gm-Message-State: AOAM533MB6hLPen1mjEsgKeecE2ueBY5oXKrnnMSWGcNIMOtdLvU0rAQ
 WxwSM8RiMwifK69TBDKJgD+x2C+u3Iit
X-Google-Smtp-Source: ABdhPJweQHmVV0UUx5aJF4XSf3mwT0CfS9APEo0gOtx/klTIZrZS7Nmxl9l15vxPFIn60fKz0VjEENXw93jx
X-Received: from ezekiel.c.googlers.com
 ([fda3:e722:ac3:cc00:4f:4b78:c0a8:108e])
 (user=shraash job=sendgmr) by 2002:a81:144a:0:b0:2e6:c2bd:b724 with SMTP id
 71-20020a81144a000000b002e6c2bdb724mr2226691ywu.270.1648129237510; Thu, 24
 Mar 2022 06:40:37 -0700 (PDT)
Date: Thu, 24 Mar 2022 19:10:31 +0530
Message-Id: <20220324134031.2648315-1-shraash@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.1.894.gb6a874cedc-goog
Subject: [PATCH v2] drm/amd/display: Fix unused-but-set-variable warning
From: Aashish Sharma <shraash@google.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 Pan Xinhui <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>, 
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>, 
 Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>,
 Jake Wang <haonan.wang2@amd.com>, 
 Anson Jacob <Anson.Jacob@amd.com>, Guenter Roeck <groeck@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 25 Mar 2022 08:49:35 +0000
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
Cc: Aashish Sharma <shraash@google.com>, kernel test robot <lkp@intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Wayne Lin <wayne.lin@amd.com>,
 Anthony Koo <Anthony.Koo@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the kernel test robot warning below:

drivers/gpu/drm/amd/amdgpu/../display/dmub/inc/dmub_cmd.h:2893:12:
warning: variable 'temp' set but not used [-Wunused-but-set-variable]

Replaced the assignment to the unused temp variable with READ_ONCE()
macro to flush the writes. READ_ONCE() helps avoid the use of
volatile and makes it obvious from the code that the read here is
intentional. Also verified on x86 that the generated code is exactly the
same as before.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Aashish Sharma <shraash@google.com>
---
v2: Removed unnecessary volatile qualifier in the typecast and an unnecessary comment. Also reworded the commit message.
---
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h b/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
index 873ecd04e01d..a58f460f431d 100644
--- a/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
+++ b/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
@@ -2913,13 +2913,11 @@ static inline void dmub_rb_flush_pending(const struct dmub_rb *rb)
 	uint32_t wptr = rb->wrpt;
 
 	while (rptr != wptr) {
-		uint64_t volatile *data = (uint64_t volatile *)((uint8_t *)(rb->base_address) + rptr);
-		//uint64_t volatile *p = (uint64_t volatile *)data;
-		uint64_t temp;
+		uint64_t *data = (uint64_t *)((uint8_t *)(rb->base_address) + rptr);
 		uint8_t i;
 
 		for (i = 0; i < DMUB_RB_CMD_SIZE / sizeof(uint64_t); i++)
-			temp = *data++;
+			(void)READ_ONCE(*data++);
 
 		rptr += DMUB_RB_CMD_SIZE;
 		if (rptr >= rb->capacity)
-- 
2.35.1.894.gb6a874cedc-goog

