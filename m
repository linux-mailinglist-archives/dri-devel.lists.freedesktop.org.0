Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C73C93BAF
	for <lists+dri-devel@lfdr.de>; Sat, 29 Nov 2025 10:50:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF8B010E1CB;
	Sat, 29 Nov 2025 09:50:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="mWum973o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 672AF10E1CB
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Nov 2025 09:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1764409817;
 bh=MmXzVJ5MoVP8VbuSvcRf5Cd6FU2Boz+4Je345xBRang=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=mWum973oC9Cc3v/JpWaj+y+bA86DwJ7gSSSecrKm9oRtJXaZEuAdCYMuM0DWgjD1P
 5U1s1i230v+rCAw8qZcP3wkUtUVZEWqXRnV7JjWyPQzTI+pY9UCi9mJK7XV3Rm7D/U
 tMnPsBic37kmOut/GD5QLOsZ7oRNojsLwLXxr1SMTG5l4Rp+VZ4uA7ywtK0yvs3Uh/
 AsHH2uEObJnWsg7bUyjJM00FGHm384j9W8TnxzDmadBAHKqBCSt1bJVapZ6Tg9UX11
 noiuxv8yOBLePzsHJHhOAZr59WfU0rcsqzHnR4PIowuyg6dGWcSMqo3LLE+lxzNnXS
 A4bjyTGgGkItw==
Received: from [192.168.1.90] (unknown [82.79.138.145])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id B623A17E0330;
 Sat, 29 Nov 2025 10:50:16 +0100 (CET)
Message-ID: <058027df-1b1b-4c46-b8e1-ec53fc809e82@collabora.com>
Date: Sat, 29 Nov 2025 11:50:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] drm/rockchip: vop2: Support setting custom
 background color
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>
Cc: Robert Mader <robert.mader@collabora.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20251118-rk3588-bgcolor-v3-0-a2cc909428ea@collabora.com>
 <20251118-rk3588-bgcolor-v3-4-a2cc909428ea@collabora.com>
 <0ed71b8d-5a2e-4213-bd2f-7ba317d1e4cb@rock-chips.com>
 <4a6443b8-d440-4921-8a43-7c20e4e265e7@collabora.com>
 <b8819463-cc61-432f-b451-db90e3b43884@rock-chips.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <b8819463-cc61-432f-b451-db90e3b43884@rock-chips.com>
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

Hi Chaoyi,

On 11/29/25 5:49 AM, Chaoyi Chen wrote:
> Hello Cristian, 
> 
> On 11/28/2025 5:44 PM, Cristian Ciocaltea wrote:
>> The precision was something I initially looked into for CRC verification, in the
>> context of the related IGT test.  But since I've added the VKMS support, I think
>> we should not worry about that anymore. 
>>
>> Moreover, as already pointed out in [1], only RK3576 supports CRC generation at
>> display controller level, and that is not particularly useful because it doesn't
> 
> I believe you can get the CRTC CRC on the RK3576, even when only the 
> background is visible and all plane is disabled. Feel free to let me
> know if you run into any issues :)

Yes, CRTC CRC works on RK3576 for the planes, but not for the background, i.e.
the CRC is not updated when setting a different background color.  Unless
there's a way to change this default behavior, which I'm not aware of. 

My current understanding is that the background color is applied at a later
stage in the display pipeline, *after* blending the planes and computing CRC.

>> take the background color into account.  Therefore I had to capture the frame
>> CRCs at DisplayPort AUX channel level, by using the USB-C DP AltMode capable
> 
> Oh that sounds interesting! I'm not sure how complex it would be to
> implement.

That's already implemented, I plan to submit the patches soon.

> 
>> port of my RK3588-based board.  However, that solution is not yet available
>> upstream, as it requires further work for cleanup and improving the overall
>> USB-C reliability. 
>>
>> Hence I'll move on with your suggestion and switch to the simple bit-shifting
>> approach for the next revision.
> 
