Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA5A6AA804
	for <lists+dri-devel@lfdr.de>; Sat,  4 Mar 2023 05:36:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8370210E083;
	Sat,  4 Mar 2023 04:36:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1980110E0CE
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Mar 2023 04:36:16 +0000 (UTC)
Received: by mail-il1-f199.google.com with SMTP id
 v3-20020a92c6c3000000b003159a0109ceso2499716ilm.12
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Mar 2023 20:36:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qBM8f3nfkQPiCUxCkC/1jIKN/CSWO63Mv0FZdwLHa7w=;
 b=X9bmfE4EHFmJrEcAK/sUzSsVG7/nra6R/K5jYuYEYuHGS1dUUugttt8dPgepi1bzMk
 JDYWb8yKtdP4QcWLdi7bBVluF8jqasVZS7QJRjuWuvVE46gaMBtjej3t4lriGcbXqn4p
 dE1MiF4dTWB6BrE6W6Rxa80SIq9fviPbsOmxyg3mXEnBCOiKOHj7nMBoH1s2IqSRFmdh
 sSTyqH+gUTes4UbG5EYABvh2HTz3uXRp94bxcPUVROvJ5dobHWyO7Y6/6ZwkBkJt++mp
 EUHlktrHuShR9XMaOy+mhyT9ZjdJ237IuSvxYfT5N/ptgBdGK9vd3fn1LMwfCK7q2x7H
 Bo6w==
X-Gm-Message-State: AO0yUKVDwp4whCCpc7c4Qxs2AmYHkq8avXR2eQqGffiAW0+NMU5m7Jyw
 6x32rrCCZGcQy5ooFpy6SrdN5ofskA6SAqwq/S6sGp3v2CPq
X-Google-Smtp-Source: AK7set9ivc7a0hTa59+MlzQADnVR9rVesqaUQ/nvWX6Tgg9CYI6nEEqLldZZLLoEwGD8VgHEij9xXEv9mpDaSxPxdEDomAm6DdMV
MIME-Version: 1.0
X-Received: by 2002:a02:94cd:0:b0:3e1:fb3d:4dce with SMTP id
 x71-20020a0294cd000000b003e1fb3d4dcemr1851215jah.0.1677904576128; Fri, 03 Mar
 2023 20:36:16 -0800 (PST)
Date: Fri, 03 Mar 2023 20:36:16 -0800
In-Reply-To: <0000000000001d1fb505f605c295@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000003a2e5e05f60b9aff@google.com>
Subject: Re: [syzbot] [hardening?] [mm?] BUG: bad usercopy in con_font_op
From: syzbot <syzbot+3af17071816b61e807ed@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, daniel@ffwll.ch, deller@gmx.de, 
 dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org, 
 jirislaby@kernel.org, keescook@chromium.org, linux-fbdev@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org, samuel.thibault@ens-lyon.org, 
 syzkaller-bugs@googlegroups.com
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

syzbot has bisected this issue to:

commit 24d69384bcd34b9dcaf5dab744bf7096e84d1abd
Author: Samuel Thibault <samuel.thibault@ens-lyon.org>
Date:   Thu Jan 19 15:19:16 2023 +0000

    VT: Add KD_FONT_OP_SET/GET_TALL operations

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=120b3232c80000
start commit:   2eb29d59ddf0 Merge tag 'drm-next-2023-03-03-1' of git://an..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=110b3232c80000
console output: https://syzkaller.appspot.com/x/log.txt?x=160b3232c80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cab35c936731a347
dashboard link: https://syzkaller.appspot.com/bug?extid=3af17071816b61e807ed
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10b71504c80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16f02d9cc80000

Reported-by: syzbot+3af17071816b61e807ed@syzkaller.appspotmail.com
Fixes: 24d69384bcd3 ("VT: Add KD_FONT_OP_SET/GET_TALL operations")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
