Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9B7410AA3
	for <lists+dri-devel@lfdr.de>; Sun, 19 Sep 2021 09:54:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6510A6E196;
	Sun, 19 Sep 2021 07:54:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E07A6E102
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Sep 2021 19:58:08 +0000 (UTC)
Received: by mail-il1-f200.google.com with SMTP id
 x4-20020a92b004000000b0022b3cb3b4deso15092053ilh.17
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Sep 2021 12:58:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=ivh/Frp5TC2qWcIkr/BnJSK/kFt1+2bIZQL24hbwT64=;
 b=yNsbYS1aZqKQvLYDyaUR8nJU74N+b31MM0KncfPKRO8iELj04At33cwUUQ3ixahlyS
 ODPxq1bNBskzzedte2F0hQ4wELQ5t9VHU/kwMNmRoyPR17zNiFl766ougwre1qpe899m
 5oGdgzUSUyvyClSLKktldrtYMtPc8kUVXVLmxTp4klDvHYjVDLwMrHxjExB11ZFbMhpd
 DpHVQ6pOeyAx3LvVK3j56cWtN12O5cM8i24OdsOPARRhPnmHSVC+ZLXQqJUB0g1rQFkl
 GP90wNUH7WVgHVcs/UTZYVQGaJqwZGK7O5XqHBz2XDZA+s0e6v+mM9Tu/+wgIDjLQek9
 j3gA==
X-Gm-Message-State: AOAM532s/2BTmgCuQK0cFLioROF+43u/Ymy/JSrVSbiSj3OBOXF8xDNS
 ufsrrlwO9hESJ2xd5ujW/+Ka62kgaqWJ7rIap5VTjls6sG3H
X-Google-Smtp-Source: ABdhPJzgs6ARQpi5xrqA8t2HeKzas+2uSX6PdE7YGSaYgxMRzN33nmneQgyfAzSK2loGTkvCoPd75fBvS4XdGFR4xW6TboTeWQui
MIME-Version: 1.0
X-Received: by 2002:a6b:610a:: with SMTP id v10mr6389678iob.167.1631995087634; 
 Sat, 18 Sep 2021 12:58:07 -0700 (PDT)
Date: Sat, 18 Sep 2021 12:58:07 -0700
In-Reply-To: <000000000000fe7dd005cc2d77c0@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000079478a05cc4a7730@google.com>
Subject: Re: [syzbot] kernel BUG in vmf_insert_pfn_prot
From: syzbot <syzbot+2d4f8693f438d2bd4bdb@syzkaller.appspotmail.com>
To: airlied@linux.ie, christian.koenig@amd.com, daniel.vetter@ffwll.ch, 
 daniel.vetter@intel.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig-owner@lists.linaro.org, linaro-mm-sig@lists.linaro.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 sumit.semwal@linaro.org, syzkaller-bugs@googlegroups.com, tzimmermann@suse.de
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sun, 19 Sep 2021 07:54:26 +0000
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

commit 8b93d1d7dbd578fd296e70008b29c0f62d09d7cb
Author: Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Thu Aug 12 13:14:10 2021 +0000

    drm/shmem-helper: Switch to vmf_insert_pfn

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1277054f300000
start commit:   9004fd387338 Add linux-next specific files for 20210917
git tree:       linux-next
final oops:     https://syzkaller.appspot.com/x/report.txt?x=1177054f300000
console output: https://syzkaller.appspot.com/x/log.txt?x=1677054f300000
kernel config:  https://syzkaller.appspot.com/x/.config?x=45d5ac72f31f29f3
dashboard link: https://syzkaller.appspot.com/bug?extid=2d4f8693f438d2bd4bdb
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13ad5527300000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13beef77300000

Reported-by: syzbot+2d4f8693f438d2bd4bdb@syzkaller.appspotmail.com
Fixes: 8b93d1d7dbd5 ("drm/shmem-helper: Switch to vmf_insert_pfn")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
