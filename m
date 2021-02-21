Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E4732081B
	for <lists+dri-devel@lfdr.de>; Sun, 21 Feb 2021 03:34:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91B026E0B6;
	Sun, 21 Feb 2021 02:34:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [IPv6:2607:f8b0:4864:20::f2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15B106E0B6
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Feb 2021 02:34:17 +0000 (UTC)
Received: by mail-qv1-xf2a.google.com with SMTP id e9so4582011qvy.3
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Feb 2021 18:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=tSAqLdEo0bUEdoKaOyNgsYB5I2Gd8CWgK0b2qhnD+gQ=;
 b=m39g3aDBAjBx00hSNSHR6VT4uUfbIxaspkxg6AInViDgH2O/llT058r38u3isWAA7M
 GrOxHSIYT0WY6jDyD7mFx2P6Ps8PecjHGUTjUfLpd7DYAJj3wFBujJThlmhAzXw3TyUR
 fx4wWQQ1Sa0FPfnEivsHTxHxJXNhHP7VQ5TrqwzlNffpVnNpwmIbSyHXN+lXaATEzG7K
 02KS1W1DsilSvGGKGrd4q6NzPRUCVbdTSPtx2KHCqNrNsMT5AACmhss45Yn2X7xrb9Nc
 UOzZ6UDWVvsOCvwAr9JFj+uIqHJiZf0ytP0IcLZEEI27PxICSNlkfmhSPZ48Ke7caajM
 OdWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tSAqLdEo0bUEdoKaOyNgsYB5I2Gd8CWgK0b2qhnD+gQ=;
 b=AubIc9449i5xOqLIvFPUzDK2Lmz94ZR6G5hA7w6LzOD97JP/wDmqhcyxNSfowv2iEn
 szEZam3xHzI9kC30Tx1tiOEOu3AnWiVLKlSKiFk1dmJO6jIn/JIka43TAEv9ULavSwH5
 oFKyRpi+Cnw2GFP0NLF8oxTolfMGFAd95ZlHDlJoomN7L/sbE29B/Q19ZEONdSJyrcRH
 qLRyn7LP60uU5wYYp5YyG9uZk8O5IhGbQBsaWcCyHoAvol0W9nlISwoii0r9SXet3n57
 t8C/+C1+4JkxISrJpb9reLQ37CwWrmU1ICLK4mmMD8lV2EgaMGc1pyWexM6OgeQ/CEqL
 glug==
X-Gm-Message-State: AOAM533kZYTHCT+vmnhdKgZ3DdKtmQ1l40NSGS0U3CWKQ8ZXJUCwS+I1
 +qSq/H4AgIuh9cQweR7RIYM=
X-Google-Smtp-Source: ABdhPJxJ04kbwthtWz9NVBDIhfjRW68l6TrbOwguQcYvLL1PurI0k4ycBMzEBfJLveCgnsDY+XJs2w==
X-Received: by 2002:a0c:85c2:: with SMTP id o60mr7880963qva.11.1613874856112; 
 Sat, 20 Feb 2021 18:34:16 -0800 (PST)
Received: from tong-desktop.local ([2601:5c0:c200:27c6:21e3:ddd4:1a2b:a77e])
 by smtp.googlemail.com with ESMTPSA id x7sm8249119qtv.58.2021.02.20.18.34.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Feb 2021 18:34:15 -0800 (PST)
From: Tong Zhang <ztong0001@gmail.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, Tong Zhang <ztong0001@gmail.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3] video: fbdev: pm2fb: avoid stall on fb_sync
Date: Sat, 20 Feb 2021 21:28:31 -0500
Message-Id: <20210221022832.360646-1-ztong0001@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <6b35b3b2-a746-9524-3a19-82ee73427ead@infradead.org>
References: <6b35b3b2-a746-9524-3a19-82ee73427ead@infradead.org>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

pm2fb_sync is called when doing /dev/fb read or write.
The original pm2fb_sync wait indefinitely on hardware flags which can
possibly stall kernel and make everything unresponsive.
Instead of waiting indefinitely, we can timeout to give user a chance to
get back control.

