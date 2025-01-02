Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C42019FF56B
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2025 02:16:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A57FE10E194;
	Thu,  2 Jan 2025 01:16:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="fvERMY/l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76C0F10E194
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2025 01:16:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AF8B7101EC109; Thu,  2 Jan 2025 02:16:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
 t=1735780605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8IiIpR9DfcQjayuPZyMADd99s6bWfl3m1k54kgdyFao=;
 b=fvERMY/lW31isDSn3fgXjpZ2G1otuqVdUQAorL/Gp5da1mASvfyWDkilYEQmLAoHm64Klw
 0YIog945ZpeZgRA6zKi3NX1LEklFle9pYcUqe9xxgDVl7uSCht35n6hThkydRlbaB5cn18
 I4HoSMC9PyQllLYK1c8kS1BnydELXKYs1vstEkTP3r2TV/37EgW/Y5hxXNJOW9/iFQRirW
 udbJB0NAqxDFZd2F0pbR8talHv+n1busI0IJSh3o7tTRkSSHHyPwviuhxbeCyO+4h6HqAR
 Hg8e/c2WFQ4hMyq/Dln4mspdpKlwqXhqe4mZUY2LyRp8nVfqyLkivHgt0HZ6zg==
Message-ID: <4e9aed87-b3fd-456d-b39a-caf3c7e729fa@denx.de>
Date: Thu, 2 Jan 2025 02:15:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] drm: bridge: dw_hdmi: Add flag to indicate output
 port is optional
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>, 
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Liu Ying <victor.liu@nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Robert Foss <rfoss@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Stefan Agner <stefan@agner.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20241231192925.97614-1-marex@denx.de>
 <20241231203136.GD31768@pendragon.ideasonboard.com>
 <88778e2b-8c43-46a1-bb79-0d9c968a5233@denx.de>
 <20250101223620.GA7206@pendragon.ideasonboard.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20250101223620.GA7206@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
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

On 1/1/25 11:36 PM, Laurent Pinchart wrote:
> On Tue, Dec 31, 2024 at 10:10:51PM +0100, Marek Vasut wrote:
>> On 12/31/24 9:31 PM, Laurent Pinchart wrote:
>>> Hi Marek,
>>
>> Hi,
>>
>>> Thank you for the patch.
>>>
>>> On Tue, Dec 31, 2024 at 08:28:48PM +0100, Marek Vasut wrote:
>>>> Add a flag meant purely to work around broken i.MX8MP DTs which enable
>>>> HDMI but do not contain the HDMI connector node. This flag allows such
>>>> DTs to work by creating the connector in the HDMI bridge driver. Do not
>>>> use this flag, do not proliferate this flag, please fix your DTs.
>>>
>>> What's the rationale for this, what prevents fixing DT instead of using
>>> this flag ? Adding such a flag will most likely open the door to
>>> proliferation.
>>
>> See the V2 series discussion, there are a few in-tree DTs which do not
>> have the HDMI connector node. The rationale is there might be more and
>> they might come from vendors, so this flag is necessary to work around
>> those DTs.
>>
>>> If you can't fix the DT on particular boards, patching it could be an
>>> option. We had a similar problem on Renesas boards, which we fixed with
>>> a DT overlay, see commit 81c0e3dd82927064 ("drm: rcar-du: Fix legacy DT
>>> to create LVDS encoder nodes"). This made the workaround self-contained,
>>> and allowed dropping it several kernel versions later (in commit
>>> 841281fe52a769fe, "drm: rcar-du: Drop LVDS device tree backward
>>> compatibility").
>>
>> Frankly, I would much rather fix the few in-tree DTs and mandate the
>> HDMI connector node in DT, which would keep the code simple, rather than
>> maintain a backward compatibility workaround for problem which might not
>> even exist.
> 
> The in-tree device tree sources should be converted as part of the
> series, I don't see a point trying to maintain backward compatibility
> for in-tree DT sources.

That's fine, that I can do.

> For out-of-tree sources it depends on how likely the problem is. There's
> no regression if nobody is affected. I personally like restricting
> backward compatibility to the strict minimum, to ensure that all new DTs
> will use proper bindings. Making the backward compatibility code
> self-contained helps there, and we could also print a loud warning
> (WARN_ON() seems appropriate) and set a date for the removal of the
> workaround.
The other alternative would be to not add the workaround at all, and 
wait if someone is going to complain about broken downstream DT. If so, 
then it can be added. I would much rather prefer this simple option, 
because I have this feeling there are not going to be (m)any broken 
downstream DTs, but I might be wrong about that.
