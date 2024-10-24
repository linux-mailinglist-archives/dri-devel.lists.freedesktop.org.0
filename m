Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8EE59ADF18
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 10:29:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2514210E8CE;
	Thu, 24 Oct 2024 08:29:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="gDKxLQ2G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7FA310E8CE;
 Thu, 24 Oct 2024 08:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ukhu1zEgudrLrY4FbTtrJ0nj4ZcHWLk3Hk7myyRZWso=; b=gDKxLQ2GzSkytVi8d7dxLZowcY
 eKvfDCnK2LvTFU8z1U4GQ0WRLi4OsUTlciXZIEWs+4wRfr3KbOhnEO0hSb6V/HSsSmNEhzPIRk5r7
 SVdIrRR+C4CrpPmnqW7F5AzjIheq/bfkpuHezw5Et8dzbp6y3dLaaHXZWTPZpzPNHfDF2YaaQnBl/
 EsMfHg0SdjaedfIrEUp81uxg3nJV5rh5yJPOiI6v1fVux5JjMZoJocSpNTk48HukrSwyiejkFN43W
 LjHmlTgZXNzRkr+VfP88JHmK30cOE74hlhteEIFdgdPLcbYlY0FKnHGcbS9WrOPGlr1oTUzmai907
 6v45iEJg==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1t3tDe-00EQ5y-09; Thu, 24 Oct 2024 10:29:22 +0200
Message-ID: <50803e40-eaaf-4301-8459-e1b465b2d6f7@igalia.com>
Date: Thu, 24 Oct 2024 09:29:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] drm/amdgpu: track bo memory stats at runtime
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Li, Yunxiang (Teddy)" <Yunxiang.Li@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
References: <20241018133308.889-1-Yunxiang.Li@amd.com>
 <20241018133308.889-5-Yunxiang.Li@amd.com>
 <1057097f-02f4-4f0f-9ac5-37aa84570b47@amd.com>
 <SA1PR12MB8599E3DD01B4A45AD7CA71FAED4C2@SA1PR12MB8599.namprd12.prod.outlook.com>
 <53382fc0-0686-46af-9285-0cd6aec314ae@amd.com>
 <cd2b57c6-1947-4dbd-bae8-ecdb2b42de72@igalia.com>
 <47e4b79b-2c08-4ee8-b472-5482bc159856@amd.com>
 <6d324aca-76fd-420b-9bae-6c0984e659e1@igalia.com>
 <7503c3fd-deea-4eb9-9324-ab4f13f70332@amd.com>
 <2141a4f4-bcf4-4419-8756-fb5afd6c7f3a@igalia.com>
 <c80eb8ff-3965-4036-b763-20c4c2550e04@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <c80eb8ff-3965-4036-b763-20c4c2550e04@amd.com>
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


On 23/10/2024 13:56, Christian König wrote:
> Am 23.10.24 um 14:24 schrieb Tvrtko Ursulin:
>> [SNIP]
>>>> To fold or not the special placements (GWS, GDS & co) is also 
>>>> tangential. In my patch I just preserved the legacy behaviour so it 
>>>> can easily be tweaked on top.
>>>
>>> Yeah, but again the original behavior is completely broken.
>>>
>>> GWS, GDS and OA are counted in blocks of HW units (multiplied by 
>>> PAGE_SIZE IIRC to avoid some GEM&TTM warnings).
>>>
>>> When you accumulate that anywhere in the memory stats then that is 
>>> just completely off.
>>
>> Ooops. :) Are they backed by some memory though, be it system or VRAM?
> 
> GDS is an internal 4 or 64KiB memory block which is only valid while 
> shaders are running. It is used to communicate stuff between different 
> shader stages and not even CPU accessible.
> 
> GWS and OA are not even memory, those are just HW blocks which implement 
> a fixed function.
> 
> IIRC most HW generation have 16 of each and when setting up the 
> application virtual address space you can specify how many will be used 
> by the application.

I see, thank you! Though I could have bothered to look in the code or 
even instrument at runtime too.

I agree removing it from system is correct. If wanted and/or desirable 
some or all could be exported as different memory regions even. DRM 
fdinfo specs already allows that. Like:

drm-total-vram: ...
drm-total-gds: ...
drm-total-oa: ...

Etc.

Regards,

Tvrtko
