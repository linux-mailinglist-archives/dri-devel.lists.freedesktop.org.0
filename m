Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E65ABBAF1
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 12:20:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C24AA89160;
	Mon, 19 May 2025 10:20:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="K9EpMG/9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AEE289160
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 10:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1747650037;
 bh=EotJMFb+Ck/FoiIg9Z1U/E97Kq5drwroY2IQOgCFFhA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=K9EpMG/9tqy3MXCDVDeCNNzNQ6dvhdk6Y8/NxZZbVFQZ1/FbrBE8fOSqJJUukG8AX
 gkSi6ZzbMNWIb/89BIUZAbcSHjk1vjW7F5HDYJqjVGh5O7aLKcNwKaV/27y73lg6I5
 B9iWdScac8CISCAgzKQs39s+qMRkGrb2CZWYYaDc0HSrdOJIJfKYB1OTJ1cAwyU4FF
 qRsQbW5o9FtsAgHVNcSJTLjV0gGE6Cerv8KU3Eg4r1iYzU1yLFmUUlxKMmRzIGZ1z8
 tQUKTxI2eUVCbt78vhiJgveEsBcT6bToIXJiNtYBIebfs2a6zGPLMF3lwzg8b6q+KP
 5fEn+0flxujjg==
Received: from [192.168.1.90] (unknown [82.76.59.134])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id ECDD817E0FD4;
 Mon, 19 May 2025 12:20:36 +0200 (CEST)
Message-ID: <050e7504-67c9-4384-826a-c655cef51b09@collabora.com>
Date: Mon, 19 May 2025 13:20:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/23] drm/tests: helpers: Add a (re)try helper variant
 to enable CRTC connector
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250425-hdmi-conn-yuv-v4-0-5e55e2aaa3fa@collabora.com>
 <20250425-hdmi-conn-yuv-v4-12-5e55e2aaa3fa@collabora.com>
 <n2ojf77winz6b4kchmt6bnppomb6cpg4okrwnh6iibsemou4as@t5lhg3m24bjm>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <n2ojf77winz6b4kchmt6bnppomb6cpg4okrwnh6iibsemou4as@t5lhg3m24bjm>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On 5/16/25 4:15 PM, Maxime Ripard wrote:
> Hi,
> 
> On Fri, Apr 25, 2025 at 01:27:03PM +0300, Cristian Ciocaltea wrote:
>> Provide a wrapper over drm_kunit_helper_enable_crtc_connector() to
>> automatically handle EDEADLK.
>>
>> This is going to help improve the error handling in a bunch of test
>> cases without open coding the restart of the atomic sequence.
>>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>>  drivers/gpu/drm/tests/drm_kunit_helpers.c | 39 +++++++++++++++++++++++++++++++
>>  include/drm/drm_kunit_helpers.h           |  7 ++++++
>>  2 files changed, 46 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/tests/drm_kunit_helpers.c
>> index 5f7257840d8ef0aeabe5f00802f5037ed652ae66..4e1174c50b1f2b6358eb740cd73c6d86e53d0df9 100644
>> --- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
>> +++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
>> @@ -332,6 +332,45 @@ int drm_kunit_helper_enable_crtc_connector(struct kunit *test,
>>  }
>>  EXPORT_SYMBOL_GPL(drm_kunit_helper_enable_crtc_connector);
>>  
>> +/**
>> + * drm_kunit_helper_try_enable_crtc_connector - (Re)tries to enable a CRTC -> Connector output
>> + * @test: The test context object
>> + * @drm: The device to alloc the plane for
>> + * @crtc: The CRTC to enable
>> + * @connector: The Connector to enable
>> + * @mode: The display mode to configure the CRTC with
>> + * @ctx: Locking context
>> + *
>> + * This function is a wrapper over @drm_kunit_helper_enable_crtc_connector
>> + * to automatically handle EDEADLK and (re)try to enable the route from
>> + * @crtc to @connector, with the given @mode.
>> + *
>> + * Returns:
>> + *
>> + * A pointer to the new CRTC, or an ERR_PTR() otherwise.
>> + */
>> +int drm_kunit_helper_try_enable_crtc_connector(struct kunit *test,
>> +					       struct drm_device *drm,
>> +					       struct drm_crtc *crtc,
>> +					       struct drm_connector *connector,
>> +					       const struct drm_display_mode *mode,
>> +					       struct drm_modeset_acquire_ctx *ctx)
>> +{
>> +	int ret;
>> +
>> +retry_enable:
>> +	ret = drm_kunit_helper_enable_crtc_connector(test, drm, crtc, connector,
>> +						     mode, ctx);
>> +	if (ret == -EDEADLK) {
>> +		ret = drm_modeset_backoff(ctx);
>> +		if (!ret)
>> +			goto retry_enable;
>> +	}
>> +
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(drm_kunit_helper_try_enable_crtc_connector);
> 
> I'm not sure it's a good idea. This function might affect the locking
> context of the caller without even reporting it.
> 
> Generally speaking, I'd really prefer to have explicit locking, even if
> it means slightly more boilerplate.

Ack.

Will drop this patch and the next one for now, and sort this out in a
separate series.

Thanks,
Cristian
