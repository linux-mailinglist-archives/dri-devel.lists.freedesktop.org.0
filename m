Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6350A6539B
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 15:31:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B686410E40E;
	Mon, 17 Mar 2025 14:31:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="CiAXpq8N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47E0010E40E
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 14:31:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1742221868; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=BJpEgdkNOnSiwPrSUBLBl5lYM+9hFEOctSz9K9PKKQtT5xnLZulbT4jKlx5w5CyrA7bRjPfUchYlYQNkDIwJ3I8ppedq7Dv1VUg5TyTlG2+HY/vwjLnveGsb3+E7+EoKkbk06OmOsrqbOGSgrmMMWNGes0MRf19ZxaeGjSmMx2U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1742221868;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=juhBGFrnJEtXmwmWUkOgurD4ow1+cM0JUbcI3gD4F48=; 
 b=ecgMK9cayVciXKLAu5E0ZSdMZjVvZf7lm927GcnIz1VU3UBjjcCpsJr6CrO7K2f9wtg5uRocgz3DxeRYM18tgoBdiZTywAnL0hqyXDt7roYcgzXKcBYO7FVAEnXnxnPBUWt3hueS0tglURSEXOwtsGM2mod3r3cMkKSr9mVwDrU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1742221868; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=juhBGFrnJEtXmwmWUkOgurD4ow1+cM0JUbcI3gD4F48=;
 b=CiAXpq8Nrl/AHbcs52PL//215ZsdMXGiJpd1bLL0pvgHIbsjUTw4dPW6Xg9FdhHh
 VyKaKpzY/kQP6q94ru+oCbZfFGzK9UMFu98OW0CsHa8T49RsZCBg6kxjO7W9/aGUXG1
 zrh0Fz3mtauDQ+mUb70hAcN9IV4RZYToVMNZEumQ=
Received: by mx.zohomail.com with SMTPS id 1742221866050461.80081265142326;
 Mon, 17 Mar 2025 07:31:06 -0700 (PDT)
Message-ID: <992360e3-632c-4a0e-bb84-a72be7d7cd37@collabora.com>
Date: Mon, 17 Mar 2025 11:30:59 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] drm/panfrost: Add support for AARCH64_4K page
 table format
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 robh@kernel.org, steven.price@arm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 kernel@collabora.com, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, sjoerd@collabora.com,
 angelogioacchino.delregno@collabora.com
References: <20250317124044.16257-1-ariel.dalessandro@collabora.com>
 <20250317124044.16257-5-ariel.dalessandro@collabora.com>
 <20250317144436.2bcc17ed@collabora.com>
Content-Language: en-US
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
In-Reply-To: <20250317144436.2bcc17ed@collabora.com>
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

Boris,

On 3/17/25 10:44 AM, Boris Brezillon wrote:
> On Mon, 17 Mar 2025 09:40:42 -0300
> Ariel D'Alessandro <ariel.dalessandro@collabora.com> wrote:
> 
>> +static int panfrost_mmu_cfg_init(struct panfrost_mmu *mmu,
>> +				  enum io_pgtable_fmt fmt)
>> +{
>> +	struct panfrost_device *pfdev = mmu->pfdev;
>> +
>> +	switch (fmt) {
>> +	case ARM_64_LPAE_S1:
>> +		return mmu_cfg_init_aarch64_4k(mmu);
>> +	case ARM_MALI_LPAE:
>> +		return mmu_cfg_init_mali_lpae(mmu);
>> +	default:
>> +		/* This should never happen */
>> +		return drm_WARN_ON(pfdev->ddev, -EINVAL);
> 
> This won't return -EINVAL, but !!(-EINVAL), AKA true. We should do
> 
> 	default:
> 		drm_WARN(ptdev->ddev, "Invalid pgtable format");
> 		return -EINVAL;
> 
> instead.

Ah, good catch. I missed that from the WARN_ON definition:

         int __ret_warn_on = !!(condition);

Thanks, will fix in v4.

-- 
Ariel D'Alessandro
Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK 
Registered in England & Wales, no. 5513718

