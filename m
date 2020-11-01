Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A629F2A1E0C
	for <lists+dri-devel@lfdr.de>; Sun,  1 Nov 2020 13:53:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C51E6E054;
	Sun,  1 Nov 2020 12:53:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 361 seconds by postgrey-1.36 at gabe;
 Sun, 01 Nov 2020 12:53:07 UTC
Received: from mail-out.m-online.net (mail-out.m-online.net
 [IPv6:2001:a60:0:28:0:1:25:1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36E606E054
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Nov 2020 12:53:07 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4CPG5d20zcz1rtjY;
 Sun,  1 Nov 2020 13:47:01 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4CPG5d1MqBz1sM9M;
 Sun,  1 Nov 2020 13:47:01 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id Ig0SONeTa5NA; Sun,  1 Nov 2020 13:47:00 +0100 (CET)
X-Auth-Info: rWAnbs54NaVbibQXufUmUAJGXRnQRHb+LcbVq5T8Dj/F5uXrVJx8CxCxlp05sPIv
Received: from igel.home (ppp-46-244-171-138.dynamic.mnet-online.de
 [46.244.171.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Sun,  1 Nov 2020 13:47:00 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
 id E0FD52C0C39; Sun,  1 Nov 2020 13:46:59 +0100 (CET)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH/RFC v2] video: fbdev: atari: Fix TT High video mode
References: <20201101102941.2891076-1-geert@linux-m68k.org>
 <20201101112915.GB1263673@ravnborg.org>
X-Yow: ..  someone in DAYTON, Ohio is selling USED CARPETS to a SERBO-CROATIAN
Date: Sun, 01 Nov 2020 13:46:59 +0100
In-Reply-To: <20201101112915.GB1263673@ravnborg.org> (Sam Ravnborg's message
 of "Sun, 1 Nov 2020 12:29:15 +0100")
Message-ID: <874km91by4.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
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
Cc: Michael Schmitz <schmitzmic@gmail.com>, linux-fbdev@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Nov 01 2020, Sam Ravnborg wrote:

> Hi Geert.
>
> On Sun, Nov 01, 2020 at 11:29:41AM +0100, Geert Uytterhoeven wrote:
>> The horizontal resolution (640) for the TT High video mode (1280x960) is
>> definitely bogus.  While fixing that, correct the timings to match the
>> TTM195 service manual.
>> 
>> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>> ---
>> Untested on actual hardware, hence the RFC.
>> 
>> v2:
>>   - Use correct base.
>> ---
>>  drivers/video/fbdev/atafb.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/video/fbdev/atafb.c b/drivers/video/fbdev/atafb.c
>> index f253daa05d9d3872..5ecf3ec9f94cb720 100644
>> --- a/drivers/video/fbdev/atafb.c
>> +++ b/drivers/video/fbdev/atafb.c
>> @@ -495,8 +495,8 @@ static struct fb_videomode atafb_modedb[] __initdata = {
>>  		"tt-mid", 60, 640, 480, 31041, 120, 100, 8, 16, 140, 30,
>>  		0, FB_VMODE_NONINTERLACED | FB_VMODE_YWRAP
>>  	}, {
>> -		/* 1280x960, 29 kHz, 60 Hz (TT high) */
>> -		"tt-high", 57, 640, 960, 31041, 120, 100, 8, 16, 140, 30,
>> +		/* 1280x960, 72 kHz, 72 Hz (TT high) */
>> +		"tt-high", 57, 1280, 960, 7761, 260, 60, 36, 4, 192, 4,
>>  		0, FB_VMODE_NONINTERLACED | FB_VMODE_YWRAP
>
> Well-spotted. The change of 640 => 1280 is surely right.
> I have a harder time understanding why the change of pixclock from 31041
> to 7761 is correct. All other modes have a pixclock close to or equal
> to 32000 - so it looks strange this one is off.

According to the Profibuch the pixclock should be about 95000.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
