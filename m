Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0544D74A193
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 17:52:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18C4910E468;
	Thu,  6 Jul 2023 15:52:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7962110E468
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 15:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688658756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FRxt/NiYUgXmWV4fU8al0zRW2xGKMvH1kCizqQUlA4w=;
 b=dcRLPyN0hCF47Lu8xVqBcOLpEdMD79WTcXaaV299k39qII0lUzBHXiOG7ZJUoU9N0Dv8IG
 JmopjTlTT7B1bq+o0uafJ5orNBvzNG5biDsCmEjGxl7it38KDHd7mDvO6jk21pQABmfaNa
 zkEcMPIUQCkHk6UXMTGQ5PQ6V1Tc7ZY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-zrrEj4-lPyqVpgB6UVMTUw-1; Thu, 06 Jul 2023 11:52:35 -0400
X-MC-Unique: zrrEj4-lPyqVpgB6UVMTUw-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3fbb18e9bd9so5142145e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jul 2023 08:52:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688658754; x=1691250754;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FRxt/NiYUgXmWV4fU8al0zRW2xGKMvH1kCizqQUlA4w=;
 b=LkOZ6VhnjVvNp9VqqNZElDHy8aFjkcrCN7iKHTxPLxCAp9hzMFVgeXCmDfOYcA0t7L
 fr8rGhmWamatUvgLvIkUu0mrYXcsH9rXfoOIavoOUiqnwJhszaGADe6+llO2Poo+bgga
 M/ADn19DTb6viIy5w/vNfTK5qKhR/xZjOYmF44S9rKCBE1z0+FxwBtxDPT+Nje7aaP/v
 xAPRlg/bKb/Z9kaYqY6MkZn/TfchYl5LvVb7oa7Fw/P0057UtGEpvKjLgTK2mYHpDww8
 IE5AEJR/PJWs5I+jUfE27IqvjUr0tWUJc1z15Y/8xlGQuKq13m5ZtNxsaiGYFO1Uvk+j
 aF6A==
X-Gm-Message-State: ABy/qLYt/svEBwa2cLOCQubaeaQtO2L/5SVQdaKvXiNOYYs7NE6WwIXn
 5rNcjW/E+L590JOUM4gF+L/xa+rLWizIhZqL36aEiHFCOilQwvMJE/g/TK+pTB88EzRiQVGJCKT
 nUY4iTAakzTOJ4edjco/fkhFf+OK2
X-Received: by 2002:a05:600c:470e:b0:3fa:94ea:583c with SMTP id
 v14-20020a05600c470e00b003fa94ea583cmr5689119wmo.8.1688658754380; 
 Thu, 06 Jul 2023 08:52:34 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHXRw0efno7C2fsVwB/UBBH508hAt9zGq2PeqHV7LtAjoXuI1o+g7kP3ECiR8lQmbiALoTLPA==
X-Received: by 2002:a05:600c:470e:b0:3fa:94ea:583c with SMTP id
 v14-20020a05600c470e00b003fa94ea583cmr5689103wmo.8.1688658754011; 
 Thu, 06 Jul 2023 08:52:34 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 m23-20020a7bcb97000000b003fbaade072dsm2484157wmi.23.2023.07.06.08.52.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jul 2023 08:52:33 -0700 (PDT)
Message-ID: <41329726-6861-f777-e7b1-e4b510ab4af5@redhat.com>
Date: Thu, 6 Jul 2023 17:52:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH drm-next v6 02/13] drm: manager to keep track of GPUs VA
 mappings
To: Donald Robson <Donald.Robson@imgtec.com>, "corbet@lwn.net"
 <corbet@lwn.net>, "jason@jlekstrand.net" <jason@jlekstrand.net>,
 "willy@infradead.org" <willy@infradead.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "bagasdotme@gmail.com" <bagasdotme@gmail.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "matthew.brost@intel.com" <matthew.brost@intel.com>,
 "bskeggs@redhat.com" <bskeggs@redhat.com>,
 "ogabbay@kernel.org" <ogabbay@kernel.org>,
 "boris.brezillon@collabora.com" <boris.brezillon@collabora.com>,
 "Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "alexdeucher@gmail.com" <alexdeucher@gmail.com>,
 "airlied@gmail.com" <airlied@gmail.com>
References: <20230629222651.3196-1-dakr@redhat.com>
 <20230629222651.3196-3-dakr@redhat.com>
 <8d01cb3add315277c86cf4b28d6901fed1977448.camel@imgtec.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <8d01cb3add315277c86cf4b28d6901fed1977448.camel@imgtec.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "airlied@redhat.com" <airlied@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Donald,

On 7/6/23 17:45, Donald Robson wrote:
> On Fri, 2023-06-30 at 00:25 +0200, Danilo Krummrich wrote:
>>
>> +#ifdef CONFIG_LOCKDEP
>> +typedef struct lockdep_map *lockdep_map_p;
>> +#define drm_gpuva_manager_ext_assert_held(mgr)		\
>> +	lockdep_assert(lock_is_held((mgr)->ext_lock) != LOCK_STATE_NOT_HELD)
>> +/**
>> + * drm_gpuva_manager_set_ext_lock - set the external lock according to
>> + * @DRM_GPUVA_MANAGER_LOCK_EXTERN
>> + * @mgr: the &drm_gpuva_manager to set the lock for
>> + * @lock: the lock to set
>> + *
>> + * If @DRM_GPUVA_MANAGER_LOCK_EXTERN is set, drivers need to call this function
>> + * to provide the lock used to lock linking and unlinking of &drm_gpuvas to the
>> + * &drm_gem_objects GPUVA list.
>> + */
>> +#define drm_gpuva_manager_set_ext_lock(mgr, lock)	\
>> +	(mgr)->ext_lock = &(lock)->dep_map
>> +#else
>> +typedef struct { /* nothing */ } lockdep_map_p;
> 
> lockdep_map_p conflicts with an identical typedef in maple_tree.h when CONFIG_LOCKDEP is
> not set (it's being pulled in by mm.h in drm_vma_manager.h). I'll just comment the line
> out for now.

Good catch! I got this trick from maple_tree.h and intended to move it 
to the lockdep header in a separate patch to avoid such collisions. 
Unfortunately, I forgot about it. Gonna fix it up.

- Danilo

> 
>> +#define drm_gpuva_manager_ext_assert_held(mgr)		do { (void)(mgr); } while (0)
>> +#define drm_gpuva_manager_set_ext_lock(mgr, lock)	do { } while (0)
>> +#endif
>> +

