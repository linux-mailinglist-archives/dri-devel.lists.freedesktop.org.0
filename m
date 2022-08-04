Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A69B589BD6
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 14:42:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4566411B16B;
	Thu,  4 Aug 2022 12:42:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FA929798C
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Aug 2022 12:41:51 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id 12so17863641pga.1
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Aug 2022 05:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=IqELUni7yOqBktpdBBbucmyGM38f0JGBlZ/P93Fp8ag=;
 b=oBx+siF17fjl9i5BvuQZ1qdK+rLtEzpUk3uCVRXEgskaRkyISP+iIlQ/giaOVIkrjI
 DPz9ffqSLfP6X23W/ejCdA0cHjdTajv5ZfB1JtrOqFFzYggakVhJNuyRdXM5xbYVQkgl
 FmW/0YPo2cmc7/vmgIsBSLBP3DlTQwPEWWb4qqNYgpHQXTyzRl2vns7C0LKp2Y+6UTn5
 SCmWIea5jDUf8jIiSHCOqmUlTa/HV5QTMluEe/494XOSjLsXKHQLHwh6EdjCLwd0hlXp
 UCrEc7VNk3jN0/Ie+66c/4j2NaDf30FsSvABj3QtrD4Jk2ZtzdGdXowveIvnqTxgXoM8
 XQtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=IqELUni7yOqBktpdBBbucmyGM38f0JGBlZ/P93Fp8ag=;
 b=4pOOgkgTk1RF+E90sygcimP8vLrZdCYW9ZR7Un80pC7pBVkSA8857vdr9KuP+TGqkv
 JiouUQG3X9hNFtds7jnZ0Xqx2x6vkTY2+ElmA+oIyv7CzaglIxzgN4sHuxwOY1nb7kTE
 c4srStmT02ihR9dTSHKbRvpVtlvc6anDFgoTyvTNN3/PKYMfUJou6S9IuejbH5y4EINh
 Ce8O3/YhxC+N5QLr/Y67wdZifFL7+J+gnqGxDPQ9bVLUpJSNl/dDb9lh+r5wiD/ZOhX0
 qJ9oW4K4afMMNCYyx3BbPUTG7obqTN3+x02qR9G9fbJ7oQOI5cBAZwEg4cNzVc4BzbsU
 SPug==
X-Gm-Message-State: ACgBeo1H/CiGXS0DK8ufywho/F7yuWCEPT5OkiOgqMJV0ZG52FO3KukV
 MkrhH4TZiaDTycVUUN7rxg==
X-Google-Smtp-Source: AA6agR7gwCQb5q3QUQuJgu3QIPH6DlUeRZ3KtvNPz5dZcndSktas2nIs8wSYnDaG/RC6A1skS2l6mA==
X-Received: by 2002:a05:6a00:17a8:b0:52e:6e3e:9ff with SMTP id
 s40-20020a056a0017a800b0052e6e3e09ffmr1828954pfg.42.1659616910895; 
 Thu, 04 Aug 2022 05:41:50 -0700 (PDT)
Received: from localhost.localdomain ([166.111.133.51])
 by smtp.gmail.com with ESMTPSA id
 i8-20020a63bf48000000b0041b672e93c2sm1070769pgo.17.2022.08.04.05.41.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Aug 2022 05:41:50 -0700 (PDT)
From: Zheyu Ma <zheyuma97@gmail.com>
To: deller@gmx.de, adaplas@gmail.com, santiago@crfreenet.org,
 akpm@linux-foundation.org
Subject: [PATCH 3/3] video: fbdev: s3fb: Check the size of screen before
 memset_io()
Date: Thu,  4 Aug 2022 20:41:25 +0800
Message-Id: <20220804124125.3506755-4-zheyuma97@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220804124125.3506755-1-zheyuma97@gmail.com>
References: <20220804124125.3506755-1-zheyuma97@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, Zheyu Ma <zheyuma97@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the function s3fb_set_par(), the value of 'screen_size' is
calculated by the user input. If the user provides the improper value,
the value of 'screen_size' may larger than 'info->screen_size', which
may cause the following bug:

[   54.083733] BUG: unable to handle page fault for address: ffffc90003000000
[   54.083742] #PF: supervisor write access in kernel mode
[   54.083744] #PF: error_code(0x0002) - not-present page
[   54.083760] RIP: 0010:memset_orig+0x33/0xb0
[   54.083782] Call Trace:
[   54.083788]  s3fb_set_par+0x1ec6/0x4040
[   54.083806]  fb_set_var+0x604/0xeb0
[   54.083836]  do_fb_ioctl+0x234/0x670

Fix the this by checking the value of 'screen_size' before memset_io().

Fixes: a268422de8bf ("[PATCH] fbdev driver for S3 Trio/Virge")
Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
---
 drivers/video/fbdev/s3fb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/video/fbdev/s3fb.c b/drivers/video/fbdev/s3fb.c
index b93c8eb02336..5069f6f67923 100644
--- a/drivers/video/fbdev/s3fb.c
+++ b/drivers/video/fbdev/s3fb.c
@@ -905,6 +905,8 @@ static int s3fb_set_par(struct fb_info *info)
 	value = clamp((htotal + hsstart + 1) / 2 + 2, hsstart + 4, htotal + 1);
 	svga_wcrt_multi(par->state.vgabase, s3_dtpc_regs, value);
 
+	if (screen_size > info->screen_size)
+		screen_size = info->screen_size;
 	memset_io(info->screen_base, 0x00, screen_size);
 	/* Device and screen back on */
 	svga_wcrt_mask(par->state.vgabase, 0x17, 0x80, 0x80);
-- 
2.25.1

