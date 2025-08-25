Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D510AB336EA
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 08:55:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C229E10E34E;
	Mon, 25 Aug 2025 06:55:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BnLOvaAU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E725510E236
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 02:31:06 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-b4717543ed9so2597005a12.3
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Aug 2025 19:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756089066; x=1756693866; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=G+OueiTUtaQ+cl4byHqQJI84zYdm0M5wQwtNQy1rpWk=;
 b=BnLOvaAUV94egPXxzLvN5WijsOulFrDY49XxaVt3z1dDsKDOnoCponhRBVjQ8Knhia
 J2OvXddOQqFjLEDapaXREIkwgr7C68pOwjNCYdcXrPbo02UlX8wj/8pGGM9doDVa83wk
 bHTf9HoQHrQFSAIbdawuolut2wo2+90NqqOwORS+pE4C3lXuZ1KBMQXf8HoTs8QrUz4N
 lckXnr4NRoTxWE0vL4Wpqyrh9BbfoVk9yU84Z+GCD4yy9PgbcMmrzDZxa5rqb89wsUL2
 ojcbUw8Fidy/ArUlSuhpMjNbSHechGQ99nOc1AC2Z1iIgWGKxXGb++99LrYHly1Euxbq
 OGjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756089066; x=1756693866;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G+OueiTUtaQ+cl4byHqQJI84zYdm0M5wQwtNQy1rpWk=;
 b=w+IOvYAvuGmFLGXaxFuxeKtnyFN6hLK4tuUKtGWOdbLaPCHXlEQpVmJhcA79H4Qrhz
 7D4m/Krwj3EpLHgau5D0bz3jeEh7Qvb8ICZuaBR2bdT2QqBHCgxQq09lYUq65iRJpxnw
 w+0CRWJx2xdJWEk0Mh55mNOc98vn//gDGK3THBsqH3pP1Pyst4OpMfKKcP60SwAtGVVw
 dAkwmaBUTJA51vhsOfySRJMxbv53xS6XLYy0XBtuDlFz+9LlCmvLD6XFhxrAp3BCEPrs
 zaGSsSqm9rU0S6ZvPoEIv4iiowCfA5d/VjvHkQUt7GW8chLYP40Z9erB/WB91uzs75f0
 dgwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPqFewtMp0eTcCjtPdwAYB4tLbFDINaFPTxJgrMLriW6bK0NF9PWgbRwFNI0qCu601O5ynuFd8jgY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzarAoJvi6EirEgcPKcvhnW5BhwgMYqb8Ztrl/+rROYNpwXJPoq
 LEQNmgcU45Ie2MjGSBvaWRBvH9BAY+9Ui+na0i6Z/OkimcfzAObJFFz1
X-Gm-Gg: ASbGncvUBY3HaQVibsYPecTOxMkRsYTNS9fwki6M+AUimZJDg4e4HQC4d3+LAnpN2DG
 +fnVI181I/iL0qdMTWBq6OnX5CeBoXEr3uIoiueIbgTPuZ3WJtEHwZ9Uo1zU+AynT7Umqy1Z3+Q
 AJ2mkN15XfHVndCkdz57YD7kj3Nt2C0NFDKe7JD3Qg1XrydSY/H//imBC1nqNrUVROIgClfZGem
 7SX26RhxQNr0zdqKiCU97IWTLDuxH42F7TYu4/63n7CVSUBB9I8AaPrnZoQc4RCQvMX/kbCHgcL
 jN3s42AgGtcnHHiiesUXmRmTUcA5dwhYh4Q1zKOBuZ2fq/ndljD7YGSz9aK2J64o5GkKm2k1iIV
 QV5kwh7Glsjzm2d+FNYKLD53xL93+mrqeofic8a52LcxfoAOZb2BVcClGvPJxf6qaw4eqpm/l1T
 g=
X-Google-Smtp-Source: AGHT+IGGTCfkkziinXGfm5OQ/klvHSQOorcEs0SZvFKbeIqW5aKv9q5QfSmua5wLs2b3iOYngv2Dpw==
X-Received: by 2002:a17:903:37cb:b0:240:1bdc:afc3 with SMTP id
 d9443c01a7336-2462ef6f678mr124826755ad.44.1756089066318; 
 Sun, 24 Aug 2025 19:31:06 -0700 (PDT)
Received: from localhost.localdomain ([114.242.33.243])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-246687af234sm53905175ad.48.2025.08.24.19.30.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Aug 2025 19:31:05 -0700 (PDT)
From: Jinchao Wang <wangjinchao600@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>,
 Yury Norov <yury.norov@gmail.com>, Qianqiang Liu <qianqiang.liu@163.com>,
 Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
 John Ogness <john.ogness@linutronix.de>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>,
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Shixiong Ou <oushixiong@kylinos.cn>,
 Jinchao Wang <wangjinchao600@gmail.com>, Zsolt Kajtar <soci@c64.rulez.org>,
 Ingo Molnar <mingo@kernel.org>, Nam Cao <namcao@linutronix.de>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Joel Granados <joel.granados@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Sohil Mehta <sohil.mehta@intel.com>,
 Feng Tang <feng.tang@linux.alibaba.com>,
 Sravan Kumar Gundu <sravankumarlpu@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Anna Schumaker <anna.schumaker@oracle.com>,
 "Darrick J. Wong" <djwong@kernel.org>,
 Max Kellermann <max.kellermann@ionos.com>,
 Yunhui Cui <cuiyunhui@bytedance.com>, Tejun Heo <tj@kernel.org>,
 Luo Gengkun <luogengkun@huaweicloud.com>, Li Huafei <lihuafei1@huawei.com>,
 Thorsten Blum <thorsten.blum@linux.dev>,
 Yicong Yang <yangyicong@hisilicon.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kexec@lists.infradead.org,
 linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/9] panic: use panic_try_start() in nmi_panic()
Date: Mon, 25 Aug 2025 10:29:32 +0800
Message-ID: <20250825022947.1596226-5-wangjinchao600@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250825022947.1596226-1-wangjinchao600@gmail.com>
References: <20250825022947.1596226-1-wangjinchao600@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 25 Aug 2025 06:55:43 +0000
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

nmi_panic() duplicated the logic to claim panic_cpu with atomic_try_cmpxchg.
This is already wrapped in panic_try_start().

Replace the open-coded logic with panic_try_start(), and use
panic_on_other_cpu() for the fallback path.

This removes duplication and keeps panic handling code consistent.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 kernel/panic.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/kernel/panic.c b/kernel/panic.c
index eacb0c972110..cd86d37d124c 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -355,15 +355,9 @@ EXPORT_SYMBOL(panic_on_other_cpu);
  */
 void nmi_panic(struct pt_regs *regs, const char *msg)
 {
-	int old_cpu, this_cpu;
-
-	old_cpu = PANIC_CPU_INVALID;
-	this_cpu = raw_smp_processor_id();
-
-	/* atomic_try_cmpxchg updates old_cpu on failure */
-	if (atomic_try_cmpxchg(&panic_cpu, &old_cpu, this_cpu))
+	if (panic_try_start())
 		panic("%s", msg);
-	else if (old_cpu != this_cpu)
+	else if (panic_on_other_cpu())
 		nmi_panic_self_stop(regs);
 }
 EXPORT_SYMBOL(nmi_panic);
-- 
2.43.0

