Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21686A10A8E
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 16:20:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9980210E395;
	Tue, 14 Jan 2025 15:20:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="riwUrW3f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1931010E398
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 15:20:14 +0000 (UTC)
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 86A24465;
 Tue, 14 Jan 2025 16:19:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1736867955;
 bh=E+LfFSR0TiCUYUvQhtKoYO9UD7uJ02nPxkly44xOqck=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=riwUrW3f0p2bxLXV3gbTgsFtlEWNZb2XxnRxzZLkO0AoDd8R+6GOT7Ahs0bJB2kKG
 dZ6YB8rcE9fDGvgxD0fUl/kcykAdUENk5HpvCASkYPZdWOYnG6MXwlCgP6JAbsefsS
 1zQ6I6n40uW/47rD5yyB9WLZoJ1j+jbchEB9z3J0=
Message-ID: <0e0ee18e-28f6-4c57-a47d-cd7ace84fa70@ideasonboard.com>
Date: Tue, 14 Jan 2025 17:20:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 03/12] drm/bridge: cdns-dsi: Fix phy de-init and flag
 it so
To: Aradhya Bhatia <aradhya.bhatia@linux.dev>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
 Udit Kumar <u-kumar1@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20250114055626.18816-1-aradhya.bhatia@linux.dev>
 <20250114055626.18816-4-aradhya.bhatia@linux.dev>
 <84ca02de-9788-4e16-bf24-1651bd365ebd@ideasonboard.com>
 <7cfc1561-a229-43e7-b4bf-23ad258733c6@linux.dev>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 xsFNBE6ms0cBEACyizowecZqXfMZtnBniOieTuFdErHAUyxVgtmr0f5ZfIi9Z4l+uUN4Zdw2
 wCEZjx3o0Z34diXBaMRJ3rAk9yB90UJAnLtb8A97Oq64DskLF81GCYB2P1i0qrG7UjpASgCA
 Ru0lVvxsWyIwSfoYoLrazbT1wkWRs8YBkkXQFfL7Mn3ZMoGPcpfwYH9O7bV1NslbmyJzRCMO
 eYV258gjCcwYlrkyIratlHCek4GrwV8Z9NQcjD5iLzrONjfafrWPwj6yn2RlL0mQEwt1lOvn
 LnI7QRtB3zxA3yB+FLsT1hx0va6xCHpX3QO2gBsyHCyVafFMrg3c/7IIWkDLngJxFgz6DLiA
 G4ld1QK/jsYqfP2GIMH1mFdjY+iagG4DqOsjip479HCWAptpNxSOCL6z3qxCU8MCz8iNOtZk
 DYXQWVscM5qgYSn+fmMM2qN+eoWlnCGVURZZLDjg387S2E1jT/dNTOsM/IqQj+ZROUZuRcF7
 0RTtuU5q1HnbRNwy+23xeoSGuwmLQ2UsUk7Q5CnrjYfiPo3wHze8avK95JBoSd+WIRmV3uoO
 rXCoYOIRlDhg9XJTrbnQ3Ot5zOa0Y9c4IpyAlut6mDtxtKXr4+8OzjSVFww7tIwadTK3wDQv
 Bus4jxHjS6dz1g2ypT65qnHen6mUUH63lhzewqO9peAHJ0SLrQARAQABzTBUb21pIFZhbGtl
 aW5lbiA8dG9taS52YWxrZWluZW5AaWRlYXNvbmJvYXJkLmNvbT7CwY4EEwEIADgWIQTEOAw+
 ll79gQef86f6PaqMvJYe9QUCX/HruAIbAwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgAAKCRD6
 PaqMvJYe9WmFD/99NGoD5lBJhlFDHMZvO+Op8vCwnIRZdTsyrtGl72rVh9xRfcSgYPZUvBuT
 VDxE53mY9HaZyu1eGMccYRBaTLJSfCXl/g317CrMNdY0k40b9YeIX10feiRYEWoDIPQ3tMmA
 0nHDygzcnuPiPT68JYZ6tUOvAt7r6OX/litM+m2/E9mtp8xCoWOo/kYO4mOAIoMNvLB8vufi
 uBB4e/AvAjtny4ScuNV5c5q8MkfNIiOyag9QCiQ/JfoAqzXRjVb4VZG72AKaElwipiKCWEcU
 R4+Bu5Qbaxj7Cd36M/bI54OrbWWETJkVVSV1i0tghCd6HHyquTdFl7wYcz6cL1hn/6byVnD+
 sR3BLvSBHYp8WSwv0TCuf6tLiNgHAO1hWiQ1pOoXyMEsxZlgPXT+wb4dbNVunckwqFjGxRbl
 Rz7apFT/ZRwbazEzEzNyrBOfB55xdipG/2+SmFn0oMFqFOBEszXLQVslh64lI0CMJm2OYYe3
 PxHqYaztyeXsx13Bfnq9+bUynAQ4uW1P5DJ3OIRZWKmbQd/Me3Fq6TU57LsvwRgE0Le9PFQs
 dcP2071rMTpqTUteEgODJS4VDf4lXJfY91u32BJkiqM7/62Cqatcz5UWWHq5xeF03MIUTqdE
 qHWk3RJEoWHWQRzQfcx6Fn2fDAUKhAddvoopfcjAHfpAWJ+ENc7BTQROprNHARAAx0aat8GU
 hsusCLc4MIxOQwidecCTRc9Dz/7U2goUwhw2O5j9TPqLtp57VITmHILnvZf6q3QAho2QMQyE
 DDvHubrdtEoqaaSKxKkFie1uhWNNvXPhwkKLYieyL9m2JdU+b88HaDnpzdyTTR4uH7wk0bBa
 KbTSgIFDDe5lXInypewPO30TmYNkFSexnnM3n1PBCqiJXsJahE4ZQ+WnV5FbPUj8T2zXS2xk
 0LZ0+DwKmZ0ZDovvdEWRWrz3UzJ8DLHb7blPpGhmqj3ANXQXC7mb9qJ6J/VSl61GbxIO2Dwb
 xPNkHk8fwnxlUBCOyBti/uD2uSTgKHNdabhVm2dgFNVuS1y3bBHbI/qjC3J7rWE0WiaHWEqy
 UVPk8rsph4rqITsj2RiY70vEW0SKePrChvET7D8P1UPqmveBNNtSS7In+DdZ5kUqLV7rJnM9
 /4cwy+uZUt8cuCZlcA5u8IsBCNJudxEqBG10GHg1B6h1RZIz9Q9XfiBdaqa5+CjyFs8ua01c
 9HmyfkuhXG2OLjfQuK+Ygd56mV3lq0aFdwbaX16DG22c6flkkBSjyWXYepFtHz9KsBS0DaZb
 4IkLmZwEXpZcIOQjQ71fqlpiXkXSIaQ6YMEs8WjBbpP81h7QxWIfWtp+VnwNGc6nq5IQDESH
 mvQcsFS7d3eGVI6eyjCFdcAO8eMAEQEAAcLBXwQYAQIACQUCTqazRwIbDAAKCRD6PaqMvJYe
 9fA7EACS6exUedsBKmt4pT7nqXBcRsqm6YzT6DeCM8PWMTeaVGHiR4TnNFiT3otD5UpYQI7S
 suYxoTdHrrrBzdlKe5rUWpzoZkVK6p0s9OIvGzLT0lrb0HC9iNDWT3JgpYDnk4Z2mFi6tTbq
 xKMtpVFRA6FjviGDRsfkfoURZI51nf2RSAk/A8BEDDZ7lgJHskYoklSpwyrXhkp9FHGMaYII
 m9EKuUTX9JPDG2FTthCBrdsgWYPdJQvM+zscq09vFMQ9Fykbx5N8z/oFEUy3ACyPqW2oyfvU
 CH5WDpWBG0s5BALp1gBJPytIAd/pY/5ZdNoi0Cx3+Z7jaBFEyYJdWy1hGddpkgnMjyOfLI7B
 CFrdecTZbR5upjNSDvQ7RG85SnpYJTIin+SAUazAeA2nS6gTZzumgtdw8XmVXZwdBfF+ICof
 92UkbYcYNbzWO/GHgsNT1WnM4sa9lwCSWH8Fw1o/3bX1VVPEsnESOfxkNdu+gAF5S6+I6n3a
 ueeIlwJl5CpT5l8RpoZXEOVtXYn8zzOJ7oGZYINRV9Pf8qKGLf3Dft7zKBP832I3PQjeok7F
 yjt+9S+KgSFSHP3Pa4E7lsSdWhSlHYNdG/czhoUkSCN09C0rEK93wxACx3vtxPLjXu6RptBw
 3dRq7n+mQChEB1am0BueV1JZaBboIL0AGlSJkm23kw==
