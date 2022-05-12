Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 053FB5246FA
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 09:29:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF55B10E48F;
	Thu, 12 May 2022 07:29:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB1B510E48F
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 07:29:39 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id dk23so8396412ejb.8
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 00:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=6pAZCGyP8MKNDHSnHkp9Vkj/nq2Rx3C2O79znDA1ohY=;
 b=gxJRzrkmadF3F010BI/AMYnQC5Uyk0pnkL9ydptziONsEZn/T/Fbr536Bj0CqT43/F
 OE8wBqNbrMI1khevv0mxyHVfbDzMZ0KwNdeo/bIpVHajTT+EF0oDYf7N0VNN3eIe2c0O
 bJgEjttmuMaTQOa5J2uuTwyztqxfHYcUX2fk7ZNZB18NWHk4aV009x5qtgb8QqTLTAaS
 8y1to59ZLt6vcN6xaJxMesvLgIVpZbaUxsHo0IzdyH1F+HGrknc0It+VZabYdtbKbDlG
 oOIQGI+//4lh04gMHGLybH31m8u8DcH87bpUKK9AOmqcOMltr0HhDsM4I8CDWsx0WSDg
 fO5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6pAZCGyP8MKNDHSnHkp9Vkj/nq2Rx3C2O79znDA1ohY=;
 b=RC7qeSAaRem8uZPF8V/wbcWKjeveiEhlsHHRftD8nv2wcRDeeji0GJdDt5mRxuERgj
 zuNtwy1zDJkCy8kqJbXNCeHNKXqSQ5SR3fwY5aZVQqvQiqUxp/xT8eMTK0W+PA61yi3f
 pNmJxo+KswAIqplYzg7ny2tldjg5c77bDEi0qM/KP6Fag+tQusHvch8KGGIikHc5LoJz
 VO04Ch1lhF2DQxgUq2a1DrwPOefceb6Fh5hj3yZetkMpgRRLu6KdzF/XY3aZI/Gv3vvl
 eUs2ICN0Ai+4V232mxlA0Vq/6t3J4528c1R85/gqlBnP4+2NevXC5J6CVrY3IRVVoSVw
 gsAA==
X-Gm-Message-State: AOAM531KjhNo9xN1ADUKcym6YzRL7pE1xvMM2Nofc09hWCbSVQEwEKd5
 s7gPcCprKRz2gOe9VIyQZLA=
X-Google-Smtp-Source: ABdhPJzmYNUvkYEksV5JP3JbnVmzNZnB1l4WyXgWPZVb+mOEjX9GxlW5bDRlUp4xgoD9wQN+D9XfMw==
X-Received: by 2002:a17:907:60d6:b0:6fa:95d3:d4e5 with SMTP id
 hv22-20020a17090760d600b006fa95d3d4e5mr13864164ejc.357.1652340578275; 
 Thu, 12 May 2022 00:29:38 -0700 (PDT)
Received: from [192.168.178.21] (p5b0ea033.dip0.t-ipconnect.de. [91.14.160.51])
 by smtp.gmail.com with ESMTPSA id
 da26-20020a056402177a00b0042617ba63a5sm2274053edb.47.2022.05.12.00.29.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 May 2022 00:29:37 -0700 (PDT)
Message-ID: <f6e42cfb-0252-1273-2ba3-76af818e0799@gmail.com>
Date: Thu, 12 May 2022 09:29:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 10/15] drm/shmem-helper: Take reservation lock instead
 of drm_gem_shmem locks
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Stone
 <daniel@fooishbar.org>, David Airlie <airlied@linux.ie>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Clark <robdclark@gmail.com>, Emil Velikov <emil.l.velikov@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, Dmitry Osipenko <digetx@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
References: <01506516-ab2f-cb6e-7507-f2a3295efb59@collabora.com>
 <YnOHAh9I1ds4+1J+@phenom.ffwll.local>
 <83e68918-68de-c0c6-6f9b-e94d34b19383@collabora.com>
 <YnkaUk0mZNuPsZ5r@phenom.ffwll.local>
 <4d08b382-0076-1ea2-b565-893d50b453cb@collabora.com>
 <YnuziJDmXVR09UzP@phenom.ffwll.local>
 <56787b70-fb64-64da-6006-d3aa3ed59d12@gmail.com>
 <3a362c32-870c-1d73-bba6-bbdcd62dc326@collabora.com>
 <YnvWUbh5QDDs6u2B@phenom.ffwll.local>
 <ba2836d0-9a3a-b879-cb1e-a48aed31637d@collabora.com>
 <YnwI5UX/zvmnAHvg@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <YnwI5UX/zvmnAHvg@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Am 11.05.22 um 21:05 schrieb Daniel Vetter:
> [SNIP]
>>>> It's unclear to me which driver may ever want to do the mapping under
>>>> the dma_resv_lock. But if we will ever have such a driver that will need
>>>> to map imported buffer under dma_resv_lock, then we could always add the
>>>> dma_buf_vmap_locked() variant of the function. In this case the locking
>>>> rule will sound like this:
>>>>
>>>> "All dma-buf importers are responsible for holding the dma-reservation
>>>> lock around the dmabuf->ops->mmap/vmap() calls."
>> Are you okay with this rule?
> Yeah I think long-term it's where we want to be, just trying to find
> clever ways to get there.
>
> And I think Christian agrees with that?

Yes, completely.

A design where most DMA-buf functions are supposed to be called with the 
reservation lock held is exactly what I have in mind for the long term.

>>>>> It shouldn't be that hard to clean up. The last time I looked into it my
>>>>> main problem was that we didn't had any easy unit test for it.
>>>> Do we have any tests for dma-bufs at all? It's unclear to me what you
>>>> are going to test in regards to the reservation locks, could you please
>>>> clarify?
>>> Unfortunately not really :-/ Only way really is to grab a driver which
>>> needs vmap (those are mostly display drivers) on an imported buffer, and
>>> see what happens.
>>>
>>> 2nd best is liberally sprinkling lockdep annotations all over the place
>>> and throwing it at intel ci (not sure amd ci is accessible to the public)
>>> and then hoping that's good enough. Stuff like might_lock and
>>> dma_resv_assert_held.
>> Alright
> So throwing it at intel-gfx-ci can't hurt I think, but that only covers
> i915 so doesn't really help with the bigger issue of catching all the
> drivers.

BTW: We have now somebody working on converting the existing 
libdrm_amdgpu unit tests over to igt.

Regards,
Christian.

>
> Cheers, Daniel

