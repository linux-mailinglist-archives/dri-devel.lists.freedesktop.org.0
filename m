Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDC894F7D0
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 22:04:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D21210E19E;
	Mon, 12 Aug 2024 20:04:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=cristian.ciocaltea@collabora.com header.b="JnBqZwsF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AFC410E19E
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 20:04:28 +0000 (UTC)
Delivered-To: kernel@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1723493059; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=DFVI2ejPpKsbUe6M1G+97fYwnwJH60kxq3P1haxtGVtuC7EVdKBtNv65W3vByHwfHYByLCPbo7Tb4IcakvaMJ2hbzp5mNUNGqeaTb9a2v+O6Ph/HnEKqv7iTyEaqtS1EGeS9D5JwEAeqinu1UDfTkLykjsm/smG89+OfPO47L+k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1723493059;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=HM8rEmZuiOeiTWWoyNk5ZGItA3VT+hmenQdK6mme3D4=; 
 b=LfAzPFgWIiijUzk4mP0p7/qdg0vVp9PFUv+kmPa4bXiG3IpRCivxMxhN0tZXgMLklJgwDv4QErDm1BoegRuD8rL8fCsVLLIPDxLKdN1UQUfApFx9YQZO9NBXR4tb4UE98m5pDOgkFeREpC6fN+wA1v4oBYcjWVYwjkrJcBWElaw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=cristian.ciocaltea@collabora.com;
 dmarc=pass header.from=<cristian.ciocaltea@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1723493059; 
 s=zohomail; d=collabora.com; i=cristian.ciocaltea@collabora.com;
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=HM8rEmZuiOeiTWWoyNk5ZGItA3VT+hmenQdK6mme3D4=;
 b=JnBqZwsFfChLRa4mKla5C7lzVCWurRnysmd8RJWAuLarkr5EEFdt1QDdwLGlnkoN
 ZkmtoQBxYnMl5YFNxbN6vhEZcX86W0KqlKPL88zHOnewIT+Cmv83OaM8LU8dvtAyxHM
 5lVCRp2oC7eC6c+rVyQ6rvMfTfwityNSPgbD2Cec=
Received: by mx.zohomail.com with SMTPS id 1723493058277520.4040371971508;
 Mon, 12 Aug 2024 13:04:18 -0700 (PDT)
Message-ID: <31cb347a-1d14-4114-bad3-5e9e4e87bf08@collabora.com>
Date: Mon, 12 Aug 2024 23:04:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] drm/rockchip: Unregister platform drivers in
 reverse order
To: Andy Yan <andyshrk@163.com>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <seanpaul@chromium.org>, Jeffy Chen <jeffy.chen@rock-chips.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Mark Yao <markyao0591@gmail.com>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240808-rk-drm-fix-unreg-v1-1-c30d9a754722@collabora.com>
 <3649004a.1f69.191445d79dc.Coremail.andyshrk@163.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <3649004a.1f69.191445d79dc.Coremail.andyshrk@163.com>
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

Hi Andy,

On 8/12/24 5:14 AM, Andy Yan wrote:
> 
> Hi Cristian,
> 
> At 2024-08-08 19:58:02, "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com> wrote:
>> Move rockchip_drm_platform_driver unregistration after its sub-drivers,
>> which ensures all drivers are unregistered in the reverse order used
>> when they were registered.
> 
> Would you please provied some detail information about how to reproduce this
> issue this patch try to fix？Or some kernel log when this issue   triggered。

I submitted this patch while investigating a couple of issues
encountered when tried to reload the rockchipdrm module. 

One was a system freeze, which eventually proved to have a different
root cause and got fixed via [1].  The other one was a lockdep splat
which seems to be caused by the switch to maple tree register cache in
vop2 - I have a regmap workaround, not yet sure that's a proper fix.

As of v6.11-rc1, reloading the module works fine, w/ or w/o this patch
applied (ignoring the above mentioned splat).  But I could only verify
on Rock 3A, hence unregistering the drivers in the correct order should,
at least, eliminate a potential source of unexpected behavior on the
other boards.

Regards,
Cristian

[1]: 9d42c3ee3ce3 ("arm64: dts: rockchip: Add missing power-domains for rk356x vop_mmu")

>> Fixes: 8820b68bd378 ("drm/rockchip: Refactor the component match logic.")
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>> drivers/gpu/drm/rockchip/rockchip_drm_drv.c | 3 +--
>> 1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
>> index 44d769d9234d..ca7b07503fbe 100644
>> --- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
>> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
>> @@ -528,10 +528,9 @@ static int __init rockchip_drm_init(void)
>>
>> static void __exit rockchip_drm_fini(void)
>> {
>> -	platform_driver_unregister(&rockchip_drm_platform_driver);
>> -
>> 	platform_unregister_drivers(rockchip_sub_drivers,
>> 				    num_rockchip_sub_drivers);
>> +	platform_driver_unregister(&rockchip_drm_platform_driver);
>> }
>>
>> module_init(rockchip_drm_init);
>>
>> ---
>> base-commit: 1eb586a9782cde8e5091b9de74603e0a8386b09e
>> change-id: 20240702-rk-drm-fix-unreg-9f3f29996a00
>> -- 
>> Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

