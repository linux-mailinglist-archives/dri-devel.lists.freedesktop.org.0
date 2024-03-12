Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 146F387949D
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 13:57:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5753710E3A1;
	Tue, 12 Mar 2024 12:57:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="wkIoiIZE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-176.mta0.migadu.com (out-176.mta0.migadu.com
 [91.218.175.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A932310E3A1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 12:57:22 +0000 (UTC)
Message-ID: <212a3a40-e1d1-4e2f-97f1-7039f92121f5@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1710248237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X1Qt+4o6QBsNPn0qIdPDH1sADqSEljNalxMJD1UqB/I=;
 b=wkIoiIZEEW/dF4dUk2t6dCgGrzPbEoOWG45L7EjEvTnWLN0u/9JNzi+HbGYq7FO5YpGbgN
 a1S3IvWCgqe460UFEuEuuHFIu7XV0xw22gpUqIKCtUywniuHboI/Fv5/mponYD7EiefyMw
 rH5gxSTqkYt0vJjWz5XDtjua2o0zl2w=
Date: Tue, 12 Mar 2024 20:56:40 +0800
MIME-Version: 1.0
Subject: Re: [v2] drm/mgag200: Add a workaround for low-latency
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, tzimmermann@suse.de, daniel@ffwll.ch
References: <20240208095125.377908-1-jfalempe@redhat.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20240208095125.377908-1-jfalempe@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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

Hi,


Interesting patch! I know this patch already merged.
While study this patch, I have a few questions.


On 2024/2/8 17:51, Jocelyn Falempe wrote:
> We found a regression in v5.10 on real-time server, using the
> rt-kernel and the mgag200 driver. It's some really specialized
> workload, with <10us latency expectation on isolated core.
> After the v5.10, the real time tasks missed their <10us latency
> when something prints on the screen (fbcon or printk)
>
> The regression has been bisected to 2 commits:
> commit 0b34d58b6c32 ("drm/mgag200: Enable caching for SHMEM pages")
> commit 4862ffaec523 ("drm/mgag200: Move vmap out of commit tail")
>
> The first one changed the system memory framebuffer from Write-Combine
> to the default caching.
> Before the second commit, the mgag200 driver used to unmap the
> framebuffer after each frame, which implicitly does a cache flush.


I don't know why it need to do a cache flush, where is the code.
I'm asking because I want to study this technique.

Generally speaking, X86-64 platform's default page caching is cached.
And I think the cached mapping is fastest for software rendering. And
the platform guaranteed the coherency for us, right?

Because X86-64 platform(or CPU)'s write buffer is implemented on the
top of cache? I'm means that for ARM(or other) CPU, when using Write-combine
the data will has nothing to do with cache.

> Both regressions are fixed by this commit, which restore WC mapping
> for the framebuffer in system memory, and add a cache flush.

So switch back to WC probably will decrease overall performance, I think.
And the cache flush operation should not have a impact. Except X86-64's
Write-Combine is different other platform's Write-Combine?


> This is only needed on x86_64, for low-latency workload,
> so the new kconfig DRM_MGAG200_IOBURST_WORKAROUND depends on
> PREEMPT_RT and X86.
>
> For more context, the whole thread can be found here [1]
>
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> Link: https://lore.kernel.org/dri-devel/20231019135655.313759-1-jfalempe@redhat.com/ # 1
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
