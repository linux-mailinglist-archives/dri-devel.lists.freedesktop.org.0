Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7061FBFF7D1
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 09:19:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0817C10E893;
	Thu, 23 Oct 2025 07:19:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="iKy0yYd5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D147310E893
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 07:19:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1761203954; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=bsCzS5MDHjxtBJy/3QQFflmrjRjP7+ij7mjvcpmJiVSO9IBjSQQM5C+NSbK6yoChcyE93a8+bTAr7+kIVJWRULaFPG11IwMZ3WWzoX6SRUIHDMxK/i5cFrX6ehbezhmHibQdMECFR8H03JqtHlDHDKEbPztexGSzIGjf9oMA6nk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1761203954;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=SF5pybulDBHW18c8HlGOwb18Vw0zJMzWb3/sOP7yWg4=; 
 b=K6gwCYSwTLEtYSOy4h2jFuHn+3XWcEyPbxPsb1wQlGLIbF5+/BgBuUMey41TiyBaXduGmi2nM8ks69qEK9ix1B5w2w2e+J3ILdm6WHoGf1PwON8jxd0fd0li8TCyDuIHDPiA8DlhlFW1pUeFUSkTQoNXINUVDOKyCp2tTWEgHdw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1761203954; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=SF5pybulDBHW18c8HlGOwb18Vw0zJMzWb3/sOP7yWg4=;
 b=iKy0yYd5IOtoKBRwSPCKhVi9FFId6Ye3aOop8qPa2+O2cHYN3UWhjtdHh4X1+yjG
 Q0AJNOmzRt4ophYTGgJDDO6C9IjCLulhIKjVwwj6tAxj0imhEVNGEc4Noq3KBRtoIqL
 2Kp8ddw0qOQjca+mU5BsgLOAxGQn4mdxpS/Qhj0s=
Received: by mx.zohomail.com with SMTPS id 1761203953036917.0062959568356;
 Thu, 23 Oct 2025 00:19:13 -0700 (PDT)
Message-ID: <40d18130-4aab-47ad-9ed4-00ff6f594cc3@collabora.com>
Date: Thu, 23 Oct 2025 10:19:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/rockchip: Set VOP for the DRM DMA device
To: Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>, Robin Murphy <robin.murphy@arm.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Daniel Stone <daniels@collabora.com>
Cc: kernel@collabora.com, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20251022161948.199731-1-dmitry.osipenko@collabora.com>
 <3705026.LM0AJKV5NW@phil>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <3705026.LM0AJKV5NW@phil>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 10/23/25 09:56, Heiko Stuebner wrote:
> Hi Dmitry,
> 
> Am Mittwoch, 22. Oktober 2025, 18:19:48 Mitteleuropäische Sommerzeit schrieb Dmitry Osipenko:
>> Use VOP for DMA operations performed by DRM core. Rockchip DRM driver
>> is backed by a virtual device that isn't IOMMU-capable, while VOP is the
>> actual display controller device backed by IOMMU. Fixes "swiotlb buffer
>> is full" warning messages originated from GEM prime code paths.
>>
>> Note, that backporting is non-trivial as this depends on 143ec8d3f9396
>> ("drm/prime: Support dedicated DMA device for dma-buf imports"), which
>> landed in v6.16 and 421be3ee36a4 ("drm/rockchip: Refactor IOMMU
>> initialisation"), which landed in v5.19.
>>
>> Reported-by: Daniel Stone <daniels@collabora.com>
>> Fixes: 2048e3286f34 ("drm: rockchip: Add basic drm driver")
>> Cc: stable@vger.kernel.org # v6.16+
>> Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> 
> just a process remark for now. This v1 so it definitly shouldn't come
> with any Reviewed-by-s pre-applied, because this should happen in public.
> 
> It's not a huge issue here, because I do trust the people involved (you,
> Sebastian, Daniel) and the change is small enough, but please for future
> changes, let Review happen on the list, not on private channels.
> 
> 
> Will look at the change itself when back home.

Thanks. I also felt uncomfortable adding r-b to v1. There was no much
discussion on the change that you can find on [1] and the change is
indeed small, so I just added the r-b. Should've linked it the patch.

[1]
https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linux/-/issues/50

-- 
Best regards,
Dmitry
