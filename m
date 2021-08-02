Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9293DD423
	for <lists+dri-devel@lfdr.de>; Mon,  2 Aug 2021 12:44:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 990436E4BB;
	Mon,  2 Aug 2021 10:44:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 387776E4BB
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Aug 2021 10:44:10 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id d1so19191500pll.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Aug 2021 03:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=sUkGZKiJFUHXdJRo8lZOT7YsQ1JM5hP71TkDPnklmzo=;
 b=rp8Pgy6HQTYz7cVX+UNgdkeJCLvJ9XPoAU3yqZXgbtvgw2Y4zu74wqxijCLER5h3d1
 9IYtRJjXiSsGud5BWvLf3v7KkB5rye6N2lkoW/Pq1IvWe1ZODNYVOkkOC+/zaRsg7CJA
 Rvuuq7ExBEHMZMJomnP1lenpEg0BLIBwh1An0oV1n8JnKD66FgQpYJGTreonjYIVFTpm
 7juis0NnCL5K9sVRVF3Xypev48AHMNw4lN3RRAVkXgFsil6blxy0EHqU5wO7nrylmw39
 ew1wiL5unCFrWDfe7sDk3aeIMjuTVMks4IjWg8/x3JTbd9YTmszZshuLWfMcGC5QdqEg
 W1Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sUkGZKiJFUHXdJRo8lZOT7YsQ1JM5hP71TkDPnklmzo=;
 b=X3halK/cEJe9ftujtKcx6s62im2pGF/p3BgS3dQF5s7wdwaR/dRCCaFidNkhkn2rtP
 WOD0FglUFUpjiyo5SwH/rLTgK42vnYGFWpoHFaAUKJ1i+DjD++kWwH+xWgH5IzlCa3f6
 co8K/eY23mUT4RIMCDc1nMMIUAcfZHNzw+nsePgo1DFoNakpEeq9Iz7aKRf2PAqkrCTX
 dHnA/xUmk+Nat1b3ebvg+/2HT1Fke0WdHQtZI/fzoZAuYKCnjsY9B+TRJT977XtYCMIu
 3AGATiWlKuCGM1MKZlPIGYDEeP52Hl+B8uJVzdaQVj2tsV4omspjXj2GT98fUHmbBtvk
 om+Q==
X-Gm-Message-State: AOAM5300xSf4D9RPMR6o2W8Wc8/pCSaGd8sRDBY9ThjUgGJOakjutsPg
 10MNpe39AtVrhVFv0moKZZM=
X-Google-Smtp-Source: ABdhPJz2ikv5xjHbyI2OQRLvHxw/dvvTn8uEDT12ePKFpN2DmxJzLaY3iw0lqtbey0zspJENCX73JQ==
X-Received: by 2002:a63:4f21:: with SMTP id d33mr553007pgb.144.1627901049822; 
 Mon, 02 Aug 2021 03:44:09 -0700 (PDT)
Received: from [192.168.1.237] ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id 37sm12731593pgt.28.2021.08.02.03.44.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 03:44:09 -0700 (PDT)
Subject: Re: [PATCH v2 0/2] locking/lockdep, drm: apply new lockdep assert in
 drm_auth.c
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, peterz@infradead.org,
 mingo@redhat.com, will@kernel.org, longman@redhat.com, boqun.feng@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, gregkh@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20210731082458.1962043-1-desmondcheongzx@gmail.com>
 <YQesKIRQKYyTFyxJ@phenom.ffwll.local>
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Message-ID: <4d871d0e-3b51-8a21-49e5-1a413bf71d4d@gmail.com>
Date: Mon, 2 Aug 2021 18:44:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YQesKIRQKYyTFyxJ@phenom.ffwll.local>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/8/21 4:26 pm, Daniel Vetter wrote:
> On Sat, Jul 31, 2021 at 04:24:56PM +0800, Desmond Cheong Zhi Xi wrote:
>> Hi,
>>
>> Following a discussion on the patch ("drm: use the lookup lock in
>> drm_is_current_master") [1], Peter Zijlstra proposed new lockdep_assert
>> helpers to make it convenient to compose lockdep checks together.
>>
>> This series includes the patch that introduces the new lockdep helpers,
>> then utilizes these helpers in drm_is_current_master_locked in the
>> following patch.
>>
>> v1 -> v2:
>> Patch 2:
>> - Updated the kerneldoc on the lock design of drm_file.master to explain
>> the use of lockdep_assert(). As suggested by Boqun Feng.
>>
>> Link: https://lore.kernel.org/lkml/20210722092929.244629-2-desmondcheongzx@gmail.com/ [1]
> 
> Can you pls also cc: this to intel-gfx so the local CI there can pick it
> up and verify? Just to check we got it all.
> -Daniel
> 

Oops my bad, I missed out the CI for this series. Will resend with the 
proper cc.

Best wishes,
Desmond

> 
>>
>> Best wishes,
>> Desmond
>>
>> Desmond Cheong Zhi Xi (1):
>>    drm: add lockdep assert to drm_is_current_master_locked
>>
>> Peter Zijlstra (1):
>>    locking/lockdep: Provide lockdep_assert{,_once}() helpers
>>
>>   drivers/gpu/drm/drm_auth.c |  6 +++---
>>   include/drm/drm_file.h     |  4 ++++
>>   include/linux/lockdep.h    | 41 +++++++++++++++++++-------------------
>>   3 files changed, 28 insertions(+), 23 deletions(-)
>>
>> -- 
>> 2.25.1
>>
> 

