Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAD2616160
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 12:02:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47D1710E46A;
	Wed,  2 Nov 2022 11:02:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63B5F10E46A
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Nov 2022 11:02:48 +0000 (UTC)
Received: from [192.168.2.196] (109-252-117-140.nat.spd-mgts.ru
 [109.252.117.140])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 03B5E660293F;
 Wed,  2 Nov 2022 11:02:45 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1667386966;
 bh=Fv2r7VMNMar50Z6R9zjXldd7YfQ7remDoXGGZJmE1fY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=iTfgEHH7xgWFBYV5P2ZbTRl4bEU1CphOUG1DTob501Tb5k2XWQuYUhhlZa+eUcCSw
 XO5MO1ZjaCRLymOol6xtJUxMu4iN/jNsByBFDwCZZTd42mFzySfx2vYEkE+EEi910B
 SpyS2awJVZ/IkKabCGAamXSoYuB69/VcBi9BptiygpcTSPq+ir3kg325GBvzG8KzBF
 lKCVsgMv+4ncPFFq4lattwk3BCtTxxtOGrl3zV2ATKHY6EGyM4nsm6PxxgKNu7asfi
 DOuW+8L29rWVLhLEFv6Hre8cJRkCZ4bJhAZUs9D5QO5rOcBSvTobjMkyrGEonh/A58
 FhVQale6x1Ugw==
Message-ID: <98b02ef5-2159-5f4f-aa5b-389aba4f92e1@collabora.com>
Date: Wed, 2 Nov 2022 14:02:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v2 2/2] drm/client: Prevent NULL dereference in
 drm_client_buffer_delete()
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, noralf@tronnes.org,
 Dan Carpenter <dan.carpenter@oracle.com>
References: <20221030154412.8320-1-dmitry.osipenko@collabora.com>
 <20221030154412.8320-3-dmitry.osipenko@collabora.com>
 <68dd2e87-c4d6-99de-22bf-5059d03c22bb@amd.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <68dd2e87-c4d6-99de-22bf-5059d03c22bb@amd.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/2/22 12:15, Christian König wrote:
> Am 30.10.22 um 16:44 schrieb Dmitry Osipenko:
>> The drm_gem_vunmap() will crash with a NULL dereference if the passed
>> object pointer is NULL. It wasn't a problem before we added the locking
>> support to drm_gem_vunmap function because the mapping argument was
>> always
>> NULL together with the object. Make drm_client_buffer_delete() to check
>> whether GEM is NULL before trying to unmap the GEM, it will happen on
>> framebuffer creation error.
>>
>> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
>> Link: https://lore.kernel.org/dri-devel/Y1kFEGxT8MVlf32V@kili/
>> Fixes: 79e2cf2e7a19 ("drm/gem: Take reservation lock for vmap/vunmap
>> operations")
>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> 
> Reviewed-by: Christian König <christian.koenig@amd.com>

Applied to drm-misc-next, thanks!

-- 
Best regards,
Dmitry

