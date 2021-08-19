Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFBA3F1BED
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 16:51:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF2AB6E8EF;
	Thu, 19 Aug 2021 14:51:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C1EC6E8EF
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 14:51:04 +0000 (UTC)
Received: from [10.172.193.212] (1.general.cking.uk.vpn [10.172.193.212])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 3DB5C3F0A1; 
 Thu, 19 Aug 2021 14:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1629384661;
 bh=g7+5SiZ8+Zdbn9VAz4P1W/9KWe16JYM3cVTVLOgS95s=;
 h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=gOLn84vqcd8NU0jf1pXAr0R+vj7wOgDSiUfOL5Ach94xt12f+5RdQNO+C1YjJcmIS
 8YuWcnDMzooqjd83MjBTbO3neWRahGq9Sr7RNU0mRuwIJ3VZAgfhFeif+24Ko3UB2G
 zcg84zwqS9aCET8kDoY/DnF9HzgR1jqHHfhLn+0KEIlNluoDP+9s+eh0sF95F60VZq
 iyWgU3wyQUneCwqvqkjB5nUm7PK3ojTBlQe9TPj82l2wf4JtT5vow2EEXNWh9os5Aj
 Cqzn401sbJ0hm8doqnIPZfKZ8YXJvfoN06FKxKefJHcOEZQU5scSvbbhAAzb1n/fh/
 5MdiauE0R5ZZw==
Subject: Re: [PATCH] drm/bridge/tc358767: make the array ext_div static const, 
 makes object smaller
To: Joe Perches <joe@perches.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210819133839.10745-1-colin.king@canonical.com>
 <0a2ea4e54d7bfd61b45cc070eee6b62e8da82190.camel@perches.com>
 <913b96bc-f5c4-1a26-c5f7-70a9d0ab3f53@canonical.com>
 <3da667b1b415b19325c034dcb389a201fa46cfd3.camel@perches.com>
From: Colin Ian King <colin.king@canonical.com>
Message-ID: <c4378876-74b0-4f80-05b7-dcd809bb47a1@canonical.com>
Date: Thu, 19 Aug 2021 15:51:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <3da667b1b415b19325c034dcb389a201fa46cfd3.camel@perches.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/08/2021 15:40, Joe Perches wrote:
> On Thu, 2021-08-19 at 14:54 +0100, Colin Ian King wrote:
>> On 19/08/2021 14:51, Joe Perches wrote:
>>> On Thu, 2021-08-19 at 14:38 +0100, Colin King wrote:
>>>> From: Colin Ian King <colin.king@canonical.com>
>>>>
>>>> Don't populate the array ext_div on the stack but instead it
>>>> static const. Makes the object code smaller by 118 bytes:
>>>>
>>>> Before:
>>>>    text    data    bss     dec    hex filename
>>>>   39449   17500    128   57077   def5 ./drivers/gpu/drm/bridge/tc358767.o
>>>>
>>>> After:
>>>>    text    data    bss     dec    hex filename
>>>>   39235   17596    128   56959   de7f ./drivers/gpu/drm/bridge/tc358767.o
>>>
>>> Why is text smaller and data larger with this change?
>>
>> There are less instructions being used with the change since it's not
>> shoving the array data onto the stack at run time. Instead the array is
>> being stored in the data section and there is less object code required
>> to access the data.
> 
> Ah.  It's really because it's not a minimal compilation ala defconfig >
> I think you should really stop making these size comparisons with
> .config uses that are not based on a defconfig as a whole lot of other
> things are going on.

I'm using allmodconfig, which I believe is a legitimate configuration,
especially since distros so build kernels with lots of modules.
I'll double check on this though in case I've made a mistake.

> 
> Please notice that the object sizes are significantly smaller below:
> 
> So with an x86-64 defconfig and this compilation unit enabled with
> CONFIG_OF enabled and CONFIG_DRM_TOSHIBA_TC358767=y, with gcc 10.3
> and this change the object size actually increases a bit.
> 
> $ size drivers/gpu/drm/bridge/tc358767.o*
>    text	   data	    bss	    dec	    hex	filename
>   13554	    268	      1	  13823	   35ff	drivers/gpu/drm/bridge/tc358767.o.new
>   13548	    268	      1	  13817	   35f9	drivers/gpu/drm/bridge/tc358767.o.old>
> objdump -h shows these differences:
> 
> .old:
>   0 .text         00001e1f  0000000000000000  0000000000000000  00000040  2**4
>                   CONTENTS, ALLOC, LOAD, RELOC, READONLY, CODE
> [...]
>  14 .rodata       000005ae  0000000000000000  0000000000000000  000046e0  2**5
>                   CONTENTS, ALLOC, LOAD, RELOC, READONLY, DATA
> 
> .new:
>   0 .text         00001e05  0000000000000000  0000000000000000  00000040  2**4
>                   CONTENTS, ALLOC, LOAD, RELOC, READONLY, CODE
> [...]
>  11 .rodata       000005ce  0000000000000000  0000000000000000  00004600  2**5
>                   CONTENTS, ALLOC, LOAD, RELOC, READONLY, DATA

ACK. Understood.  Even so, it still makes sense for these kind of
janitorial changes as it makes sense to constify arrays when they are
read-only and making them static is sensible for const data.

> 
> cheers, Joe
> 

