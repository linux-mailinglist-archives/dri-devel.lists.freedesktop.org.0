Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 985EA6A3FDE
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 12:01:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57F2C10E2D6;
	Mon, 27 Feb 2023 11:01:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8193410E1C3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 11:01:13 +0000 (UTC)
Received: from [192.168.2.206] (109-252-117-89.nat.spd-mgts.ru
 [109.252.117.89])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 8239066021EB;
 Mon, 27 Feb 2023 11:00:58 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1677495671;
 bh=Uh8//OK+3hdNaqjSqu/2C6uxnKClaRwrTVDY9fef0ho=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=hctghTghqru1ufBwHyKfPoGQ6MxZQUBi+4x2k85yWbUCCSVHsiU43UFihpoYvVJe9
 VHAEXnBGIeYnKasmvdJS846U3ZcAR9awuPJoLraH386O1zezaFU3kEbMOo7SswOT/M
 NYefK92/y8Geb4qWB/UTr2DF3IiO2djjCz4LXnHO2Yc6ysQqbhNS15RCgwtnxH5M3z
 4k3/yfW8h0Y0ElY1aYfF2BRSACbuoP61ZS6Cod/EnpFHbTGA3NxV2ygPIls4SjthyU
 /1IgmSNSnyfGWJaRRz/HF1G5m/0fEm+wZcTKDhv+BkY/7zve4y0prElm08Ygtl5Rua
 2zNsHMup0OwqA==
Message-ID: <95cf8f0e-0ec1-5071-834e-9eb97a0da233@collabora.com>
Date: Mon, 27 Feb 2023 14:00:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v10 00/11] Add generic memory shrinker to VirtIO-GPU and
 Panfrost DRM drivers
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20230108210445.3948344-1-dmitry.osipenko@collabora.com>
 <ab018466-1659-d54d-4144-5e0879815de6@suse.de>
 <e9364e10-1ad8-aaaf-3d78-a29b0c1516ef@collabora.com>
 <6c16f303-81df-7ebe-85e9-51bb40a8b301@collabora.com>
 <87a60z2y2t.fsf@intel.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <87a60z2y2t.fsf@intel.com>
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
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Gerd Hoffmann <kraxel@redhat.com>, kernel@collabora.com,
 Sumit Semwal <sumit.semwal@linaro.org>, Steven Price <steven.price@arm.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org, Qiang Yu <yuq825@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/27/23 13:37, Jani Nikula wrote:
> On Mon, 27 Feb 2023, Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:
>> On 2/17/23 16:41, Dmitry Osipenko wrote:
>>> On 2/17/23 16:28, Thomas Zimmermann wrote:
>>>> Hi,
>>>>
>>>> I looked through the series. Most of the patches should have an r-b or
>>>> a-b at this point. I can't say much about patch 2 and had questions
>>>> about others.
>>>>
>>>> Maybe you can already land patches 2, and 4 to 6? They look independent
>>>> from the shrinker changes. You could also attempt to land the locking
>>>> changes in patch 7. They need to get testing. I'll send you an a-b for
>>>> the patch.
>>>
>>> Thank you, I'll apply the acked patches and then make v11 with the
>>> remaining patches updated.
>>>
>>> Not sure if it will be possible to split patch 8, but I'll think on it
>>> for v11.
>>>
>>
>> Applied patches 1-2 to misc-fixes and patches 3-7 to misc-next, with the
>> review comments addressed.
> 
> Please resolve the drm-tip rebuild conflict [1].
> 
> BR,
> Jani.
> 
> 
> [1] https://paste.debian.net/1272275/

Don't see that conflict locally, perhaps somebody already fixed it?

-- 
Best regards,
Dmitry

