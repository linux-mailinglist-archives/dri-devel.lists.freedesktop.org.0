Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF51D0D690
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jan 2026 14:44:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBF5910E06B;
	Sat, 10 Jan 2026 13:44:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hm2UN18N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D19410E06B
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jan 2026 13:20:19 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id
 af79cd13be357-8ba0d6c68a8so586216085a.1
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jan 2026 05:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768051218; x=1768656018; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
 :message-id:from:references:cc:to:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mvmFtpYq3AhGNwfLF6kPdeLfesgtuyHszNnUMDnYmVI=;
 b=hm2UN18NzUL1Z4vSQxQl/gCPlElEZUS7AYalPEHDnaU03c0e4iwSW/T51zDi9gxZS6
 zSRq64BQvRHINO7DVMERdwbJzn0JWqi3pxULWJw8b0OU+NJ6QrVSvtOpwUmk0P8c7XN0
 GFcSJc5AGVRVEtqctuwHvW8q/Prt9tBMUKdP8Cw3bQt3IWkDjzfIwntmfVXK9Xzf1my0
 Ec8LPYJDsGRmPvc3Mm3XNNLG5Czza0j+aTwY2GSgcUyrfnYEISXEvIgwLMWn53wgFUTC
 Hby7bbhzh4eTK7KO8qjWyVkUftoMZ41VgJF6Z7LGBuKfjsRTEY8eYVyqCT5P5Li6JCHQ
 9lPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768051218; x=1768656018;
 h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
 :message-id:from:references:cc:to:subject:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mvmFtpYq3AhGNwfLF6kPdeLfesgtuyHszNnUMDnYmVI=;
 b=QbG3+JSCswk/qbbIZ6IVHPgq1vJtEq0WMu53nl/unXShZOWCUAci3Bwvym3iSIa3bf
 iMyAxgSlFRmPtpI6fXqfe75RuhYW21WitfcxzgF+c78Q4dCUmK2Quj/Ug7KBTJLvzeRN
 KOoIrgB3ym/pq74Dn/71OxGu83VoxztKs3vqwyMLcFZtjcvKRYwR6unf9ltiEjWfN1nP
 ZLYiYzsa9Q/2JkZFL0Simme+JnqLhaFpAqryW4lrRqRBwlEH7Sg7rvLj5uW/NpjdhAXs
 fT1+9NHvFtghKSH5Hz4UKECFnP5g7iaX4MNGR5EKPHNKxu2x+y1ZufpE2OJskfCotw3/
 t+AQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtMhYM9McWcrZH1zZ0986orDNstaIWim+4BD6fk7CaCb40k3peFV7kmi8cuRG1AO3HL5Na+K/F5Fs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyzDkR3dTR9acwL+GHFJmNcARizGXPjuwk/kH/xjy/4JyrufrRo
 byTbLWWprAUOmmOKQRFu+M/X132+Z4OXke5NkZsmNHFehFC7wcEFJQM=
X-Gm-Gg: AY/fxX53vDjGRyrk2QpXhZCwfwkEqWgoDarxTM5JzVxSAXMkY1YuaMs+6GAC34hnisM
 4APOd+GsmGZDldf2liCZ8tY34seYvcJIJbZ2SwviZiuFOFEMcHop4J4ql7VIBXxiFLUkS3Rmj4C
 jq9rH/Gfj62D4x2XDPr8Duj9HV2MpCuinI0vBhyIYoDpUxWwgBKKOahGl9Mx6dFHdha8NSy0hVL
 Lbqq7HKYEXx/lTtkqtRAEa0wCIN+X+bnBRYbOYjJDHgoPse9IQJ38nxQXO78vb4atCfw1UsD7R9
 f9GfJq+8My2NCl0u0CjtN/iCJrZuiPTqeNzn5UhyE69+cQF2X9yZa22ApZzd5jNTbTotavbrGue
 hZB/zGvCLhL1g7NBZFXIrk6INApG0uPPYC0dAfHB8C601NePOk1RduzevHUaz6VcdJoPfy78NVV
 0gX1A0XeZ6UmZjZOioJ9VhQMSmJtwLccAhYiSkYSQ=
