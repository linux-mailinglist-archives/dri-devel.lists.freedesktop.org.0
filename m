Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3267AAD87C8
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 11:28:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33F8310E902;
	Fri, 13 Jun 2025 09:28:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=damsy.net header.i=@damsy.net header.b="jwhTvky8";
	dkim=permerror (0-bit key) header.d=damsy.net header.i=@damsy.net header.b="l0sYhRpD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jeth.damsy.net (jeth.damsy.net [51.159.152.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BD7C10E902;
 Fri, 13 Jun 2025 09:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202408r; d=damsy.net; c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1749806828;
 bh=1dbowANn3no5ldVSSjkkvBv
 xNOcop2zv/uIzMhogrt0=; b=jwhTvky8/jfkKg1DI/SrGprnYXFIXRdpXRl/FVYLa9/Z44tnMH
 23PCl7l5E4JQoJcrPm/qGuWfi3IqGKu2xxPEYyIjjkVbu6SO3PjQRLUO92WK9vfdr7SQSI1MXfy
 AcQ1sZPBNbDD9QN2OsKMk8bXukJ9eNqEk/+OZ66u1mCUVLUgQH0+jxh08r1abKz73bq/nVWvlzP
 aOD/iyKklGpezS3CUcgBdhePCMcsnlIVOMyZnKV0F+ygDXWIK8ANQgWObLSVoWkGkQdpJPV4pl0
 xx1WzAlRuIHOEIIVnUz/CQ5OZAQBgOvy237e4p9G4UPvDPdI5gzhuyg/S3q7oqeHpvQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202408e; d=damsy.net;
 c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1749806828; bh=1dbowANn3no5ldVSSjkkvBv
 xNOcop2zv/uIzMhogrt0=; b=l0sYhRpDgmwdX9m9jfyvdM1hz0uMxd3Aq2ZUVVGzUVVS1S7B6z
 VUQsVbrzpzMefepo27q2JFcL3Gz1ZrOfWPDA==;
Message-ID: <d205de0c-0c7a-4644-9655-e9ca28cadb57@damsy.net>
Date: Fri, 13 Jun 2025 11:27:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/amdgpu: give each kernel job a unique id
To: Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 Philipp Stanner <phasta@kernel.org>, dri-devel@lists.freedesktop.org
References: <aEmR9420vj-ISz-W@cassiopeiae>
 <dc661205-1e5b-4697-863b-36a299365219@amd.com> <aEmcpsXwS8dLNGUg@cassiopeiae>
 <5f71cfd0-fd38-491c-8255-bdd3e0fb19dc@amd.com> <aEtnS6kvh1mssFTb@cassiopeiae>
 <099816b4-0b7b-4ac7-9bb5-22f23b1db7b7@amd.com> <aEvitwoc_D6OxXCS@pollux>
Content-Language: en-US
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
In-Reply-To: <aEvitwoc_D6OxXCS@pollux>
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



Le 13/06/2025 à 10:35, Danilo Krummrich a écrit :
> On Fri, Jun 13, 2025 at 10:23:15AM +0200, Christian König wrote:
>>> Another option is to just add an interface to get a kernel client_id from the
>>> same atomic / IDA.
>>
>> That won't give us fixed numbers for in kernel clients.
> 
> That's fine, then let's come up with an API that reserves fixed numbers.
> 
> My main concern is that drivers silently rely on DRM API internals, i.e. that
> client_id is an u64 atomic, etc.

Let me express the need then: an id that is printed in gpu_scheduler_trace events and this id needs 
to be mappable by a userspace tool to a semantic.

The current solution implements this need using:
* fixed ids which are u64 numbers because drm client id are u64.
* hard-coded mapping in the tool between these ids and their meaning ("u64_max - 1" interpreted as 
"vm_update" and so on).

It doesn't depend on how drm internally manage these ids.

Adding an API to reserve fixed numbers would work but:
* if the fixed numbers are chosen by the driver ("drm_reserve_id(u64_max -1)"), I don't see the 
benefit over the current patch
* if the fixed numbers are allocated by drm (drm_reserve_id("vm_update") -> u64), it would then 
require a way to expose them to userspace (through /sys/kernel/debug/dri/x/clients?)


Thanks,
Pierre-Eric
