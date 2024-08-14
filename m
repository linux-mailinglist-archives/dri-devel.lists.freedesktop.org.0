Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 296A795110B
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 02:32:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08B0310E3E4;
	Wed, 14 Aug 2024 00:32:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFD5710E347
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 00:32:04 +0000 (UTC)
Received: by mail-io1-f71.google.com with SMTP id
 ca18e2360f4ac-821dabd4625so777258139f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 17:32:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723595524; x=1724200324;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KN5LyX62t8kajm/Aoto7iYQTQrVYYSEk/pn2RlwMI5k=;
 b=tDmyJ1aLnX2t47osN9+GeB+Atv0qK31UmeusVUhv9ahOjiYYxVNn9rDuJF4ZvtBz1I
 Zems2MfoHAVaPPGFI+qQycS9iESqipWhjIyy6LBc4l4uEtL/4Tgx+3GJ033wfKgf3VQ2
 2F8sld/tjukJq1ZpKtGYYBOjgvCbNgEKDs4+CUb24Sk9cUnWmYQWLGHFGyAEnMHlBPqE
 g3iaczq8Ny/PHLpToTqfEXbDORqTcPl8M6BR06HxzG2kBgJgDamdxezHFGXQ1ni8tZpw
 nPWxRAzpebEjPtR6K/iKIWcSJBI83qFMjXqluYleTztIoErZWLKGqgZuunkkGsonPoap
 ZMqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU921mQES6GzBePqomd+gHJfak2/Y7xilsf3KkmrGOHYmxp6tcomVmtm+bH+Z+QDTDJQFZRoZyzu+0zg5d9qQB6PoUS6zwEv4uKZrRRQEOQ
X-Gm-Message-State: AOJu0YyqK1N6qi8xSYkxA2w7sfMsGTzbSGN6LViB5ESMsfogTEUsun4C
 EOC+RgKSWPgfSrLR2iAPAzS9WM+n1njk1lktpVQ4N0W7syfINdexBxj9rsyeqzm4v/8HBbStfHg
 uwg9vwxLTo5GvES1mwCRt+6sWVaZa262peLJtHHVb6M8bd686jHWRYWY=
X-Google-Smtp-Source: AGHT+IH/g8aCJGElQ8/VklE5ry7A0gnFjQgBbmtCcpZz0jkOADdHDRelv0/VaixlspNKb+4RvqquWD/KTAwBB1bAKcnlGLxEbNk8
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1c49:b0:374:9a34:a0a with SMTP id
 e9e14a558f8ab-39d12505416mr900485ab.6.1723595523843; Tue, 13 Aug 2024
 17:32:03 -0700 (PDT)
Date: Tue, 13 Aug 2024 17:32:03 -0700
In-Reply-To: <000000000000be3c1a0604b53a1c@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000ef7be4061f99da2f@google.com>
Subject: Re: [syzbot] [mm?] kernel BUG in filemap_unaccount_folio
From: syzbot <syzbot+17a207d226b8a5fb0fd9@syzkaller.appspotmail.com>
To: airlied@redhat.com, akpm@linux-foundation.org, christian.koenig@amd.com, 
 daniel@ffwll.ch, david@redhat.com, dri-devel@lists.freedesktop.org, 
 fengwei.yin@intel.com, gurchetansingh@chromium.org, hughd@google.com, 
 kraxel@redhat.com, linaro-mm-sig-bounces@lists.linaro.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-mm@kvack.org, sumit.semwal@linaro.org, 
 syzkaller-bugs@googlegroups.com, vivek.kasireddy@intel.com
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

syzbot suspects this issue was fixed by commit:

commit 7d79cd784470395539bda91bf0b3505ff5b2ab6d
Author: Vivek Kasireddy <vivek.kasireddy@intel.com>
Date:   Mon Jun 24 06:36:13 2024 +0000

    udmabuf: use vmf_insert_pfn and VM_PFNMAP for handling mmap

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=17dad691980000
start commit:   9b6de136b5f0 Merge tag 'loongarch-fixes-6.7-1' of git://gi..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=6ae1a4ee971a7305
dashboard link: https://syzkaller.appspot.com/bug?extid=17a207d226b8a5fb0fd9
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15f58d67680000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10a78c62e80000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: udmabuf: use vmf_insert_pfn and VM_PFNMAP for handling mmap

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
