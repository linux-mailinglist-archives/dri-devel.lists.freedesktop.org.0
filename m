Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FB2AB5C5D
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 20:38:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABAB110E5D6;
	Tue, 13 May 2025 18:38:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="H6cDZAvR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D10D10E5D3;
 Tue, 13 May 2025 18:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QhfAGnuvDJzqnrtxEie7hKmneaYnXiuHS//L4LziLpQ=; b=H6cDZAvRwRYuj37mXVFrm0AZoD
 HbLMDAm14CHCGrYvsqhQdli6XhVy/o/YhnKsGug4tsMb0wevclO5tUQfmQvXj4jqFn0Wf/K+OzUKa
 l0jMlvKu/d24AOXs/dQIYhHXUZKE1japckpkhKWRhbNxNRbAOQ6t+Nn6Ldl/iCsWuy1LXUHBbw4N4
 QlUyltPvZcriVblNzTXZmbADKjbbKZ/GXte2ljIis5DGkVoOosFAPb2kFHU3S0e0Ajc0FfznHL9yp
 P5N+3s4gkJYShBbGKF6agGWyAVynuiaLvPUVFiibQNWZ4OqP5TO8Vd6ODh0ZRbdB7ODsrYobV1Uhr
 tyOhyBew==;
Received: from [189.6.16.79] (helo=[192.168.0.55])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uEuQl-007ktH-NM; Tue, 13 May 2025 20:38:19 +0200
Message-ID: <e0460dd3-1e13-4118-857a-a21b2cfb476b@igalia.com>
Date: Tue, 13 May 2025 15:38:14 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] drm/amd/display: remove code duplication on dcn401
To: Alex Hung <alex.hung@amd.com>, airlied@gmail.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, harry.wentland@amd.com,
 simona@ffwll.ch, sunpeng.li@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com
References: <20250430142549.829861-1-mwen@igalia.com>
 <c1f3aec6-aa50-4a86-b44c-5db16a37a14d@amd.com>
Content-Language: en-US
From: Melissa Wen <mwen@igalia.com>
In-Reply-To: <c1f3aec6-aa50-4a86-b44c-5db16a37a14d@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/05/2025 14:38, Alex Hung wrote:
> Hi Melissa,
>
> The patchset looks good to me but there is WIP dcn401 code, meaning 
> dcn20 and dcn401 are different.
>
> I will check how to refactor code so this patchset can fit better.

I see. Let's wait a bit so.

Anyway, thanks for taking a look.

Melissa

>
> Thanks
>
> On 4/30/25 08:20, Melissa Wen wrote:
>> Hi,
>>
>> I've been examining dcn401 code to figure out what is causing a wrong
>> cursor gamma on HDR issue reported in [1], and I found unnecessary code
>> duplications during this inspection. I don't have the HW, so I'd
>> appreciate if someone can validate this series (if it makes sense to you
>> ofc).
>>
>> This series basically adds some hooks to dcn20 base functions that are
>> usually used in other hw versions and reuses those functions on dcn401
>> so that we can reduce many lines of code and also increase the coverage
>> of bug fixes by avoiding the kind of issue of [2]. Better for debugging
>> and maintainability too.
>>
>> [1] https://gitlab.freedesktop.org/drm/amd/-/issues/4176
>> [2] 
>> https://lore.kernel.org/amd-gfx/20250430141156.827763-1-mwen@igalia.com/
>>
>> Melissa Wen (5):
>>    drm/amd/display: add hook for program_tg
>>    drm/amd/display: hook up program_tg for dcn401
>>    drm/amd/display: remove duplicated program_front_end_for_ctx code
>>    drm/amd/display: remove duplicated post_unlock_program_front_end code
>>      on dcn401
>>    drm/amd/display: remove duplicated program_pipe code on dcn401
>>
>>   .../amd/display/dc/hwss/dcn20/dcn20_hwseq.c   |  40 +-
>>   .../amd/display/dc/hwss/dcn401/dcn401_hwseq.c | 436 +-----------------
>>   .../amd/display/dc/hwss/dcn401/dcn401_hwseq.h |  10 +-
>>   .../amd/display/dc/hwss/dcn401/dcn401_init.c  |   5 +-
>>   .../drm/amd/display/dc/hwss/hw_sequencer.h    |   4 +
>>   5 files changed, 45 insertions(+), 450 deletions(-)
>>
>

