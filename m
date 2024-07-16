Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D75932731
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 15:12:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEB4110E249;
	Tue, 16 Jul 2024 13:12:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OHh/UxlF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 431E410E249
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 13:12:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7B23C6125C;
 Tue, 16 Jul 2024 13:12:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53420C116B1;
 Tue, 16 Jul 2024 13:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721135534;
 bh=qXFO+tHvEVrQ1IReAUQT2w5nLq2TWFdSCuWqGTWx7DI=;
 h=Date:Subject:To:References:Cc:From:In-Reply-To:From;
 b=OHh/UxlFyCZ4oZK6RQ1CUlLsiF426xE1r7JBKqKtwlRMvr9csd/WYfWavrlN3vjDS
 vWw9SJvDXPkZ7Xa9cPSUjW0DMnJJI94PcYKtqsI1GajAqJdWTVmK4wRs6hWOOolTVv
 0MEDTHJ+EjunB8bAkRkD7aqBHPviweEzUjUY140K+LQeyLnGPhmXrwvKojD0f69VMu
 UGXsTBU6YkzpeIl9F5eNunAo4ycYXP/sFfFw4B0YwZXAMBeHjtB/cK9CfT9JZusv8R
 Na0GZ3+kgE7VVt+aDROM/Y0BOxApTK0mG6Vl2+r5xNdoY5tQ44iBuO2HW1TNdVmcdT
 enA65ROTvZd8Q==
Message-ID: <4e38cc8d-ba25-4e13-adaf-8cd9fc557baa@kernel.org>
Date: Tue, 16 Jul 2024 15:12:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Switch reference counting to GEM instead of TTM
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20240716123519.1884-1-christian.koenig@amd.com>
Content-Language: en-US
Cc: thomas.hellstrom@linux.intel.com, matthew.brost@intel.com,
 dri-devel@lists.freedesktop.org
From: Danilo Krummrich <dakr@kernel.org>
In-Reply-To: <20240716123519.1884-1-christian.koenig@amd.com>
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

Hi Christian,

On 7/16/24 2:35 PM, Christian König wrote:
> Hello everyone,
> 
> to make use of drm_exec it is necessary to have TTM drivers actually use
> the GEM reference count instead of the TTM one.
> 
> This patch set is a start to do that. It switches all uses of
> ttm_bo_get/put to the GEM counterpart and then makes ttm_bo_get private
> to TTM.

That makes a lot of sense.

But I think for at least some drivers it requires a bit more than just
replacing ttm_bo_{get, put} with drm_gem_object_{get, put}.

I gave this a quick shot on Nouveau, and as is, it creates a refcount
underflow for the GEM object's reference count.

At a first glance this seems to happen because some of the previous 
ttm_bo_put() calls intend to compensate for the initial refcount of a 
ttm_buffer_object.

I will have a closer look later on.

- Danilo

> 
> Netx step is to completely remove the TTM refcounting.
> 
> Please review and/or comment.
> 
> Cheers,
> Christian.
> 
> 
