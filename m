Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6753B336EB
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 08:55:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C30D410E34F;
	Mon, 25 Aug 2025 06:55:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gbrloA3S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C135D10E236
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 02:31:41 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id
 41be03b00d2f7-b49d6f8f347so1029293a12.0
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Aug 2025 19:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756089101; x=1756693901; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=WUEa4tYSS0p5DNjOCVeWcyYJH7ruf9/pefat3lfo8dQ=;
 b=gbrloA3SF9qzCLKrOO/J/v6DU8tQHpOa07eFVnoU6YjzT+Y5DpWMjn3x26TUjXiShZ
 tKaMfqr2o/Y69KLa1KlntolCWFg0p758bkfeY7j9ForWuPsovpxFCICSapjkQJEiRsrH
 /hMP9eXq3AbsIuSJ1SP8QcBbHRXqZhzFejaeL5wFPqfyUj5hRjY/1i4E+y37GKUHOqeO
 qBVswa0VsrQR6dqCnz8cIgZyHrQhvoTf+pKFr/iH8A/9lRoIbSt3YEa0e7NcqcHanynm
 RAp4W7e3lXxD0cdDbw64UbFtIkN0YajNyW2W8/V6i8gegQj1yq0aE3xDTjDbV8mNckN7
 yP+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756089101; x=1756693901;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WUEa4tYSS0p5DNjOCVeWcyYJH7ruf9/pefat3lfo8dQ=;
 b=V7lt14Id7FFBRHP9DB4z/OsLQJ4iyNzZ75QrO+0k45IOAY0pUwY4VBY6BvwIPFqFt7
 tne1PsAo8+8RC+efTSwIaLUyBZF98SaVzyQcXuKdt8LtAqPW3qm6pLccyFX3OhBl7J0b
 rJPzY5wJgyXhIpr/NHsz3xPOy349LxtKL3ZZcT3FnK5PrMT6dgPpkskXs6vGaYghqpjB
 KZgr7G8/QE2Jn+Tcn2wolXGf+ZgYw1gJEuY2x25MK8sKp9T/s8ds1unnoVpm24NxvPTp
 k7MVGxAQyen/kpGU0mjvkGvOIn221eKawHTFKzFqzptAUwLVG8yFQNPiDs+a2Idyjl5S
 h1CA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVD/uqBrr8o6K3ko2A5i1K7RVu1FPRkDV6ALY/9TK3qhJL0Tx0euTYduHAjZ/8i1VaKXyGuom90UDo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzdYmRV1P64ij05nWL63McHfj8x5W89EaiyrGDh76DY0o/Uaq72
 vWVkDcvmnNCK0PW6Zpg1qR5SMBoQsrVuEdawFsA9D9iv+KrnSxRjne+4
X-Gm-Gg: ASbGncsT98R+hNSt9gR9KvgAuKg43Gwa2H/+41SVxoVGJIjSxJJrFtWpnpArwf7BzlK
 BHYGDe3ARB3q1ZQRAhyCPqfT4l61us0v167MuW+MsrFUz6OrLjB9nRtNQ7WgqyTcTVreOpojaGN
 wxkpfZrQYbwp5Etuo3eHG/hBE8nbPck06bSeC+pXqO8dJN/nZ8xej9nkIeENpLma71thsO0d3x8
 EB5cyQoWk/xUT7EaNTDoFzqimh4yMXHZGzZ17JJmYWAoBezbBVshbAXKgn91FjtjlgwSOuBbeHC
 s7v23MifJRn2c1wFikOV+yodbthDhH1QOXfWHJsVrtSYEun1Da8DIGI5K8Z96wJjX72Ib/epl2U
 lqAHMMRvYO1i9a2n1wQl2gfzIMLOj+p6fBJS+m33xJCjkDF8NGRv8YsyUsmHM7p+UYX3k41Qonw
 Q=
X-Google-Smtp-Source: AGHT+IEsHHne9AMztJo7a8IjD1y4loI/AihrgL9BB/L9e0AetCJaQuYxWX/l7xlWh7T6OVyIoYtcqA==
X-Received: by 2002:a17:903:283:b0:246:61c:a67e with SMTP id
 d9443c01a7336-2462efdd639mr124786615ad.61.1756089101128; 
 Sun, 24 Aug 2025 19:31:41 -0700 (PDT)
Received: from localhost.localdomain ([114.242.33.243])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-246687af234sm53905175ad.48.2025.08.24.19.31.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Aug 2025 19:31:40 -0700 (PDT)
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
Subject: [PATCH v2 7/9] panic/printk: replace this_cpu_in_panic() with
 panic_on_this_cpu()
Date: Mon, 25 Aug 2025 10:29:35 +0800
Message-ID: <20250825022947.1596226-8-wangjinchao600@gmail.com>
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

