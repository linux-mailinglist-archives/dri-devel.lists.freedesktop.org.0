Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2395574D52
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 14:20:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB48E112A76;
	Thu, 14 Jul 2022 12:20:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 44785112A76
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 12:20:43 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3E93213D5;
 Thu, 14 Jul 2022 05:20:43 -0700 (PDT)
Received: from [10.57.86.49] (unknown [10.57.86.49])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 176203F792;
 Thu, 14 Jul 2022 05:20:41 -0700 (PDT)
Message-ID: <9ea171ca-8515-4088-9ea4-e6e35d9c8db8@arm.com>
Date: Thu, 14 Jul 2022 13:20:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/3] drm/komeda - Fix handling of pending crtc state
 commit to avoid lock-up
Content-Language: en-GB
To: Liviu Dudau <liviu.dudau@arm.com>,
 Carsten Haitzler <carsten.haitzler@foss.arm.com>
References: <20220606114714.175499-1-carsten.haitzler@foss.arm.com>
 <20220606114714.175499-3-carsten.haitzler@foss.arm.com>
 <YshVFKbiz/7FrkKT@e110455-lin.cambridge.arm.com>
 <af1d56b5-a999-6806-1aa6-593eb0e9380a@foss.arm.com>
 <Ysv3vS2oosEgFJcN@e110455-lin.cambridge.arm.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <Ysv3vS2oosEgFJcN@e110455-lin.cambridge.arm.com>
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

On 2022-07-11 11:13, Liviu Dudau wrote:
[...]
>> But nothing worrying. It does work, though doesn't compile due to:
>>
>> drivers/gpu/drm/arm/display/komeda/komeda_kms.c: In function
>> ‘komeda_kms_atomic_commit_hw_done’:
>> drivers/gpu/drm/arm/display/komeda/komeda_kms.c:77:9: error: ‘for’ loop
>> initial declarations are only allowed in C99 or C11 mode
>>     77 |         for (int i = 0; i < kms->n_crtcs; i++) {
>>        |         ^~~
>> drivers/gpu/drm/arm/display/komeda/komeda_kms.c:77:9: note: use option
>> ‘-std=c9
>> ’, ‘-std=gnu99’, ‘-std=c11’ or ‘-std=gnu11’ to compile your code
>>
>> but that was a trivial fixup.
> 
> Interesting that I'm not seeing that, probably due to using GCC12? Anyway, I'll fix
> that and send a proper patch.

FWIW we do use -std=gnu11 since 5.18 (see e8c07082a810), but I'm not 
entirely sure what the status quo is for using the new features in fixes 
which might also warrant backporting to stable. I believe Carsten's 
stuck on an older kernel thanks to constraints of the rest of that 
project ;)

Cheers,
Robin.
