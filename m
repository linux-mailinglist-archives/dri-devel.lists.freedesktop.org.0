Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3217D0EC0E
	for <lists+dri-devel@lfdr.de>; Sun, 11 Jan 2026 12:54:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0B7D10E0E9;
	Sun, 11 Jan 2026 11:54:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dqvJEqT/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ABEA10E068
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jan 2026 05:26:39 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id
 d75a77b69052e-4f34c5f2f98so60343811cf.1
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jan 2026 21:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768109198; x=1768713998; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
 :message-id:references:cc:to:from:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HnrpYrRIYSXlW2YfNWkieSaYgDrKbTtuKGx2OJu0pTM=;
 b=dqvJEqT/egH9EYVaoTlBwBLz9rpJe0igkdQjNZkJ9XufkURK9CL9/HlTLKY1er2aOo
 CK8SJQK7fD8hFgVwdX+YpkmfJurKh1Xa/pUs/mQgPJXX7IF3l6n0KuZGAIU/+oMYDbqp
 d28XCt7nitBpoxWHChToBxQIlvDRcm3v7s+7S3xoKzpVL5bIZvefM415uKpDNlPxSWGK
 cmqEMuXaX1GKvMevTuESuxgzAfjzUTe+nDMM4ZGKzWdqLQLVYrgmPxabvPqvBHw2ZsdF
 3dd83VPzJJByCvYH6Tg0Hjn1u8rHJobbf7tcPQPGHPK+4wh3gQNG2EtcnzBGuGHujnGp
 kgpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768109198; x=1768713998;
 h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
 :message-id:references:cc:to:from:subject:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HnrpYrRIYSXlW2YfNWkieSaYgDrKbTtuKGx2OJu0pTM=;
 b=nSM/m3J0x14esYyJ7Z+sipnw/NRBtF05RSDR05atX7w3y298e/3AF68EZOkr0cAuJf
 JZjE7WNlGwArdNo7jed3iQFaTY3HTC/Bze51wyN5DEVlH1HRXCIr7l+IbuUHA/cwhKxt
 0iBU+/S0lkjIUYJ9P2pJC5cqqqPt5RdZoCWt08XwQWrUZDGGfyuv+G5fyN/CbdqDaovx
 /x+d0FUjvey+Ym4OjCdCgdpzh3ErIklLHGoCAoFP5/BbeyJhJzP4OHTO/OOmJsZhbbID
 1RnvoW5vf73ZcJGoFfQ3dCUwUSUw3bKjduVMwPyA56t3OBncvLxYZG2AsDO14X0GYazu
 hHoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/hQnrCgpN7cobFJryrpib0UAtLFIWtfexVRGl3XT2Yxpf1yZtLFfU6ewsVs50s8p2e95d2XHsOWo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzjwP/AzPV6wYOVEU5tETAWPblf3rNkvGEEFPlA2Sq6acFsHk6o
 DnwoIbvXDiYsxSeY4Efg6l7v7LhxEUSsHi1ZfFYnKm+e2kR1HLpjDTM=
X-Gm-Gg: AY/fxX4IrwdeLZvwf1M+AXPw4RphbvIx/iQY9hZJo6fGj7rAJgGAHsDRTKwwmcX155Q
 xPW24f7rwOHDysM8f3cjlFOBuJUhmF3atMjAjDUgisNNzSUDYF1WGYetj0TbJYvPwvi87OofrDf
 3z4DtSnjQlZZKyM4wPYj90ySjRVDVY5C7x6B103fuH9HcsRygId1TijeSG6HfCZFqrFVkkVHxM3
 FjP0PXITRNq9EGwtoOxC0IGNoVTGkRu6WpJFo4YhaqzQ4GodWHvYx+R0osXxQZozHKrLaxdrPJV
 qWa6Ecq0sYNnnFjAlGvXqNnSdP9mcjPIocsMIF9gtLo0FUbXdQ/MWEhA6AOi5hKxP6ms+zaUTYa
 qQlqu7/kdgl9j4zETdYujbiJRxb9EZgkwNRwq+EG8GIFyWQn6jyqgn1Mfjx6sbtZYl93iRW8IT8
 pzMIiNL2oDSESuvUh1WvDddL1kpz7Td9rqOmrc0UM=
X-Google-Smtp-Source: AGHT+IHQl6yFzxp8o7DLX3rtK4HUBNR2DuuHigCF0nkzFaedMhsnKWOHtdCDrOaqoDZhFhU2TS5YvQ==
X-Received: by 2002:ac8:5f48:0:b0:4e7:2dac:95b7 with SMTP id
 d75a77b69052e-4ffb491045cmr213358841cf.37.1768109197681; 
 Sat, 10 Jan 2026 21:26:37 -0800 (PST)