The helper this_cpu_in_panic() duplicated logic already provided by
panic_on_this_cpu().

Remove this_cpu_in_panic() and switch all users to panic_on_this_cpu().

This simplifies the code and avoids having two helpers for the same check.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 include/linux/printk.h            |  2 --
 kernel/panic.c                    |  2 +-
 kernel/printk/nbcon.c             |  2 +-
 kernel/printk/printk.c            | 15 ++-------------
 kernel/printk/printk_ringbuffer.c |  2 +-
 lib/dump_stack.c                  |  2 +-
 6 files changed, 6 insertions(+), 19 deletions(-)

diff --git a/include/linux/printk.h b/include/linux/printk.h
index 5d22b803f51e..45c663124c9b 100644
--- a/include/linux/printk.h
+++ b/include/linux/printk.h
@@ -330,8 +330,6 @@ static inline bool pr_flush(int timeout_ms, bool reset_on_progress)
 
 #endif
 
-bool this_cpu_in_panic(void);
-
 #ifdef CONFIG_SMP
 extern int __printk_cpu_sync_try_get(void);
 extern void __printk_cpu_sync_wait(void);
diff --git a/kernel/panic.c b/kernel/panic.c
index 5266e195f5ac..8415e4073da1 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -343,7 +343,7 @@ EXPORT_SYMBOL(panic_on_this_cpu);
  */
 bool panic_on_other_cpu(void)
 {
-	return (panic_in_progress() && !this_cpu_in_panic());
+	return (panic_in_progress() && !panic_on_this_cpu());
 }
 EXPORT_SYMBOL(panic_on_other_cpu);
 
diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
index 7490865e2f44..c6d1a4a747e9 100644
--- a/kernel/printk/nbcon.c
+++ b/kernel/printk/nbcon.c
@@ -1394,7 +1394,7 @@ enum nbcon_prio nbcon_get_default_prio(void)
 {
 	unsigned int *cpu_emergency_nesting;
 
-	if (this_cpu_in_panic())
+	if (panic_on_this_cpu())
 		return NBCON_PRIO_PANIC;
 
 	cpu_emergency_nesting = nbcon_get_cpu_emergency_nesting();
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 5fe35f377b79..faa8b1f0585b 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -17,6 +17,7 @@
  *	01Mar01 Andrew Morton
  */
 
+#include "linux/panic.h"
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/kernel.h>
@@ -345,18 +346,6 @@ static void __up_console_sem(unsigned long ip)
 }
 #define up_console_sem() __up_console_sem(_RET_IP_)
 
-/* Return true if a panic is in progress on the current CPU. */
-bool this_cpu_in_panic(void)
-{
-	/*
-	 * We can use raw_smp_processor_id() here because it is impossible for
-	 * the task to be migrated to the panic_cpu, or away from it. If
-	 * panic_cpu has already been set, and we're not currently executing on
-	 * that CPU, then we never will be.
-	 */
-	return unlikely(atomic_read(&panic_cpu) == raw_smp_processor_id());
-}
-
 /*
  * Return true if a panic is in progress on a remote CPU.
  *
@@ -365,7 +354,7 @@ bool this_cpu_in_panic(void)
  */
 bool other_cpu_in_panic(void)
 {
-	return (panic_in_progress() && !this_cpu_in_panic());
+	return (panic_in_progress() && !panic_on_this_cpu());
 }
 
 /*
diff --git a/kernel/printk/printk_ringbuffer.c b/kernel/printk/printk_ringbuffer.c
index d9fb053cff67..e2a1b2d34d2b 100644
--- a/kernel/printk/printk_ringbuffer.c
+++ b/kernel/printk/printk_ringbuffer.c
@@ -2143,7 +2143,7 @@ static bool _prb_read_valid(struct printk_ringbuffer *rb, u64 *seq,
 			 * But it would have the sequence number returned
 			 * by "prb_next_reserve_seq() - 1".
 			 */
-			if (this_cpu_in_panic() &&
+			if (panic_on_this_cpu() &&
 			    (!debug_non_panic_cpus || legacy_allow_panic_sync) &&
 			    ((*seq + 1) < prb_next_reserve_seq(rb))) {
 				(*seq)++;
diff --git a/lib/dump_stack.c b/lib/dump_stack.c
index b3a85fe8b673..f0c78b5b5324 100644
--- a/lib/dump_stack.c
+++ b/lib/dump_stack.c
@@ -102,7 +102,7 @@ static void __dump_stack(const char *log_lvl)
  */
 asmlinkage __visible void dump_stack_lvl(const char *log_lvl)
 {
-	bool in_panic = this_cpu_in_panic();
+	bool in_panic = panic_on_this_cpu();
 	unsigned long flags;
 
 	/*
-- 
2.43.0

