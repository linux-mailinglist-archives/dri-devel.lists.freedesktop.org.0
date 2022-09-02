Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BA25AACA0
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 12:38:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C195510E7F0;
	Fri,  2 Sep 2022 10:38:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA5E510E7F1;
 Fri,  2 Sep 2022 10:38:34 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id z20so1827401ljq.3;
 Fri, 02 Sep 2022 03:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=zb5JB4hN023tPDYi3X8LwwwxfrMO5eJ6HDfLqyKNUp4=;
 b=b+3QDVeZ8R7VkX5Bf/lQ/zM5cKpssDiy6sioxY3jw9J59uDY2aLPinjOd5/AfzMPSF
 F25cqjiDBi0zlLf8NewvQzjGLBKLLwe77dGjcGOssNv9QG7GD4v9Y7R5vUVBkwhzJqAt
 W+NgPvhc+LGHFoczAHcg6Xd3RZE5aY0kB0c6sHOthdo2C6I6KgqGlMNMjWhr5LBa7hEJ
 PF8PoWJrMQEbxEgzwwdfZOe63pnK6yiDDUckqcBXrJcCgoCnkkMNTICwsyuKzCch5zAF
 oZnume/cpTmEe8YMT0zAnJRdyZ8FX7N+NEVx+V/5rqxYqoL28d0bRVzC4c7nr4HeYJuG
 nuzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=zb5JB4hN023tPDYi3X8LwwwxfrMO5eJ6HDfLqyKNUp4=;
 b=KCTywGyRFnTP/3C6JtyU2tQjbcq4goVqUdosWJwU50+IB4+/HnVTISCE6HE+CiZNs0
 PTozkTgvFLATSMMx91utEhkN/tSswHQ/QcglzS8yzc3mmI9VyJVBA3uXgB/xk1AQ3viz
 6JH5SpXhgmqVdVVOWMm/vgT9nyvnZahmXj5xPbR48K3qCaQk1RMaELMPRRmrQBLip3yV
 VspiZGcEbblkrDXOMA5u7MTSSE/N/w8Lc6KwOg6NyO/avtMTbr0C+oHfF34dxXT5yFvF
 R9dWFlE41N2O7MaYSzg4AJOXY3Ry5kruOVYCmugA4NGWubk9hd13OALS3FFDpui5Hlhb
 Gesg==
X-Gm-Message-State: ACgBeo2BZA7RytIL4km1QxTdlwIU82nbn/vgOZiQwW2AgkrRw2Xfb6YH
 O4/qR4dnApRaEOAInwKs3iM=
X-Google-Smtp-Source: AA6agR40LFWSHSrrETgLqAmkw4fHaA4WAaccG4Nn66YZ/3AUuSYYBeJUuN4jK3ma7gFMPZa8TWb1KQ==
X-Received: by 2002:a2e:bf07:0:b0:261:cafb:d4a8 with SMTP id
 c7-20020a2ebf07000000b00261cafbd4a8mr10289818ljr.268.1662115113077; 
 Fri, 02 Sep 2022 03:38:33 -0700 (PDT)
Received: from [192.168.2.145] (109-252-119-13.nat.spd-mgts.ru.
 [109.252.119.13]) by smtp.googlemail.com with ESMTPSA id
 5-20020a2eb945000000b00267232d0652sm147092ljs.46.2022.09.02.03.38.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Sep 2022 03:38:32 -0700 (PDT)
Message-ID: <c89680d0-30ee-f5d7-be68-fa84458df04d@gmail.com>
Date: Fri, 2 Sep 2022 13:38:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v4 06/21] drm/i915: Prepare to dynamic dma-buf locking
 specification
Content-Language: en-US
From: Dmitry Osipenko <digetx@gmail.com>
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas_os@shipmail.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
References: <20220831153757.97381-1-dmitry.osipenko@collabora.com>
 <20220831153757.97381-7-dmitry.osipenko@collabora.com>
 <DM5PR11MB1324088635FDE00B0D957816C17B9@DM5PR11MB1324.namprd11.prod.outlook.com>
 <760b999f-b15d-102e-8bc7-c3e69f07f43f@gmail.com>
In-Reply-To: <760b999f-b15d-102e-8bc7-c3e69f07f43f@gmail.com>
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
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "kernel@collabora.com" <kernel@collabora.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Leon Romanovsky <leon@kernel.org>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>, "Gross,
 Jurgen" <jgross@suse.com>, David Airlie <airlied@linux.ie>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Tomi Valkeinen <tomba@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Tomasz Figa <tfiga@chromium.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Qiang Yu <yuq825@gmail.com>, Alex Deucher <alexander.deucher@amd.com>,
 Amol Maheshwari <amahesh@qti.qualcomm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

02.09.2022 13:31, Dmitry Osipenko пишет:
> 01.09.2022 17:02, Ruhl, Michael J пишет:
> ...
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
>>> @@ -331,7 +331,19 @@ static void __i915_gem_free_objects(struct
>>> drm_i915_private *i915,
>>> 			continue;
>>> 		}
>>>
>>> +		/*
>>> +		 * dma_buf_unmap_attachment() requires reservation to be
>>> +		 * locked. The imported GEM shouldn't share reservation lock,
>>> +		 * so it's safe to take the lock.
>>> +		 */
>>> +		if (obj->base.import_attach)
>>> +			i915_gem_object_lock(obj, NULL);
>>
>> There is a lot of stuff going here.  Taking the lock may be premature...
>>
>>> 		__i915_gem_object_pages_fini(obj);
>>
>> The i915_gem_dmabuf.c:i915_gem_object_put_pages_dmabuf is where
>> unmap_attachment is actually called, would it make more sense to make
>> do the locking there?
> 
> The __i915_gem_object_put_pages() is invoked with a held reservation
> lock, while freeing object is a special time when we know that GEM is
> unused.
> 
> The __i915_gem_free_objects() was taking the lock two weeks ago until
> the change made Chris Wilson [1] reached linux-next.
> 
> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=2826d447fbd60e6a05e53d5f918bceb8c04e315c
> 
> I don't think we can take the lock within
> i915_gem_object_put_pages_dmabuf(), it may/should deadlock other code paths.

On the other hand, we can check whether the GEM's refcount number is
zero in i915_gem_object_put_pages_dmabuf() and then take the lock if
it's zero.

Also, seems it should be possible just to bail out from
i915_gem_object_put_pages_dmabuf() if refcount=0. The further
drm_prime_gem_destroy() will take care of unmapping. Perhaps this could
be the best option, I'll give it a test.
