Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4CA92A73E
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 18:24:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52B3F10E032;
	Mon,  8 Jul 2024 16:24:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="jeibj9US";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A98B810E032
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2024 16:24:47 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id E7FCC887B9;
 Mon,  8 Jul 2024 18:24:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1720455885;
 bh=+fEyfp1GigiHxYcbx1OC+XWY6BBrzyHXvIiRSE3vRVE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jeibj9UStOPEmgyTMI+6d51OA3GIqKhlFw+jq/qRMkQj80rGlh/gOm9DJa61X00r+
 YK+ZluUVaRXaxvMnVVbVFulVJlIcLRg0DevuIgq3AzCU7QQ1H2vsCItMN/HDvdIXZt
 7AY9DY7BaxBb+3i4VAp60wsMfIKGFtGuNOvq1wkvtxYH5dy4iSpXXIV3Bn2vJ+igVW
 souaJKeV21C+tbaA4HxceTXeh1MKV5DTFamS5+NXy3s1a0XvbJBg/9nQccIPI0z9/r
 r1R0Fy6Db2edOEfx8Okn6wsW4a8k2tiN4oolYyfVUUMIl8VvVnUK6iTWO/ysTErPLd
 JyLu9QcZkv61Q==
Message-ID: <c2ef6725-77db-4497-9c24-fcce660ee6d7@denx.de>
Date: Mon, 8 Jul 2024 17:06:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/bridge: tc358767: Add configurable default
 preemphasis
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, kernel@dh-electronics.com
References: <20240625120552.145389-1-marex@denx.de>
 <20240625120552.145389-2-marex@denx.de> <3293850.oiGErgHkdL@steina-w>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <3293850.oiGErgHkdL@steina-w>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
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

On 6/26/24 9:36 AM, Alexander Stein wrote:

Hi,

sorry for the late reply.

>> @@ -2435,6 +2454,18 @@ static int tc_probe_bridge_endpoint(struct tc_data *tc)
>>   			return -EINVAL;
>>   		}
>>   		mode |= BIT(endpoint.port);
>> +		if (endpoint.port != 2)
>> +			continue;
>> +
> 
> Mh, I know currently there are not other port-specific properties. But
> maybe it's easier to read if 'if (endpoint.port == 2) {' is used.

Fixed in V4, thanks.
