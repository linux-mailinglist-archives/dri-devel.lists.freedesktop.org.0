Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 430762DF527
	for <lists+dri-devel@lfdr.de>; Sun, 20 Dec 2020 12:10:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78F7E6E15F;
	Sun, 20 Dec 2020 11:10:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89E1C89D7B
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Dec 2020 01:01:45 +0000 (UTC)
Received: from fsav304.sakura.ne.jp (fsav304.sakura.ne.jp [153.120.85.135])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 0BJ108Mq021270;
 Sat, 19 Dec 2020 10:00:09 +0900 (JST)
 (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav304.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav304.sakura.ne.jp);
 Sat, 19 Dec 2020 10:00:08 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav304.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 0BJ104SU021250
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Sat, 19 Dec 2020 10:00:08 +0900 (JST)
 (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: WARNING: suspicious RCU usage in modeset_lock
To: "Paul E. McKenney" <paulmck@kernel.org>
References: <000000000000cb6db205b68a971c@google.com>
 <CAKMK7uEiS5SrBYv-2w2wWL=9G4ByoHvtiWVsPqekswZzOGmzjg@mail.gmail.com>
 <20201216161621.GH2657@paulmck-ThinkPad-P72>
 <CAKMK7uH1agVS=e245b=25Lv9Q+u5c7=KL-_NF8Hte10nKTqAXw@mail.gmail.com>
 <20201217152118.GR2657@paulmck-ThinkPad-P72>
 <X9wGBcCnhxr36WF4@boqun-archlinux>
 <CACT4Y+bABW7OP0RDm-Qnq2M6kKVTc=e7Tmt5Uc1+zWyD2roqrA@mail.gmail.com>
From: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <c0ed329a-1349-5d07-5b60-0a89d9fb9de3@i-love.sakura.ne.jp>
Date: Sat, 19 Dec 2020 10:00:02 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CACT4Y+bABW7OP0RDm-Qnq2M6kKVTc=e7Tmt5Uc1+zWyD2roqrA@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Sun, 20 Dec 2020 11:10:15 +0000
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 syzbot <syzbot+972b924c988834e868b2@syzkaller.appspotmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Boqun Feng <boqun.feng@gmail.com>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 Josh Triplett <josh@joshtriplett.org>, Steven Rostedt <rostedt@goodmis.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, rcu@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Dmitry Vyukov <dvyukov@google.com>,
 Nathan Chancellor <natechancellor@gmail.com>, Peter Rosin <peda@axentia.se>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 16, 2020 at 5:16 PM Paul E. McKenney <paulmck@kernel.org> wrote:
> In my experience, lockdep will indeed complain if an interrupt handler
> returns while in an RCU read-side critical section.

Can't we add lock status checks into the beginning and the end of interrupt handler functions
(e.g. whether "struct task_struct"->lockdep_depth did not change) ?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
