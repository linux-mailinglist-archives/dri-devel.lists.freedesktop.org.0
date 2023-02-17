Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C587269ACA6
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 14:41:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D11CB10EFD7;
	Fri, 17 Feb 2023 13:41:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EF6810EFD7
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 13:41:35 +0000 (UTC)
Received: from [192.168.2.109] (109-252-117-89.nat.spd-mgts.ru
 [109.252.117.89])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 54CAB6601F13;
 Fri, 17 Feb 2023 13:41:32 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1676641294;
 bh=QEsanptIUs+DNGjJkoo74QmfA4sYNiYpQ+Z8nBl9cOE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=H0IL9tyyLG2AmVtJRlEEDgHQPlSoK4swz3W4uwDWTIi6WegxJb80lxqjgi4uy0TiF
 vQXUXXx4xbgindGq++pO0QA0H8HUUinweAQie7GhpJgM1pqR9wozeYUVpcwNh7LIZg
 rIFs8S72UWL/ATqbi6v1UZ3gxVBWYQIfOU5ByF/zf+pCrCDTKY5YnquvnF7UGzhTOR
 s9Xi3ceH+CQJj2bBgI/aNLwvC752sR4lP6MMct3nIORdZco30bzqeUb56NaU6fCofn
 CmCJQKiYj8T5qK4NJAFuIsJLMaoX02ZGPJePu+59RiJXlPBOBMLGkF+u6k6bRSROqu
 D0gM/8SgCKXbA==
Message-ID: <e9364e10-1ad8-aaaf-3d78-a29b0c1516ef@collabora.com>
Date: Fri, 17 Feb 2023 16:41:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v10 00/11] Add generic memory shrinker to VirtIO-GPU and
 Panfrost DRM drivers
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Qiang Yu <yuq825@gmail.com>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Herring <robh@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230108210445.3948344-1-dmitry.osipenko@collabora.com>
 <ab018466-1659-d54d-4144-5e0879815de6@suse.de>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <ab018466-1659-d54d-4144-5e0879815de6@suse.de>
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
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/17/23 16:28, Thomas Zimmermann wrote:
> Hi,
> 
> I looked through the series. Most of the patches should have an r-b or
> a-b at this point. I can't say much about patch 2 and had questions
> about others.
> 
> Maybe you can already land patches 2, and 4 to 6? They look independent
> from the shrinker changes. You could also attempt to land the locking
> changes in patch 7. They need to get testing. I'll send you an a-b for
> the patch.

Thank you, I'll apply the acked patches and then make v11 with the
remaining patches updated.

Not sure if it will be possible to split patch 8, but I'll think on it
for v11.

-- 
Best regards,
Dmitry

