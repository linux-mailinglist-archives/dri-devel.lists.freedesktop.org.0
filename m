Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 663BB9538FD
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2024 19:27:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60B9510E4A3;
	Thu, 15 Aug 2024 17:27:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=cristian.ciocaltea@collabora.com header.b="kFX92+ZB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9441910E4A3
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2024 17:27:18 +0000 (UTC)
Delivered-To: kernel@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1723742822; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=chmoEqwf+/HX3ADYKvNk7Ng/Vy9TRVLgDl8UmqtgvL10PCDu9BDSycvb8n8ig9CBjgjFZ2RykxFu4el6Z8ZGjTNpUeL30GUZbhhRXH6+z3IP4Ch+0oNBCAFeDx2txS81kMK6hXN3OZxJVxyU6WhSpKvnhhAVDlyB8Js33Cvc/do=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1723742822;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=7ubLrdWiAuaARtSKkJ+5UEopClt1Yb7V+WKhakMp2tM=; 
 b=E5aSY2DwZSZaKgg12dAJqKN9/FlAnx8etLqUPwRou1OJDID6OH0buupg+kvlJlDMQrhwV3/q//G4zsEFGPmrfskT0R9jgAztWFwIaaXPHEjibX3hOCJQD+hkYCGSZlHdmGv50GxVi83Gs93litKOmRdN0mHEXGukT2IbGxXO2mo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=cristian.ciocaltea@collabora.com;
 dmarc=pass header.from=<cristian.ciocaltea@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1723742822; 
 s=zohomail; d=collabora.com; i=cristian.ciocaltea@collabora.com;
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=7ubLrdWiAuaARtSKkJ+5UEopClt1Yb7V+WKhakMp2tM=;
 b=kFX92+ZBJEF3qr2ZiFa2KMXfiIvV5/FB5K/T1hbxvA5TiTa4cW1EKmOZ34CP+MSd
 BkSjdghnDfh9yf+3T/LY1/bElXQIHGTlZFjq8wghPoVSfs4uSNbNdqRL7Yv3hLFTJye
 G1dvj1moMblGf5nvnh77qw/kgiWGd/KsZKEFncbw=
Received: by mx.zohomail.com with SMTPS id 1723742819663277.3175685898667;
 Thu, 15 Aug 2024 10:26:59 -0700 (PDT)
Message-ID: <80ffed99-7368-4f84-8dc9-4c980055e48d@collabora.com>
Date: Thu, 15 Aug 2024 20:26:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] drm/rockchip: Unregister platform drivers in
 reverse order
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <seanpaul@chromium.org>, Jeffy Chen <jeffy.chen@rock-chips.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Mark Yao <markyao0591@gmail.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240808-rk-drm-fix-unreg-v1-1-c30d9a754722@collabora.com>
 <9027071.qdD9tO9HgI@diego>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Content-Language: en-US
In-Reply-To: <9027071.qdD9tO9HgI@diego>
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

On 8/15/24 5:21 PM, Heiko Stübner wrote:
> Am Donnerstag, 8. August 2024, 13:58:02 CEST schrieb Cristian Ciocaltea:
>> Move rockchip_drm_platform_driver unregistration after its sub-drivers,
>> which ensures all drivers are unregistered in the reverse order used
>> when they were registered.
> 
> are you sure about that?
> 
> I.e. currently rockchip_drm_init() does 
>   platform_register_drivers(rockchip_sub_drivers, ...)
> to register the sub-drivers and only after that registers the main
> drm-platform-driver
> 
> rockchip_drm_fini currently does the reverse of first unregistering the
> main drm-platform-driver and after that unregistering the array of sub-
> drivers.
> 
> 
> So as it stands right now, rockchip_drm_fini does already do exactly the
> reverse when de-registering.

Indeed, somehow I overlooked this while debugging some module unloading
issues.  I guess it just felt more naturally to have the subdrivers
unregistered first.

Out of curiosity to see if there's a common pattern for handling this, I
found that most drivers do indeed unregister the subdrivers before the main
platform one, but weirdly enough, some of them do also keep the same order
on registration, similarily to what this patch unintentionally does:

  drivers/power/supply/ab8500_charger.c
  drivers/gpu/drm/vc4/vc4_drv.c
  drivers/gpu/drm/mcde/mcde_drv.c

Not sure if those are potential mistakes, or maybe it doesn't really matter?!

Please let me know if you have a preference for it, and I'll update the
patch accordingly, otherwise let's just ignore it altogether.

Thanks,
Cristian

