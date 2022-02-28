Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 101E24C6091
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 02:04:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3C3310E1F7;
	Mon, 28 Feb 2022 01:04:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F222910E1F7
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 01:04:37 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id A2F9B83A45;
 Mon, 28 Feb 2022 02:04:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1646010276;
 bh=OJNMnUVNafU61yaAHKLvz4SdZo43KUrxCkhls87bHnM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=A/cQxmUOCwoMiKgPmxfpfZVzIVKnk7z0GlLFOq2xH1otWtFAZXTLuqINcUDQ9I/VU
 fYeqCB1r156xFXY05NqawtQptAYOgACtMn6l6cPQ1fBz+CLoQdfavU2PtQt0FnXSA0
 +rJNJGpoTG8iUDsEmSYqYfupwfCVYH99gJjEqhglPGtDWm1P/A35Eonj8d2wZeqOqa
 Ns0t4r3zH+1Fnoi6ohM5lOisuYaO9vZX848HCmQTpi6e8YYoExNGHpC8PyzDqw0aC7
 cOvN6pDaUVDUUKs6fsuPvZSbZpuYiMfLwPXkluPZSVj4lIKK84mqEhR6Upz1lfwpcB
 iPtQbYRauoSNA==
Message-ID: <4be01be7-decb-881c-ec3d-fb583feaed35@denx.de>
Date: Mon, 28 Feb 2022 02:04:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH V2] drm/imx: parallel-display: Remove bus flags check in
 imx_pd_bridge_atomic_check()
Content-Language: en-US
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Max Krummenacher <max.oss.09@gmail.com>
References: <20220201113643.4638-1-cniedermaier@dh-electronics.com>
 <36f517300a15b2460a02512ef3c5814ad0ed2290.camel@gmail.com>
 <e00e00585b9945e396bdc3bbd8f30f7e@dh-electronics.com>
 <20220221092908.6d8d18c5@collabora.com>
 <c91e56b7d56381722c923455a78435fe130a2182.camel@gmail.com>
 <20220221133141.06171584@collabora.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20220221133141.06171584@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
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
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 "Marek MV. Vasut\"" <marex@denx.de>, David Airlie <airlied@linux.ie>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org\""
 <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/21/22 13:31, Boris Brezillon wrote:
> On Mon, 21 Feb 2022 12:56:43 +0100
> Max Krummenacher <max.oss.09@gmail.com> wrote:
> 
>> Am Montag, den 21.02.2022, 09:29 +0100 schrieb Boris Brezillon:
>>> Hello Christoph,
>>>
>>> On Sat, 19 Feb 2022 09:28:44 +0000
>>> Christoph Niedermaier <cniedermaier@dh-electronics.com> wrote:
>>>    
>>>> From: Max Krummenacher [mailto:max.oss.09@gmail.com]
>>>> Sent: Wednesday, February 9, 2022 10:38 AM
>>>>>> If display timings were read from the devicetree using
>>>>>> of_get_display_timing() and pixelclk-active is defined
>>>>>> there, the flag DISPLAY_FLAGS_SYNC_POSEDGE/NEGEDGE is
>>>>>> automatically generated. Through the function
>>>>>> drm_bus_flags_from_videomode() e.g. called in the
>>>>>> panel-simple driver this flag got into the bus flags,
>>>>>> but then in imx_pd_bridge_atomic_check() the bus flag
>>>>>> check failed and will not initialize the display. The
>>>>>> original commit fe141cedc433 does not explain why this

Can you please update the commit message to fix the following warning:

Please use git commit description style 'commit <12+ chars of sha1> 
("<title line>")' - ie: 'commit fe141cedc433 ("drm/imx: pd: Use bus 
format/flags provided by the bridge when available")'

Also, collect the AB from Boris and TB from Max.

I can also fix it up for you while applying if that's OK with you.

[...]

> Acked-by: Boris Brezillon <boris.brezillon@collabora.com>

[...]
