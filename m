Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0509B44E399
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 10:03:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3394C6EB5E;
	Fri, 12 Nov 2021 09:03:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1633 seconds by postgrey-1.36 at gabe;
 Thu, 11 Nov 2021 10:25:30 UTC
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [IPv6:2a01:488:42:1000:50ed:8234::])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 575D289BAE
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 10:25:30 +0000 (UTC)
Received: from ip4d173d4a.dynamic.kabel-deutschland.de ([77.23.61.74]
 helo=[192.168.66.200]); authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1ml7Gq-0006dt-HS; Thu, 11 Nov 2021 11:25:28 +0100
Message-ID: <34c2969a-e916-cef4-80bb-f39cb2fdd6cb@leemhuis.info>
Date: Thu, 11 Nov 2021 11:25:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] fbdev: Prevent probing generic drivers if a FB is already
 registered
Content-Language: en-BS
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Ilya Trukhanov <lahvuun@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
References: <20211111092053.1328304-1-javierm@redhat.com>
 <23b693d5-0335-8f42-a206-65e170ab6e52@leemhuis.info>
 <YYzptg1V+lyO0iVP@phenom.ffwll.local>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <YYzptg1V+lyO0iVP@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1636626330;
 118f9cd4; 
X-HE-SMSGID: 1ml7Gq-0006dt-HS
X-Mailman-Approved-At: Fri, 12 Nov 2021 09:03:36 +0000
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

On 11.11.21 11:00, Daniel Vetter wrote:
> On Thu, Nov 11, 2021 at 10:58:14AM +0100, Thorsten Leemhuis wrote:
>> On 11.11.21 10:20, Javier Martinez Canillas wrote:
>>> The efifb and simplefb drivers just render to a pre-allocated frame buffer
>>> and rely on the display hardware being initialized before the kernel boots.
>>>
>>> But if another driver already probed correctly and registered a fbdev, the
>>> generic drivers shouldn't be probed since an actual driver for the display
>>> hardware is already present.
>>>
>>> Reported-by: Ilya Trukhanov <lahvuun@gmail.com>
>>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>>> ---
>>
>> TLDR: Javier, in case you need to send an improved patch, could you
>> please add this before the 'Reported-by:'
>>
>> Link: https://lore.kernel.org/r/20211110200253.rfudkt3edbd3nsyj@lahvuun/
> 
> Uh I thought Link: was for the patch submission chain, and we've used
> References: for bug reports and everything else. Is the extension of Link:
> a new thing?

Not really (afaics), but I made that clearer recently. To quote from my
own text below:

>> This concept is old, but the text was reworked recently to make this use
>> case for the Link: tag clearer. For details see:
>> https://git.kernel.org/linus/1f57bd42b77c

If you search the history, you'll find quite a few commits (some really
old) that use 'Link:' to point to bugtracker or regression reports.
'References:' is used as well, but mainly by the drm subsystem.

But yes, sadly the Link tag historically is overloaded and used for
different things afaics. I'm all for fixing this and plan to start a
discussion about this in the next few days (hopefully it doesn't become
weeks), but for now I have a few issues with regzbot I need to deal with
first.

Ciao, Thorsten

>> And if the patch is already good to go: could the subsystem maintainer
>> please add it when applying?
>>
>>
>> Long story: hi, this is your Linux kernel regression tracker speaking.
>> Thanks for working on a fix for a regression I'm keeping an eye on.
>>
>> There is one small detail that could be improved: the commit message
>> would benefit from a link to the regression report, for reasons
>> explained in Documentation/process/submitting-patches.rst. To quote:
>>
>> ```
>> If related discussions or any other background information behind the
>> change can be found on the web, add 'Link:' tags pointing to it. In case
>> your patch fixes a bug, for example, add a tag with a URL referencing
>> the report in the mailing list archives or a bug tracker;
>> ```
>>
>> This concept is old, but the text was reworked recently to make this use
>> case for the Link: tag clearer. For details see:
>> https://git.kernel.org/linus/1f57bd42b77c
>>
>> Yes, that "Link:" is not really crucial; but it's good to have if
>> someone needs to look into the backstory of this change sometime in the
>> future. But I care for a different reason. I'm tracking this regression
>> (and others) with regzbot, my Linux kernel regression tracking bot. This
>> bot will notice if a patch with a Link: tag to a tracked regression gets
>> posted and record that, which allowed anyone looking into the regression
>> to quickly gasp the current status from regzbot's webui
>> (https://linux-regtracking.leemhuis.info/regzbot ) or its reports. The
>> bot will also notice if a commit with a Link: tag to a regression report
>> is applied by Linus and then automatically mark the regression as
>> resolved then.
>>
>> IOW: this tag makes my life a regression tracker a lot easier, as I
>> otherwise have to tell regzbot manually about the fix. ;-)
>>
>> Ciao, Thorsten (while carrying his Linux kernel regression tracker hat)
>>
>> #regzbot ^backmonitor
>> https://lore.kernel.org/r/20211110200253.rfudkt3edbd3nsyj@lahvuun/
> 
