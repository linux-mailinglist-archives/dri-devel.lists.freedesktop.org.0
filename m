Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A05927E2FC
	for <lists+dri-devel@lfdr.de>; Wed, 30 Sep 2020 09:50:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3529E6E53E;
	Wed, 30 Sep 2020 07:50:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mxout.uchuujin.de (static.85-10-192-230.clients.your-server.de
 [85.10.192.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A744F89D9A
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 10:52:06 +0000 (UTC)
Received: by neutronstar.dyndns.org (Postfix, from userid 1000)
 id 95E361430A410; Tue, 29 Sep 2020 12:52:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=uchuujin.de; s=h;
 t=1601376723; bh=S4qRhmQnANACcgAsVG/DL9GYSVFl4YpEydWlE5Zr2Ds=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kQ5SCbFzDRm4dN6U+6m/9xGYPd9nKBC0cDUYWnO70jRjSK1W6dsLgFyeYAHhRRkK4
 hGvGy2CfTg+VS/p2BwjSZvM7VU/0YSpcRkDH2kyYOHmIr6gi1q3vz/cWxZiySJHhsj
 /QdFJQt/aJOQqzNYzWtK5xjTmBCa2JSOFUnjnlpVbzDVH/WYHFlIbUpSPfJJVi/Ofv
 bPPRXvGYyq2xbfho+O+8CxyeN5ryfqTSejVkrZBp4whlcwSwAsqReID7WjQNgUbk8p
 lCTmS673EGxk/BpX9j7jzcaISeLJq44r+QtnpNnjeZP/RSw3x9GbctyGQawjVtn5F8
 vvfWOcjWk3/Hw==
Date: Tue, 29 Sep 2020 12:52:03 +0200
From: Martin Hostettler <textshell@uchuujin.de>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Subject: Re: [PATCH] vt_ioctl: make VT_RESIZEX behave like VT_RESIZE
Message-ID: <20200929105203.GG24673@neutronstar.dyndns.org>
References: <000000000000226d3f05b02dd607@google.com>
 <bbcef674-4ac6-c933-b55d-8961ada97f4c@i-love.sakura.ne.jp>
 <47907f77-b14b-b433-45c6-a315193f0c1a@i-love.sakura.ne.jp>
 <494395bc-a7dd-fdb1-8196-a236a266ef54@i-love.sakura.ne.jp>
 <20200927092701.GA1037755@PWN>
 <4933b81b-9b1a-355b-df0e-9b31e8280ab9@i-love.sakura.ne.jp>
 <20200928175956.GF24673@neutronstar.dyndns.org>
 <100dfd3f-3415-80ae-a6cf-30d15f7ca49f@i-love.sakura.ne.jp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <100dfd3f-3415-80ae-a6cf-30d15f7ca49f@i-love.sakura.ne.jp>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Wed, 30 Sep 2020 07:50:09 +0000
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
Cc: syzbot <syzbot+b308f5fd049fbbc6e74f@syzkaller.appspotmail.com>,
 linux-fbdev@vger.kernel.org, George Kennedy <george.kennedy@oracle.com>,
 b.zolnierkie@samsung.com, gregkh@linuxfoundation.org, deller@gmx.de,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Martin Hostettler <textshell@uchuujin.de>,
 Linus Torvalds <torvalds@linux-foundation.org>, daniel.vetter@ffwll.ch,
 jirislaby@kernel.org, Peilin Ye <yepeilin.cs@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 29, 2020 at 10:12:46AM +0900, Tetsuo Handa wrote:
> On 2020/09/29 2:59, Martin Hostettler wrote:
> > On Sun, Sep 27, 2020 at 08:46:30PM +0900, Tetsuo Handa wrote:
> >> VT_RESIZEX was introduced in Linux 1.3.3, but it is unclear that what
> >> comes to the "+ more" part, and I couldn't find a user of VT_RESIZEX.
> >>
> > 
> > It seems this is/was used by "svgatextmode" which seems to be at
> > http://www.ibiblio.org/pub/Linux/utils/console/
> > 
> > Not sure if that kind of software still has a chance to work nowadays.
> > 
> 
> Thanks for the information.
> 
> It seems that v.v_vlin = curr_textmode->VDisplay / (MOFLG_ISSET(curr_textmode, ATTR_DOUBLESCAN) ? 2 : 1)
> and v.v_clin = curr_textmode->FontHeight . Thus, v.v_clin is font's height and seems to be non-zero.
> But according to https://bugs.gentoo.org/19485 , people are using kernel framebuffer instead.
> 

Yes, this seems to be from pre framebuffer times.

Back in the days "svga" was the wording you got for "pokes svga card
hardware registers from userspace drivers". And textmode means font
rendering is done via (fixed function in those times) hardware scanout
engine. Of course having only to update 2 bytes per character was a huge
saving early on. Likely this is also before vesa VBE was reliable.

So i guess the point where this all starts going wrong allowing the X parts
of the api to be combined with FB based rendering at all? Sounds the only
user didn't use that combination and so it was never tested?

Then again, this all relates to hardware from 20 years ago...

 - Martin Hostettler
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
