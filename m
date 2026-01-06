Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5441ECF79B6
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 10:48:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D28C010E0D0;
	Tue,  6 Jan 2026 09:48:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.b="gc1OWrfE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2633 seconds by postgrey-1.36 at gabe;
 Tue, 06 Jan 2026 09:48:05 UTC
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03D1410E0D0
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 09:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:
 Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
 References; bh=hZWhWS6u8qnxThFxrHymtByvkuCdMoLtOGR4+l86sSM=; t=1767692885;
 x=1768124885; b=gc1OWrfEew21AxJZYmfot/i7p0nDEnq2HE4qR+mIvTC5En3ikE3250ZBVOnNN
 cLjBiBQ4xe3F/jSg0rq+Yk1Dhdp/u2I4VDNUmuHhVHS+iHGuMzxKt1Ox1ZZwzhUMFKXd5kyPctK40
 e6p5alggT1Of+cjdgkiNEuLhME6lv1jLg82585qJutF7XZDMXqBvYJsrk1DEPBcLwjWvBDpoHWKnn
 JxnBK19sE3m2aLa4n1qdfCmKIDfiiSNwEFBB+PbjUpXmfU4cVfFUGZIjH/juMlwWuuNRIUbTOdA8V
 e53R9oqwt3zKHBzEdo6bIyhQqPKI3IhebObH35Ld7bX1Lq4W4Q==;
Received: from [2a02:8108:8984:1d00:a0cf:1912:4be:477f]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
 id 1vd2z0-004AI7-0E; Tue, 06 Jan 2026 10:04:06 +0100
Message-ID: <785e9aa8-dbfa-4325-bbcd-0ab44a2feb46@leemhuis.info>
Date: Tue, 6 Jan 2026 10:04:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] fbdev: bitblit: bound-check glyph index in bit_putcs*
To: "Barry K. Nathan" <barryn@pobox.com>, Vitaly Chikunov <vt@altlinux.org>,
 Junjie Cao <junjie.cao@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Peilin Ye <yepeilin.cs@gmail.com>, Daniel Vetter
 <daniel.vetter@ffwll.ch>, Shigeru Yoshida <syoshida@redhat.com>,
 Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Zsolt Kajtar <soci@c64.rulez.org>,
 Albin Babu Varghese <albinbabuvarghese20@gmail.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 regressions@lists.linux.dev, Ben Hutchings <ben@decadent.org.uk>
References: <20251020134701.84082-1-junjie.cao@intel.com>
 <aU23brU4lZqIkw4Z@altlinux.org> <aU58SeZZPxScVPad@altlinux.org>
 <ccbbf777-cf4e-4c66-856e-282dd9d61970@pobox.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <ccbbf777-cf4e-4c66-856e-282dd9d61970@pobox.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1767692885;
 27ba5f6d; 
X-HE-SMSGID: 1vd2z0-004AI7-0E
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

[Top posting to make this easy processable]

TWIMC, Ben (now CCed) meanwhile reported the problem as well:

https://lore.kernel.org/all/c5a27a57597c78553bf121d09a1b45ed86dc02a8.camel@decadent.org.uk/

There he wrote
"""
This can be fixed by backporting the following commits from 5.11:

7a089ec7d77f console: Delete unused con_font_copy() callback implementations
259a252c1f4e console: Delete dummy con_font_set() and con_font_default()
callback implementations
4ee573086bd8 Fonts: Add charcount field to font_desc
4497364e5f61 parisc/sticore: Avoid hard-coding built-in font charcount
a1ac250a82a5 fbcon: Avoid using FNTCHARCNT() and hard-coded built-in
font charcount

These all apply without fuzz and builds cleanly for x86_64 and parisc64.
"""

Ciao, Thorsten

