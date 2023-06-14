Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D4372F662
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jun 2023 09:33:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 016EC89A88;
	Wed, 14 Jun 2023 07:33:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4FED89A88
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jun 2023 07:33:17 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4f14865fcc0so2286e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jun 2023 00:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1686727995; x=1689319995;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qkWUYxeNpxiShyt/biqf0PvJmlpRvEtSSRqqG9LGg20=;
 b=Q33P7o+fu2X34hrkntGtMU0jIuiUSMlEpor/wwql9xBvzGOS2N6LLDN8ShTHfJxbip
 tecrPeBFTEAhcjZIvWek2T0FlxNGahyhReRHFVY/GlsxXmVPyOlrNBI6q/fdmUYxOkcJ
 teJLLAxBphdKEO0YpujMNDdLJuXdYl3kjFwQ1ILH7BRCPe6NpRYMkTEOQ4EZTC0oRefp
 JXTJYv8MU/9EYqsIapfJwUv4D6malYKI4MrVCsbEEd8pJMntR5m0hURX72jh2UyDex6w
 APlZF1Csrik1q4tuQNtpHzjIa5mBVSsIceaHc7mQWERbUyAOOWOobFOFaPAn7/2JUcyE
 3i0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686727995; x=1689319995;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qkWUYxeNpxiShyt/biqf0PvJmlpRvEtSSRqqG9LGg20=;
 b=XVSzrU/TI3jVCBuL9Byx3RaceLDnmigyF6c8SFjJasalTHAt1Z/ZCV6Uu0vXUDlJRh
 l3/f7ugxieewS3q5Kty47n7nA1q7N27Rqu+YRag7mOAof/PVHjRUlwqj3HCqI0HtxfNH
 8POQr2jNQBAWIWSg6cBRu3ccOuvqvfL3kX946S6XF/Qu5z61zwCsHCUT+8+i3KLMTScT
 ZnIYUACivOhgpzGsXbIFuQLA6Av8j2GJpkmZ7n2S5u272tuLhOKR2gWex37oPtgpQbAh
 JFngMt4oCHPF8pxNExhuahKNYlz5lq6YUApcAM/R9gpzSNLYEjzX0xcOeMmYqIntu3RS
 Jt0A==
X-Gm-Message-State: AC+VfDzNR59zK6NJ9tK/NsVwM84sKygHUNRVuhPw4o/Fg5lZAy2eo+4S
 cz6LIBcdPYy1Z8PLpQPbsuMBULS0s0T4HqJffMzbhQ==
X-Google-Smtp-Source: ACHHUZ7jmduHKMzJV4DW9K/I2UmCi6bSW7ZCxI84e5H3m243tIdv98qbYVlnEeFzbG23nkVVry5ZG+nAthWBTpqD19s=
X-Received: by 2002:ac2:560b:0:b0:4f6:3c00:1764 with SMTP id
 v11-20020ac2560b000000b004f63c001764mr39438lfd.5.1686727994625; Wed, 14 Jun
 2023 00:33:14 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000fe7dd005cc2d77c0@google.com>
 <0000000000006d819905fe07c52f@google.com>
In-Reply-To: <0000000000006d819905fe07c52f@google.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Wed, 14 Jun 2023 09:33:01 +0200
Message-ID: <CACT4Y+bvzX7METN=jCcmY96dF-XNysYtF0s70Y2nxNNeYDUpsg@mail.gmail.com>
Subject: Re: [syzbot] kernel BUG in vmf_insert_pfn_prot
To: syzbot <syzbot+2d4f8693f438d2bd4bdb@syzkaller.appspotmail.com>
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
Cc: sumit.semwal@linaro.org, linaro-mm-sig-owner@lists.linaro.org,
 tzimmermann@suse.de, airlied@linux.ie, daniel.vetter@ffwll.ch,
 javierm@redhat.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 suijingfeng@loongson.cn, mripard@kernel.org, daniel.vetter@intel.com,
 syzkaller-bugs@googlegroups.com, christian.koenig@amd.com,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 13 Jun 2023 at 21:23, syzbot
<syzbot+2d4f8693f438d2bd4bdb@syzkaller.appspotmail.com> wrote:
>
> syzbot suspects this issue was fixed by commit:
>
> commit a5b44c4adb1699661d22e5152fb26885f30a2e4c
> Author: Thomas Zimmermann <tzimmermann@suse.de>
> Date:   Mon Mar 20 15:07:44 2023 +0000
>
>     drm/fbdev-generic: Always use shadow buffering
>
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1025ee07280000
> start commit:   0326074ff465 Merge tag 'net-next-6.1' of git://git.kernel...
> git tree:       upstream
> kernel config:  https://syzkaller.appspot.com/x/.config?x=d323d85b1f8a4ed7
> dashboard link: https://syzkaller.appspot.com/bug?extid=2d4f8693f438d2bd4bdb
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14fd1182880000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17567514880000
>
> If the result looks correct, please mark the issue as fixed by replying with:
>
> #syz fix: drm/fbdev-generic: Always use shadow buffering
>
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection

Looks reasonable:

#syz fix: drm/fbdev-generic: Always use shadow buffering
