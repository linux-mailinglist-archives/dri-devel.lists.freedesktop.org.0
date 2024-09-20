Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D1297D7E7
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2024 17:54:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A81D10E24E;
	Fri, 20 Sep 2024 15:54:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="CwiO7nqJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
 by gabe.freedesktop.org (Postfix) with ESMTP id 911B610E846
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2024 15:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
 Content-Type; bh=ik0gK8vRwGiHfDmJUuUxNY6F8LkSlnZadKmBWuY90CI=;
 b=CwiO7nqJAb74PnXh6/KJFnbmieBdqJQDpsqaOxH7w/V9s1kgCTJoy/vT3qYrd4
 D5OGz+9sWPwh1vPly0BMmxyi4SPw7hhpAIqUdnxeOZHmHFeoOqB4I9D138l1RWti
 kipx8r9CiEryuXG2UqoC4irxhsgWKGDw0HdjFcFyrzoZg=
Received: from localhost (unknown [36.33.37.137])
 by gzga-smtp-mta-g3-3 (Coremail) with SMTP id _____wAnb+oLle1meaO8EQ--.24619S2;
 Fri, 20 Sep 2024 23:30:19 +0800 (CST)
Date: Fri, 20 Sep 2024 23:30:18 +0800
From: Qianqiang Liu <qianqiang.liu@163.com>
To: Helge Deller <deller@gmx.de>
Cc: aniel@ffwll.ch, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 syzbot+3d613ae53c031502687a@syzkaller.appspotmail.com
Subject: Re: [PATCH] fbcon: Fix a NULL pointer dereference issue in fbcon_putcs
Message-ID: <Zu2VCshU3Jx5X7oE@thinkpad.lan>
References: <20240916011027.303875-1-qianqiang.liu@163.com>
 <a57734e8-ffb9-4af1-be02-eb0c99507048@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a57734e8-ffb9-4af1-be02-eb0c99507048@gmx.de>
X-CM-TRANSID: _____wAnb+oLle1meaO8EQ--.24619S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKw1xKw1DWry8Kw4xXw45GFg_yoWfCFcEv3
 y7CFWYg3y7Xa43A3ZxWanxJFZF9w1UJF1UuryrZrnF9anxGr4UCan5XrWxJr4jgFZIqa10
 9F4UJFn7KFWF9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0tCzJUUUUU==
X-Originating-IP: [36.33.37.137]
X-CM-SenderInfo: xtld01pldqwhxolxqiywtou0bp/1tbiLwxgambtjEK3EwAAsI
X-Mailman-Approved-At: Fri, 20 Sep 2024 15:54:28 +0000
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

I simplified the C reproducer as follows:

#include <stdint.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <linux/fb.h>
#include <linux/tiocl.h>
#include <sys/ioctl.h>

struct param {
        uint8_t type;
        struct tiocl_selection ts;
};

int main()
{
        write(1, "executing program\n", sizeof("executing program\n") - 1);

        int fd = open("/dev/fb1", 0, 0);

        struct fb_con2fbmap con2fb;
        con2fb.console = 0x19;
        con2fb.framebuffer = 0;
        ioctl(fd, FBIOPUT_CON2FBMAP, &con2fb);

        int fd1 = open("/dev/tty1", O_RDWR, 0);

        struct param param;
        param.type = 2;
        param.ts.xs = 0;
        param.ts.ys = 0;
        param.ts.xe = 0;
        param.ts.ye = 0;
        param.ts.sel_mode = 0;

        ioctl(fd1, TIOCLINUX, &param);

        con2fb.console = 1;
        con2fb.framebuffer = 0;
        ioctl(fd, FBIOPUT_CON2FBMAP, &con2fb);

        return 0;
}

But I still need time to debug the kernel code..

-- 
Best,
Qianqiang Liu

