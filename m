Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 438A36DE2EF
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 19:45:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5077F10E5EF;
	Tue, 11 Apr 2023 17:45:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99FA310E5EF
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 17:44:59 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4PwtX74CBcz9sSy;
 Tue, 11 Apr 2023 19:44:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1681235095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vRheGNvwUwjVulBxUZGJ10XUMWmjP19fn3hx4S1L7fE=;
 b=RceP99JdUWwOsA3G66T2S1vWQqyXBtIAmqYLoK7x747/l/IJaI2UM+lvn0ZaN6VkgqSLoy
 cPi38OdwpDGXvkETXvfpOhcB9TodMqO7Ub97DtAse9BG6F7aLMnsHl3h1XxogMZBOi8E0t
 UpeHMMGK2N9olZuQHE09tbutX1rF9oiVFhWXZxkFWALEDqkEcyfleahGXXFOAkxDaVJ+Cv
 ji1e4BrZ4P9aibkVDjcUYSGQ6g/ZsWtyEIJph87omyXe78rQ21zLPKn2a19qefjZkPRl7+
 BXjuQ+m/IpyAKhBT4ZNPeTXCFNm/eoNNm0f+ND2KlOcOkfcY4kPTMM5WkFGh5g==
Message-ID: <7dfd79a2-2b09-5b9a-9fa7-632b2e4af817@mailbox.org>
Date: Tue, 11 Apr 2023 19:44:53 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] fbdev: Don't spam dmesg on bad userspace ioctl input
Content-Language: en-CA
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20230404123624.360384-1-daniel.vetter@ffwll.ch>
 <03a575e1-b4ed-7bd6-b68a-0583d76803ff@mailbox.org>
 <CAMuHMdXj8PG=aidRbSaP-792wGZuRyZE6VF1BARRz7LeUrWfeA@mail.gmail.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <CAMuHMdXj8PG=aidRbSaP-792wGZuRyZE6VF1BARRz7LeUrWfeA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: kkogx3qx9i8wf7ph4digd4ntck555yro
X-MBO-RS-ID: 3225e6186ae24f33cf5
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Helge Deller <deller@gmx.de>,
 syzbot+20dcf81733d43ddff661@syzkaller.appspotmail.com,
 Javier Martinez Canillas <javierm@redhat.com>, stable@vger.kernel.org,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/11/23 11:10, Geert Uytterhoeven wrote:
> Hi Michel,
> 
> On Wed, Apr 5, 2023 at 10:50 AM Michel Dänzer
> <michel.daenzer@mailbox.org> wrote:
>> On 4/4/23 14:36, Daniel Vetter wrote:
>>> There's a few reasons the kernel should not spam dmesg on bad
>>> userspace ioctl input:
>>> - at warning level it results in CI false positives
>>> - it allows userspace to drown dmesg output, potentially hiding real
>>>   issues.
>>>
>>> None of the other generic EINVAL checks report in the
>>> FBIOPUT_VSCREENINFO ioctl do this, so it's also inconsistent.
>>>
>>> I guess the intent of the patch which introduced this warning was that
>>> the drivers ->fb_check_var routine should fail in that case. Reality
>>> is that there's too many fbdev drivers and not enough people
>>> maintaining them by far, and so over the past few years we've simply
>>> handled all these validation gaps by tighning the checks in the core,
>>> because that's realistically really all that will ever happen.
>>>
>>> Reported-by: syzbot+20dcf81733d43ddff661@syzkaller.appspotmail.com
>>> Link: https://syzkaller.appspot.com/bug?id=c5faf983bfa4a607de530cd3bb008888bf06cefc
>>> Fixes: 6c11df58fd1a ("fbmem: Check virtual screen sizes in fb_set_var()")
>>> Cc: Helge Deller <deller@gmx.de>
>>> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
>>> Cc: stable@vger.kernel.org # v5.4+
>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>>> Cc: Javier Martinez Canillas <javierm@redhat.com>
>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>>> ---
>>>  drivers/video/fbdev/core/fbmem.c | 4 ----
>>>  1 file changed, 4 deletions(-)
>>>
>>> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
>>> index 875541ff185b..9757f4bcdf57 100644
>>> --- a/drivers/video/fbdev/core/fbmem.c
>>> +++ b/drivers/video/fbdev/core/fbmem.c
>>> @@ -1021,10 +1021,6 @@ fb_set_var(struct fb_info *info, struct fb_var_screeninfo *var)
>>>       /* verify that virtual resolution >= physical resolution */
>>>       if (var->xres_virtual < var->xres ||
>>>           var->yres_virtual < var->yres) {
>>> -             pr_warn("WARNING: fbcon: Driver '%s' missed to adjust virtual screen size (%ux%u vs. %ux%u)\n",
>>> -                     info->fix.id,
>>> -                     var->xres_virtual, var->yres_virtual,
>>> -                     var->xres, var->yres);
>>>               return -EINVAL;
>>>       }
>>>
>>
>> Make it pr_warn_once? 99.9...% of the benefit, without spam.
> 
> Except that it should be pr_warn_once_per_fb_info, [...]

Not really, that's what I mean by 99.9...% of the benefit. Even if a broken driver is masked on some systems, eventually the other driver masking it should get fixed, at which point the previously masked driver will be reported again.


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer

