Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 152E19A137B
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 22:12:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD6C210E77A;
	Wed, 16 Oct 2024 20:11:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="GQUKy8HH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91D9C10E770
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 20:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1729109515;
 bh=wMMMSBEtO//hNRrqnvuJxHE7i3VytWAet/SFOjJlcPg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=GQUKy8HHXHg7k/uaFBtaX446bbWo/EEXU6VejI+SL02D40oY3f7hd8BrPBJneJ49n
 nIqJEy+sYkmmtf7b1az/b7AqehAGL7655wy8z9kKk8mFlswhgOVESkCcB9hlYIPxKt
 UNo2Y/MYZq/OniClYOj+6fyg0U7ZR4wXwaSJjEExoyZRgNcLklnlTqwsDVGe/hFHfW
 uoCc5Q2knfDiTQU93gJipKttIHVonkViRijZ854hekKLuMg0hSJ8IWae4vj0pxSGrF
 kMEP+25j9Ezqu3ryUSSoy0YQR/TyNzCqPMnaHC+uV2QLPLLgUuyzUWZU9IytQ05024
 NvbjuwNpSueUg==
Received: from [192.168.1.90] (unknown [188.24.146.62])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id F1F5D17E36CA;
 Wed, 16 Oct 2024 22:11:53 +0200 (CEST)
Message-ID: <e5f1d4ea-4b8d-4f42-9025-5291baddf7e5@collabora.com>
Date: Wed, 16 Oct 2024 23:11:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/3] drm/rockchip: Add basic RK3588 HDMI output support
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Mark Yao <markyao0591@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 kernel@collabora.com, Alexandre ARNOUD <aarnoud@me.com>,
 Luis de Arquer <ldearquer@gmail.com>, Algea Cao <algea.cao@rock-chips.com>
References: <20241010-b4-rk3588-bridge-upstream-v9-0-68c47dde0410@collabora.com>
 <20241010-b4-rk3588-bridge-upstream-v9-3-68c47dde0410@collabora.com>
 <3wjk75z2ozz2lg7qx6by3phjoe2brov6rz4jezpowrreedjua6@wt2js5hzqqdi>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <3wjk75z2ozz2lg7qx6by3phjoe2brov6rz4jezpowrreedjua6@wt2js5hzqqdi>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 10/16/24 12:27 PM, Uwe Kleine-König wrote:
> Hello,
> 
> On Thu, Oct 10, 2024 at 01:40:51AM +0300, Cristian Ciocaltea wrote:
>> +struct platform_driver dw_hdmi_qp_rockchip_pltfm_driver = {
>> +	.probe  = dw_hdmi_qp_rockchip_probe,
>> +	.remove_new = dw_hdmi_qp_rockchip_remove,
>> +	.driver = {
>> +		.name = "dwhdmiqp-rockchip",
>> +		.pm = &dw_hdmi_qp_rockchip_pm,
>> +		.of_match_table = dw_hdmi_qp_rockchip_dt_ids,
>> +	},
>> +};
> 
> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers. Please just drop "_new".
> 
> Additionally I suggest to drop one of the white spaces between .probe
> and =.

Handled both in v10 [1].

Thanks,
Cristian

[1] https://lore.kernel.org/all/20241016-b4-rk3588-bridge-upstream-v10-0-87ef92a6d14e@collabora.com/
