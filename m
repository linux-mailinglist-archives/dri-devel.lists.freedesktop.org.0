Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDEEC06B9C
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 16:36:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0F2B10EAAC;
	Fri, 24 Oct 2025 14:36:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oQPRiweH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A73ED10EAAC
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 14:36:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 461BC4492E;
 Fri, 24 Oct 2025 14:36:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 824E8C4CEF1;
 Fri, 24 Oct 2025 14:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761316600;
 bh=dAwvJ61kT4ula3oy4h+pw30yXKe3R4m8XcTn2QIYR2c=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=oQPRiweHpKRyJbHzsmtAwsmNfIaHfkRpKJtEXZz+CXgwOLVOtSqEyPTBV/3VoUNIe
 FsiKBDyhc9M3WcN6ee4V3Mpolo0Svns4Uh5n+ExMZesdvcYiFpcK3MrtQYTHMGzJXw
 ZbK7LgT96X6duFHadhaDh2UPlhNML0H3xIaOZDuSLAPPVRmfxF6yxeLzoQ95T5fN3n
 l4pvZO5qFfMXgiI66yUg/A7vJzIvMvaWy7i3RijjpVBvf4OP/ukanhCHqyzQEe9mxe
 HAlDXOEgKB4thbP5M/wSGYBLbqD5z8NEbXhml/8GbRWujB6I3I1MUYsS0vQzElZFcg
 mmu3zNuRkYyBQ==
Message-ID: <02b7cdce-95fe-475f-a346-b41fd5615695@kernel.org>
Date: Fri, 24 Oct 2025 16:36:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-fence: Correct return of dma_fence_driver_name()
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: phasta@kernel.org, Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251024075019.162351-2-phasta@kernel.org>
 <11b7a8a5-170f-4815-a8ac-5dba2d8e67a1@igalia.com>
 <5de88e79575e06c053f2d61f7bb58bf9cf5b556e.camel@mailbox.org>
 <1d0bbdcf-f4d6-49c0-bbdf-364c2af80868@igalia.com>
 <89812f66-25a6-4f9e-aa4f-74adbf116db8@kernel.org>
 <5640fbf1-7b8d-4537-9f1a-b401a7a4934b@igalia.com>
 <8cba66d2-9608-4a5c-a2af-6cc91f46a49f@kernel.org>
 <cefe8f07-68a3-4c93-ae46-ebb01ff6fa2c@igalia.com>
 <b21ba8b4-a31f-44e5-a2da-ba585a93d3a6@kernel.org>
 <66f066b0-a8bb-40b2-bdd8-7cbcf114cde1@igalia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <66f066b0-a8bb-40b2-bdd8-7cbcf114cde1@igalia.com>
Content-Type: text/plain; charset=UTF-8
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

On 10/24/25 4:28 PM, Tvrtko Ursulin wrote:
> On 24/10/2025 15:17, Danilo Krummrich wrote:
>> On 10/24/25 3:37 PM, Tvrtko Ursulin wrote:
>>> How about "unknown-driver", would that satisfy you?
>>
>> Honestly, the most accurate thing to say would be "fence-signaled", because
>> that's the actual condition which causes the change.
> Hm, ->get_driver_name() returning "fence-signaled" is not great, and debugfs
> output in the form of "kernel fence: fence-signaled timeline-signaled seq 1234
> signaled" feels a bit redundant. :shrug:

Indeed, what about "retired-driver"? Still implying that it's not just unknown,
but that some process has finished. But without the ambiguity of "detached-driver".