Received: from [120.7.1.23] (135-23-93-252.cpe.pppoe.ca. [135.23.93.252])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4ffa926a9d9sm102307371cf.25.2026.01.10.21.26.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 10 Jan 2026 21:26:37 -0800 (PST)
Subject: Re: [PATCH v2] fbdev: bitblit: bound-check glyph index in bit_putcs*
From: Woody Suwalski <terraluna977@gmail.com>
To: Vitaly Chikunov <vt@altlinux.org>, Junjie Cao <junjie.cao@intel.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, 
 Helge Deller <deller@gmx.de>, Zsolt Kajtar <soci@c64.rulez.org>,
 Albin Babu Varghese <albinbabuvarghese20@gmail.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 regressions@lists.linux.dev, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20251020134701.84082-1-junjie.cao@intel.com>
 <aU23brU4lZqIkw4Z@altlinux.org>
 <e6aac320-846d-eecf-0016-23b56d7cd854@gmail.com>
Message-ID: <b3672ea8-ec45-b5d1-cb08-b83eb8697904@gmail.com>
Date: Sun, 11 Jan 2026 00:26:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:128.0) Gecko/20100101
 Firefox/128.0 SeaMonkey/2.53.23
MIME-Version: 1.0
In-Reply-To: <e6aac320-846d-eecf-0016-23b56d7cd854@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 11 Jan 2026 11:54:29 +0000
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

