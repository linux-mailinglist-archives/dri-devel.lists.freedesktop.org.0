Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7846286C3
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 18:13:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 288FA10E302;
	Mon, 14 Nov 2022 17:13:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E15B10E302
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 17:13:39 +0000 (UTC)
Received: from [192.168.2.143] (unknown [109.252.117.140])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 4C17B6602959;
 Mon, 14 Nov 2022 17:13:35 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1668446017;
 bh=AQDL+8PHAV4fn/eF4t2W+Glw/f8RZnTsmn4wnj94Llc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=n4B8UOb/VTKL30eskN4CbJChJas5q1MM+NodfPX1GNVYISptHBtLOCXqWotOILXt1
 fZMnjK77FSvaoZeGpnaW/e7WwrwRZnHmpRgw29l2E4W6wVb5Lkg3qA/GjtZHixfyKs
 InRdhXkMXiRwK5LHfeZ7aJzoxvWlxSTPNUxHxSwa3Jrt7Iu1r8ZeA3GA0BJbvtE8Ds
 NkjNbJM+lbJuLYiPfh+D999CpEA2RHFhNmkY5zALrDcoqTI0stZONex/RzESy9UW2A
 lFaY6QsJ/MxL6tP48HWrjHKhn+FdB9putWiepb0EWZ5gTxD71+hulk0y5F73Ze+JcH
 8WjeteG/5gbfQ==
Message-ID: <9d9e745d-a417-d07f-e413-095dd2f610ac@collabora.com>
Date: Mon, 14 Nov 2022 20:13:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v8 7/7] drm/panfrost: Switch to generic memory shrinker
Content-Language: en-US
To: Steven Price <steven.price@arm.com>, David Airlie <airlied@linux.ie>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Clark <robdclark@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Qiang Yu <yuq825@gmail.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Herring <robh@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20221105232719.302619-1-dmitry.osipenko@collabora.com>
 <20221105232719.302619-8-dmitry.osipenko@collabora.com>
 <41c4d78c-cb47-d06f-f6af-e827dd56b857@arm.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <41c4d78c-cb47-d06f-f6af-e827dd56b857@arm.com>
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
Cc: Dmitry Osipenko <digetx@gmail.com>, kernel@collabora.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Steve,

On 11/14/22 19:54, Steven Price wrote:
> On 05/11/2022 23:27, Dmitry Osipenko wrote:
>> Replace Panfrost's custom memory shrinker with a common drm-shmem
>> memory shrinker.
>>
>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> 
> Sadly this triggers GPU faults under memory pressure - it looks
> suspiciously like mappings are being freed while the jobs are still running.
> 
> I'm not sure I understand how the generic shrinker replicates the
> "gpu_usecount" atomic that Panfrost currently has, and I'm wondering if
> that's the cause?
> 
> Also just reverting this commit (so just patches 1-6) I can't actually
> get Panfrost to purge any memory. So I don't think the changes (most
> likely in patch 4) are quite right either.
> 
> At the moment I don't have the time to investigate in detail. But if
> you've any ideas for something specific I should look at I can run more
> testing.

Thank you for the testing! It just occurred to me that the shrinker
callback lost the dma_resv_test_signaled() in comparison to the previous
versions of this patchset. It appeared to me that the drm_gem_lru now
checks whether reservation is busy, but it doesn't.

I saw a similar page faults once in a while when was testing the
Panfrost driver, but then couldn't reproduce the faults after applying
the IOMMU unmap range fix that Robin made recently.

I'll re-add the dma_resv_test_signaled() in v9, it was a luck that I
didn't hit it much during my testing.

-- 
Best regards,
Dmitry

