Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C54E9D01422
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 07:41:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B782910E696;
	Thu,  8 Jan 2026 06:41:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="ituyddiG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com
 [209.85.160.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52D8910E696
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 06:41:11 +0000 (UTC)
Received: by mail-oa1-f48.google.com with SMTP id
 586e51a60fabf-3ffc3d389a8so914762fac.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jan 2026 22:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1767854470; x=1768459270;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fKxEAdYiJlS8fDoSU85pZDagNF70n0w9ciKlM1INT/U=;
 b=ituyddiGUO5Zr9qk3q5Wg4vjn3pqfMW2u1oXcpPAYvN20k/WEqiMWrwG/LZexFwveK
 yKd+a4FE1gH4XrSzCWMS+YfQo/KOdTRbuDiHaJQZIZDg9Jp80hPOj9NuQI252W1VmKWu
 bc/Y7q/ewxpxzN8WKGF944vK24VaJUBUpZ5rl9RLMAiKOEIv4Z5iS+dEwWdoHYu7Bbm4
 +CXRVjwXRWTq6KOrKFZeqFiXH4/LMWjXtvOR4+say2QejheF9NB01iH340oqyuiaXXRE
 k3IbY+irl0C0VYi1rW0FC2gUhPb8XkPtmV/DAj9uDsQTfhLD8i7Y/IySWkaF3w9L3Y8a
 g+xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767854470; x=1768459270;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=fKxEAdYiJlS8fDoSU85pZDagNF70n0w9ciKlM1INT/U=;
 b=YGm8GN9JvnACVti1WgKmS/1ws4rhkfMS8+YxXHedrU2i5tppkFSv5/ouVZVrJv14qa
 NXV8vtbBssxOOB5/M4m42h0w9abE26tiFTwVelO+N4J0VEGLwfJgxqFYHhsSIeBkX4LD
 cEbuLrfsmLuZsywzxe6ylkblPu6emD3JJQ28Yha6rbYpETPdnBC796vz46de0+w3Oprx
 eF1ym2xmHEheaj1Pdzck+NTLT4QgrPLAKwQ4IQkeZguutXjJ8LwNX6+udYFU8+Auz+uB
 hfarZLKpOdfVJ9Ky0WYzxU1UFG8LfHsIAGQLPU6+lQOFGagrrb5OMMzwz0zSvcgjC9YP
 ZNLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQgz4q99gjqZPenBpfpg4VoJ8J7KPdzZCgE9CxjVpZPM+6zMVhKVNRsJlqmF6nU9Wjna0GW34i8g4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwnJAohmMzVVqD7t6Xn3ujYvtl/QHPpi6Qu4z6ts81D2fJVxUvp
 MdwylUNQUxPvCpQMX65dk/F/SPmydAk6jMdkyO40sYDaSnqbG8HmBanboiJBKhMuK17vSm0UAKS
 TJ7mfjZyXW9WzsMBYDeRA8pF9iX3ov+xnammXd++h
X-Gm-Gg: AY/fxX5sPzbm/lPoCcXvC0Ak/XqCv3EEbrhNVBxGvdhLX5jQXIvPxBk/Yae7gti1Em+
 bkemljedl+fB2kxWEcAL5LLyfaRPLQ+hzv8PSgUKURNb1177LGRGONF6QscYzcQVTrT1tEW+QiF
 slS0XMeRzAFBizWRiRKw/sAwKFW1azbVS1WHuzR3CiMViuGfsdTAmKL2tTXW7JKxGTM/NgkC1kg
 SGI3nVnbAim+pdRfwwzvWCBSIi32BwYmnrD2+sF/k8Ai2W3cVnLdYdLpDltndPnG8dsZ0TnCWmy
 15viQg+odd58xv+xZ9M5YMFTDc2iXrOVC0x71IyDThu56EgyrLBarPIep6Y=
X-Google-Smtp-Source: AGHT+IGBodRfkjq3ySaB5gepcgr25ld9Em+U0Br2++GdDCZSnQNlfymSxhpKwGmkFcDnmN0/CTyxJFyk2qGpL8ky4gw=
X-Received: by 2002:a05:6871:826:b0:3ff:bf04:f12e with SMTP id
 586e51a60fabf-3ffc094cf02mr2095026fac.3.1767854470155; Wed, 07 Jan 2026
 22:41:10 -0800 (PST)
MIME-Version: 1.0
References: <1f849a1a.ab5b.19b9b6beda1.Coremail.wangzhi_xd@stu.xidian.edu.cn>
In-Reply-To: <1f849a1a.ab5b.19b9b6beda1.Coremail.wangzhi_xd@stu.xidian.edu.cn>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Thu, 8 Jan 2026 07:40:59 +0100
X-Gm-Features: AQt7F2ptA9RfDjB3sEEtR3CSDsPayA4rba6AWtuNL-nB4cyxuAGS1uaFD_wg9kE
Message-ID: <CANp29Y7JeN3NntqAJ+g1oqA7pXHLy7qW8Pp9as+ft5d89_2oXA@mail.gmail.com>
Subject: Re: [syzbot] WARNING in drm_prime_destroy_file_private
To: =?UTF-8?B?546L5b+X?= <wangzhi_xd@stu.xidian.edu.cn>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Jan 8, 2026 at 3:25=E2=80=AFAM '=E7=8E=8B=E5=BF=97' via syzkaller-b=
ugs
<syzkaller-bugs@googlegroups.com> wrote:
>
> syzbot has found the following issue on:

Please do not mark bugs that you report yourself as [syzbot], it's not
correct and very confusing.

>
> HEAD commit:    6.18.0-rcX
> git tree:       linux-stable
> console output: (see below)
> kernel config:  (please provide if available)
>
> ---
>
> WARNING: CPU: 3 PID: 28430 at drivers/gpu/drm/drm_prime.c:223 drm_prime_d=
estroy_file_private+0x43/0x60
> Modules linked in:
> CPU: 3 UID: 0 PID: 28430 Comm: syz.0.6460 Not tainted 6.18.0 #1 PREEMPT(f=
ull)
> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.16.3-0-=
ga6ed6b701f0a-prebuilt.qemu.org 04/01/2014
> RIP: 0010:drm_prime_destroy_file_private+0x43/0x60
> Code: 00 00 fc ff df 48 89 fa 48 c1 ea 03 80 3c 02 00 75 21 48 8b 83 90 0=
0 00 00 48 85 c0 75 06 5b e9 a3 4f 81 fc e8 9e 4f 81 fc 90 <0f> 0b 90 5b e9=
 94 4f 81 fc e8 7f a8 e7 fc eb d8 66 66 2e 0f 1f 84
> RSP: 0018:ffffc900032c7cb8 EFLAGS: 00010293
> RAX: 0000000000000000 RBX: ffff888100aa4380 RCX: ffffffff8b428d97
> RDX: ffff888122c61d00 RSI: ffffffff85390862 RDI: ffff888100aa4410
> RBP: 0000000000000000 R08: 0000000000000001 R09: fffff52000658f77
> R10: ffffc900032c7bbf R11: 0000000000000000 R12: ffff888100aa4000
> R13: dffffc0000000000 R14: ffff888100aa42d8 R15: ffff888100aa42b0
> FS:  000055556463b500(0000) GS:ffff8881a2701000(0000) knlGS:0000000000000=
000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 000000110c2acc50 CR3: 00000001326c0000 CR4: 00000000000006f0
>
> Call Trace:
>  <TASK>
>  drm_file_free.part.0+0x805/0xcf0
>  drm_close_helper.isra.0+0x183/0x1f0
>  drm_release+0x1ab/0x360
>  __fput+0x402/0xb50
>  task_work_run+0x16b/0x260
>  exit_to_user_mode_loop+0xf9/0x130
>  do_syscall_64+0x424/0xfa0
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
>  </TASK>
>