Woody Suwalski wrote:
> Vitaly Chikunov wrote:
>> Dear linux-fbdev, stable,
>>
>> On Mon, Oct 20, 2025 at 09:47:01PM +0800, Junjie Cao wrote:
>>> bit_putcs_aligned()/unaligned() derived the glyph pointer from the
>>> character value masked by 0xff/0x1ff, which may exceed the actual 
>>> font's
>>> glyph count and read past the end of the built-in font array.
>>> Clamp the index to the actual glyph count before computing the address.
>>>
>>> This fixes a global out-of-bounds read reported by syzbot.
>>>
>>> Reported-by: syzbot+793cf822d213be1a74f2@syzkaller.appspotmail.com
>>> Closes: https://syzkaller.appspot.com/bug?extid=793cf822d213be1a74f2
>>> Tested-by: syzbot+793cf822d213be1a74f2@syzkaller.appspotmail.com
>>> Signed-off-by: Junjie Cao <junjie.cao@intel.com>
>> This commit is applied to v5.10.247 and causes a regression: when
>> switching VT with ctrl-alt-f2 the screen is blank or completely filled
>> with angle characters, then new text is not appearing (or not visible).
>>
>> This commit is found with git bisect from v5.10.246 to v5.10.247:
>>
>>    0998a6cb232674408a03e8561dc15aa266b2f53b is the first bad commit
>>    commit 0998a6cb232674408a03e8561dc15aa266b2f53b
>>    Author:     Junjie Cao <junjie.cao@intel.com>
>>    AuthorDate: 2025-10-20 21:47:01 +0800
>>    Commit:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>    CommitDate: 2025-12-07 06:08:07 +0900
>>
>>        fbdev: bitblit: bound-check glyph index in bit_putcs*
>>
>>        commit 18c4ef4e765a798b47980555ed665d78b71aeadf upstream.
>>
>>        bit_putcs_aligned()/unaligned() derived the glyph pointer from 
>> the
>>        character value masked by 0xff/0x1ff, which may exceed the 
>> actual font's
>>        glyph count and read past the end of the built-in font array.
>>        Clamp the index to the actual glyph count before computing the 
>> address.
>>
>>        This fixes a global out-of-bounds read reported by syzbot.
>>
>>        Reported-by: 
>> syzbot+793cf822d213be1a74f2@syzkaller.appspotmail.com
>>        Closes: 
>> https://syzkaller.appspot.com/bug?extid=793cf822d213be1a74f2
>>        Tested-by: syzbot+793cf822d213be1a74f2@syzkaller.appspotmail.com
>>        Signed-off-by: Junjie Cao <junjie.cao@intel.com>
>>        Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>>        Signed-off-by: Helge Deller <deller@gmx.de>
>>        Cc: stable@vger.kernel.org
>>        Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>
>>     drivers/video/fbdev/core/bitblit.c | 16 ++++++++++++----
>>     1 file changed, 12 insertions(+), 4 deletions(-)
>>
>> The minimal reproducer in cli, after kernel is booted:
>>
>>    date >/dev/tty2; chvt 2
>>
>> and the date does not appear.
>>
>> Thanks,
>>
>> #regzbot introduced: 0998a6cb232674408a03e8561dc15aa266b2f53b
>>
>>> ---
>>> v1: 
>>> https://lore.kernel.org/linux-fbdev/5d237d1a-a528-4205-a4d8-71709134f1e1@suse.de/
>>> v1 -> v2:
>>>   - Fix indentation and add blank line after declarations with the 
>>> .pl helper
>>>   - No functional changes
>>>
>>>   drivers/video/fbdev/core/bitblit.c | 16 ++++++++++++----
>>>   1 file changed, 12 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/video/fbdev/core/bitblit.c 
>>> b/drivers/video/fbdev/core/bitblit.c
>>> index 9d2e59796c3e..085ffb44c51a 100644
>>> --- a/drivers/video/fbdev/core/bitblit.c
>>> +++ b/drivers/video/fbdev/core/bitblit.c
>>> @@ -79,12 +79,16 @@ static inline void bit_putcs_aligned(struct 
>>> vc_data *vc, struct fb_info *info,
>>>                        struct fb_image *image, u8 *buf, u8 *dst)
>>>   {
>>>       u16 charmask = vc->vc_hi_font_mask ? 0x1ff : 0xff;
>>> +    unsigned int charcnt = vc->vc_font.charcount;
>>>       u32 idx = vc->vc_font.width >> 3;
>>>       u8 *src;
>>>         while (cnt--) {
>>> -        src = vc->vc_font.data + (scr_readw(s++)&
>>> -                      charmask)*cellsize;
>>> +        u16 ch = scr_readw(s++) & charmask;
>>> +
>>> +        if (ch >= charcnt)
>>> +            ch = 0;
>>> +        src = vc->vc_font.data + (unsigned int)ch * cellsize;
>>>             if (attr) {
>>>               update_attr(buf, src, attr, vc);
>>> @@ -112,14 +116,18 @@ static inline void bit_putcs_unaligned(struct 
>>> vc_data *vc,
>>>                          u8 *dst)
>>>   {
>>>       u16 charmask = vc->vc_hi_font_mask ? 0x1ff : 0xff;
>>> +    unsigned int charcnt = vc->vc_font.charcount;
>>>       u32 shift_low = 0, mod = vc->vc_font.width % 8;
>>>       u32 shift_high = 8;
>>>       u32 idx = vc->vc_font.width >> 3;
>>>       u8 *src;
>>>         while (cnt--) {
>>> -        src = vc->vc_font.data + (scr_readw(s++)&
>>> -                      charmask)*cellsize;
>>> +        u16 ch = scr_readw(s++) & charmask;
>>> +
>>> +        if (ch >= charcnt)
>>> +            ch = 0;
>>> +        src = vc->vc_font.data + (unsigned int)ch * cellsize;
>>>             if (attr) {
>>>               update_attr(buf, src, attr, vc);
>>> -- 
>>> 2.48.1
>>>
> I have done the same bisecting work, too bad I did not notice Vitaly's 
> work earlier :-(
>
> There is a "cheap" workaround for systems before 5.11, (not addressing 
> the root issue but) working:
>
> diff --git a/drivers/video/fbdev/core/bitblit.c 
> b/drivers/video/fbdev/core/bitblit.c
> index 7c2fc9f..c5a1a9d 100644
> --- a/drivers/video/fbdev/core/bitblit.c
> +++ b/drivers/video/fbdev/core/bitblit.c
> @@ -86,7 +86,7 @@ static inline void bit_putcs_aligned(struct vc_data 
> *vc, struct fb_info *info,
>      while (cnt--) {
>          u16 ch = scr_readw(s++) & charmask;
>
> -        if (ch >= charcnt)
> +        if (charcnt && ch >= charcnt)
>              ch = 0;
>          src = vc->vc_font.data + (unsigned int)ch * cellsize;
>
> @@ -125,7 +125,7 @@ static inline void bit_putcs_unaligned(struct 
> vc_data *vc,
>      while (cnt--) {
>          u16 ch = scr_readw(s++) & charmask;
>
> -        if (ch >= charcnt)
> +        if (charcnt && ch >= charcnt)
>              ch = 0;
>          src = vc->vc_font.data + (unsigned int)ch * cellsize;
>
> I will try next to go full backport from 5.11 as Thorsten has suggested.
>
> However the bigger problem is that the fbdev patch has landed in the 
> 5.4.302 EOL, and essentially the 5.4 EOL kernel is now hanging broken :-(
>
> Thanks, Woody
>
I have tested the solution of backporting the series of patches from 
5.11, it seems to be working OK.
However for the soon-to-be-EOL 5.10 and already EOL'ed 5.4 I would 
suggest a simpler solution where we replace  most of the logic from 5.11 
with a hardcoded charcnt=256, if charcnt not set. This would take 
advantage of the bugfix from Junjie, and be a minimal change for the 
5.10 kernel (works on 5.4 as well)

--- a/drivers/video/fbdev/core/bitblit.c    2026-01-10 
16:28:37.438569812 -0500
+++ b/drivers/video/fbdev/core/bitblit.c    2026-01-10 
16:32:51.356236549 -0500
@@ -86,6 +86,8 @@ static inline void bit_putcs_aligned(str
      while (cnt--) {
          u16 ch = scr_readw(s++) & charmask;

+        if (charcnt == 0)
+            charcnt = 256;
          if (ch >= charcnt)
              ch = 0;
          src = vc->vc_font.data + (unsigned int)ch * cellsize;
@@ -125,6 +127,8 @@ static inline void bit_putcs_unaligned(s
      while (cnt--) {
          u16 ch = scr_readw(s++) & charmask;

+        if (charcnt == 0)
+            charcnt = 256;
          if (ch >= charcnt)
              ch = 0;
          src = vc->vc_font.data + (unsigned int)ch * cellsize;

Thanks, Woody


