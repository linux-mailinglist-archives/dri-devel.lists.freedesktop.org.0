Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CF56DC185
	for <lists+dri-devel@lfdr.de>; Sun,  9 Apr 2023 23:35:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98FEA10E057;
	Sun,  9 Apr 2023 21:35:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D28010E150
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Apr 2023 12:15:59 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 bp17-20020a17090b0c1100b0023f187954acso2203620pjb.2
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Apr 2023 05:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681042559;
 h=content-disposition:mime-version:message-id:subject:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2t1G48wxCUMMNbti7GgTNE7UH21GayHo7SYoWCZ/eD4=;
 b=Tbvt+HdVNbYiGq7fDUN4njsb312cRhqX1XfVQwj94qBSr7Zlg51ZZ0j2h9zEAYDD8p
 n+dJCTsqC4IJgwX4WVSijqh89bsh8yYQxHMuGN518SK25WfGKACYJ/W2wiZF76e2zIVU
 vAMmf3VEfDlPO3NMGWrw4YlcZF00ygEWpT2X+mB5WBiiaecNIeUEhlIRM6wqk64nt5ho
 LXvlHYUvDeSULNTXSdpLImpJn8WPNjXoGcCvkobJqmD9ewbQOaDHeRn8FwxbqVrnWZw/
 HHlDlCqojRU9DgBe8Cw4oKfzVHwneJljrw8jMZ30lFm2sX54aa4KjiD7vH+KdAmycyG2
 HLbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681042559;
 h=content-disposition:mime-version:message-id:subject:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2t1G48wxCUMMNbti7GgTNE7UH21GayHo7SYoWCZ/eD4=;
 b=zZXH26k2KDeMDaihUVaKq4bQkVCI9TJ6wEKnggxk5dZRWAHbCfQavgzzdsKI0J/xV1
 xR/8MMkcOtx9vupDs+kSkQjb2adMlqA4uQEw8hkoyaJBy4YaBVCdycqHGUS7THWW0Ak8
 LMYceX5c1rpSgTYvt7CH1b/yT8dPA/9tCbqkaMV58+7gbkB6cK/ymeOiI7k+IAUtYJZz
 otGVil2NLQZLRwPxFgzDsXF/VF1vOSTxYhxgnsWgymXrG2MrjcnIO4ndT762Lx5BUa05
 xtgRwDX6AkPYRqpSu4sjJamRJrMfgx4/EZ8XjvzVlcudpayYvM3BhyJij4GtTc0KkEsz
 q/9Q==
X-Gm-Message-State: AAQBX9d0tuRa4RK0i/baPu5VQoGCaAr6BxRuzikuoZJGAeQSZY2qtyuj
 kwRngKQ/GRmFo/W/usFUIZk=
X-Google-Smtp-Source: AKy350b6EIoszL0MLK9VxD/SyGuJSu3zGGhxXa7DggjtZSCA8l2yRe9zb1npycWT30wpm5/jlC4v7g==
X-Received: by 2002:a17:90b:390a:b0:244:b000:d8e3 with SMTP id
 ob10-20020a17090b390a00b00244b000d8e3mr10163647pjb.45.1681042558567; 
 Sun, 09 Apr 2023 05:15:58 -0700 (PDT)
Received: from dragonet (dragonet.kaist.ac.kr. [143.248.133.220])
 by smtp.gmail.com with ESMTPSA id
 g9-20020a1709026b4900b0019fea4d61c9sm5777925plt.198.2023.04.09.05.15.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Apr 2023 05:15:58 -0700 (PDT)
Date: Sun, 9 Apr 2023 21:15:54 +0900
From: "Dae R. Jeong" <threeearcat@gmail.com>
To: daniel@ffwll.ch, deller@gmx.de, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: KASAN: null-ptr-deref Read in soft_cursor
Message-ID: <ZDKsev8m5ShO_z0j@dragonet>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailman-Approved-At: Sun, 09 Apr 2023 21:35:34 +0000
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

Hi,

We observed an issue "KASAN: null-ptr-deref in soft_cursor" during fuzzing.

We acknowledge that this issue is a bit old, and we are sorry for
reporting this late. And unfortunately, we have not found a reproducer
for the crash yet. We will inform you if we have any update on this
crash.  Detailed crash information is attached below.

Best regards,
Dae R. Jeong

-----
- Kernel version:
6.2-rc1

- Crash report:
==================================================================
BUG: KASAN: null-ptr-deref in soft_cursor+0x420/0xe80 drivers/video/fbdev/core/softcursor.c:70
Read of size 16 at addr 0000000000000200 by task systemd/1

CPU: 2 PID: 1 Comm: systemd Not tainted 6.2.0-rc1-30092-gc55e2cce6a18-dirty #1
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.14.0-0-g155821a1990b-prebuilt.qemu.org 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x1cf/0x2c0 lib/dump_stack.c:106
 print_report+0xed/0x1f0 mm/kasan/report.c:420
 kasan_report+0xef/0x120 mm/kasan/report.c:517
 kasan_check_range+0x2b5/0x2f0 mm/kasan/generic.c:189
 memcpy+0x25/0x60 mm/kasan/shadow.c:65
 soft_cursor+0x420/0xe80 drivers/video/fbdev/core/softcursor.c:70
 bit_cursor+0x1c95/0x2710 drivers/video/fbdev/core/bitblit.c:377
 hide_cursor+0x95/0x3f0 drivers/tty/vt/vt.c:907
 do_con_write+0x216/0xf270 drivers/tty/vt/vt.c:2927
 con_write+0x20/0x40 drivers/tty/vt/vt.c:3295
 process_output_block drivers/tty/n_tty.c:586 [inline]
 n_tty_write+0xef3/0x1420 drivers/tty/n_tty.c:2350
 do_tty_write drivers/tty/tty_io.c:1018 [inline]
 file_tty_write+0x625/0xa30 drivers/tty/tty_io.c:1089
 call_write_iter include/linux/fs.h:2186 [inline]
 new_sync_write fs/read_write.c:491 [inline]
 vfs_write+0x848/0xd90 fs/read_write.c:584
 ksys_write+0x182/0x2c0 fs/read_write.c:637
 do_syscall_x64 arch/x86/entry/common.c:51 [inline]
 do_syscall_64+0x4e/0xa0 arch/x86/entry/common.c:82
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7fa7860101b0
Code: 2e 0f 1f 84 00 00 00 00 00 90 48 8b 05 19 7e 20 00 c3 0f 1f 84 00 00 00 00 00 83 3d 19 c2 20 00 00 75 10 b8 01 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 31 c3 48 83 ec 08 e8 ae fc ff ff 48 89 04 24
RSP: 002b:00007ffea5a37dd8 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 000000000000000a RCX: 00007fa7860101b0
RDX: 000000000000000a RSI: 00007fa78853ccbe RDI: 0000000000000013
RBP: 00007fa78853ccbe R08: 00007ffea5a37d90 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000013
R13: 0000000000000000 R14: ffffffffffffffff R15: 00005626fb929250
 </TASK>
==================================================================
