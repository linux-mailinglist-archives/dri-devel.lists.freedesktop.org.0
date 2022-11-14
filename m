Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAEC627449
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 02:49:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F80B10E259;
	Mon, 14 Nov 2022 01:49:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77CE510E259
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 01:49:39 +0000 (UTC)
Received: by mail-il1-f198.google.com with SMTP id
 h10-20020a056e021b8a00b00302671bb5fdso96017ili.21
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Nov 2022 17:49:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0NIciGEMFs3GR0VxmcRj2FqKZjUa05yht5hU+xLHqL8=;
 b=H5gilPW+JC+Do8mqZ+tsLhcVV+ahrYspSl1hecYSow3Nw9ZxhPAH2Hcp2M/0OCg1xh
 NFpNmnVFYDpDN5xvJHXveTMh7d2YINvRYUA0rrRoXtT0le91dARAJxH/Jxg6szaZ/jrm
 oG6aufMG+tELafnAY/xGa6Z3i9fGX4qa/I8JgI3ZvUNgsqoIGQwyOZDiIxJnFHeGOP+Q
 HOIkNwGogBQ32xTMjuZvg2ISXLjRm7pykOlN6op+V5QUKa5bAih9BaWu+6klIN4kf1ss
 MQxhvdKTrVzFNfo34/v2FxtS9kza5vgYcTVIJF3n0QKC/V8PXnygVJbijjqyA3kMcOgL
 B34w==
X-Gm-Message-State: ANoB5pk3T7Vdwsm0OxsRgvBh9eSD8BToQcHRDx28KfsIOuAHNUY5WBMa
 rTzL7DcUjnka2M42JkeFMuC1Kch6vF0YEqnQA01VXkEMk65i
X-Google-Smtp-Source: AA0mqf4oSH+2L1giJjDUKiHTVQUltrz0Z1AwBwcVEqq+IVE588oskcYMuAffWmdXohdOr+bP5nkTCRoWMV6ijRU4lY/7rTO8ke0c
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1061:b0:300:d3e0:2492 with SMTP id
 q1-20020a056e02106100b00300d3e02492mr5288163ilj.148.1668390578548; Sun, 13
 Nov 2022 17:49:38 -0800 (PST)
Date: Sun, 13 Nov 2022 17:49:38 -0800
In-Reply-To: <00000000000041665a05ed5c17db@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000c7f9c605ed6473c8@google.com>
Subject: Re: [syzbot] possible deadlock in vfs_fileattr_set
From: syzbot <syzbot+abe01a74653f00aabe3e@syzkaller.appspotmail.com>
To: airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-graphics-maintainer@vmware.com, linux-kernel@vger.kernel.org, 
 reiserfs-devel@vger.kernel.org, sroland@vmware.com, 
 syzkaller-bugs@googlegroups.com, tzimmermann@suse.de, zackr@vmware.com
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

commit 6dd6b7643e723b4779e59c8ad97bd5db6ff3bb12
Author: Thomas Zimmermann <tzimmermann@suse.de>
Date:   Mon Jan 18 13:14:19 2021 +0000

    drm/vmwgfx: Remove reference to struct drm_device.pdev

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1418e6a5880000
start commit:   f8f60f322f06 Add linux-next specific files for 20221111
git tree:       linux-next
final oops:     https://syzkaller.appspot.com/x/report.txt?x=1618e6a5880000
console output: https://syzkaller.appspot.com/x/log.txt?x=1218e6a5880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=85ba52c07cd97289
dashboard link: https://syzkaller.appspot.com/bug?extid=abe01a74653f00aabe3e
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=138b76ae880000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16ab1bfe880000

Reported-by: syzbot+abe01a74653f00aabe3e@syzkaller.appspotmail.com
Fixes: 6dd6b7643e72 ("drm/vmwgfx: Remove reference to struct drm_device.pdev")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
