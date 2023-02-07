Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6161268E47A
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 00:34:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94DA810E643;
	Tue,  7 Feb 2023 23:34:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 304F510E643
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Feb 2023 23:34:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: lina@asahilina.net)
 by mail.marcansoft.com (Postfix) with ESMTPSA id B96E5420CF;
 Tue,  7 Feb 2023 23:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
 s=default; t=1675812876;
 bh=Xy3vMOIfFYc5nq14WL4mTN1YL0ebGR5OtV9XaHb9X74=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=P85+mHCFgZZkUVYvaKaulsowpsBFnJkG1b3TdYBVW+NZEGeZp4ul/f+mv5fcHJA/4
 4ejJ5qlgmK3pMS0k5K22tG6Yi6knLeqyET3LrsFgPobBZO84SeyHYOykHDgpSwwVN5
 5q2PWjFrHP194nqXTABYIBTQGxfu1JK7dOwCOXpCAKBz0Jd2moei6UyBkuG3F8Dps3
 ornKGGCtakFbut0SKW6dwSlhb3r90auZsVn9C4nBp8hu1Xaa88a2Srud16lQm8uZYF
 5Y3nW/c+QWkqBDI7yoHwukXI0z+NDeuXErefMrfa35h5kTOGc0Avivq7T2koEAKEr+
 L3BpzuNOCISbQ==
Message-ID: <149ac5cb-e17f-0c37-b65d-5cfa0a4d8163@asahilina.net>
Date: Wed, 8 Feb 2023 08:34:31 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] drm/shmem-helper: Fix locking for
 drm_gem_shmem_get_pages_sgt()
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230205125124.2260-1-lina@asahilina.net>
 <77be28c1-52ff-87c8-b7f7-f99273d48267@suse.de>
From: Asahi Lina <lina@asahilina.net>
In-Reply-To: <77be28c1-52ff-87c8-b7f7-f99273d48267@suse.de>
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
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 asahi@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sorry, I accidentally sent this reply offlist! Resending, my apologies...

On 07/02/2023 20.29, Thomas Zimmermann wrote:
> Hi
> 
> Am 05.02.23 um 13:51 schrieb Asahi Lina:
>> Other functions touching shmem->sgt take the pages lock, so do that here
> 
> Really? I was just locking at the Lima driver and it apparently access 
> sgt without locking in [1]. Not that I disagree with the patch in general.

It looks like that lima code is reimplementing a lot of helper
functionality. I imagine it was written before the helpers...? I think
most of that function could be replaced with a call to
drm_gem_shmem_get_pages_sgt().

I don't know exactly how the lima driver works, but if there is a
possibility of multiple calls to lima_heap_alloc() on the same BO
without a higher-level mutex protecting it, I would say that code is racy.

For the Rust abstraction (and really for a well-designed API in general)
you want a coherent story on locking, so I think it makes sense to take
the pages lock to manipulate the sgt, since
drm_gem_shmem_get_pages_sgt() was already taking the pages lock for
inner things anyway. Otherwise it's impossible to make safe without
adding another discrete layer of locking around everything (I can't just
take the pages lock in the wrapper since drm_gem_shmem_get_pages_sgt()
would try to recursively lock it).

> Best regards
> Thomas
> 
> [1] 
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/lima/lima_gem.c#L21

~~ Lina