In-Reply-To: <7cfc1561-a229-43e7-b4bf-23ad258733c6@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 14/01/2025 16:44, Aradhya Bhatia wrote:
> Hi Tomi,
> 
> On 1/14/25 18:00, Tomi Valkeinen wrote:
>> Hi,
>>
>> On 14/01/2025 07:56, Aradhya Bhatia wrote:
>>> From: Aradhya Bhatia <a-bhatia1@ti.com>
>>>
>>> The driver code doesn't have a Phy de-initialization path as yet, and so
>>> it does not clear the phy_initialized flag while suspending. This is a
>>> problem because after resume the driver looks at this flag to determine
>>> if a Phy re-initialization is required or not. It is in fact required
>>> because the hardware is resuming from a suspend, but the driver does not
>>> carry out any re-initialization causing the D-Phy to not work at all.
>>>
>>> Call the counterparts of phy_init() and phy_power_on(), that are
>>> phy_exit() and phy_power_off(), from _bridge_disable(), and clear the
>>> flags so that the Phy can be initialized again when required.
>>>
>>> Fixes: fced5a364dee ("drm/bridge: cdns: Convert to phy framework")
>>> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
>>> Signed-off-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
>>> ---
>>>    drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 6 +++++-
>>>    1 file changed, 5 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
>>> b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
>>> index 056583e81155..039c5eb7fb66 100644
>>> --- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
>>> +++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
>>> @@ -672,6 +672,11 @@ static void cdns_dsi_bridge_disable(struct
>>> drm_bridge *bridge)
>>>        if (dsi->platform_ops && dsi->platform_ops->disable)
>>>            dsi->platform_ops->disable(dsi);
>>>    +    dsi->phy_initialized = false;
>>> +    dsi->link_initialized = false;
>>> +    phy_power_off(dsi->dphy);
>>> +    phy_exit(dsi->dphy);
>>> +
>>
>> The phy related lines are counterparts to what's done in
>> cdns_dsi_hs_init(), right? Maybe add cdns_dsi_hs_uninit(),
>>
>> But is the phy_initialized even needed? phy_initialized() is called from
>> cdns_dsi_bridge_enable() and cdns_dsi_bridge_pre_enable(). Won't the
>> call in cdns_dsi_bridge_enable() be always skipped, as
>> cdns_dsi_bridge_pre_enable() already set phy_initialized?
> 
> Yes, that is how the behavior has been. The initialization calls inside
> the _bridge_enable() end-up getting skipped.
> 
> My first thought after reading your comments was to remove the init
> calls entirely from the _bridge_pre_enable(), and drop the
> phy_initialized flag too, and let _bridge_enable() only handle the init.