[   39.503356] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.13.0-48-gd9c812dda5194
[   39.503947] Call Trace:
[   39.504081]  <IRQ>
[   39.504193]  dump_stack+0x7d/0xa3
[   39.504377]  nmi_cpu_backtrace.cold+0x32/0x7e
[   39.504613]  ? lapic_can_unplug_cpu+0x70/0x70
[   39.504850]  nmi_trigger_cpumask_backtrace+0xdf/0x100
[   39.505121]  rcu_dump_cpu_stacks+0xed/0x130
[   39.505349]  rcu_sched_clock_irq.cold+0x3b1/0x61d
[   39.505602]  ? hrtimer_run_queues+0x2c/0x1b0
[   39.505833]  ? __acct_update_integrals+0x136/0x160
[   39.506091]  update_process_times+0xb9/0xf0
[   39.506317]  tick_sched_handle.isra.0+0x5c/0x80
[   39.506562]  tick_sched_timer+0x70/0x90
[   39.506770]  __hrtimer_run_queues+0x1c6/0x3e0
[   39.517095]  ? tick_sched_handle.isra.0+0x80/0x80
[   39.517349]  ? enqueue_hrtimer+0xd0/0xd0
[   39.517561]  ? _raw_write_lock_irqsave+0xd0/0xd0
[   39.517812]  ? ktime_get+0x45/0xb0
[   39.517997]  ? ktime_get_update_offsets_now+0x96/0x150
[   39.518273]  hrtimer_interrupt+0x1a0/0x340
[   39.518496]  __sysvec_apic_timer_interrupt+0x7f/0x160
[   39.518768]  asm_call_irq_on_stack+0xf/0x20
[   39.518997]  </IRQ>
[   39.519114]  sysvec_apic_timer_interrupt+0x6f/0x80
[   39.519372]  asm_sysvec_apic_timer_interrupt+0x12/0x20
[   39.519647] RIP: 0010:pm2fb_sync+0x47/0x70 [pm2fb]
[   39.519907] Code: 89 ef e8 0c 87 2c c1 48 8b 53 08 31 c0 89 82 40 8c 00 00 0f ae f0 48 8b 53 08 1
[   39.520885] RSP: 0018:ffff88810a1f7df8 EFLAGS: 00000202
[   39.521165] RAX: 0000000072d5d49f RBX: ffff88810a034418 RCX: ffffc900000b0020
[   39.521542] RDX: ffffc900000b0000 RSI: 0000000000000246 RDI: ffff88810a034420
[   39.521920] RBP: ffff88810a034420 R08: 0000000000000000 R09: ffffed102143ef64
[   39.522297] R10: 0000000000000003 R11: ffffed102143ef63 R12: ffff88810a1f7ed0
[   39.522673] R13: ffff88810a034000 R14: ffffc90002800000 R15: ffff888109e5e000
[   39.523053]  ? pm2fb_sync+0x24/0x70 [pm2fb]
[   39.523280]  fb_write+0x1c2/0x2d0
[   39.523461]  vfs_write+0x108/0x380
[   39.523647]  ksys_write+0xb4/0x150
[   39.523832]  ? __ia32_sys_read+0x40/0x40
[   39.524043]  ? fpregs_assert_state_consistent+0x4d/0x60
[   39.524322]  do_syscall_64+0x33/0x40
[   39.524517]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   39.524788] RIP: 0033:0x7f5e50097970
[   39.524981] Code: 73 01 c3 48 8b 0d 28 d5 2b 00 f7 d8 64 89 01 48 83 c8 ff c3 66 0f 1f 44 00 00 4
[   39.525952] RSP: 002b:00007ffec6895b38 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
[   39.526352] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f5e50097970
[   39.526726] RDX: 0000000000000200 RSI: 000056491a6ad000 RDI: 0000000000000001
[   39.537261] RBP: 0000000000000200 R08: 0000000000000000 R09: 000056491a6ad030
[   39.537633] R10: 0000000000000871 R11: 0000000000000246 R12: 0000000000000800
[   39.538008] R13: 000056491a6ad000 R14: 0000000000000200 R15: 0000000000000000

Signed-off-by: Tong Zhang <ztong0001@gmail.com>
---
 v3: initialize timeout_fifo to 0, and added comment for WAIT_FIFO_TIMEOUT
 v2: fix typo and add console log according to Randy's <rdunlap@infradead.org> comment
 drivers/video/fbdev/pm2fb.c | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/pm2fb.c b/drivers/video/fbdev/pm2fb.c
index 27893fa139b0..37db7e740221 100644
--- a/drivers/video/fbdev/pm2fb.c
+++ b/drivers/video/fbdev/pm2fb.c
@@ -183,12 +183,24 @@ static inline void pm2v_RDAC_WR(struct pm2fb_par *p, s32 idx, u32 v)
 
 #ifdef CONFIG_FB_PM2_FIFO_DISCONNECT
 #define WAIT_FIFO(p, a)
+#define WAIT_FIFO_TIMEOUT(p, a) (0)
 #else
 static inline void WAIT_FIFO(struct pm2fb_par *p, u32 a)
 {
 	while (pm2_RD(p, PM2R_IN_FIFO_SPACE) < a)
 		cpu_relax();
 }
+/* return 1 for timeout, otherwise 0 */
+static inline int WAIT_FIFO_TIMEOUT(struct pm2fb_par *p, u32 a)
+{
+	int timeout = 10000;
+	while (pm2_RD(p, PM2R_IN_FIFO_SPACE) < a) {
+		cpu_relax();
+		if (--timeout == 0)
+			return 1;
+	}
+	return 0;
+}
 #endif
 
 /*
@@ -1031,15 +1043,27 @@ static int pm2fb_blank(int blank_mode, struct fb_info *info)
 static int pm2fb_sync(struct fb_info *info)
 {
 	struct pm2fb_par *par = info->par;
+	int timeout_sync = 10000;
+	int timeout_fifo = 0;
 
-	WAIT_FIFO(par, 1);
+	if (WAIT_FIFO_TIMEOUT(par, 1))
+		goto end;
 	pm2_WR(par, PM2R_SYNC, 0);
 	mb();
 	do {
-		while (pm2_RD(par, PM2R_OUT_FIFO_WORDS) == 0)
+		timeout_fifo = 10000;
+		while (pm2_RD(par, PM2R_OUT_FIFO_WORDS) == 0) {
 			cpu_relax();
-	} while (pm2_RD(par, PM2R_OUT_FIFO) != PM2TAG(PM2R_SYNC));
+			if (--timeout_fifo == 0)
+				goto end;
+		}
+		if (pm2_RD(par, PM2R_OUT_FIFO) == PM2TAG(PM2R_SYNC))
+			break;
+	} while (--timeout_sync > 0);
 
+end:
+	if ((!timeout_sync) || (!timeout_fifo))
+		printk_ratelimited(KERN_WARNING "pm2fb: sync timeout!\n");
 	return 0;
 }
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
