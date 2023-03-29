Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A756CDC88
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 16:28:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13C8410EB20;
	Wed, 29 Mar 2023 14:28:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3172910EB2A
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 14:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680100085;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2IMTvlD7BQ+8/mU8ytgTCkV+PC7n6ZcoxNSMYcHe1Nc=;
 b=YMOHzqYElNvzsEflpQFAVCChhVJ6GhI3M4kJq5WMUffEvTjKemElM6dMj2ukU2GyKp2R/r
 vvxEArf8jySMUZ/3r2KUxsWElKibtyQBRCoQUPp4HNhF1ACQRMXQ9++UU09E9uBrAV2XQb
 Dc2T0H31kJLAP7ukOQRlbXqsiD7aRdM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-446-Zi0a9KdiO_u5lcXFkp8Tfw-1; Wed, 29 Mar 2023 10:28:04 -0400
X-MC-Unique: Zi0a9KdiO_u5lcXFkp8Tfw-1
Received: by mail-ed1-f71.google.com with SMTP id
 q13-20020a5085cd000000b004af50de0bcfso23009632edh.15
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 07:28:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680100083; x=1682692083;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2IMTvlD7BQ+8/mU8ytgTCkV+PC7n6ZcoxNSMYcHe1Nc=;
 b=UfsXGllV6xv4CZGm9fUbO3s18BoYf3Qz6vH7Ak5swgme7Nw6zi/weTXBZcEAd96bd7
 WPbxbYJUBYRHh/EIMVNy55w681yD3wLLY2EDwzG1kDtgNqcf7Zp2aa/897k61Q9f/CLE
 s1OCevzNyGt0RfQGRNB+KA27BOvtGsL5NZHzUolXDSa8gAAx6XbcLz4Bhg+vYHTbHd1M
 NaLaFlQ4ky8qaVRZuvXv7PEWDSyTJKAzYD+XcUKflilRShMLGOPYGiMMoQ174nKFTAKa
 SnRCd0tRPJg3Zy1xOTBmO/v8NVFTRMfCjw/2sLgtB06tcMCJhsEykIx3FNKvizw07JEL
 eXHQ==
X-Gm-Message-State: AAQBX9fo6yiBRC+L+xi4QKgzSYOeazHSzao2Y7EIMirUzVmlthaopZg9
 p0Bn2XYrxr76sMZoFXrjIpwHxpPdRluTa4/AWd9n56GpGM5MRhJUaie9tUM4jsfQG0oITxPaPsx
 esaZ325IOk29Wc+Q9Du9AXnXuv2LM
X-Received: by 2002:aa7:c942:0:b0:4fc:782c:dc9b with SMTP id
 h2-20020aa7c942000000b004fc782cdc9bmr16965066edt.40.1680100083053; 
 Wed, 29 Mar 2023 07:28:03 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZQj+54K9X2a5yVxUKW95bneoWuQPNIFC6vxpvwo0v7S9NbIDOgyaldD7ryw29z6brvAT2Wjw==
X-Received: by 2002:aa7:c942:0:b0:4fc:782c:dc9b with SMTP id
 h2-20020aa7c942000000b004fc782cdc9bmr16965053edt.40.1680100082784; 
 Wed, 29 Mar 2023 07:28:02 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 z21-20020a50cd15000000b004acbda55f6bsm17116867edi.27.2023.03.29.07.28.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Mar 2023 07:28:01 -0700 (PDT)
Message-ID: <46f01fc0-ec64-c215-b027-bd748711e6d8@redhat.com>
Date: Wed, 29 Mar 2023 16:28:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20230329135401.105592-1-christian.koenig@amd.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] drm/ttm: set TTM allocated pages as reserved
In-Reply-To: <20230329135401.105592-1-christian.koenig@amd.com>
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
Cc: Pierre-eric.Pelloux-prayer@amd.com, npiggin@gmail.com,
 Sean Christopherson <seanjc@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/29/23 15:54, Christian König wrote:
> KVM tries to grab references to pages in VMAs marked with VM_PFNMAP.
> This is illegal and can cause data corruption with TTM pages because
> only some of them are actually reference counted.

I think that you are referring to this:

         /* Don't set the __GFP_COMP flag for higher order allocations.
          * Mapping pages directly into an userspace process and calling
          * put_page() on a TTM allocated page is illegal.
          */
         if (order)
                 gfp_flags |= __GFP_NOMEMALLOC | __GFP_NORETRY | __GFP_NOWARN |
                         __GFP_KSWAPD_RECLAIM;

By "directly" I guess you mean without going through remap_pfn_range().

Based on our discussion offlist, it should be possible to remove the
get_page/put_page from the path that fills in the KVM page table, but
it is difficult to remove it altogether (it requires changing everything
to use userspace virtual address).

Indeed KVM needs to detect non-reference-counted pages because unfortunately
there are cases where people want to map VM_PFNMAP pages into a guest.  If
it is not enough to have PageReserved set, and there is a better check, KVM
can be fixed too.

> Mark all pages allocated by TTM as reserved, this way KVM handles the
> PFNs like they would point to MMIO space.
> 
> This still results in a warning, but at least no other problem.

What warning is it?

Paolo

> Signed-off-by: Christian König<christian.koenig@amd.com>

