Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C077793275E
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 15:24:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E35B10E1BA;
	Tue, 16 Jul 2024 13:24:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gfn4mbdp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BA2C10E1BA
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 13:24:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CED8960F32;
 Tue, 16 Jul 2024 13:24:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6484C116B1;
 Tue, 16 Jul 2024 13:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721136259;
 bh=QBH1lxbrQpELJQKNfJSONUrIk1rWvfwec7nRIi4891c=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=gfn4mbdpzF9nWTxuJ8Ilnf9s/kQIse2Tt78z8LRaKrQR2Y9t1WRCaSsm038AwPTZn
 KkbXF3JL7PTHvXRfECrheQEC0phpflDyGgZMHCWw1CewWefayTWtT/VqtnUz4Xj/RD
 mj5qpSRU+aZZZkVxCBFNhPi38LZytqa0KqnoWrPad4u6fLxzI1v9MhDD9K0xdMJ5xn
 Y/MktqepVhd5Z0wnvcJESevsijRTKAdqJU9Cq7dbjLvJZc3gmrTzMWjs37pM2hm0w6
 mfhvmRA/5W+IjwlQw5jT+LGjURld4QxPTNT4Sqd35s+A2R6wyW/asxEjDXOA7TXD90
 27zvSOMI2cB+A==
Message-ID: <6819d277-e5c3-4648-8b56-bcfbf793a59d@kernel.org>
Date: Tue, 16 Jul 2024 15:24:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Switch reference counting to GEM instead of TTM
From: Danilo Krummrich <dakr@kernel.org>
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: thomas.hellstrom@linux.intel.com, matthew.brost@intel.com,
 dri-devel@lists.freedesktop.org
References: <20240716123519.1884-1-christian.koenig@amd.com>
 <4e38cc8d-ba25-4e13-adaf-8cd9fc557baa@kernel.org>
Content-Language: en-US
In-Reply-To: <4e38cc8d-ba25-4e13-adaf-8cd9fc557baa@kernel.org>
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

On 7/16/24 3:12 PM, Danilo Krummrich wrote:
> Hi Christian,
> 

Forgot to say, please also add driver maintainers and related
mailing lists, dri-devel gets a lot of messages and I saw this
series by chance.

- Danilo

> On 7/16/24 2:35 PM, Christian König wrote:
>> Hello everyone,
>>
>> to make use of drm_exec it is necessary to have TTM drivers actually use
>> the GEM reference count instead of the TTM one.
>>
>> This patch set is a start to do that. It switches all uses of
>> ttm_bo_get/put to the GEM counterpart and then makes ttm_bo_get private
>> to TTM.
> 
> That makes a lot of sense.
> 
> But I think for at least some drivers it requires a bit more than just
> replacing ttm_bo_{get, put} with drm_gem_object_{get, put}.
> 
> I gave this a quick shot on Nouveau, and as is, it creates a refcount
> underflow for the GEM object's reference count.
> 
> At a first glance this seems to happen because some of the previous 
> ttm_bo_put() calls intend to compensate for the initial refcount of a 
> ttm_buffer_object.
> 
> I will have a closer look later on.
> 
> - Danilo
> 
>>
>> Netx step is to completely remove the TTM refcounting.
>>
>> Please review and/or comment.
>>
>> Cheers,
>> Christian.
>>
>>
