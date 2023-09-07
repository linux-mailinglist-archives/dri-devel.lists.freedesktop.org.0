Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FEA79710F
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 10:54:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 644A310E79B;
	Thu,  7 Sep 2023 08:54:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D6A110E788
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Sep 2023 08:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694076861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=56TqKCcZL60A+Wc7kJAS/gDpfEBf+hRJ5ysg2ApH3tE=;
 b=TjWZjG3cARfXFx0bJFX1Mn98ijrZ5m+fcirfNsDBrRdzfaUs6WtCmK8ir5Yyetdmx/+CqL
 oOKjdw8LwHurF0bXYjyEddOStJEI4TMn5ONHshKZCuP3Oh0I9wH/GLwnfo1YrKY8XSrpg+
 JGiOtU2XmvqdHpuFsld1oqVA7RFc8MU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-614-wkoGSXQIO1ufkxKIIN0VmA-1; Thu, 07 Sep 2023 04:54:19 -0400
X-MC-Unique: wkoGSXQIO1ufkxKIIN0VmA-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-997c891a88dso42397066b.3
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Sep 2023 01:54:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694076858; x=1694681658;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=56TqKCcZL60A+Wc7kJAS/gDpfEBf+hRJ5ysg2ApH3tE=;
 b=HI6R3nA7aw2T1AaZMtY/ZndTnai+lLDU/+9+jiUJjpxTtF4ADiE319fsao0W3xgfNG
 Tm+JvqjKmng5XSuNGjEpoReR04lzXD4fam0hYa/9Ej6/IPwNxZf5HHeUkCBSvRe4FOhQ
 58lnRTWyPrEWNr54S1MCxkiG/pk1Rhn6rw2V/IQYvOR4BJMp3KzGSmNZ5GJGexahZnAg
 TtVP6CjpGNLzhkzQCfsXi8+x+F9ZelrwlvSw1/zs9XUgqLCDjAuI81DSm4CwPhHhIml5
 66iFdyeDktlc+eZwN7jpdw/6wQq96wfw9KF/p2VWmjZw2DPmfzRA51ppD2v7vfkondRY
 Sr/w==
X-Gm-Message-State: AOJu0YysbkPQfMwnpguzrwcweupvl09WFgtMrulGNC48DShgExphT+eK
 vugQ2F5tzJc6YCSDyNduCYhv1HVKDMSiyW+9M61oKR8qctrfHRcxp1hFLWsuxTvkg+2nH87Kjqm
 Bu6LuxdgDFSTLXi3i/FivmZYgbvaU
X-Received: by 2002:a17:906:3014:b0:9a1:e231:67e5 with SMTP id
 20-20020a170906301400b009a1e23167e5mr4093427ejz.39.1694076858814; 
 Thu, 07 Sep 2023 01:54:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFkjF/oeSxCuBoHl+DyVfde/AyF2LYClR/AcdAAKcsH7MTToGTtYqE/ni8+s35VoLBdgb9ozQ==
X-Received: by 2002:a17:906:3014:b0:9a1:e231:67e5 with SMTP id
 20-20020a170906301400b009a1e23167e5mr4093414ejz.39.1694076858449; 
 Thu, 07 Sep 2023 01:54:18 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 q19-20020a170906941300b0099bcb44493fsm10266693ejx.147.2023.09.07.01.54.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Sep 2023 01:54:18 -0700 (PDT)
Message-ID: <149184db-8003-d1d4-4ae0-1401ff1b3359@redhat.com>
Date: Thu, 7 Sep 2023 10:54:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH drm-misc-next v2 2/7] drm/gpuvm: rename struct
 drm_gpuva_manager to struct drm_gpuvm
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20230906214723.4393-1-dakr@redhat.com>
 <20230906214723.4393-3-dakr@redhat.com>
 <20230907095649.13dbd49c@collabora.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20230907095649.13dbd49c@collabora.com>
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

On 9/7/23 09:56, Boris Brezillon wrote:
> On Wed,  6 Sep 2023 23:47:10 +0200
> Danilo Krummrich <dakr@redhat.com> wrote:
> 
>> Rename struct drm_gpuva_manager to struct drm_gpuvm including
>> corresponding functions. This way the GPUVA manager's structures align
>> very well with the documentation of VM_BIND [1] and VM_BIND locking [2].
>>
>> It also provides a better foundation for the naming of data structures
>> and functions introduced for implementing a common dma-resv per GPU-VM
>> including tracking of external and evicted objects in subsequent
>> patches.
> 
> I'm fine with this rename, but I feel like some bits are missing in
> this patch. I see a few functions taking a drm_gpuvm object and still
> being prefixed with drm_gpuva_ (I'm not talking about functions that
> only manipulate a drm_gpuva object, but those updating the the VM state,
> like the sm_map/unmap helpers), and I think it'd be preferable to
> rename the source files and the Kconfig option too.
> 

I was a bit hesitant to also rename the source files in the first place,
but I think that makes sense.