X-Google-Smtp-Source: AGHT+IHYkrReK4yF4naTlaDor67swNTpLoEWAakzLr0Pf9Lu/+qdcpqgONPLVqMEeWigmof52e/WWw==
X-Received: by 2002:a05:620a:2910:b0:8a1:ac72:e3db with SMTP id
 af79cd13be357-8c389429138mr1637486585a.72.1768051218033; 
 Sat, 10 Jan 2026 05:20:18 -0800 (PST)
Received: from [120.7.1.23] (135-23-93-252.cpe.pppoe.ca. [135.23.93.252])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8c37f51d06fsm1031114585a.32.2026.01.10.05.20.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 10 Jan 2026 05:20:17 -0800 (PST)
Subject: Re: [PATCH v2] fbdev: bitblit: bound-check glyph index in bit_putcs*
To: Vitaly Chikunov <vt@altlinux.org>, Junjie Cao <junjie.cao@intel.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, 
 Helge Deller <deller@gmx.de>, Zsolt Kajtar <soci@c64.rulez.org>,
 Albin Babu Varghese <albinbabuvarghese20@gmail.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 regressions@lists.linux.dev, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20251020134701.84082-1-junjie.cao@intel.com>
 <aU23brU4lZqIkw4Z@altlinux.org>
From: Woody Suwalski <terraluna977@gmail.com>
Message-ID: <e6aac320-846d-eecf-0016-23b56d7cd854@gmail.com>
Date: Sat, 10 Jan 2026 08:20:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:128.0) Gecko/20100101
 Firefox/128.0 SeaMonkey/2.53.23
MIME-Version: 1.0
In-Reply-To: <aU23brU4lZqIkw4Z@altlinux.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 10 Jan 2026 13:44:06 +0000
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

