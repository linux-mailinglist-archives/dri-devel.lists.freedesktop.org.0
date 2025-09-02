Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 177B9B40A1B
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 18:04:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 453F010E1DC;
	Tue,  2 Sep 2025 16:04:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="FUUfI3WX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A7C010E1DC
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 16:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1756829092;
 bh=ovWdbmcLBmA33JBDYg84OE2PqHzIKb6iNt+T6eoF2kw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=FUUfI3WXYc1B8QJ6WeBpPvR0+1cMVN778Sl29SAmhAoSko8l+RH/Bxm0WuqqyJJW1
 lrMAWYbfZ80CGBKTAcbSG/5phmbYDtRElhkRWQsS9uubdqJ8wRB8MMfG+ZuqR0EuH5
 cc4hQYsR8yFJX4o5sAEOP2F17NHZFKm/Loaa7WpvuUrKY1fNLRA9RgbCkxZUyWSGld
 ZMvRimQ+t3ZM3ANHSvPz18MV+Wjp08FasY9xoJR+TY+A4eE9FUKLI9OF72e5kPK8jO
 J7wJyFTpc76oxwxhQbs+xMKsWOMZ1oUXQNvGMP9PG9O5KdeNyGwlOdVxEehCPDsBh3
 4dG8NXOEAcTIg==
Received: from [192.168.1.90] (unknown [82.79.138.60])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 5E63E17E131D;
 Tue,  2 Sep 2025 18:04:51 +0200 (CEST)
Message-ID: <fc9baa6d-ed38-478b-9338-8a76986639da@collabora.com>
Date: Tue, 2 Sep 2025 19:04:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Introduce BACKGROUND_COLOR DRM CRTC property
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, Matt Roper <matthew.d.roper@intel.com>
References: <20250902-rk3588-bgcolor-v1-0-fd97df91d89f@collabora.com>
 <50e3f25c-f4e1-40f6-8e36-23193863f1ee@foss.st.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <50e3f25c-f4e1-40f6-8e36-23193863f1ee@foss.st.com>
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

Hi Raphael,

On 9/2/25 4:19 PM, Raphael Gallais-Pou wrote:
> 
> 
> On 9/2/25 11:27, Cristian Ciocaltea wrote:
>> Some display controllers can be hardware-configured to present non-black
>> colors for pixels which are not covered by any plane (or are exposed
>> through transparent regions of higher planes).
>>
>> The first patch of the series introduces the BACKGROUND_COLOR DRM
>> property that can be attached to a CRTC via a dedicated helper function.
>> A 64-bit ARGB color value format is also defined and can be manipulated
>> with the help of a few utility macros.
> 
> Hi Cristian,
> 
> Thanks for this work ! :)
> 
> FWIW I sent a series also based on Matt's work four years ago:
> https://lore.kernel.org/dri-devel/20210707084557.22443-2-raphael.gallais-pou@foss.st.com/
> 
> IIRC at the time there was some questions around the pixel format used for the
> property, and non-opaque color vs alpha pre-multiplication.
> Mind that on STM32MP platforms alpha channel for the background color is not
> supported.
> 
> Hope the thread can bring some insights.

Thanks for pointing this out, I will consider it for v2.

Regards,
Cristian
