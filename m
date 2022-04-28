Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 833C7513BBC
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 20:41:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 830F610E37E;
	Thu, 28 Apr 2022 18:41:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58A6F10E37E
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 18:41:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id 1DB581F45BA9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651171290;
 bh=HSr1KCZ5LnslRjGdE29dDFgwDJWDw5RpI+XCM1ThDIE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=bfLldcJ+mxw6WfTtItLTOjLcjf0DYyzsn4duwT4V65y2wh/auNP5VbaKcF1uLtb0B
 iB/cky4I5BR35dO0sBsMH/IMcS2hQcrcukVUN2Se+PPS1Acf+cYw0aWDojUZPfuPr6
 lry0gDJpMS6Znk7q4EgkKajPlWGFIbW3IQSsLO06kQYS5k5BW2+iwu3TyC1kW+eE2T
 ltrTAD36FgqZAog2GI8KGWD5k8oX5TmtV/lGfBCUjyzIl3wf69EgFqlvTSr7MWV/Rl
 O+vG2kloLrPb0rbCPCkO+207H8MSE6C8OYDbpOG/crx11Q8yVrBAc1ev3YHC1FTzVZ
 Ke2HvHpsR9S0A==
Message-ID: <9647245d-b0b5-12d1-fef2-7a5f759f908b@collabora.com>
Date: Thu, 28 Apr 2022 21:41:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v5 01/17] drm/panfrost: Put mapping instead of shmem obj
 on panfrost_mmu_map_fault_addr() error
Content-Language: en-US
To: Steven Price <steven.price@arm.com>, David Airlie <airlied@linux.ie>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Clark <robdclark@gmail.com>, Emil Velikov <emil.l.velikov@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, Qiang Yu <yuq825@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20220424190424.540501-1-dmitry.osipenko@collabora.com>
 <20220424190424.540501-2-dmitry.osipenko@collabora.com>
 <37dae9fa-dadf-4b80-fbea-689472fd7dce@arm.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <37dae9fa-dadf-4b80-fbea-689472fd7dce@arm.com>
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
Cc: Dmitry Osipenko <digetx@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

28.04.2022 16:19, Steven Price пишет:
> On 24/04/2022 20:04, Dmitry Osipenko wrote:
>> When panfrost_mmu_map_fault_addr() fails, the BO's mapping should be
>> unreferenced and not the shmem object that backs that mapping.
>>
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> 
> Fixes: bdefca2d8dc0 ("drm/panfrost: Add the panfrost_gem_mapping concept")
> 
> Reviewed-by: Steven Price <steven.price@arm.com>

Thank you for the fixes tag. It appeared to me that this problem existed
since the first addition of the srinker when I was looking up the
offending commit, my bad :)

