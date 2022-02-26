Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 347784C55DB
	for <lists+dri-devel@lfdr.de>; Sat, 26 Feb 2022 13:44:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE9F910E257;
	Sat, 26 Feb 2022 12:44:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D76710E257
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Feb 2022 12:44:46 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id u16so7005038pfg.12
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Feb 2022 04:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=Sn/z8nvM161fdH6pWEKCkPPFVvsowaWegFT2G61xxdw=;
 b=EhMLDaNjtyW/hlVkocLTA0AAr0EdD+vS7deyFf2QCBdw6Qt7WDODTALdL7nkPdsKHq
 fL3fhkiafWtGq/bybIKmQkjkMdd+6CrK1io3dGiOMOaLRDTC/RHu9n3rP6GD5HheKbqR
 xTzWeZPLboOns2VrxG7nVV78ouXZP3zlebPpdenHzxG7zHb+hjx1T3GmXRiZqeIjBOdL
 WD4pb9WXKfqKp8GTuruR3VURHlt85wj2iLGxzr1QSUEAJkfTdj+By0zdjGpLYUE3ubEi
 /GGaKUY2rDcyX7IRuoXRcopVir/27Q1anA61orf3WfSD+jgRLUWW9rYr5vwefsTLjKLX
 bCaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=Sn/z8nvM161fdH6pWEKCkPPFVvsowaWegFT2G61xxdw=;
 b=zr4q2dQ2KuCqLdMfEbuiu7IRhNVkNaTjVklTEjU+8ZfxMNf6p67+O+I7bxfYtVzAFx
 BWgNgJMth2SXO8JtakMNO+m5TvmuaZxrSLQnV0pLDXBTyfx4IhSsdi2Z61jOGWgKXKHJ
 CB2lI0u51330shC2GDWJzNWieax30+xddqDK+ZrRLQ9hZJpEaUF2LkeR3TdmXwKfKGPu
 sw9gXp/UWNNQ5jAPE9K/5luO2xsK0JEdq3C1eaXBc0skwN2s7bjErF8yagW64pQbD0iz
 NLSGge3TBl03Iz5mMYsgF5UxRnTUy9uDPIC1XKooAHwFaFQlylI4RWknkd0DGFhK4xa8
 Xt/g==
X-Gm-Message-State: AOAM530MUsQkJ1S/H4e5iurnmm6CoKgFBz6lleaQkEt60xIUAGUeW7+C
 vr+omJXGNtdPC4tdNHW9xd/5F6ZJPSGOY1jRBg==
X-Google-Smtp-Source: ABdhPJwS3wcSDYAdmHpH2aX2ySuYxUZzrV58f1pG5p33jYqqYGekq0LtiJfVEM6dmLuNgLbfXP5CWjhh1NWxw5TWeS0=
X-Received: by 2002:a05:6a00:1991:b0:4e1:a7dd:96e5 with SMTP id
 d17-20020a056a00199100b004e1a7dd96e5mr12734448pfl.2.1645879484788; Sat, 26
 Feb 2022 04:44:44 -0800 (PST)
MIME-Version: 1.0
From: Zheyu Ma <zheyuma97@gmail.com>
Date: Sat, 26 Feb 2022 20:44:33 +0800
Message-ID: <CAMhUBjmetJqbERvQ8513b-wHuV68hqLTuUVWiORyJyXP26gO7Q@mail.gmail.com>
Subject: [BUG] fbdev: sm712fb: Page fault in smtcfb_read
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

I found a minor in the smtcfb_read() function of the driver sm712fb.

This read function can not handle the case that the size of the
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
    char buf[10];

    int fd = open("/dev/fb0", O_RDWR);
    read(fd, buf, 3);

    return 0;
}

The following log reveals it:

[ 2432.614490] BUG: unable to handle page fault for address: ffffc90001ffffff
[ 2432.618474] RIP: 0010:smtcfb_read+0x230/0x3e0
[ 2432.626551] Call Trace:
[ 2432.626770]  <TASK>
[ 2432.626950]  vfs_read+0x198/0xa00
[ 2432.627225]  ? do_sys_openat2+0x27d/0x350
[ 2432.627552]  ? __fget_light+0x54/0x340
[ 2432.627871]  ksys_read+0xce/0x190
[ 2432.628143]  do_syscall_64+0x43/0x90

Regards,
Zheyu Ma
