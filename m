Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C557B0AC0
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 18:59:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22E9C10E579;
	Wed, 27 Sep 2023 16:59:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19EAE10E579
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 16:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695833964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l6cdl+aga/6XxqqAgUUx1HZQLiVlXgz3gMJOL8B3acE=;
 b=YNfZ+lY2YOb+5a+/zIKNezh/F7Hhrb1pjEt+FGMy5YbdmC570z4yr63cPABdqXLuJ637oe
 epZ5cVuaU/eHksNBqkeztjnk3nFqgqlLhs01fU5DIHKPx54EnslLzPvUzbUSHAHP9ZLlHw
 ONCaWvfnjb7Q+SvaEyQJyMBDc7zNpQc=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-BiUPL9P0P52Aw72FqtAb-w-1; Wed, 27 Sep 2023 12:59:22 -0400
X-MC-Unique: BiUPL9P0P52Aw72FqtAb-w-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-9ae57d8b502so967409366b.2
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 09:59:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695833956; x=1696438756;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l6cdl+aga/6XxqqAgUUx1HZQLiVlXgz3gMJOL8B3acE=;
 b=dnk+1dqG77/na3IME+f+Lwlek9vjPkTrnGSAK30bX0tsUr7Eg32eksAf7iTnXeui1I
 t8ICNMkRwfT9W2m7eK0RX+E8uOIG7JhkIIiD7kmnIoi14WXCJOd+v3QYeiK2wSqs+/yP
 7WBFolgmGmGL53zrs7Nt2t9JwT8J94QgJ/KiNzOyf5l6WRhUnhJO8bx+64ruqvbvIw7s
 ZPHztQyiG3F0ht2HUvGFRX6GLzr0uLxoontoiql2sTWy9FSzE4X32X532zFatQaFo9NW
 f5pc3v5w2dsi4eFUiQR8FTVffstsZbOlrFfbpmDBw+Q7ZYQWKudCJBc6lBQI1lUzffWr
 fNxQ==
X-Gm-Message-State: AOJu0Yy3c47tARrp1qTKL+ibqaRvUYePBTvTEkToy9hkNIoLZE95cOi9
 mwytGlMkrpMrJPEYCSz6umhTdxFRmjUYeqfUau55dTnYZKxDQklTgCx9IczOYRIwkAvYZizcV86
 iVX/bhZjlvPsLgreK3yxtNrdQj+mX
X-Received: by 2002:aa7:d0d8:0:b0:530:a0a9:ee36 with SMTP id
 u24-20020aa7d0d8000000b00530a0a9ee36mr2095709edo.38.1695833956677; 
 Wed, 27 Sep 2023 09:59:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKMrmbuENX8FTtWAevq2VNbPYGGhr9ZiqqUZp9scNnPqDJ3oJHDnGAkbey4dkMV7CVYYlnMQ==
X-Received: by 2002:aa7:d0d8:0:b0:530:a0a9:ee36 with SMTP id
 u24-20020aa7d0d8000000b00530a0a9ee36mr2095696edo.38.1695833956385; 
 Wed, 27 Sep 2023 09:59:16 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 s3-20020a056402014300b0052595b17fd4sm8315439edu.26.2023.09.27.09.59.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Sep 2023 09:59:15 -0700 (PDT)
Message-ID: <a46f49b8-3680-9476-046b-e3d821184851@redhat.com>
Date: Wed, 27 Sep 2023 18:59:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH drm-misc-next v4 7/8] drm/gpuvm: generalize
 dma_resv/extobj handling and GEM validation
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20230920144343.64830-1-dakr@redhat.com>
 <20230920144343.64830-8-dakr@redhat.com>
 <20230922134548.7ede67c0@collabora.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20230922134548.7ede67c0@collabora.com>
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
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 donald.robson@imgtec.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/22/23 13:45, Boris Brezillon wrote:
> On Wed, 20 Sep 2023 16:42:40 +0200
> Danilo Krummrich <dakr@redhat.com> wrote:
> 
>> +	/**
>> +	 * @DRM_GPUVM_RESV_PROTECTED: GPUVM is protected externally by the
>> +	 * GPUVM's &dma_resv lock
> 
> I think we need to be more specific, and list the fields/operations
> that need to be externally protected when DRM_GPUVM_RESV_PROTECTED is
> set.

I agree, we should probably keep a list somewhere. However, there are also
lockdep asserts where a lock is required to be held.

> 
>> +	 */
>> +	DRM_GPUVM_RESV_PROTECTED = (1 << 0),
> 

