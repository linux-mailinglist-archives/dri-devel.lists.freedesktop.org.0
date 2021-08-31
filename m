Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 526A83FCABE
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 17:24:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BB5D6E0DC;
	Tue, 31 Aug 2021 15:24:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 386B86E0DC
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 15:24:46 +0000 (UTC)
Received: from fsav311.sakura.ne.jp (fsav311.sakura.ne.jp [153.120.85.142])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 17VFO9XU065984;
 Wed, 1 Sep 2021 00:24:09 +0900 (JST)
 (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav311.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav311.sakura.ne.jp);
 Wed, 01 Sep 2021 00:24:09 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav311.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 17VFO3bt065891
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 1 Sep 2021 00:24:09 +0900 (JST)
 (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: [PATCH] fbmem: don't allow too huge resolutions
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 syzbot <syzbot+04168c8063cfdde1db5e@syzkaller.appspotmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Colin King <colin.king@canonical.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 syzkaller-bugs@googlegroups.com, Randy Dunlap <rdunlap@infradead.org>
References: <000000000000815b9605c70e74f8@google.com>
 <131b24e5-ee31-6f7b-42b4-c34583711913@infradead.org>
 <2fccb5d3-191c-924e-159f-1c9d423e282f@i-love.sakura.ne.jp>
 <339bfb21-8e80-c7d9-46dd-c416f87c50c0@infradead.org>
 <535e404d-03bf-8e7a-b296-132a2a98c599@i-love.sakura.ne.jp>
 <CAMuHMdWX7s63X_zR9329canbQkPGBVxZNG4O+_=jUut60aGR9g@mail.gmail.com>
From: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <5c6d2b95-31d7-0d59-5e62-2593d9a0e1fe@i-love.sakura.ne.jp>
Date: Wed, 1 Sep 2021 00:23:58 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWX7s63X_zR9329canbQkPGBVxZNG4O+_=jUut60aGR9g@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021/08/31 15:48, Geert Uytterhoeven wrote:
> Furthermore, this restricts the virtual frame buffer size on 64-bit,
> too, while graphics cards can have much more than 4 GiB of RAM.

Excuse me, but do you mean that some hardware allows allocating more than
UINT_MAX bytes of memory for kernel frame buffer drivers?

> IMHO that should be fixed in vga16fb, too.

According to https://elixir.bootlin.com/linux/v5.14/A/ident/fb_check_var , 
there are 89 files. Randomly picking up drivers/video/fbdev/udlfb.c as
an example. dlfb_is_valid_mode() from dlfb_ops_check_var() is doing

  if (mode->xres * mode->yres > dlfb->sku_pixel_limit)
    return 0;
  return 1;

where max dlfb->sku_pixel_limit seems to be 2048 * 1152 but I think we need
same overflow check. I want to avoid patching individual modules if possible.
That depends on whether some hardware needs to allocate more than UINT_MAX
bytes of memory.