On 12/27/25 03:04, Barry K. Nathan wrote:
> On 12/26/25 4:21 AM, Vitaly Chikunov wrote:
>> Dear linux-fbdev, stable,
>>
>> On Fri, Dec 26, 2025 at 01:29:13AM +0300, Vitaly Chikunov wrote:
>>>
>>> On Mon, Oct 20, 2025 at 09:47:01PM +0800, Junjie Cao wrote:
>>>> bit_putcs_aligned()/unaligned() derived the glyph pointer from the
>>>> character value masked by 0xff/0x1ff, which may exceed the actual
>>>> font's
>>>> glyph count and read past the end of the built-in font array.
>>>> Clamp the index to the actual glyph count before computing the address.
>>>>
>>>> This fixes a global out-of-bounds read reported by syzbot.
>>>>
>>>> Reported-by: syzbot+793cf822d213be1a74f2@syzkaller.appspotmail.com
>>>> Closes: https://syzkaller.appspot.com/bug?extid=793cf822d213be1a74f2
>>>> Tested-by: syzbot+793cf822d213be1a74f2@syzkaller.appspotmail.com
>>>> Signed-off-by: Junjie Cao <junjie.cao@intel.com>
>>>
>>> This commit is applied to v5.10.247 and causes a regression: when
>>> switching VT with ctrl-alt-f2 the screen is blank or completely filled
>>> with angle characters, then new text is not appearing (or not visible).
>>>
>>> This commit is found with git bisect from v5.10.246 to v5.10.247:
>>>
>>>    0998a6cb232674408a03e8561dc15aa266b2f53b is the first bad commit
>>>    commit 0998a6cb232674408a03e8561dc15aa266b2f53b
>>>    Author:     Junjie Cao <junjie.cao@intel.com>
>>>    AuthorDate: 2025-10-20 21:47:01 +0800
>>>    Commit:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>>    CommitDate: 2025-12-07 06:08:07 +0900
>>>
>>>        fbdev: bitblit: bound-check glyph index in bit_putcs*
>>>
>>>        commit 18c4ef4e765a798b47980555ed665d78b71aeadf upstream.
>>>
>>>        bit_putcs_aligned()/unaligned() derived the glyph pointer from
>>> the
>>>        character value masked by 0xff/0x1ff, which may exceed the
>>> actual font's
>>>        glyph count and read past the end of the built-in font array.
>>>        Clamp the index to the actual glyph count before computing the
>>> address.
>>>
>>>        This fixes a global out-of-bounds read reported by syzbot.
>>>
>>>        Reported-by:
>>> syzbot+793cf822d213be1a74f2@syzkaller.appspotmail.com
>>>        Closes: https://syzkaller.appspot.com/bug?
>>> extid=793cf822d213be1a74f2
>>>        Tested-by: syzbot+793cf822d213be1a74f2@syzkaller.appspotmail.com
>>>        Signed-off-by: Junjie Cao <junjie.cao@intel.com>
>>>        Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>        Signed-off-by: Helge Deller <deller@gmx.de>
>>>        Cc: stable@vger.kernel.org
>>>        Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>>
>>>     drivers/video/fbdev/core/bitblit.c | 16 ++++++++++++----
>>>     1 file changed, 12 insertions(+), 4 deletions(-)
>>>
>>> The minimal reproducer in cli, after kernel is booted:
>>>
>>>    date >/dev/tty2; chvt 2
>>>
>>> and the date does not appear.
>>>
>>> Thanks,
>>>
>>> #regzbot introduced: 0998a6cb232674408a03e8561dc15aa266b2f53b
>>>
>>>> ---
>>>> v1: https://lore.kernel.org/linux-fbdev/5d237d1a-a528-4205-
>>>> a4d8-71709134f1e1@suse.de/
>>>> v1 -> v2:
>>>>   - Fix indentation and add blank line after declarations with
>>>> the .pl helper
>>>>   - No functional changes
>>>>
>>>>   drivers/video/fbdev/core/bitblit.c | 16 ++++++++++++----
>>>>   1 file changed, 12 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/video/fbdev/core/bitblit.c b/drivers/video/
>>>> fbdev/core/bitblit.c
>>>> index 9d2e59796c3e..085ffb44c51a 100644
>>>> --- a/drivers/video/fbdev/core/bitblit.c
>>>> +++ b/drivers/video/fbdev/core/bitblit.c
>>>> @@ -79,12 +79,16 @@ static inline void bit_putcs_aligned(struct
>>>> vc_data *vc, struct fb_info *info,
>>>>                        struct fb_image *image, u8 *buf, u8 *dst)
>>>>   {
>>>>       u16 charmask = vc->vc_hi_font_mask ? 0x1ff : 0xff;
>>>> +    unsigned int charcnt = vc->vc_font.charcount;
>>
>> Perhaps, vc->vc_font.charcount (which is relied upon in the following
>> comparison) is not always set correctly in v5.10.247. At least two
>> commits that set vc_font.charcount are missing from v5.10.247:
>>
>>    a1ac250a82a5 ("fbcon: Avoid using FNTCHARCNT() and hard-coded
>> built-in font charcount")
>>    a5a923038d70 ("fbdev: fbcon: Properly revert changes when
>> vc_resize() failed")
>>
>> Thanks,
> 
> I was just about to report this.
> 
> I found two ways to fix this bug. One is to revert this patch; the other
> is to apply the following 3 patches, which are already present in 5.11
> and later:
> 
> 7a089ec7d77fe7d50f6bb7b178fa25eec9fd822b
>     console: Delete unused con_font_copy() callback implementations
> 
> 4ee573086bd88ff3060dda07873bf755d332e9ba
>     Fonts: Add charcount field to font_desc
> 
> a1ac250a82a5e97db71f14101ff7468291a6aaef
>     fbcon: Avoid using FNTCHARCNT() and hard-coded built-in font
>     charcount
> 
> (Oh, by the way, this same regression also affects 5.4.302, and the same
> 3 patches fix the regression on 5.4 as well, once you manually fix merge
> conflicts. Maybe it would be better to backport other additional commits
> instead of fixing the merge conflicts manually, but since 5.4 is now EOL
> I didn't dig that deep.)
> 
> Once these 3 patches are applied, I wonder if a5a923038d70 now becomes
> necessary for 5.10.y. For what it's worth, it applies fine and the
> resulting kernel seems to run OK in brief testing.
> 

