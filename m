Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB46A9331B9
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 21:14:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4343610E877;
	Tue, 16 Jul 2024 19:14:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="lvJQ9aB6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E717310E877
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 19:14:19 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 6474E8881D;
 Tue, 16 Jul 2024 21:14:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1721157258;
 bh=awnqlGqMwGLUHgbLwB8m4Ybfwee+dxX+vxx4wn86s6o=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=lvJQ9aB6fsnJ5Sc7vr/gEMYaP4nCJf+rsJ5k3mxcycJm2YRmOdwp+v3aYLN836A3G
 zvdmS4UVABFqsMdkVmWLWimSZQIqo35/+5EddOCNE+Gxx8iEjg9S8wXanw8UyAn7dV
 YfiqwpmhDvRueZ0B5tZ438vJ9hRGKGwi+bs/Kfhx+exHEAWDqOJ+dzUICqrdi1YrPq
 nT5XlSgSFeal2Sv34FeTFWYdMM4EWcb98iCGMw7NhkTNWlfgOaP7K3weyS3niOiNpa
 +Ikgq+08w6CVuPGeN6BHSjjTeiKCCfLqVZidYGPSxfodEbr61TVXfO4oJvie1OwNcv
 ri4B5FGo+5jpQ==
Message-ID: <091542bc-7d52-4444-aab8-85f765ad99dc@denx.de>
Date: Tue, 16 Jul 2024 20:43:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm: bridge: samsung-dsim: Initialize bridge on
 attach
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Michael Walle <mwalle@kernel.org>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org
Cc: Adam Ford <aford173@gmail.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, kernel@dh-electronics.com
References: <20240625122824.148163-1-marex@denx.de>
 <4603431.cEBGB3zze1@steina-w> <f90aa303-f18b-4cca-bb7a-f94f74dfee36@denx.de>
 <D29SIGP58O7E.3AJ5VRGQ4I1VN@kernel.org>
 <CGME20240711153825eucas1p2f3be863ea60d080e1c15d1b3d6570069@eucas1p2.samsung.com>
 <1867bfd6-ad00-46a7-8bad-4a4441d9854c@denx.de>
 <7efa1605-bdec-42b1-8a9f-363a70b78017@samsung.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <7efa1605-bdec-42b1-8a9f-363a70b78017@samsung.com>
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

On 7/11/24 5:57 PM, Marek Szyprowski wrote:
> On 11.07.2024 17:38, Marek Vasut wrote:
>> On 6/26/24 10:02 AM, Michael Walle wrote:
>>> On Wed Jun 26, 2024 at 5:21 AM CEST, Marek Vasut wrote:
>>>> Thank you for testing and keeping up with this. I will wait for more
>>>> feedback if there is any (Frieder? Lucas? Michael?). If there are no
>>>> objections, then I can merge it in a week or two ?
>>>
>>> I'll try to use your approach on the tc358775. Hopefully, I'll find
>>> some time this week.
>>
>> So ... I wonder ... shall I apply these patches or not ?
>>
>> I'll wait about a week or two before applying them, to get some input.
>>
> I've pointed that they break current users of Samsung DSIM: Exynos-DSI
> and Samsung s6e3ha2/s6e3hf2 panels, but unfortunately I'm not able to
> provide datasheet nor any other documentation. Due to other tasks and
> holidays I'm not able to debug it further too, at least till the end of
> August. Maybe we could keep old behavior for "exynos-dsi" compatible device?

Nope, let's not pile up workarounds. It would be good to figure out why 
does this display misbehave when the data lanes are in LP11 on start up. 
It seems most sinks do require data lanes in LP11 on start up, so what 
is special about this panel ? Do you have access to the datasheet and 
can you check once you're back ?
