Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A06526A3A14
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 05:19:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8146710E0CE;
	Mon, 27 Feb 2023 04:19:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A03610E0CE
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 04:19:49 +0000 (UTC)
Received: from [192.168.2.206] (109-252-117-89.nat.spd-mgts.ru
 [109.252.117.89])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 178D36602E18;
 Mon, 27 Feb 2023 04:19:46 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1677471587;
 bh=neJHlzU7HoVQIEsPasqkW1HUTHpgAXMlKs8lTrotf54=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=mSbCBFeT2V5iyIj9z5lklaoIexXd+XiqkJmUAy3zGrKiBSl55nfJVaNQ9lp2chHZH
 0CJ5aKr+o7WUEW+Gn1O1C0qkEtqJOVyq0mXGCRR7IjlRxzDt8RLLMBmJwDGvU5i6RH
 Q3xf8gV8cgUnXi19RWWIDuT+jLJHc87d6E6L2YIxwh+q6mC1FDGHFOKEFy0xC3Ga4V
 6iZR4N1VSmFVLVKAZHOIWpolaOo/49yArPJVejrq5IeCPDQHchCj0eo1sSeuOQI5iO
 cVdXHcwE/27njzWEPq794fKTysNcn+RvkvDpMWJra0IIg8J0xblp9ClAD1OII6BRtI
 VsNykWm8mmVqQ==
Message-ID: <6c16f303-81df-7ebe-85e9-51bb40a8b301@collabora.com>
Date: Mon, 27 Feb 2023 07:19:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v10 00/11] Add generic memory shrinker to VirtIO-GPU and
 Panfrost DRM drivers
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
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
 <e9364e10-1ad8-aaaf-3d78-a29b0c1516ef@collabora.com>
In-Reply-To: <e9364e10-1ad8-aaaf-3d78-a29b0c1516ef@collabora.com>
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

On 2/17/23 16:41, Dmitry Osipenko wrote:
> On 2/17/23 16:28, Thomas Zimmermann wrote:
>> Hi,
>>
>> I looked through the series. Most of the patches should have an r-b or
>> a-b at this point. I can't say much about patch 2 and had questions
>> about others.
>>
>> Maybe you can already land patches 2, and 4 to 6? They look independent
>> from the shrinker changes. You could also attempt to land the locking
>> changes in patch 7. They need to get testing. I'll send you an a-b for
>> the patch.
> 
> Thank you, I'll apply the acked patches and then make v11 with the
> remaining patches updated.
> 
> Not sure if it will be possible to split patch 8, but I'll think on it
> for v11.
> 

Applied patches 1-2 to misc-fixes and patches 3-7 to misc-next, with the
review comments addressed.

-- 
Best regards,
Dmitry

