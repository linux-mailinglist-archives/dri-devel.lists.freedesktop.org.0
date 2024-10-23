Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 120399AC060
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 09:33:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3CD810E04F;
	Wed, 23 Oct 2024 07:33:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="mmIBk/Hn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4061310E04F;
 Wed, 23 Oct 2024 07:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RMSUwiYfUyQQwRXtCIqQ5coNzdBGxBM/GULfh19f6Z8=; b=mmIBk/HnxwTR7T38kNFlOkuqSS
 RGtF9REHRh2ELC3m4XLFdX+KUY2LMTuwz+yodNEkimYsIZ+6x24+YhgHZlQCVx7WHdnZdM07j7KOV
 VJJTLwilF4Sbb2vwZFRQOlplLDijlx2QfE6aQMEC/Tf1STaRCwXGF+66b19qa55fDi0sb8QUX6lCf
 e/4VmYEHdVV9OOnql7Dj13upF1mhS0Am+RBfcxeRetruM+YjonlOD2Nw3retYFxTGj1iMTJTwjlSf
 sNf/Na5Re7mxi3HMzzoCRqv9QZdCrrQbLk6YAFj0PkIQVkBc3NcaFVUHfx0Ra1OPLa58Yc1Sdndl5
 XXF0qPRQ==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1t3VsJ-00Dw9M-9I; Wed, 23 Oct 2024 09:33:47 +0200
Message-ID: <8a6e6fce-e3df-40e9-ab1b-f5d641e078bd@igalia.com>
Date: Wed, 23 Oct 2024 08:33:46 +0100
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
 <SA1PR12MB859939F759D6B661D49FC924ED4C2@SA1PR12MB8599.namprd12.prod.outlook.com>
 <3930f491-10a2-4863-8e24-009d3fbc2b23@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <3930f491-10a2-4863-8e24-009d3fbc2b23@amd.com>
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


On 22/10/2024 18:06, Christian König wrote:
> Am 22.10.24 um 18:46 schrieb Li, Yunxiang (Teddy):
>> [Public]
>>
>> I suppose we could add a field like amd-memory-private: to cover the 
>> private placements.
> 
> No, that is not really appropriate either. GWS, GDS and OA are not 
> memory in the first place.
> 
> Those BOs are HW blocks which the driver allocated to use.
> 
> So accounting them for the memory usage doesn't make any sense at all.
> 
> We could print them in the fdinfo as something special for statistics, 
> but it's probably not that useful.
> 
>>   When would a BO not have a placement, is it when it is being moved?
> 
> There are BOs which are only temporary, so when they are evicted their 
> backing store is just discarded.
> 
> Additional to that allocation of backing store is sometimes delayed 
> until the first use.

Would this work correctly if instead of preferred allowed mask was used?

Point being, to correctly support fdinfo stats drm-total-, *if* a BO 
*can* have a backing store at any point it should always be counted there.

*If* it currently has a placement it is drm-resident-.

If it has a placement but can be discarded it is drm-purgeable-. Etc.

Regards,

Tvrtko

> 
>>   Since we are tracking the state changes, I wonder if such situations 
>> can be avoided now so whenever we call these stat update functions the 
>> BO would always have a placement.
> 
> No, as I said before those use cases are perfectly valid. BO don't need 
> a backing store nor do they need a placement.
> 
> So the code has to gracefully handle that.
> 
> Regards,
> Christian.
> 
>>
>> Teddy
> 
