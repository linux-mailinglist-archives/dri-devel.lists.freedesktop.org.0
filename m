Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BD33309D5
	for <lists+dri-devel@lfdr.de>; Mon,  8 Mar 2021 10:00:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 504BD6E82D;
	Mon,  8 Mar 2021 09:00:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 799ED6E82D;
 Mon,  8 Mar 2021 09:00:09 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id s7so4546412plg.5;
 Mon, 08 Mar 2021 01:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=pXqQKfOnSJI+qHzrd8W/hQRHzPfCp7ycjownQ6DzJZE=;
 b=RN8Xly3iPJqWRhT1m9LzPwiIP3PSnheEbTQTb5Ff4/2zoTb22P318t6wmpH+LCE7OT
 s5KdaGwJryqpLZQLzL+o1feOo/yYZX3ft4ot+YxIG3mCg23+pgM23KyqegfzLqoE+ynK
 0w6xj5pKYTSo9cL8hKPqQrawpvtNbVEYaL4oHkYpD67q16nxAyMmvscdN7UQv/biw4O/
 A4jBRKbxDyC2ZZEoLoxcfPBMGP3GFYW/+IasOlQu5KoUcsjFTw0EuJsq4Lc5IwyNfe2j
 K0mOlAQ/bjoEJqA1I+3sa2HVz0DY+DS/3OXT/0J2AuYvFz5+hTlRLt9shh9UlCfoa3PN
 xkag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=pXqQKfOnSJI+qHzrd8W/hQRHzPfCp7ycjownQ6DzJZE=;
 b=U1SP8b0WtT7vVg8UTw7Q/xCRWOJk0ZMlqIosIkx7KlRxP7NJ+5DCP0lSRbxK/e6/8h
 eqzATRGW2s8fax2cw9WwUx1txTQHOK6/mAKma02NfgVKA1SqeLoSp5zC6mtVwU7FU+d6
 3lDiX4a7m4ebjAdPRW8ivevCWuiTKLzQiwvuJH3jEZZuhlD00kg0rCxZHTbsxNQs9ZVi
 Lpm2Kh0M0P5cYzlqW9PBBaIDJxwNP1Ta7KdKnC2/w3HymVeznigVlf8ypPfxa5lTs+/d
 gUjWzQs+Hv23fTPDyjD2bsXB4+ZRR0WbbKCoBBszbIDLzqXIpGdgQ3+lsV6kZubAXKEf
 bBWQ==
X-Gm-Message-State: AOAM530H3eo3qwmeVBA1rKFLwueqT9QS96iEODei0beAH1V00hav796Z
 Kh4wzLeUwYj1KhXfhiyzaiI=
X-Google-Smtp-Source: ABdhPJyF9yXNYPSn0ghWFrOwzE9Hw9zyuIY3fTctBT7LuUkHjewJNdiVJTnz4foHTIXJ81MEjvRFDQ==
X-Received: by 2002:a17:90a:a503:: with SMTP id
 a3mr15834493pjq.235.1615194009137; 
 Mon, 08 Mar 2021 01:00:09 -0800 (PST)
Received: from localhost.localdomain ([45.135.186.99])
 by smtp.gmail.com with ESMTPSA id s18sm9550643pfm.129.2021.03.08.01.00.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 01:00:08 -0800 (PST)
From: Jia-Ju Bai <baijiaju1990@gmail.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch,
 matthew.auld@intel.com, chris@chris-wilson.co.uk, lkml@SDF.ORG
Subject: [PATCH] gpu: drm: i915: fix error return code of
 igt_buddy_alloc_smoke()
Date: Mon,  8 Mar 2021 00:59:52 -0800
Message-Id: <20210308085952.8153-1-baijiaju1990@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: intel-gfx@lists.freedesktop.org, Jia-Ju Bai <baijiaju1990@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When i915_random_order() returns NULL to order, no error return code of
igt_buddy_alloc_smoke() is assigned.
To fix this bug, err is assigned with -EINVAL in this case.

Fixes: 1fe3818d17c9 ("drm/i915/selftests: try to rein in alloc_smoke")
Reported-by: TOTE Robot <oslab@tsinghua.edu.cn>
Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
---
 drivers/gpu/drm/i915/selftests/i915_buddy.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/selftests/i915_buddy.c b/drivers/gpu/drm/i915/selftests/i915_buddy.c
index 632b912b0bc9..cf9b551b77e1 100644
--- a/drivers/gpu/drm/i915/selftests/i915_buddy.c
+++ b/drivers/gpu/drm/i915/selftests/i915_buddy.c
@@ -318,8 +318,10 @@ static int igt_buddy_alloc_smoke(void *arg)
 	}
 
 	order = i915_random_order(mm.max_order + 1, &prng);
-	if (!order)
+	if (!order) {
+		err = -EINVAL;
 		goto out_fini;
+	}
 
 	for (i = 0; i <= mm.max_order; ++i) {
 		struct i915_buddy_block *block;
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
