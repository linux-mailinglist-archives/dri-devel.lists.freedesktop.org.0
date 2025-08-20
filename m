Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E124BB2DDFF
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 15:39:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D5D910E738;
	Wed, 20 Aug 2025 13:38:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bxCwAkJR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8331F10E6D2
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 09:17:34 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-76e1fc69f86so562018b3a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 02:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755681454; x=1756286254; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OVI1k/pB0ixIWErdqLS9pw9F8W8NF+7vGjYmUvMOdxQ=;
 b=bxCwAkJRCWzHcmKn6VuhPZBoHWFSJgNxU1LMZm8vlgi4gCXzwE80T8FTWtJDgKDdYe
 GEsuY1ys5wa+Vi54oEWgg4FLPsk8rPeiX/ZZMjhqmfJjt2OdJ3IbjzbAdcXW9wSF/YHX
 urizb/PYxVucNqWI+j29ttsYqufvQxq7DiBcbMeFjUA44XdvKWB8nSQ7al65Wpt8JqQA
 Ci9q7F3oI345Fd8/2ECMT3VQNJLdzRi77brZmhGOnVTOn3nRPjMFx2J4xWVNSUO5s9F0
 XQtYWKZdEQqIXJWBedtxzaxV9uJr+wA7pSFRHPm04HM3niXnhPp/Wu+Wyt1sj09JhcpL
 EwQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755681454; x=1756286254;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OVI1k/pB0ixIWErdqLS9pw9F8W8NF+7vGjYmUvMOdxQ=;
 b=MtdpOkrLPBdnoQmnZc0iTCghglISMzvMeWnFtV4xxeaxioEkhRYYj88DiKlbAorEnB
 ipwNP0H+kZ//QxeGYSeFcgUIwWQImOF+QfDlqALVfx9FPCrkZFYwdDOwLHvL71A+0pKa
 Mrr6gLCZA5HrCgiOcVqaTFB5/8jRk2o28zyBk0E2d2At8UhQ394d+kkRFn4jlYGM8/Dx
 b58P/vl3i79sd14tZ6+YvKsSjQXr6vy56eY6xTM5EqZakGkoGwZPsZ8osh9E7P4BkSIM
 icG2NbSdvy3jmSZqm1OPZs0HqfaBknlE4A/LvemusHaGOFjjdpHllcd8IOUFiwLMvZzL
 2big==
X-Forwarded-Encrypted: i=1;
 AJvYcCUE5N3kv+vsoqsFIFD9QEmTTs9DtzBQNfnvf47YWmnDZsSDiQuV6eOpbR2mDfwbPMN99fuwkeOOHbs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyKWjfJLHeyi880kPsQRCMXhsFbVADGjd2JOJuaPoYVuHi+3JEH
 ETRVDGqW/B4GMoe9hWHJKZzABR1SDFYoPglR3O3OP8sv9ytoEqjdbwO+
X-Gm-Gg: ASbGncvxoSLTUlNpAA9hO8EJPGFzTdSh3JmeAa8LAvMu3y5hZ0HVxO3Y5bHt/vgyc7K
 d4+MuxmB3WeOfcYOfdJ4/EkSvUQwsZkHmSzEzFcXgkl8cKkPhXrGOdQyM0TCf8XY3+g6em/I7IG
 A8GUeJrpqE7wN8mL/MAI70FObXFTrOPbULjNTi1NV77usqL11hK5QrdXJua0LrMuiWn0AXvJj00
 85EyFU2B/U0Z2l2QgJ2Wb6VqZm7biOOgwtJY+K/+aEzqhYCWcDDJ90Cg/Vray87f/suXu5OinWs
 C5MNyJF2Tt58ob48A856h4HnvlrK8t2wmIGcsm1OL464WvxiYeMrGuGw+KBv3za+OMhOH325zwS
 sDd/gm2VDkFkH1GE/i9Kei2NcLfoxrsmfqgwkbGXY5VCDJQu0mgZwobMbZVd2Upd/4jMisJey05
 BZJ3qqbhlHmJP2kqg=
X-Google-Smtp-Source: AGHT+IHx9qodfUsUtujF4WcGyv1bu3UXIDMU9WkHwudd4s28sPGdBAtDjIFUWtp2i3gI178EqoOB1w==
X-Received: by 2002:a05:6a21:6d8c:b0:23d:48fc:652b with SMTP id
 adf61e73a8af0-2431b7c805emr3407301637.12.1755681453721; 
 Wed, 20 Aug 2025 02:17:33 -0700 (PDT)
Received: from localhost.localdomain ([114.242.33.243])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76e7ccfa8d1sm4847120b3a.0.2025.08.20.02.17.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 02:17:33 -0700 (PDT)
From: Jinchao Wang <wangjinchao600@gmail.com>
To: pmladek@suse.com, akpm@linux-foundation.org,
 Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Qianqiang Liu <qianqiang.liu@163.com>, Shixiong Ou <oushixiong@kylinos.cn>,
 Jinchao Wang <wangjinchao600@gmail.com>,
 Sravan Kumar Gundu <sravankumarlpu@gmail.com>,
 Zsolt Kajtar <soci@c64.rulez.org>, Kees Cook <kees@kernel.org>
Cc: linux-kernel@vger.kernel.org, feng.tang@linux.alibaba.com,
 joel.granados@kernel.org, john.ogness@linutronix.de, namcao@linutronix.de,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 2/9] fbdev: Use panic_in_progress() helper
Date: Wed, 20 Aug 2025 17:14:47 +0800
Message-ID: <20250820091702.512524-3-wangjinchao600@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250820091702.512524-2-wangjinchao600@gmail.com>
References: <20250820091702.512524-1-wangjinchao600@gmail.com>
 <20250820091702.512524-2-wangjinchao600@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 20 Aug 2025 13:38:50 +0000
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

This patch updates the fbcon_skip_panic() function to use
the panic_in_progress() helper.

The previous direct access to panic_cpu is less
readable and is being replaced by a dedicated function
that more clearly expresses the intent.

This change is part of a series to refactor the kernel's
panic handling logic for better clarity and robustness.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 drivers/video/fbdev/core/fbcon.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 55f5731e94c3..b062b05f4128 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -279,14 +279,7 @@ static int fbcon_get_rotate(struct fb_info *info)
 
 static bool fbcon_skip_panic(struct fb_info *info)
 {
-/* panic_cpu is not exported, and can't be used if built as module. Use
- * oops_in_progress instead, but non-fatal oops won't be printed.
- */
-#if defined(MODULE)
-	return (info->skip_panic && unlikely(oops_in_progress));
-#else
-	return (info->skip_panic && unlikely(atomic_read(&panic_cpu) != PANIC_CPU_INVALID));
-#endif
+	return (info->skip_panic && unlikely(panic_in_progress()));
 }
 
 static inline bool fbcon_is_active(struct vc_data *vc, struct fb_info *info)
-- 
2.43.0

