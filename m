Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46368576ECF
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jul 2022 16:38:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDD0610F6D0;
	Sat, 16 Jul 2022 14:35:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8CAD610E06A
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jul 2022 15:50:54 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 43AA412FC;
 Fri, 15 Jul 2022 08:50:54 -0700 (PDT)
Received: from [192.168.99.12] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 377BF3F792;
 Fri, 15 Jul 2022 08:50:53 -0700 (PDT)
Message-ID: <8d1fedde-6cf4-1e68-90e0-9f34d776437e@foss.arm.com>
Date: Fri, 15 Jul 2022 16:50:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 3/3] drm/komeda - Fix handling of pending crtc state
 commit to avoid lock-up
Content-Language: en-US
To: Robin Murphy <robin.murphy@arm.com>, Liviu Dudau <liviu.dudau@arm.com>
References: <20220606114714.175499-1-carsten.haitzler@foss.arm.com>
 <20220606114714.175499-3-carsten.haitzler@foss.arm.com>
 <YshVFKbiz/7FrkKT@e110455-lin.cambridge.arm.com>
 <af1d56b5-a999-6806-1aa6-593eb0e9380a@foss.arm.com>
 <Ysv3vS2oosEgFJcN@e110455-lin.cambridge.arm.com>
 <9ea171ca-8515-4088-9ea4-e6e35d9c8db8@arm.com>
From: Carsten Haitzler <carsten.haitzler@foss.arm.com>
Organization: Arm Ltd.
In-Reply-To: <9ea171ca-8515-4088-9ea4-e6e35d9c8db8@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: dri-devel@lists.freedesktop.org, steven.price@arm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/14/22 13:20, Robin Murphy wrote:
> On 2022-07-11 11:13, Liviu Dudau wrote:
> [...]
>>> But nothing worrying. It does work, though doesn't compile due to:
>>>
>>> drivers/gpu/drm/arm/display/komeda/komeda_kms.c: In function
>>> ‘komeda_kms_atomic_commit_hw_done’:
>>> drivers/gpu/drm/arm/display/komeda/komeda_kms.c:77:9: error: ‘for’ loop
>>> initial declarations are only allowed in C99 or C11 mode
>>>     77 |         for (int i = 0; i < kms->n_crtcs; i++) {
>>>        |         ^~~
>>> drivers/gpu/drm/arm/display/komeda/komeda_kms.c:77:9: note: use option
>>> ‘-std=c9
>>> ’, ‘-std=gnu99’, ‘-std=c11’ or ‘-std=gnu11’ to compile your code
>>>
>>> but that was a trivial fixup.
>>
>> Interesting that I'm not seeing that, probably due to using GCC12? 
>> Anyway, I'll fix
>> that and send a proper patch.
> 
> FWIW we do use -std=gnu11 since 5.18 (see e8c07082a810), but I'm not 
> entirely sure what the status quo is for using the new features in fixes 
> which might also warrant backporting to stable. I believe Carsten's 
> stuck on an older kernel thanks to constraints of the rest of that 
> project ;)

Not that old - my last sync was like end of April, but i was basing my 
commits off a stable kernel release tree (5.17.4), I have multiple 
kernels for different purposes and for this stuck to something released 
vaguely recently (i synced my tree to latest release before sending off 
the patch set). I'm not sure on the kernel policy for the above for (int 
i = 0;...) etc. usage. I tend to still be more conservative and keep my 
vars at top of the block anyway out of decades of habit.
