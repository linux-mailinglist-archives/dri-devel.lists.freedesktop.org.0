Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 056891812F7
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 09:32:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C6CC6E92C;
	Wed, 11 Mar 2020 08:32:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDA646E416
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 04:36:03 +0000 (UTC)
Received: by mail-il1-f198.google.com with SMTP id t9so517636ilk.10
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 21:36:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=TOW6EyRWWRmr0XeVGg68EU3oaAG/uTESSlfkqLc+cAM=;
 b=CG7f/5EiZBf2nBKpCvHJhekV3HPZjAX2n0sTb4/9gQ83H6bNbdLkm0x93cRLJUB7CV
 C8li5n+L+ncV9wD74fCYRYJ8aLnpSI1I6t784omIeqUSj+8G5TP3yJsRkzCA7cZjc409
 uve+TjIcvy9/OxQHCMcjCS56jGgmebZhnrhQFOJu4ogJ3hVKXeFivfifaFvr8QkpEc6D
 6jKbyFDS2AH80jyIKA43MoD/sn+lT3LfpyCgS6h8mjofBj4LzjuLd/kFnfjkQBKG5uxC
 vBu3HB3U4G8iVQDXesiBQ7azJXHVxQppU8hp2xeDDbBnOKj9+eoCB4nMTXBGABDSVrd1
 8Ueg==
X-Gm-Message-State: ANhLgQ1Waz+zSIv9nkfXk334ypKMwq7bVdo62RpNVfeXWsahriz0EDPQ
 9/mamxiU656vEdb6KXEXKkzsqpmyqOsb+qjvYesvh7fhaqj6
X-Google-Smtp-Source: ADFU+vux2t/xaiujvf8Y0YWq1KqzivojgudC+oOlyt8deIl3lhzOJSMIuuTOmRBd2XaXjPCRM7y5g8S9EcYG/6ABJbFkK9akhOZH
MIME-Version: 1.0
X-Received: by 2002:a92:7b10:: with SMTP id w16mr1278071ilc.93.1583901362950; 
 Tue, 10 Mar 2020 21:36:02 -0700 (PDT)
Date: Tue, 10 Mar 2020 21:36:02 -0700
In-Reply-To: <0000000000002e20b9059fee8a94@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000019196205a08cc67d@google.com>
Subject: Re: WARNING in idr_destroy
From: syzbot <syzbot+05835159fe322770fe3d@syzkaller.appspotmail.com>
To: a@unstable.cc, airlied@linux.ie, airlied@redhat.com, 
 alexander.deucher@amd.com, b.a.t.m.a.n@lists.open-mesh.org, 
 christian.koenig@amd.com, daniel@ffwll.ch, davem@davemloft.net, 
 dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org, 
 hdegoede@redhat.com, kraxel@redhat.com, linux-kernel@vger.kernel.org, 
 maarten.lankhorst@linux.intel.com, mareklindner@neomailbox.ch, 
 mripard@kernel.org, netdev@vger.kernel.org, noralf@tronnes.org, 
 sw@simonwunderlich.de, syzkaller-bugs@googlegroups.com, tglx@linutronix.de, 
 tzimmermann@suse.de
X-Mailman-Approved-At: Wed, 11 Mar 2020 08:32:41 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

syzbot has bisected this bug to:

commit 5b3709793d151e6e12eb6a38a5da3f7fc2923d3a
Author: Thomas Zimmermann <tzimmermann@suse.de>
Date:   Wed May 8 08:26:19 2019 +0000

    drm/ast: Convert AST driver to |struct drm_gem_vram_object|

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=15a66fb5e00000
start commit:   63623fd4 Merge tag 'for-linus' of git://git.kernel.org/pub..
git tree:       upstream
final crash:    https://syzkaller.appspot.com/x/report.txt?x=17a66fb5e00000
console output: https://syzkaller.appspot.com/x/log.txt?x=13a66fb5e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5d2e033af114153f
dashboard link: https://syzkaller.appspot.com/bug?extid=05835159fe322770fe3d
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14e978e3e00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10b1a819e00000

Reported-by: syzbot+05835159fe322770fe3d@syzkaller.appspotmail.com
Fixes: 5b3709793d15 ("drm/ast: Convert AST driver to |struct drm_gem_vram_object|")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
