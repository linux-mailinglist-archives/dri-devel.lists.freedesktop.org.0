Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 764BBC4724D
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 15:22:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD1A210E3D1;
	Mon, 10 Nov 2025 14:22:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ggTb4Yvk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EC5B10E074
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 14:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1762784543;
 bh=riqluud7DRBnsD2rjaWhV/ylLC40XHZ/UFfYhjGom0s=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ggTb4YvkwduTIa72FOaubny4AQdcIVM0N2hzfb3g9yhsmd7ewtO18d5tPS+IxfSw4
 GSSnXzjTkEF1e2nCFMvvaE+gZ/HJp+vU99BRjumDHumlyyiVXAGQ+jtpXbZRbIUaWG
 7r/+tGhHGessAWBxEPgya7AbYzPEbIzHYxA7bb7JN+R5AHMwjAP1hUmfQuZh01Nym0
 5LQj+ZjiueEI9J5O4Jy8ghyVqZHwUcYjgDNJFAhY/SrkLlS5I88ji9Qb303tZUlSWu
 1N86wT9NMg7goRR1FVUO7UeYDSNSpX/xQDTBF/xd4GJ8qKYcFSrkcyh8/jZS9Wojd4
 B+wUHqMNAVpDw==
Received: from [192.168.1.90] (unknown [82.79.138.145])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 61C7E17E1299;
 Mon, 10 Nov 2025 15:22:22 +0100 (CET)
Message-ID: <0e7d78e0-36ee-4115-b224-dbf4bda87ede@collabora.com>
Date: Mon, 10 Nov 2025 16:22:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Introduce BACKGROUND_COLOR DRM CRTC property
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Robert Mader <robert.mader@collabora.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Matt Roper <matthew.d.roper@intel.com>
References: <20251013-rk3588-bgcolor-v2-0-25cc3810ba8c@collabora.com>
 <x33zabb5un2boben6r4qp3vvrgca5s37gmseespdwwbajumdxx@mcxe6or5p63m>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <x33zabb5un2boben6r4qp3vvrgca5s37gmseespdwwbajumdxx@mcxe6or5p63m>
Content-Type: text/plain; charset=UTF-8
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

On 10/13/25 11:55 PM, Dmitry Baryshkov wrote:
> On Mon, Oct 13, 2025 at 09:27:17PM +0300, Cristian Ciocaltea wrote:
>> Some display controllers can be hardware-configured to present non-black
>> colors for pixels which are not covered by any plane (or are exposed
>> through transparent regions of higher planes).
>>
>> The first patch of the series introduces the BACKGROUND_COLOR DRM
>> property that can be attached to a CRTC via a dedicated helper function.
>> A 64-bit ARGB color value format is also defined and can be manipulated
>> with the help of a few utility macros.
> 
> 
> Please provide IGT tests. I'd at least check that using the
> BACKGROUND_COLOR results in the same CRC as then one when there is a
> plane covering the whole screen.

Done:

https://lore.kernel.org/all/20251110-crtc-bgcolor-v1-1-28669b692970@collabora.com/

> Additional note. I see a value in having the CRTC property for the
> background colour. However it might be more flexible to reuse old
> proposal for solid fill planes ([1]) and instead implement the lowest
> Z-order plane supporting only solid fill colour as an image source.

Thanks for pointing this out.  Will keep it in mind as for now there is no
(immediate) plan to consider the alternative(s).
