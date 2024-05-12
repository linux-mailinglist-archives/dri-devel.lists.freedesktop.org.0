Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9838C383F
	for <lists+dri-devel@lfdr.de>; Sun, 12 May 2024 21:37:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AD5010E028;
	Sun, 12 May 2024 19:37:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 726F510E028
 for <dri-devel@lists.freedesktop.org>; Sun, 12 May 2024 19:37:06 +0000 (UTC)
Received: by mail-io1-f70.google.com with SMTP id
 ca18e2360f4ac-7e1d7031f4aso124411939f.1
 for <dri-devel@lists.freedesktop.org>; Sun, 12 May 2024 12:37:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715542625; x=1716147425;
 h=content-transfer-encoding:to:from:subject:message-id:in-reply-to
 :date:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WVn/OxZZaVY2YhgVyRsBmiKCFaHKe7OYXMQofi/q71Q=;
 b=IMniAgb9h9CDgxAQ//2LRGTdzvwXrZvT3F6DjPRm7Q3jWrxn8m5tflvOl9tfWvBQQU
 pTTB4VhEVl6ZQnRo3NbScDxAd83iv4ZPJCaAMTW+cnsfWDhwGxLAC806WL+RRLkgKA1T
 bzbYaYsefa2nr5Wp93pO7Mbp29etVzj09a3yWN+NaC9H6vQquUB/gd4tYaFabOVptL0X
 pD9wEfLNSZ8IwK5Dik3s5C9ZO7J4rOS0eDXyLe7DYHHykhhMXIEps3pOf2Yn7lTtmxJs
 z4zhc9YocLWGIleZNWoevLYCCUxbVqkyI4uHn0kk6ejXiRBhVVlPfDZM06K0aoXy8M0g
 O68A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQSVcy2fwkscPd7rFefLqFW8YFxBKdWnOg2Yoq5xQJamOYFTuOZ9U9caxq+BQoOaJtlTJEQI8WFenuwuXDxESbXczdMQBz7Q0owxvjLQou
X-Gm-Message-State: AOJu0YzIj8B/nx4pS1e0QZ5wFSTXpEU/bUAh01WpHXAX0OsxCWfgdt1F
 m20/o7J8++tiw78a8XM3Hj4RkKMgY0Ag9TGXNmbYfmqEkAxHd7fNHWeZumrj7zGFd1wbSV4yFfE
 cE9soiHYl+xBywXYwd++9wErinJoUgk+eoQ5jKNapsfy1XVfpP/xXMzU=
X-Google-Smtp-Source: AGHT+IGDS4MzOj5DR3HwqtSuhyI/oGt5Xu9CBnIDswORRMQ+lAMRu3qR2PZxLFcQnybLBtI0Q4Kjbto+VKB+6t/KDiLXjmW3OA5F
MIME-Version: 1.0
X-Received: by 2002:a05:6638:8506:b0:488:d9fb:b418 with SMTP id
 8926c6da1cb9f-4895933e5a1mr551182173.6.1715542625498; Sun, 12 May 2024
 12:37:05 -0700 (PDT)
Date: Sun, 12 May 2024 12:37:05 -0700
In-Reply-To: <000000000000898d010616c1fd03@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000ca4700061846e4e1@google.com>
Subject: Re: [syzbot] [fs?] KASAN: slab-use-after-free Read in __fput (2)
From: syzbot <syzbot+5d4cb6b4409edfd18646@syzkaller.appspotmail.com>
To: brauner@kernel.org, christian.koenig@amd.com, daniel@ffwll.ch, 
 dmantipov@yandex.ru, dri-devel@lists.freedesktop.org, jack@suse.cz, 
 justinjiang@vivo.com, linaro-mm-sig@lists.linaro.org, 
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, lvc-project@linuxtesting.org, 
 mdaenzer@redhat.com, pchelkin@ispras.ru, sumit.semwal@linaro.org, 
 syzkaller-bugs@googlegroups.com, tjmercier@google.com, 
 viro@zeniv.linux.org.uk
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

syzbot has bisected this issue to:

commit ff2d23843f7fb4f13055be5a4a9a20ddd04e6e9c
Author: Michel D=C3=A4nzer <mdaenzer@redhat.com>
Date:   Fri Jul 23 07:58:57 2021 +0000

    dma-buf/poll: Get a file reference for outstanding fence callbacks

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=3D17c1007c9800=
00
start commit:   5eb4573ea63d Merge tag 'soc-fixes-6.9-2' of git://git.kern.=
.
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=3D1421007c9800=
00
console output: https://syzkaller.appspot.com/x/log.txt?x=3D1021007c980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3D9d985095f83428b=
e
dashboard link: https://syzkaller.appspot.com/bug?extid=3D5d4cb6b4409edfd18=
646
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D11a13cf898000=
0
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D15c4d2f8980000

Reported-by: syzbot+5d4cb6b4409edfd18646@syzkaller.appspotmail.com
Fixes: ff2d23843f7f ("dma-buf/poll: Get a file reference for outstanding fe=
nce callbacks")

For information about bisection process see: https://goo.gl/tpsmEJ#bisectio=
n
