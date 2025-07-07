Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD022AFB5EB
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 16:26:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF09210E4A6;
	Mon,  7 Jul 2025 14:26:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FtrrWXCw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FA4E10E4B2;
 Mon,  7 Jul 2025 14:26:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 79C4AA54040;
 Mon,  7 Jul 2025 14:26:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 426CBC4CEE3;
 Mon,  7 Jul 2025 14:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751898365;
 bh=OBRjOpjOD3WykltUSQMBZISNgt5fgN/t8xYyHJ16hjA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=FtrrWXCwihQc4HhxP+7uIfFuqgZkW/OrkvocN04uMru1qFolF8COfcG8n9z/7HEu4
 k1YNKAH+obsa5iDJU39RlkYvJYkhg08KPQC6u3/O3CM1+P+UPNIBKaqPCDtZXJNgIo
 Ih+9l7xLkH3dXl2QchCsdE9z9HR8PSENbtwZ4jBs1VUdf7VJ2tWbMAEvUIPuJHzFNn
 T9K7x61OmwJW8pNrYTbukg9jEh3faZkkvUdI9RKAjwwMxESEBMZGmg+mU0b/5ScHOL
 0wtjO2m1kt7vOnsb78t0dP0InmhzIcfsu3o3/iWZC+6yCTzBDrn0I4n13PNyZMdT3F
 P9Kxc/F81DxWg==
Message-ID: <b78fbad7-b7e3-454d-be67-03777ba3daa4@kernel.org>
Date: Mon, 7 Jul 2025 16:26:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] drm/nouveau: Remove waitque for sched teardown
To: phasta@kernel.org
Cc: Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20250707134221.34291-2-phasta@kernel.org>
 <20250707134221.34291-9-phasta@kernel.org>
 <89b0a4bf-2a66-4610-93d2-8f2f096592a3@kernel.org>
 <7d5137a8c71c525c4e806f8ff06102d2e3a47ccc.camel@mailbox.org>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <7d5137a8c71c525c4e806f8ff06102d2e3a47ccc.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 7/7/25 3:54 PM, Philipp Stanner wrote:
> On Mon, 2025-07-07 at 15:47 +0200, Danilo Krummrich wrote:
>> On 7/7/25 3:42 PM, Philipp Stanner wrote:
>>> struct nouveau_sched contains a waitque needed to prevent
>>> drm_sched_fini() from being called while there are still jobs
>>> pending.
>>> Doing so so far would have caused memory leaks.
>>>
>>> With the new memleak-free mode of operation switched on in
>>> drm_sched_fini() by providing the callback
>>> nouveau_sched_fence_context_kill() the waitque is not necessary
>>> anymore.
>>>
>>> Remove the waitque.
>>>
>>> Signed-off-by: Philipp Stanner <phasta@kernel.org>
>>
>> Doesn't this break the driver until fixed up by the subsequent patch?
>>
> 
> Did you mean to answer to patch 6?
> 
> Patch 6 implements the cancel_job() callback for nouveau, which makes
> sure the (still existing) waitque will never block. The, now redundant,
> waitque then gets removed in patch 7.

Yup, I mixed up the order on my end.

Acked-by: Danilo Krummrich <dakr@kernel.org>
