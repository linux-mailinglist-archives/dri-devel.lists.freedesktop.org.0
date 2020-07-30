Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98AE0234029
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 09:37:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F7796EA08;
	Fri, 31 Jul 2020 07:37:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83EE16E1B6
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 11:27:35 +0000 (UTC)
Received: from fsav404.sakura.ne.jp (fsav404.sakura.ne.jp [133.242.250.103])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 06UBRToT022896;
 Thu, 30 Jul 2020 20:27:30 +0900 (JST)
 (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav404.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav404.sakura.ne.jp);
 Thu, 30 Jul 2020 20:27:29 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav404.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 06UBRTGu022886
 (version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
 Thu, 30 Jul 2020 20:27:29 +0900 (JST)
 (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: [PATCH] fbmem: pull fbcon_update_vcs() out of fb_set_var()
To: Daniel Vetter <daniel@ffwll.ch>
References: <1596000620-4075-1-git-send-email-penguin-kernel@I-love.SAKURA.ne.jp>
 <CAKMK7uHeteS2+rKrZKrAM+zQO==hAX0XaVc9JfHPsdLTCtzKOw@mail.gmail.com>
 <a3bb6544-064d-54a1-1215-d92188cb4209@i-love.sakura.ne.jp>
 <CAKMK7uGTL02SHbEazu5YEnEncO6c-+P6DXt1GWSVQ28enqLx2g@mail.gmail.com>
From: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <d4c97785-467a-6e04-b8bb-c8aa4177882a@i-love.sakura.ne.jp>
Date: Thu, 30 Jul 2020 20:27:26 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uGTL02SHbEazu5YEnEncO6c-+P6DXt1GWSVQ28enqLx2g@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 31 Jul 2020 07:36:08 +0000
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jiri Slaby <jslaby@suse.com>,
 syzbot <syzbot+c37a14770d51a085a520@syzkaller.appspotmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020/07/30 20:16, Daniel Vetter wrote:
> Patch looks good, except ... does this compile? fbcon_update_vcs is
> defined in fbcon.h, and that doesn't seem to be included here ...
> Maybe what we want is an fb_set_var_ioctl in fbmem.c so that the fbcon
> interaction is a bit better hidden (but that's a bikeshed, feel free
> to ignore). Also I have no idea what trickery you need to compile-test
> ps3fb, that's why I'm asking :-)

Right. I didn't prepare environment for compiling powerpc kernel.
Kernel test robot found it and I already posted V2 patch as
https://lkml.kernel.org/r/075b7e37-3278-cd7d-31ab-c5073cfa8e92@i-love.sakura.ne.jp .
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
