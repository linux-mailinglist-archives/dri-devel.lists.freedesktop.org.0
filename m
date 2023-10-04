Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2D57B7FF4
	for <lists+dri-devel@lfdr.de>; Wed,  4 Oct 2023 14:57:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 225F410E361;
	Wed,  4 Oct 2023 12:57:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16A6E10E109
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Oct 2023 12:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696424240;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UocplIidO7zTE/4ZN7c3P31bQ70zOq+bV6Role3kEz0=;
 b=AYEkZh9MzX1Al1cWNSVw50m48w7rEYgdDPi8vTAfu6Vtw+K9Alc77RZ8CLbNAXqbCR/vtQ
 0zjJiX2tCoan3z8rpQ1fXKyt4OMtA3RhN+oZnH1xFBXJLdNywYHVaKBVyC4g5C3sNQ69LD
 o+1w7KTTbryjxZLZb3ZFIUfRanmYyp0=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-561-GfWkXj6cPp6A9AxYbyTqfg-1; Wed, 04 Oct 2023 08:57:12 -0400
X-MC-Unique: GfWkXj6cPp6A9AxYbyTqfg-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-99bebfada8cso187384966b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Oct 2023 05:57:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696424231; x=1697029031;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :references:cc:to:subject:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UocplIidO7zTE/4ZN7c3P31bQ70zOq+bV6Role3kEz0=;
 b=fl/vHI5xoEWRXBkNFNkO4QXi4zpdUKRbcdg+GwOMKqnbvUNh/e3NeD8u7jaXGPgoLz
 U9gh4j7HlW06FxlLtHUyeggHvIPFdhjIyFvgYuSVvvBmi2pU7guUaUS2d6yOU/g8Ipxh
 O80zMdsYufK0MzYEe97yiKyiMV5CFeNmN1FrSpEfMLxDwC1Ju1+J8HCsMW+KOq3jOleT
 9hoGmAfdwCAfXn0n8v99hyOvbLUKWrcLiyBU43NVFYE/fcFORWHE8Ivw544Yo2JaqOJp
 5cxvdxTnegjTNrsxSmaRcPdsx8qMMZiuvI2hNeaY7m8LqL6nYqd6cuwuuOh+6cWb0gxw
 VVOQ==
X-Gm-Message-State: AOJu0YxyNwXmBwtBEfKm0aBpstzeQv+76LBe4Qj9n5++/gtpsCh7OJfJ
 RjASDpSrOvq4HSpv/18v5dqP8yiM11RshZIaYpzJB02b9NmJ2ue33jkgz6g3g6JPOomu6cSQCnF
 woOUx1YUeTot0fYA1wn8EisRKvrvP
X-Received: by 2002:a17:906:4d2:b0:9a2:26d8:f184 with SMTP id
 g18-20020a17090604d200b009a226d8f184mr1535495eja.51.1696424230989; 
 Wed, 04 Oct 2023 05:57:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmt8ptQ+NpMGEA8WwD3MopWfb9O4X8+QQKV5V2rPVZNgpUR9p7BK5+q5JqnyoFPOngtFGAoA==
X-Received: by 2002:a17:906:4d2:b0:9a2:26d8:f184 with SMTP id
 g18-20020a17090604d200b009a226d8f184mr1535481eja.51.1696424230614; 
 Wed, 04 Oct 2023 05:57:10 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 va17-20020a17090711d100b0099d804da2e9sm2828850ejb.225.2023.10.04.05.57.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Oct 2023 05:57:09 -0700 (PDT)
Message-ID: <6489f31f-8929-3e59-fbef-a22049cccbe3@redhat.com>
Date: Wed, 4 Oct 2023 14:57:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH drm-misc-next v5 4/6] drm/gpuvm: track/lock/validate
 external/evicted objects
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 airlied@gmail.com, daniel@ffwll.ch, matthew.brost@intel.com,
 sarah.walker@imgtec.com, donald.robson@imgtec.com,
 boris.brezillon@collabora.com, christian.koenig@amd.com, faith@gfxstrand.net
References: <20230928191624.13703-1-dakr@redhat.com>
 <20230928191624.13703-5-dakr@redhat.com>
 <e4e68970-c7c9-55e2-9483-01252f38c956@linux.intel.com>
 <6b16ab6f-b1a2-efdb-04bf-5af4c3de381b@linux.intel.com>
Organization: RedHat
In-Reply-To: <6b16ab6f-b1a2-efdb-04bf-5af4c3de381b@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/3/23 11:11, Thomas Hellström wrote:

<snip>

>>> +
>>> +/**
>>> + * drm_gpuvm_bo_evict() - add / remove a &drm_gpuvm_bo to / from the &drm_gpuvms
>>> + * evicted list
>>> + * @vm_bo: the &drm_gpuvm_bo to add or remove
>>> + * @evict: indicates whether the object is evicted
>>> + *
>>> + * Adds a &drm_gpuvm_bo to or removes it from the &drm_gpuvms evicted list.
>>> + */
>>> +void
>>> +drm_gpuvm_bo_evict(struct drm_gpuvm_bo *vm_bo, bool evict)
>>> +{
>>> +    struct drm_gem_object *obj = vm_bo->obj;
>>> +
>>> +    dma_resv_assert_held(obj->resv);
>>> +
>>> +    /* Always lock list transactions, even if DRM_GPUVM_RESV_PROTECTED is
>>> +     * set. This is required to protect multiple concurrent calls to
>>> +     * drm_gpuvm_bo_evict() with BOs with different dma_resv.
>>> +     */
>>
>> This doesn't work. The RESV_PROTECTED case requires the evicted flag we discussed before. The list is either protected by the spinlock or the resv. Otherwise a list add could race with a list removal elsewhere.

I think it does unless I miss something, but it might be a bit subtle though.

Concurrent drm_gpuvm_bo_evict() are protected by the spinlock. Additionally, when
drm_gpuvm_bo_evict() is called we hold the dma-resv of the corresponding GEM object.

In drm_gpuvm_validate() I assert that we hold *all* dma-resv, which implies that no
one can call drm_gpuvm_bo_evict() on any of the VM's objects and no one can add a new
one and directly call drm_gpuvm_bo_evict() on it either.

>>
>> Thanks,
>>
>> Thomas
>>
>>
> 

