Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61797576EF3
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jul 2022 16:39:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 450F210FB17;
	Sat, 16 Jul 2022 14:36:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5695D10E06A
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jul 2022 15:20:32 +0000 (UTC)
Received: from [192.168.2.145] (109-252-119-232.nat.spd-mgts.ru
 [109.252.119.232])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id A8F966601A65;
 Fri, 15 Jul 2022 13:52:34 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1657889555;
 bh=xBrCQQ1aUsGQz6qdhuocrnTP5+tcL+Nz6m7uUCjtSGM=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=clV0z9vutT6bRhR5BtXS0O7WzzAm7FQS3nD57RwBVfQGuLU0xbs9cfvW+RI0jb6d7
 noQkILVtQXufoE4j0mb33JOo/Hpi6i6Vj4G/MxJQQX0niLpsHNB0s3ZDc3eBfiSw6a
 /VC94LtAi8YEiRRvlSPUGauPutq4Xg9RbJ02nDBX4d3tRms5m1+UQUpklG5jkkeVud
 rvaRAfCg+DiynKSfZCaMlVhx5bc1HdjWffpPCVERvj9GeALlpQ7btCvBKLPge4l38t
 c8iWRFwlTDCMlExgiUM4jj9ec7QG4xGIoNq68RmQemrfKYODjNvvI53F6/tQwLDYKN
 ZIUQiue8PU8/w==
Message-ID: <65150a1b-ff28-8815-3b9e-736d224a9f10@collabora.com>
Date: Fri, 15 Jul 2022 15:52:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/2] drm/ttm: fix locking in vmap/vunmap TTM GEM helpers
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 tzimmermann@suse.de, dri-devel@lists.freedesktop.org
References: <20220715111533.467012-1-christian.koenig@amd.com>
 <fce378f2-50be-ac02-97b1-767e310f28a2@collabora.com>
 <8089571c-4536-c2fa-2bac-9958d30c8919@amd.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <8089571c-4536-c2fa-2bac-9958d30c8919@amd.com>
Content-Type: text/plain; charset=UTF-8
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

On 7/15/22 14:33, Christian König wrote:
> Am 15.07.22 um 13:31 schrieb Dmitry Osipenko:
>> On 7/15/22 14:15, Christian König wrote:
>>> I've stumbled over this while reviewing patches for DMA-buf and it looks
>>> like we completely messed the locking up here.
>>>
>>> In general most TTM function should only be called while holding the
>>> appropriate BO resv lock. Without this we could break the internal
>>> buffer object state here.
>> Could you please clarify which part of the TTM state is affected?
> 
> The ttm_bo_vmap() function calls ttm_mem_io_reserve() with bo->resource
> as parameter.
> 
> Since bo->resource is protected by the lock we must make sure that we
> are holding the lock while doing this.

Thanks, I see now that the resource members need locking.

-- 
Best regards,
Dmitry
