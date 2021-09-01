Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFB33FD77E
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 12:18:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E142B6E169;
	Wed,  1 Sep 2021 10:18:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa3.bahnhof.se (pio-pvt-msa3.bahnhof.se [79.136.2.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF4BB6E171;
 Wed,  1 Sep 2021 10:18:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id 238573F3BA;
 Wed,  1 Sep 2021 12:18:29 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.679
X-Spam-Level: 
X-Spam-Status: No, score=-2.679 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.58,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Authentication-Results: pio-pvt-msa3.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dkRNpVQicIcb; Wed,  1 Sep 2021 12:18:28 +0200 (CEST)
Received: by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id 7FAC83F3AD;
 Wed,  1 Sep 2021 12:18:26 +0200 (CEST)
Received: from [192.168.0.209] (unknown [192.198.151.52])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 7FFA53600BA;
 Wed,  1 Sep 2021 12:18:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1630491506; bh=ReO8qzvBhoEvdlzC1dSe6hXDRvAMR8muGSWBYNe+0w8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=afyZg0pDI8al5a9C/AaN5880LYKyML06ZgD+S6wxs0wGnqxc235cM+Ms3BMBw/MV6
 XE8mIjVYHaQR5WSvrIiQd79g4J5G33RrLZxwqCncw2XArSq1aW1rpzJZHRDb9Nc3IY
 fyVcIvql6ylEtxluqObDuVhdJc7EVVntcx4qvOQE=
Subject: Re: [Intel-gfx] [PATCH 7/8] drm/i915/gem: Correct the locking and pin
 pattern for dma-buf (v8)
To: Jason Ekstrand <jason@jlekstrand.net>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20210723172142.3273510-1-jason@jlekstrand.net>
 <20210723172142.3273510-8-jason@jlekstrand.net>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <f9f7c266-978a-8b93-ab6d-5544f08c7b99@shipmail.org>
Date: Wed, 1 Sep 2021 12:18:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210723172142.3273510-8-jason@jlekstrand.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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

Hi, Jason,

A quick question below:

On 7/23/21 7:21 PM, Jason Ekstrand wrote:
> From: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>
> If our exported dma-bufs are imported by another instance of our driver,
> that instance will typically have the imported dma-bufs locked during
> dma_buf_map_attachment(). But the exporter also locks the same reservation
> object in the map_dma_buf() callback, which leads to recursive locking.
>
> So taking the lock inside _pin_pages_unlocked() is incorrect.
>
> Additionally, the current pinning code path is contrary to the defined
> way that pinning should occur.
>
> Remove the explicit pin/unpin from the map/umap functions and move them
> to the attach/detach allowing correct locking to occur, and to match
> the static dma-buf drm_prime pattern.
>
> Add a live selftest to exercise both dynamic and non-dynamic
> exports.
>
> v2:
> - Extend the selftest with a fake dynamic importer.
> - Provide real pin and unpin callbacks to not abuse the interface.
> v3: (ruhl)
> - Remove the dynamic export support and move the pinning into the
>    attach/detach path.
> v4: (ruhl)
> - Put pages does not need to assert on the dma-resv
> v5: (jason)
> - Lock around dma_buf_unmap_attachment() when emulating a dynamic
>    importer in the subtests.
> - Use pin_pages_unlocked
> v6: (jason)
> - Use dma_buf_attach instead of dma_buf_attach_dynamic in the selftests

Why did we drop the dynamic importer from the selftests? Shouldn't we 
try to ensure compatibility with dynamic importers?

/Thomas


