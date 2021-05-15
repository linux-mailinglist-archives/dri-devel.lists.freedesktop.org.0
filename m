Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D01A3814B8
	for <lists+dri-devel@lfdr.de>; Sat, 15 May 2021 02:45:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AD966F4CA;
	Sat, 15 May 2021 00:45:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E33926F4CA
 for <dri-devel@lists.freedesktop.org>; Sat, 15 May 2021 00:45:43 +0000 (UTC)
Received: from fsav303.sakura.ne.jp (fsav303.sakura.ne.jp [153.120.85.134])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 14F0jFEm090525;
 Sat, 15 May 2021 09:45:15 +0900 (JST)
 (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav303.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav303.sakura.ne.jp);
 Sat, 15 May 2021 09:45:15 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav303.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 14F0jFti090520
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Sat, 15 May 2021 09:45:15 +0900 (JST)
 (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: [PATCH] video: fbdev: vga16fb: fix OOB write in
 vga16fb_imageblit()
To: "Maciej W. Rozycki" <macro@orcam.me.uk>,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <0000000000006bbd0c05c14f1b09@google.com>
 <6e21483c-06f6-404b-4018-e00ee85c456c@i-love.sakura.ne.jp>
 <87d928e4-b2b9-ad30-f3f0-1dfb8e4e03ed@i-love.sakura.ne.jp>
 <05acdda8-dc1c-5119-4326-96eed24bea0c@i-love.sakura.ne.jp>
 <CAHk-=wguwhFpjhyMtDaH2hhjoV62gDgByC=aPyTrW9CkM5hqvA@mail.gmail.com>
 <alpine.DEB.2.21.2105142150460.3032@angie.orcam.me.uk>
From: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <543ead9f-08d2-cc9d-e569-78a479378e62@i-love.sakura.ne.jp>
Date: Sat, 15 May 2021 09:45:11 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2105142150460.3032@angie.orcam.me.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Colin King <colin.king@canonical.com>, Jiri Slaby <jirislaby@kernel.org>,
 syzbot <syzbot+1f29e126cf461c4de3b3@syzkaller.appspotmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021/05/15 5:25, Maciej W. Rozycki wrote:
>  NB for fbcon the usual ioctl to resize the console is FBIOPUT_VSCREENINFO 
> rather than VT_RESIZEX; fbset(8) uses it, and I actually experimented with 
> it and a TGA-like (SFB+) framebuffer when at my lab last time, as Linux is 
> kind enough to know how to fiddle with its clockchip.  It works just fine.

fbcon_update_vcs() from FBIOPUT_VSCREENINFO is no-op if vc->vc_mode != KD_TEXT
(which is equivalent to "if vc->vc_mode == KD_GRAPHICS" because KD_TEXT0/KD_TEXT1
are treated as KD_TEXT). Then, maybe it is OK to let resize_screen() return -EINVAL
in order to make vc_do_resize() request fail if vc->vc_mode == KD_GRAPHICS.

>  Overall I think it does make sense to resize the text console at any 
> time, even if the visible console (VT) chosen is in the graphics mode, as 
> my understanding (and experience at least with vgacon) is that resizing 
> the console applies globally across all the VTs.  So the intent of the 
> original change appears valid to me, and the choice not to reprogram the 
> visible console and only store the settings for a future use if it's in 
> the graphics mode correct.
>
>  Which means any bug triggered here needs to be fixed elsewhere rather 
> than by making the request fail.

Since syzbot does not trigger this problem with Linus's patch, I think we can
try Linus's patch with

  pr_info_once("Resizing text console while in graphical mode is ignored. Please report if you need this.\n");

added in order to see if somebody wants "only store the settings for a future use".

