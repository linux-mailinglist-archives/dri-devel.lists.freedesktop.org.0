Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C043A59A48
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 16:46:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD55E10E477;
	Mon, 10 Mar 2025 15:46:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="hECOg93O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9177510E477
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 15:46:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1741621569; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=NiHi27hdfQxbeW3CxdZzSRA4K8O8/l6SjnpHs7duMHLEy4dE8oIYRLiDNPlqAJ1isWWnvvAd6koFCCs+ia3Lg8VrivMrQ1joLVu2easq+Z4mfy6LPZp5CG+pIU46rZyEZPbVPoWDT6FgJC019FSUIy6UcwA6ty818xPuHL6ktY4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1741621569;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=nteUPilcCeVNoxHOhuQ2B/1Kq1k+d99vAmMwSOhuO1k=; 
 b=Wf4EZ5HjBzs4Eo1DdCVBtixBqviwh7FP2WhB/xImrKi1S49sPwRkbS0ttEAbvQXX1GhBWsX1B90ei/Qq8rLGjG+Jyzj/wqbXxXkYKn4PbG4mAjYGErOsylUqH18S0STcvt/HuEDRGDcH9/vl2Q6RzjypifS4pL+pMKlsob0MDB0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741621569; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=nteUPilcCeVNoxHOhuQ2B/1Kq1k+d99vAmMwSOhuO1k=;
 b=hECOg93O14P+PU8FRdiwCKOM+wz6C4qoEWp0Pe+407qBRy71Fp43CpF8AdrfR6lI
 wCLZj8OKW0mIsrYIejIrOBQ3oUj4KuX1t7HAr4gtEKLnOJaJbrRHt4sSequOrzrSXZH
 D1HcX0cmV+JlthV03oCKWR7NP09LkJ/+dt6Cvgto=
Received: by mx.zohomail.com with SMTPS id 1741621566672706.8975406997224;
 Mon, 10 Mar 2025 08:46:06 -0700 (PDT)
Message-ID: <bc587831-97b2-4991-9d5e-71e6962c63a1@collabora.com>
Date: Mon, 10 Mar 2025 12:46:01 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/4] drm/panfrost: Support ARM_64_LPAE_S1 page table
To: Steven Price <steven.price@arm.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: boris.brezillon@collabora.com, robh@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
References: <20250226183043.140773-1-ariel.dalessandro@collabora.com>
 <20250226183043.140773-4-ariel.dalessandro@collabora.com>
 <6cdaafa2-68f9-4d5b-abe5-5c9c549e3c6e@arm.com>
Content-Language: en-US
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
In-Reply-To: <6cdaafa2-68f9-4d5b-abe5-5c9c549e3c6e@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
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

Hi Steven,

On 2/27/25 11:44 AM, Steven Price wrote:
> On 26/02/2025 18:30, Ariel D'Alessandro wrote:
>> Bifrost MMUs support AArch64 4kB granule specification. However,
>> panfrost only enables MMU in legacy mode, despite the presence of the
>> HW_FEATURE_AARCH64_MMU feature flag.
>>
>> This commit adds support to use page tables according to AArch64 4kB
>> granule specification. This feature is enabled conditionally based on
>> the GPU model's HW_FEATURE_AARCH64_MMU feature flag.
>>
>> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> 
> I find some of the naming confusing here. The subject calls it
> 'ARM_64_LPAE_S1' which in an unfortunate name from the iommu code.
> 
> AIUI, LPAE is the "Large Physical Address Extension" and is a v7 feature
> for 32 bit. "LEGACY" (as Bifrost calls it) mode is a (modified) version
> of LPAE, which in Linux we've called "mali_lpae".
> 
> What you're adding support for is AARCH64_4K which is the v8 64 bit
> mode. So I think it's worth including the "64" part of the name of the
> mmu_lpae_s1_enable() function. Personally I'd be tempted to drop the
> "_s1" part, but I guess there's a small chance someone will find a use
> for the second stage one day.

Yes, overall agreed. I'll definitely keep the "64_4k" part of the name 
explicit and also keep the "mali_lpae" for the legacy mode. Will send a 
patchset v1 soon with all this, we can continue reviewing it there.

> 
> Note also that it's not necessarily a clear-cut improvement to use
> AARCH64_4K over LEGACY. I wouldn't be surprised if this actually causes
> (minor) performance regressions on some platforms. Sadly I don't have
> access to a range of hardware to test this on.

FWIW, I'm using Mesa CI [0] to test this as much as possible, at least 
to detect any (major) regressions. As proposed by Boris, we should use a 
property to progressively enable this feature.

Thanks!

[0] https://gitlab.freedesktop.org/mesa/mesa/

-- 
Ariel D'Alessandro
Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK 
Registered in England & Wales, no. 5513718

