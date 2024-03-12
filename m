Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4750E879100
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 10:30:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC84A10F325;
	Tue, 12 Mar 2024 09:30:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="DWuSd9ew";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9D10112D4A
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 09:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=l2801UBYl+X+85z+y0c8FhDFmfLImSMDBxhpXc6TUcc=; b=DWuSd9ewG2yTQoOeQlvxu/pB+K
 eMMJZ6Bp6/KDgEF1V4xsMS+DrGhbgeVH3xX53Kr/gub5PJTsq6ZqKJq7eUYIqjPD/DeVNiIncnIZ7
 cqIcCnMSVIjb04cxOwNIg0aV49/17uvwoyHJ+DssozU5d0ZqITtn3nnzfeTtaBaMv7LQFEt1F8uQd
 p9TjqsjazclfNf9YIR73WRThMN3/1HAxfv9VBLoLDAueQ5iPpM+wuPXbEIyg0NbVFCF/itZvLvgHL
 LJPpePKKneo9ua82K3D9GkWEdu2SlxhYemaIJ52ouGzmPN7MM53u201aLNzrDn0YONUmE6rt3jU6b
 RKZuj88w==;
Received: from [84.65.0.132] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1rjySb-009EkR-Fw; Tue, 12 Mar 2024 10:30:13 +0100
Message-ID: <07885e3b-ee7b-456b-9fad-17d9009a4cb7@igalia.com>
Date: Tue, 12 Mar 2024 09:30:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] drm/gem: Add a mountpoint parameter to
 drm_gem_object_init()
Content-Language: en-GB
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 Russell King <linux@armlinux.org.uk>, Lucas Stach <l.stach@pengutronix.de>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Sui Jingfeng <suijingfeng@loongson.cn>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Thierry Reding
 <thierry.reding@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Huang Rui <ray.huang@amd.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Karolina Stolarek <karolina.stolarek@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
References: <20240311100959.205545-1-mcanal@igalia.com>
 <20240311100959.205545-3-mcanal@igalia.com>
 <30a7f20b-1f2c-41cb-b193-03429c160b63@igalia.com>
 <3a5d07c0-120f-47f9-a35a-31f3bfcc9330@amd.com>
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <3a5d07c0-120f-47f9-a35a-31f3bfcc9330@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 12/03/2024 08:59, Christian König wrote:
> Am 12.03.24 um 09:51 schrieb Tvrtko Ursulin:
>>
>> Hi Maira,
>>
>> On 11/03/2024 10:05, Maíra Canal wrote:
>>> For some applications, such as using huge pages, we might want to have a
>>> different mountpoint, for which we pass in mount flags that better match
>>> our usecase.
>>>
>>> Therefore, add a new parameter to drm_gem_object_init() that allow us to
>>> define the tmpfs mountpoint where the GEM object will be created. If
>>> this parameter is NULL, then we fallback to shmem_file_setup().
>>
>> One strategy for reducing churn, and so the number of drivers this 
>> patch touches, could be to add a lower level drm_gem_object_init() 
>> (which takes vfsmount, call it __drm_gem_object_init(), or 
>> drm__gem_object_init_mnt(), and make drm_gem_object_init() call that 
>> one with a NULL argument.
> 
> I would even go a step further into the other direction. The shmem 
> backed GEM object is just some special handling as far as I can see.
> 
> So I would rather suggest to rename all drm_gem_* function which only 
> deal with the shmem backed GEM object into drm_gem_shmem_*.

That makes sense although it would be very churny. I at least would be 
on the fence regarding the cost vs benefit.

> Also the explanation why a different mount point helps with something 
> isn't very satisfying.

Not satisfying as you think it is not detailed enough to say driver 
wants to use huge pages for performance? Or not satisying as you 
question why huge pages would help?

Regards,

Tvrtko
