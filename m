Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7765801F2
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 17:34:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC78BC0768;
	Mon, 25 Jul 2022 15:34:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3366BC0768
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 15:34:29 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id 72so10729008pge.0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 08:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=GVcBtZOANtlGOk2kyFP5BT5LKuDd1n4y4SlkfBh5i0c=;
 b=aY0i5moV4xCLdYQwyBUTg1BTHgMtcdKsmK70EGnqxSyH/SNHtWvxH6lrCyCHpnD5/I
 eKdIqqIS/7y1h6/9HbIQ9upn03exO6RMAFp7vEVYDHSn2Q3l+bnoh9pc3MGovD+r5o6t
 ubCs83NZTvF2AQDoDo86lfcCoVRyrhShJ7dHlsAh1l7bPDVsC69rrSnWdcNkX1iiAvb6
 ygGuuZQf+yyqfkaZR8iK4oDY07dx8lPhJTdxfz/DELvCBrzYA23Pu3vnKUMjF8kbDfGc
 HRu6bibwy5eu/YNUM84gjl8bf8QwaFXeEXG2vm8T8C8tpzKFWu2K6vSu8eNAthcvG3UW
 7qWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=GVcBtZOANtlGOk2kyFP5BT5LKuDd1n4y4SlkfBh5i0c=;
 b=XGkKaN+FbeBaFZQ6aTD3MxjPJNUlJDApTI/rXzbK4QgrwTUpyD+aevFjHeNPzaknDA
 YbQe1TrvuQnEfoZgVCLiZ4n1Nv+2EiVSO2ZFyV8VPrj6A8uW1E1AtSlAsWdhEs02Mb1F
 DmBbK3an9bScrQca5uPcJUCSJU0PFCgtP3y/OliCxuK8p/cf9zpjlfyMA8++WEYdq5cL
 TpfvE4s9Hj2RHclbCzP/EQGMpYjnlx8y+8MMIf1o4oqEfp7TS9zv22fQR57ykHs51RX/
 owzCU2/wYeC65H+dSr7CmT05yk9SAaWvXQFL9kIPi3r9p4a9RBBXiJJrI31Av+P/5tPa
 WdGg==
X-Gm-Message-State: AJIora8aRS8/Pi+UlTHrWRFOE1Lh+irol6CbJdYNsQ4kx8OYrL9dNMrl
 hhZlehLgygWHbyJtqevayyLxwrjXnerG8OCxnL6rviWWt0+x47SD
X-Google-Smtp-Source: AGRyM1u3dF3bwhEbwyf4LNJYCn+ofb87hMribTY7p3ioNLv7RroN2gI7oWBFmAmIgJsI16Jhyx9KcM0Xuxy6ARYTVio=
X-Received: by 2002:a63:5c5e:0:b0:412:a2f1:d0dd with SMTP id
 n30-20020a635c5e000000b00412a2f1d0ddmr11633584pgm.251.1658763268384; Mon, 25
 Jul 2022 08:34:28 -0700 (PDT)
MIME-Version: 1.0
From: Kyryl Melekhin <k.melekhin@gmail.com>
Date: Mon, 25 Jul 2022 11:34:16 +0000
Message-ID: <CABgARp-kFcJLcQvRBjF+fMg8GhTj149Rw9VkLi+spZYHyQr4fw@mail.gmail.com>
Subject: [amdgpu] drm/ttm: fbdev race condition into fork()
To: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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

Hello Dri-devel,

There is yet another race condition happening with ttm objects,
this time with fbdev.

Please consider the following simple code that shows the problem (or
email attached):
https://0x0.st/ojmf.c

The kernel assertion:

[ 2112.472011] ---[ end trace 0000000000000000 ]---
[ 2182.118552] usb 3-2.2.1.4: reset high-speed USB device number 8
using xhci_hcd
[ 2194.632197] ------------[ cut here ]------------
[ 2194.632199] WARNING: CPU: 6 PID: 383 at
drivers/gpu/drm/ttm/ttm_bo_vm.c:352 0xffffffff8169c28f
[ 2194.632201] CPU: 6 PID: 383 Comm: fb Tainted: G        W
5.19.0-rc7+ #22 353afba44cdabdab9fdfaa6990a088718abd5d85
[ 2194.632204] Hardware name: To Be Filled By O.E.M. To Be Filled By
O.E.M./X300M-STX, BIOS L1.72 10/08/2021
[ 2194.632205] RIP: 0010:0xffffffff8169c28f
[ 2194.632206] Code: 48 8d ba 50 01 00 00 b8 01 00 00 00 f0 0f c1 82
50 01 00 00 85 c0 74 16 8d 50 01 09 c2 78 01 c3 be 01 00 00 00 e9 91
47 e5 ff <0f> 0b eb d2 be 02 00 00 00 e9 83 47 e5 ff 0f 1f 00 41 57 41
56 41
[ 2194.632207] RSP: 0018:ffffc90000767d30 EFLAGS: 00010287
[ 2194.632209] RAX: ffff888100a627b8 RBX: ffff888101745ec0 RCX: ffff888102285128
[ 2194.632210] RDX: ffff888102b00058 RSI: 00007f89976fb000 RDI: ffff88811031d440
[ 2194.632211] RBP: ffff88810177c800 R08: ffff888102541138 R09: ffff88811f9d95e0
[ 2194.632212] R10: ffff8887fe2fc000 R11: 0000000000000000 R12: 0000000000000000
[ 2194.632213] R13: ffff888102c5fc00 R14: ffff88811031d390 R15: ffff88811031d440
[ 2194.632213] FS:  00007f89977afb68(0000) GS:ffff8887ded80000(0000)
knlGS:0000000000000000
[ 2194.632214] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 2194.632215] CR2: 00007f8994840000 CR3: 00000001047df000 CR4: 0000000000750ee0
[ 2194.632216] PKRU: 55555554
[ 2194.632217] Call Trace:
[ 2194.632218]  <TASK>
[ 2194.632219]  0xffffffff81040d1e
[ 2194.632220]  0xffffffff8104306b
[ 2194.632221]  0xffffffff81043306
[ 2194.632222]  ? 0xffffffff81608ae6
[ 2194.632222]  0xffffffff810437d1
[ 2194.632223]  0xffffffff81fa1884
[ 2194.632224]  0xffffffff8200006a
[ 2194.632225] RIP: 0033:0x00007f8997749429
[ 2194.632226] Code: 88 00 00 00 31 c0 48 89 e5 48 89 ef e8 e0 b5 00
00 bf ff ff ff ff e8 36 7a fc ff 4c 89 e7 e8 ae bc 01 00 b8 39 00 00
00 0f 05 <48> 89 c3 85 c0 75 50 b8 ba 00 00 00 64 48 8b 14 25 00 00 00
00 0f
[ 2194.632227] RSP: 002b:00007ffee0d808e0 EFLAGS: 00000246 ORIG_RAX:
0000000000000039
[ 2194.632228] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f8997749429
[ 2194.632229] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 00007f89977affd4
[ 2194.632230] RBP: 00007ffee0d808e0 R08: 0000000000000000 R09: 0000000000000000
[ 2194.632230] R10: 0000000000000008 R11: 0000000000000246 R12: 00007f89977affd4
[ 2194.632231] R13: 00007f89977afb9c R14: 00007ffee0d809a0 R15: 00007f89977b0a40
[ 2194.632232]  </TASK>

Apparently this commit does not fix it
dbd0da2453c694f2f74651834d90fb280b57f151

Hardware info:
00:00.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Renoir/Cezanne
Root Complex
00:01.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Renoir PCIe
Dummy Host Bridge
00:01.1 PCI bridge: Advanced Micro Devices, Inc. [AMD] Renoir PCIe GPP Bridge
00:02.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Renoir PCIe
Dummy Host Bridge
00:02.3 PCI bridge: Advanced Micro Devices, Inc. [AMD] Renoir/Cezanne
PCIe GPP Bridge
00:02.4 PCI bridge: Advanced Micro Devices, Inc. [AMD] Renoir/Cezanne
PCIe GPP Bridge
00:08.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Renoir PCIe
Dummy Host Bridge
00:08.1 PCI bridge: Advanced Micro Devices, Inc. [AMD] Renoir Internal
PCIe GPP Bridge to Bus
00:14.0 SMBus: Advanced Micro Devices, Inc. [AMD] FCH SMBus Controller (rev 51)
00:14.3 ISA bridge: Advanced Micro Devices, Inc. [AMD] FCH LPC Bridge (rev 51)
00:18.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Cezanne Data
Fabric; Function 0
00:18.1 Host bridge: Advanced Micro Devices, Inc. [AMD] Cezanne Data
Fabric; Function 1
00:18.2 Host bridge: Advanced Micro Devices, Inc. [AMD] Cezanne Data
Fabric; Function 2
00:18.3 Host bridge: Advanced Micro Devices, Inc. [AMD] Cezanne Data
Fabric; Function 3
00:18.4 Host bridge: Advanced Micro Devices, Inc. [AMD] Cezanne Data
Fabric; Function 4
00:18.5 Host bridge: Advanced Micro Devices, Inc. [AMD] Cezanne Data
Fabric; Function 5
00:18.6 Host bridge: Advanced Micro Devices, Inc. [AMD] Cezanne Data
Fabric; Function 6
00:18.7 Host bridge: Advanced Micro Devices, Inc. [AMD] Cezanne Data
Fabric; Function 7
04:00.0 VGA compatible controller: Advanced Micro Devices, Inc.
[AMD/ATI] Cezanne (rev c8)
04:00.1 Audio device: Advanced Micro Devices, Inc. [AMD/ATI] Renoir
Radeon High Definition Audio Controller

Kyryl