Vitaly Chikunov wrote:
> Dear linux-fbdev, stable,
>
> On Mon, Oct 20, 2025 at 09:47:01PM +0800, Junjie Cao wrote:
>> bit_putcs_aligned()/unaligned() derived the glyph pointer from the
>> character value masked by 0xff/0x1ff, which may exceed the actual font's
>> glyph count and read past the end of the built-in font array.
>> Clamp the index to the actual glyph count before computing the address.
>>
>> This fixes a global out-of-bounds read reported by syzbot.
>>
>> Reported-by: syzbot+793cf822d213be1a74f2@syzkaller.appspotmail.com
>> Closes: https://syzkaller.appspot.com/bug?extid=793cf822d213be1a74f2
>> Tested-by: syzbot+793cf822d213be1a74f2@syzkaller.appspotmail.com
>> Signed-off-by: Junjie Cao <junjie.cao@intel.com>
> This commit is applied to v5.10.247 and causes a regression: when
> switching VT with ctrl-alt-f2 the screen is blank or completely filled
> with angle characters, then new text is not appearing (or not visible).
>
> This commit is found with git bisect from v5.10.246 to v5.10.247:
>
>    0998a6cb232674408a03e8561dc15aa266b2f53b is the first bad commit
>    commit 0998a6cb232674408a03e8561dc15aa266b2f53b
>    Author:     Junjie Cao <junjie.cao@intel.com>
>    AuthorDate: 2025-10-20 21:47:01 +0800
>    Commit:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>    CommitDate: 2025-12-07 06:08:07 +0900
>
>        fbdev: bitblit: bound-check glyph index in bit_putcs*
>
>        commit 18c4ef4e765a798b47980555ed665d78b71aeadf upstream.
>
>        bit_putcs_aligned()/unaligned() derived the glyph pointer from the
>        character value masked by 0xff/0x1ff, which may exceed the actual font's
>        glyph count and read past the end of the built-in font array.
>        Clamp the index to the actual glyph count before computing the address.
>
>        This fixes a global out-of-bounds read reported by syzbot.
>
>        Reported-by: syzbot+793cf822d213be1a74f2@syzkaller.appspotmail.com
>        Closes: https://syzkaller.appspot.com/bug?extid=793cf822d213be1a74f2
>        Tested-by: syzbot+793cf822d213be1a74f2@syzkaller.appspotmail.com
>        Signed-off-by: Junjie Cao <junjie.cao@intel.com>
>        Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>        Signed-off-by: Helge Deller <deller@gmx.de>
>        Cc: stable@vger.kernel.org
>        Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>
>     drivers/video/fbdev/core/bitblit.c | 16 ++++++++++++----
>     1 file changed, 12 insertions(+), 4 deletions(-)
>
> The minimal reproducer in cli, after kernel is booted:
>
>    date >/dev/tty2; chvt 2
>
> and the date does not appear.
>
> Thanks,
>
> #regzbot introduced: 0998a6cb232674408a03e8561dc15aa266b2f53b
>
>> ---
>> v1: https://lore.kernel.org/linux-fbdev/5d237d1a-a528-4205-a4d8-71709134f1e1@suse.de/
>> v1 -> v2:
>>   - Fix indentation and add blank line after declarations with the .pl helper
>>   - No functional changes
>>
>>   drivers/video/fbdev/core/bitblit.c | 16 ++++++++++++----
>>   1 file changed, 12 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/video/fbdev/core/bitblit.c b/drivers/video/fbdev/core/bitblit.c
>> index 9d2e59796c3e..085ffb44c51a 100644
>> --- a/drivers/video/fbdev/core/bitblit.c
>> +++ b/drivers/video/fbdev/core/bitblit.c
>> @@ -79,12 +79,16 @@ static inline void bit_putcs_aligned(struct vc_data *vc, struct fb_info *info,
>>   				     struct fb_image *image, u8 *buf, u8 *dst)
>>   {
>>   	u16 charmask = vc->vc_hi_font_mask ? 0x1ff : 0xff;
>> +	unsigned int charcnt = vc->vc_font.charcount;
>>   	u32 idx = vc->vc_font.width >> 3;
>>   	u8 *src;
>>   
>>   	while (cnt--) {
>> -		src = vc->vc_font.data + (scr_readw(s++)&
>> -					  charmask)*cellsize;
>> +		u16 ch = scr_readw(s++) & charmask;
>> +
>> +		if (ch >= charcnt)
>> +			ch = 0;
>> +		src = vc->vc_font.data + (unsigned int)ch * cellsize;
>>   
>>   		if (attr) {
>>   			update_attr(buf, src, attr, vc);
>> @@ -112,14 +116,18 @@ static inline void bit_putcs_unaligned(struct vc_data *vc,
>>   				       u8 *dst)
>>   {
>>   	u16 charmask = vc->vc_hi_font_mask ? 0x1ff : 0xff;
>> +	unsigned int charcnt = vc->vc_font.charcount;
>>   	u32 shift_low = 0, mod = vc->vc_font.width % 8;
>>   	u32 shift_high = 8;
>>   	u32 idx = vc->vc_font.width >> 3;
>>   	u8 *src;
>>   
>>   	while (cnt--) {
>> -		src = vc->vc_font.data + (scr_readw(s++)&
>> -					  charmask)*cellsize;
>> +		u16 ch = scr_readw(s++) & charmask;
>> +
>> +		if (ch >= charcnt)
>> +			ch = 0;
>> +		src = vc->vc_font.data + (unsigned int)ch * cellsize;
>>   
>>   		if (attr) {
>>   			update_attr(buf, src, attr, vc);
>> -- 
>> 2.48.1
>>
I have done the same bisecting work, too bad I did not notice Vitaly's 
work earlier :-(

There is a "cheap" workaround for systems before 5.11, (not addressing 
the root issue but) working:

diff --git a/drivers/video/fbdev/core/bitblit.c 
b/drivers/video/fbdev/core/bitblit.c
index 7c2fc9f..c5a1a9d 100644
--- a/drivers/video/fbdev/core/bitblit.c
+++ b/drivers/video/fbdev/core/bitblit.c
@@ -86,7 +86,7 @@ static inline void bit_putcs_aligned(struct vc_data 
*vc, struct fb_info *info,
      while (cnt--) {
          u16 ch = scr_readw(s++) & charmask;

-        if (ch >= charcnt)
+        if (charcnt && ch >= charcnt)
              ch = 0;
          src = vc->vc_font.data + (unsigned int)ch * cellsize;

@@ -125,7 +125,7 @@ static inline void bit_putcs_unaligned(struct 
vc_data *vc,
      while (cnt--) {
          u16 ch = scr_readw(s++) & charmask;

-        if (ch >= charcnt)
+        if (charcnt && ch >= charcnt)
              ch = 0;
          src = vc->vc_font.data + (unsigned int)ch * cellsize;

I will try next to go full backport from 5.11 as Thorsten has suggested.

However the bigger problem is that the fbdev patch has landed in the 
5.4.302 EOL, and essentially the 5.4 EOL kernel is now hanging broken :-(

Thanks, Woody

