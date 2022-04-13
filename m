Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA6D4FF387
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 11:31:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B9A210FB66;
	Wed, 13 Apr 2022 09:31:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 863F110FB89
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 09:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649842282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IAMVXndxW0OtvIwRqL0hyfDoLN2+4Iki0eZzZOShd7A=;
 b=S8d+nHy8yEQ9ZAvQ/c33KDe8A8+zkv5SmEQvVAj07Fx+mvrNnQGuXjrpnuRyk7SQgUGHSd
 BouJOUb1Q7vhWtNIOIB8wloVn1wnN7CYVlwERiB39s/VL9S315LeQQ3PY31Ws7SZqCGE/f
 LteY4sLwKcEds50owMFzEByEe6KvLRY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-551-zaXtkIJCOgqL3TnSs06chw-1; Wed, 13 Apr 2022 05:31:21 -0400
X-MC-Unique: zaXtkIJCOgqL3TnSs06chw-1
Received: by mail-wm1-f70.google.com with SMTP id
 p31-20020a05600c1d9f00b0038ed0964a90so600824wms.4
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 02:31:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IAMVXndxW0OtvIwRqL0hyfDoLN2+4Iki0eZzZOShd7A=;
 b=o0FUXoZA/d6hdETZIngOWRzytHv6vU471wUnCi6Oxl4A/JCU7QHO//IodhPBweDNWX
 HtzWoNWV366hJOCN7ShmNW+my3YrSIHrA9wdCX7NWek97nUa4tvNDald34nj1EurNEls
 pfsik6Z/B4NtTxhxebnZq74KMSk3wikHkFI2UGA9uG2IFa8s3JPYmmyvThnxLb1CeB2Q
 U3MctQxNCIGjOsnfeD53CmfZrPvGqYFgcXVVR2Wwdo5+2dLBIPWPGxJ7a689ynr4X59J
 1YFAXFcGPi0Xjt6jm1EF2zCTUTpX2vdpgu24Ht4j4bOAslKRc8274L6weYI4KbcI4UVx
 n0EQ==
X-Gm-Message-State: AOAM530Lm++kczQLOP3chqBY6AWlogv9GSqWKFVu6DepCtL3zPM2q9uf
 Bywi8luekbdUg1sYHHpEmK/OViAUIXzTbjxY3ahdoq1b/FQJgdJsZQ/6Y2cNb53Nu8AMevofB7o
 Mdfi64begbSITXnT0jgx8StM/2YT1
X-Received: by 2002:a5d:4303:0:b0:207:a7d8:4ce6 with SMTP id
 h3-20020a5d4303000000b00207a7d84ce6mr10638947wrq.101.1649842279850; 
 Wed, 13 Apr 2022 02:31:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwUm1vydojlfWe/H1ysZrMzcrbEN1Uf13kLtCOmU70SI8wmq4v7NO1wCDHQORMytmlOINcbNA==
X-Received: by 2002:a5d:4303:0:b0:207:a7d8:4ce6 with SMTP id
 h3-20020a5d4303000000b00207a7d84ce6mr10638931wrq.101.1649842279662; 
 Wed, 13 Apr 2022 02:31:19 -0700 (PDT)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 m1-20020a1ca301000000b0038ea15d5f75sm1932109wme.38.2022.04.13.02.31.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Apr 2022 02:31:19 -0700 (PDT)
Message-ID: <85a3bd58-7c7c-051d-665d-68d00e4b3ee0@redhat.com>
Date: Wed, 13 Apr 2022 11:31:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] fbcon: Fix delayed takeover locking
To: Daniel Vetter <daniel@ffwll.ch>
References: <20220413082128.348186-1-daniel.vetter@ffwll.ch>
 <955400a5-a785-57af-92d4-42710c55ce99@redhat.com>
 <YlaWE+/YBtcrnLHY@phenom.ffwll.local>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <YlaWE+/YBtcrnLHY@phenom.ffwll.local>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Daniel Vetter <daniel.vetter@intel.com>, Du Cheng <ducheng2@gmail.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Zheyu Ma <zheyuma97@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Nathan Chancellor <nathan@kernel.org>, Claudio Suarez <cssk@net-c.es>,
 Matthew Wilcox <willy@infradead.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Sam Ravnborg <sam@ravnborg.org>,
 Helge Deller <deller@gmx.de>, Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/13/22 11:21, Daniel Vetter wrote:
> On Wed, Apr 13, 2022 at 11:16:08AM +0200, Javier Martinez Canillas wrote:
>> Hello Daniel,
>>
>> On 4/13/22 10:21, Daniel Vetter wrote:
>>> I messed up the delayed takover path in the locking conversion in
>>> 6e7da3af008b ("fbcon: Move console_lock for register/unlink/unregister").
>>>
>>
>> Maybe a few more words of what the issue is ? Something like the following:
>>
>> If CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER is enabled, fbcon take-over
>> doesn't take place when calling fbcon_fb_registered(). Instead, is deferred
>> using a workqueue and its fbcon_register_existing_fbs() function calls to
>> fbcon_fb_registered() again for each registered fbcon fb.
>>
>> This leads to the console_lock tried to be held twice, causing a deadlock.
> 
> Will add.
>>

Thanks.

[snip]  

>> Removing these comments feels like should be in a separate patch or at least
>> mention in the patch description that should had been removed in the commit
>> 6e7da3af008b ("fbcon: Move console_lock for register/unlink/unregister"),
>> that made these functions to be called without the console_lock being held.
> 
> Yeah I forgot to mention that in the commit message - while reviewing all
> the locking to figure out the bug I also noticed that I didn't update the
> comments, and since it's all issues in the same patch I figured I'll do it
> all in one go.
> 
> Ok if I explain that and then keep the comment removals?
Yes, I'm OK with that and agreed that all changes are to fix the same commit.

It's just that it took me some time to figure out why you were removing those.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

