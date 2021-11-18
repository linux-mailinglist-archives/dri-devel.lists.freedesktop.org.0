Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA94455916
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 11:31:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1AE26E9D1;
	Thu, 18 Nov 2021 10:31:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 465 seconds by postgrey-1.36 at gabe;
 Thu, 18 Nov 2021 10:31:25 UTC
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org
 [IPv6:2001:67c:2050::465:101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC5EE6E9D1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 10:31:25 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:1:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4Hvwqt40PVzQkBm;
 Thu, 18 Nov 2021 11:23:38 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1637231015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gkJIXLfzz2unXFwNEvNI/v0piUtyf4I0sEh2A2GIBWg=;
 b=W079kjBtf3W8qUK5+OZdr9ytIXun01G6vHHD0qMurH1fEzJexcrBGKfT3PVnRLr9JphAZm
 Y5fJh8JaFQfetGZg557+tmimu9tMSQEtcEPAXXiMb5jdMcWRmtp4+EzZbmz29Sy1l2aXj/
 Zs2BQ3sSWKNlcww53NgxBvBpg2CfD6VVad9rG0eOz9CsfbAbV/H/TExJyg4OPAs+XoIxdC
 YwD2EjZdYpJ7ct7J0zZwfFPYeeR0VSOcN+RqAG89rAm8DRu8MYO1DjFsc9irCovlAfpaap
 f+SmDchbAynz3uZGeZdTGebQZfsrqQFg9Lc9bmrWHdXRjNqZl1jU2MGOBmG9DQ==
Message-ID: <5b9e4690-fe8c-b043-9a52-60c7f8a55ad8@mailbox.org>
Date: Thu, 18 Nov 2021 11:23:32 +0100
MIME-Version: 1.0
Content-Language: en-CA
To: Daniel Vetter <daniel@ffwll.ch>, Jocelyn Falempe <jfalempe@redhat.com>
References: <20211108153453.51240-1-jfalempe@redhat.com>
 <YYlJsmrlDH5yW6nf@phenom.ffwll.local>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
Subject: Re: [PATCH v2] drm/fb-helper: Call drm_fb_helper_hotplug_event() when
 releasing drm master
In-Reply-To: <YYlJsmrlDH5yW6nf@phenom.ffwll.local>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-11-08 17:00, Daniel Vetter wrote:
> On Mon, Nov 08, 2021 at 04:34:53PM +0100, Jocelyn Falempe wrote:
>> When using Xorg/Logind and an external monitor connected with an MST dock.
>> After disconnecting the external monitor, switching to VT may not work,
>> the (internal) monitor sill display Xorg, and you can't see what you are
>> typing in the VT.
>>
>> This is related to commit e2809c7db818 ("drm/fb_helper: move deferred fb
>> checking into restore mode (v2)")
>>
>> When switching to VT, with Xorg and logind, if there
>> are pending hotplug event (like MST unplugged), the hotplug path
>> may not be fulfilled, because logind may drop the master a bit later.
>> It leads to the console not showing up on the monitor.
>>
>> So when dropping the drm master, call the delayed hotplug function if
>> needed.
>>
>> v2: rewrote the patch by calling the hotplug function after dropping master
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Lastclose console restore is a very gross hack, and generally doesn't work
> well.
> 
> The way this is supposed to work is:
> - userspace drops drm master (because drm master always wins)
> - userspace switches the console back to text mode (which will restore the
>   console)
> 
> I guess we could also do this from dropmaster once more (like from
> lastclose), but that really feels like papering over userspace bugs. And
> given what a massive mess this entire area is already, I'm not eager to
> add more hacks here.
> 
> So ... can't we fix userspace?

Sounds like the good old UMS days, when VT switching relied on user space doing the right things in the right order.

With KMS, surely the kernel needs to be able to get to a known good state from scratch when it's in control of the VT, no matter what state user space left things in.


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer
