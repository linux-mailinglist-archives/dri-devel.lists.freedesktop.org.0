Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7F54C55D1
	for <lists+dri-devel@lfdr.de>; Sat, 26 Feb 2022 13:40:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9186010E19E;
	Sat, 26 Feb 2022 12:40:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5E9F10E19E
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Feb 2022 12:40:02 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id q11so6967205pln.11
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Feb 2022 04:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=YuRKzy5bovku/y4EtdmzO3tswEC9NnMGJRdh5w4j4uo=;
 b=BuZMddIc1HxfpW2RI1vxH2+Yg4P/UAwzSk07gyuLA/DFysQx9PnVhSPd6bjwqFXlax
 0ksjho++2JtylK+2yZFTBSj3mP9FqF2+5A5wj35pXdoC7HWMTFlbabJjriao5kBf3gXa
 +MZtYgp5WgAuLsmq5Y8k2CDHliYjkmQ1Pd4xDJPbrDV7syTqb+vbH1aNceNrCmr0eL0X
 BXuiCPGM+AhNk8+rdH2FUIoALOiViGZmtPTBCqnxN4r6ESb1r65qfF7KSRTJ5imiKPF2
 WRspPwXCNk1hppKWU1G6b4YZ2OYQfrD7Y23qpXjDxWy2mWdFX3e1Y+poJLM9LgvL1Cx3
 9l6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=YuRKzy5bovku/y4EtdmzO3tswEC9NnMGJRdh5w4j4uo=;
 b=5x0+PKNm9cZcC4aWPV0T0BQ/PN5Jo2XmrEZM3oUlqD0HP8fTnr2HETOKdJMtNT9YBd
 Piv2elPpmFIORpEsF8XT6Qi+0U3AhYPA2vBTtiKbUQ496ZsOh6cMEr6u0yTAj1omtkaL
 L+QQXk1hxYyrRHaikmdshyZZUIAp+kD4v1k+E+QV/TfXoJyECF7iZhEp9wMZ5z9T1UuJ
 10t7xUPf1IIAtLJWl4TtyYm9DR5VbU9eeMpmrkTAmvJLrPOINHsIh1dMJttWHoAdrt1z
 9kjoefdrwB9jOYRgTTMMz1eUwNDDXhPT606whxwxCQzLbByGYJ1ukyxIxFm4OGse6vMl
 2RXw==
X-Gm-Message-State: AOAM5329LVFFBWuYdnmb2v3Zxv1ToroYMKeZ4nmjXbP42FMWa9Bc5qPp
 rmQxkDSyRSHIX6tU/GHxUyj6ocKj5IByb7fx51RHhvxFMV2d
X-Google-Smtp-Source: ABdhPJwbCKBPx6DuSPeqH6k4X0BcBh3xfFXOJBO1dc+vcW3pMhCvj6J/jvfUwNucJlrmv9B0PcpnxtoSFK03D6ttNJE=
X-Received: by 2002:a17:90a:3d0f:b0:1bb:80e9:3b45 with SMTP id
 h15-20020a17090a3d0f00b001bb80e93b45mr7663101pjc.31.1645879202221; Sat, 26
 Feb 2022 04:40:02 -0800 (PST)
MIME-Version: 1.0
From: Zheyu Ma <zheyuma97@gmail.com>
Date: Sat, 26 Feb 2022 20:39:51 +0800
Message-ID: <CAMhUBjnAQmqPQEjiTNBnki5Vidnsr0ZFmBSM8pis4+j0=oZpPg@mail.gmail.com>
Subject: [BUG] fbdev: sm712fb: Page fault in smtcfb_write()
To: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com
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
Cc: linux-fbdev@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

I found a minor in the smtcfb_write() function of the driver sm712fb.
This write function can not handle the case that the size of the
buffer is 3 and does not check for it, which may cause a page fault.

Here is a simple PoC:

#include <endian.h>
#include <fcntl.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include <sys/syscall.h>
#include <sys/types.h>
#include <unistd.h>

int main(void)
{
    int fd = open("/dev/fb0", O_RDWR);
    write(fd, "000", 3);

    return 0;
}

The following log reveals it:

[ 1830.917859] BUG: unable to handle page fault for address: ffffc90001ffffff
[ 1830.918481] #PF: supervisor write access in kernel mode
[ 1830.919005] #PF: error_code(0x0002) - not-present page
[ 1830.921941] RIP: 0010:smtcfb_write+0x2c0/0x460
[ 1830.930156] Call Trace:
[ 1830.930364]  <TASK>
[ 1830.930543]  vfs_write+0x291/0xd60
[ 1830.930835]  ? do_sys_openat2+0x27d/0x350
[ 1830.931192]  ? __fget_light+0x54/0x340
[ 1830.931504]  ksys_write+0xce/0x190
[ 1830.931784]  do_syscall_64+0x43/0x90

Regards,
Zheyu Ma