Isn't that the wrong way around? If currently bridge_pre_enable enables 
the phy, your suggestion above would change that. I would think keeping 
the init calls in bridge_pre_enable, and drop from bridge_enable.

> The _bridge_enable() will anyway get renamed to _bridge_pre_enable(),
> while the existing _bridge_pre_enable() will get dropped, by the last
> patch of this series.

Ok, but you can't do a fix that'll only be right after some future patch 
does more changes =).

> But since this patch is intended as a fix, it will get applied to
> previous versions while that last patch of the series won't... and then

Speaking of which, I think you should cc: stable for the ones that 
should be applied to earlier kernels. And it would be good to have all 
such patches first in the series, to decrease any dependencies.

> we may end up having init calls only from _bridge_enable() for the older
> versions.
> Also, given all the fixes in the series, there is a possibility that an
> older-version of the driver might become functional (except for the
> color shift issue).
> 
> My question then is, would it be a cause for concern if all the init
> calls are handled from the _bridge_enable() only?

I'm not sure I follow here. Don't we want the init calls to happen in 
the pre_enable phase, both before and after the sequence change (patch 12)?

But generally speaking, yes, it's good to keep fixes simple, and do 
cleanups later on top. Keeping that in mind, maybe this current patch is 
fine as it is. Although... if the init is done in pre_enable, shouldn't 
the deinit be done in post_disable?

> (one of the potential concerns detailed below)
> 
>>
>> Same question for cdns_dsi_init_link(), although that's also called from
>> cdns_dsi_transfer(), so we probably need dsi->link_initialized.
>>
> 
> Don't you think we'd need the phy to also be initialized for the DCS
> command to work?

I'm sure we do. But the driver doesn't do that currently, does it? Which 
I did find a bit odd, but I'm not familiar with the HW.

However, my comment was related to calling cdns_dsi_init_link() in both 
cdns_dsi_bridge_enable and cdns_dsi_bridge_pre_enable functions. In this 
case the call in the cdns_dsi_bridge_enable function is a no-op, similar 
to calling cdns_dsi_hs_init().

But, if changed, that's also a cleanup, so maybe better keep away from 
fix patches.

> Usually, since DSI is among the initial bridges to get pre_enabled, the
> Link and Phy are both initialized by the time cdns_dsi_transfer() is
> called. So, even if cdns_dsi_transfer() doesn't call for
> cdns_dsi_hs_init(), it is able to work fine.
> 
> If DCS commands do indeed require the cdns_dsi_hs_init(), then shifting
> it to _bridge_enable() (like I suggested above) would be problematic
> without fixing it here.

I don't know what how the HW works, but we definitely need PHY to send 
DCS commands. But we don't necessarily need HS mode, LP works fine 
(usually). It's just not clear to me what exactly cdns_dsi_hs_init() and 
cdns_dsi_init_link() do. What is "link"? Looks like cdns_dsi_init_link 
is doing some PHY stuff, which is kind of strange thing to do, as 
phy_init() and phy_power_on() are only done later.

In any case, yes, the cdns_dsi_transfer() has to make sure we have LP/HS 
working. So indeed it might mean calling both functions. This is, 
however, perhaps a different topic, best left out of this series.

  Tomi

