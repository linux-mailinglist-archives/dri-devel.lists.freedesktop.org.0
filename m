Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4F74F79E4
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 10:34:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46D1E10EA02;
	Thu,  7 Apr 2022 08:34:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 141869 seconds by postgrey-1.36 at gabe;
 Thu, 07 Apr 2022 08:34:35 UTC
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org
 [IPv6:2001:67c:2050:0:465::201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E32D310EA02
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 08:34:35 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:1:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4KYvnP6mNRz9sXS;
 Thu,  7 Apr 2022 10:34:33 +0200 (CEST)
Message-ID: <711a4d4f-a9ab-17b8-5bbe-a4fd4ea842d3@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1649320471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3oFNnkr+DMyF10ZqVthACa69gQyIvx0oBI01Cd9y8UY=;
 b=IlgexuRL/ybQzh3570JqlovIBNlhnA2NcR1mKjpP6iOAk2OJSZe2jVVpx71gv4u3Fbq+Qu
 7cP+lBk+O6el8riOzDcl/RTIFSzNGhDOyGcKGohAIyvI0WkKXrZocp2cNWSTdhXkmVxlNd
 v7IsTYcD7sRtKxNBAjT4apPv6f0Pg7WpTEpygsoUhu8ysdCdjUeznIUoqdHa5BPITSifqo
 gasRwLYuKWPChCY/DuoXV+NWIJ0t1voqq332N4IPOZN2ftbJz8TR45TsPeRvM4ymBoyEoG
 73hIJ2deNqsrPwtKpKqPpJk1RSaphKkK34QZTTE8+OdBUQ3qlXphtjukrEP8tg==
Date: Thu, 7 Apr 2022 10:34:28 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] drm/atomic: Convert a warning to dbg atomic printk
Content-Language: en-CA
To: Zack Rusin <zackr@vmware.com>
References: <20220404182115.18849-1-zack@kde.org>
 <4f5cd810-39e1-1c1f-4dd0-480fd6689d5c@mailbox.org>
 <5752c3fd9f901a722e3ea9210127118ed22c97b4.camel@vmware.com>
 <3254a42f-c922-f17a-97f6-35466c735d40@mailbox.org>
 <b904d6755e2c039963b3076e12e2fb085e399353.camel@vmware.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <b904d6755e2c039963b3076e12e2fb085e399353.camel@vmware.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: "airlied@linux.ie" <airlied@linux.ie>, Martin Krastev <krastevm@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Maaz Mombasawala <mombasawalam@vmware.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-04-06 16:10, Zack Rusin wrote:
> On Wed, 2022-04-06 at 10:30 +0200, Michel Dänzer wrote:
>> On 2022-04-06 00:47, Zack Rusin wrote:
>>> On Tue, 2022-04-05 at 19:09 +0200, Michel Dänzer wrote:
>>>> On 2022-04-04 20:21, Zack Rusin wrote:
>>>>> From: Zack Rusin <zackr@vmware.com>
>>>>>
>>>>> By default each flip times out after 0.1 sec
>>>>
>>>> 10 * HZ is 10 seconds, not 0.1.
>>>
>>> Yea, sorry, this entire commit message is not correct. I've sent
>>> out a
>>> very old diff with a log the best I could remember. I recall our
>>> conversation now and iirc we said that maybe an interface through
>>> drm
>>> atomic code to enable/disable this error is the way to go but after
>>> looking at this again I'm not sure. More below.
>>>
>>>>> and a warning about the time out is added to the kernel log.
>>>>> The
>>>>> warning is
>>>>> harmless because there's another flip coming right after but it
>>>>> can
>>>>> quickly fill up
>>>>> the log, e.g. missing 2 flips every second over a 24 hour span
>>>>> will
>>>>> add about 172 thousand lines to the log.
>>>>
>>>> As we discussed before, while this might be true for the vmwgfx
>>>> driver,
>>>> for other drivers this message indicates that either the GPU
>>>> hung, or
>>>> something else went wrong spectacularly. As such, I think we do
>>>> want to
>>>> see these messages by default for other drivers at least.
>>>
>>> I'm not going to argue for or against that but I am curious what's
>>> the
>>> point of the message. The message is basically saying "something
>>> could
>>> possibly have went very wrong". OK, what's next? Especially if
>>> there's
>>> no visible problems and it's not reproducible. Even if it would be
>>> reproducible there's nothing actionable from the message itself. If
>>> the
>>> system has no output connected and no users are currently logged in
>>> and
>>> we missed a flip, does it matter?
>>
>> I don't think waiting for a 10 second timeout is the appropriate
>> behaviour in that case. While a KMS CRTC is enabled, the driver needs
>> to make it work, in the worst case via a timer which ticks at the
>> CRTC refresh rate.
> 
> What if it isn't a driver bug

Does it make a difference? It's still a bug.

> and it just so happens that vmwgfx is the only one that's running on some specific system
> without a display long enough?

FWIW, other drivers have hit this same error before as well, but not just because no outputs were enabled. If it's really related to that, a vmwgfx bug seems most likely.


>> The error means that either:
>>
>> * A flip actually didn't complete in 10 seconds.
>> * There's some kind of time tracking issue which results in the timer
>> firing after less than 10 seconds (of the system actually running).
>>
>> Either way, it's an issue which should be fixed rather than just
>> swept under the rug.
> 
> Without being able to reproduce or really confirm that it's an actual
> problem in vmwgfx I'm going to leave this to you then.

Nice try. :) This is for vmwgfx developers.


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer
