Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A099A345D54
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 12:51:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90AFF6E8CB;
	Tue, 23 Mar 2021 11:51:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D2D66E8CB;
 Tue, 23 Mar 2021 11:51:16 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id hq27so26588510ejc.9;
 Tue, 23 Mar 2021 04:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=JWCHWFwsG8yAzV03OTUOhh2O9iC7eym1dVNKWhgZZjs=;
 b=BRTtEir0vV8VjibQFJUw7vOLkJMfeYABsba+9SJWPRyNEW8i1OEMB5kkNp534VlNs+
 7sl2dGOV4/5Wd92Djj1tf3r57WKsxQF3RNzMnx6lpXTrMS5/D8YCLEA9/tzlqWd/L+QC
 GSWYzvDMhEr1uwmhiocBqVoBQ66mtCbTs30QgSHO99PXKTwejiIhzk/jgXVeJj6v0CFu
 pRMZ79du/2Riy1OY4rr0KU6ocz4I8qtzsXKt7hw8QUZ9cwVFUo7QBNSCfLnTf0c19nZd
 6qYdLvj6mfPUKEnNseIZUsG5GwL9ovOIi6JGlSC2KZvK9eiYTrT4RZVtmUnSOo/Tw5XH
 OXYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=JWCHWFwsG8yAzV03OTUOhh2O9iC7eym1dVNKWhgZZjs=;
 b=jHZu8yJpc9p3FQiqzm50XeRiaz7gx3aAe58AcQDOIVlQmjYGHKIyBhBwyynY81xBdH
 NOfLGPP+vRfcyq2J6tLjNcf/2IcRPfGxk8rjunSoicPO7wjJ1lsx1onfqS5PZtUX7EBb
 AQWGY7wAd5o6PTzpU0fjJhlQ62wvIo4vwpwBM5YXhAUfKJvvZuEYNC14H4C3exIpgpze
 pWXdHjW7kJjX40ypUAsTseLgEoRMytGOxQibaYAII1ey78fy8VtI5xghUEmZD7OadEwC
 B5llipvyTFD/CcBqSfJADXxEAAF3IvKHTGaVv2t6dyvFKbHZ09gxHG2qznD/Ur3UKO8a
 qNsg==
X-Gm-Message-State: AOAM531ZWwvR0j98M4lUQV8t5phTQhayvS2wpBdtNhnFkx1IFWFHdBRh
 JPvwa6SL+zY6TDnefUBON8kbKWZmT9U=
X-Google-Smtp-Source: ABdhPJxsrabBoa7M9oiVWkVeAIwKM+ydfyCpTsx+1w70kNyHxgoKtcDAjaVQyNDPYn6G6RLmhgt3yQ==
X-Received: by 2002:a17:906:311a:: with SMTP id
 26mr4430193ejx.395.1616500274813; 
 Tue, 23 Mar 2021 04:51:14 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:fdcd:4dd1:a1af:a7ec?
 ([2a02:908:1252:fb60:fdcd:4dd1:a1af:a7ec])
 by smtp.gmail.com with ESMTPSA id p9sm12666884eds.66.2021.03.23.04.51.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Mar 2021 04:51:14 -0700 (PDT)
Subject: Re: [PATCH] drm/ttm: stop warning on TT shrinker failure
To: Michal Hocko <mhocko@suse.com>, Daniel Vetter <daniel@ffwll.ch>
References: <1ae415c4-8e49-5183-b44d-bc92088657d5@gmail.com>
 <CAKMK7uEDhuvSwJj5CX8vHgLb+5zm=rdJPmXwb-VQWdrW6GwQZw@mail.gmail.com>
 <e6e9df3e-cd2b-d80f-205d-6ca1865819b2@gmail.com>
 <YFigZ5+H95c/GI/S@phenom.ffwll.local>
 <20210322140548.GN1719932@casper.infradead.org>
 <YFi+UROYbQERYEEr@dhcp22.suse.cz>
 <CAKMK7uGM6EJvzktrANyeeemRPoW7O0ka-ZyKi==wL1zt3yM=5w@mail.gmail.com>
 <c78457bb-d93a-ff84-1cce-0fb3fa9f0cec@gmail.com>
 <YFma+ZxncvfBd++o@dhcp22.suse.cz> <YFnQ1Lk6BTo8L7pr@phenom.ffwll.local>
 <YFnVMRNmWG+qv+4i@dhcp22.suse.cz>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <d1d7170b-7566-32c3-9883-49e5573e7339@gmail.com>
Date: Tue, 23 Mar 2021 12:51:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YFnVMRNmWG+qv+4i@dhcp22.suse.cz>
Content-Language: en-US
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
Cc: Matthew Wilcox <willy@infradead.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Linux MM <linux-mm@kvack.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Dave Chinner <dchinner@redhat.com>, Leo Liu <Leo.Liu@amd.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 23.03.21 um 12:46 schrieb Michal Hocko:
> On Tue 23-03-21 12:28:20, Daniel Vetter wrote:
>> On Tue, Mar 23, 2021 at 08:38:33AM +0100, Michal Hocko wrote:
> [...]
>>>>> fs_reclaim_acquire is there to make sure lockdep understands that this
>>>>> is a shrinker and that it checks all the dependencies for us like if
>>>>> we'd be in real reclaim. There is some drop caches interfaces in proc
>>>>> iirc, but those drop everything, and they don't have the fs_reclaim
>>>>> annotations to teach lockdep about what we're doing.
>>> ... I really do not follow this. You shouldn't really care whether this
>>> is a reclaim interface or not. Or maybe I just do not understand this...
>> We're heavily relying on lockdep and fs_reclaim to make sure we get it all
>> right. So any drop caches interface that isn't wrapped in fs_reclaim
>> context is kinda useless for testing. Plus ideally we want to only hit our
>> own paths, and not trash every other cache in the system. Speed matters in
>> CI.
> But what is special about this path to hack around and make it pretend
> it is part of the fs reclaim path?

That's just to teach lockdep that there is a dependency.

In other words we pretend in the debugfs file that it is part of the fs 
reclaim path to check for the case when it really becomes part of the fs 
reclaim path.

Regards,
Christian.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
