Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C49DE67CAE0
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 13:24:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C578110E2BF;
	Thu, 26 Jan 2023 12:24:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A99E10E365
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 12:24:36 +0000 (UTC)
Received: from [192.168.2.197] (109-252-117-89.nat.spd-mgts.ru
 [109.252.117.89])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id EC0626602E6E;
 Thu, 26 Jan 2023 12:24:32 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1674735874;
 bh=vcL/t3khQ9UtoF+bJWODdAsRg8AvYVc6c48gFUnC2yo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=DuYwMnk3kOEkj1W+FCWlYGj6DBN5pCQtsO4gypbXtuU067eSVXBRnVXjiqPlCS2aC
 G3crMGFDmBcdLdXt3cDOvyh0S8XNpN23Z/nBtPCrEC8f3DguxaxuulyQQIFqV1n11e
 Up3kuIfNwSWvSygWLH/JBkwP+JFbODv5T8fjf9oFBc2cOHwqsUW8fDCl6zOP4hXY3m
 1oByoZw4CqfygTdjlkRbv8Y6HAYHMcttRQTn2vcZdfYjLlqYBElSK5C0wD6/vZ/JKy
 baQL1XZNYUKRsCdTVR2hOC87AptcwNInoVpNTHPyEzwk8LSG72AXVItyrBSqZH/I7n
 6CSuTAPe9FrnQ==
Message-ID: <75698ab8-2e0b-8673-2f7d-83ffa37f447b@collabora.com>
Date: Thu, 26 Jan 2023 15:24:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v10 06/11] drm/shmem-helper: Don't use vmap_use_count for
 dma-bufs
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20230108210445.3948344-1-dmitry.osipenko@collabora.com>
 <20230108210445.3948344-7-dmitry.osipenko@collabora.com>
 <20230126121705.wsm62yxco7cubwyf@sirius.home.kraxel.org>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20230126121705.wsm62yxco7cubwyf@sirius.home.kraxel.org>
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
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 dri-devel@lists.freedesktop.org, Gurchetan Singh <gurchetansingh@chromium.org>,
 kernel@collabora.com, Sumit Semwal <sumit.semwal@linaro.org>,
 Steven Price <steven.price@arm.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 virtualization@lists.linux-foundation.org, Sean Paul <sean@poorly.run>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-kernel@vger.kernel.org,
 Qiang Yu <yuq825@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/26/23 15:17, Gerd Hoffmann wrote:
> On Mon, Jan 09, 2023 at 12:04:40AM +0300, Dmitry Osipenko wrote:
>>  its own refcounting of vmaps, use it instead of drm-shmem
>> counting. This change prepares drm-shmem for addition of memory shrinker
>> support where drm-shmem will use a single dma-buf reservation lock for
>> all operations performed over dma-bufs.
> 
> Likewise truncated?

Should be the email problem on yours side, please see [1][2] where the
messages are okay.

[1]
https://lore.kernel.org/dri-devel/20230108210445.3948344-7-dmitry.osipenko@collabora.com/
[2] https://patchwork.freedesktop.org/patch/517401/

-- 
Best regards,
Dmitry

