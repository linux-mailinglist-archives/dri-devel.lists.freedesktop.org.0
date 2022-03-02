Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3CF4CAA09
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 17:22:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DAE910E1BA;
	Wed,  2 Mar 2022 16:22:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6CA710E1BA
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 16:22:11 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 16D1A83CB4;
 Wed,  2 Mar 2022 17:22:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1646238129;
 bh=Ui0lOUccZ2U3X4byTnnIyzbyt9V+lYdEnWlNlS8j40k=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=xQ1IDrJe2puN8YVLVeP7wsBdn6JprbXOHdr5lsJiU0AVnGVPHhHTXRaX2Q9s/8JNL
 SM3mC4zuMSxj6pyrUFjmvUFwFzJLGYGVziNOJbHXw655i6c9zESx5W6wbuBumVCP4u
 NAnvlntqgf4e58hdzZSuaEiXuGbDzFaF+wcI59O1B3G48TjhrFNl1jrQUeYyFTqd9E
 LOFSvQvtkbdVqWtZ00OXwMxsL29nP+AfzHsQJIlJvuL1jpJEcJtfizE01EfoZ8v62p
 TuJK9beVnNJBvMC0+sc4Gxi/eWmMi0uTZDTnsWr+U+pACf+uNIm0x0Q34p0/Emv+wV
 CuFuUPWdSgwyw==
Message-ID: <9c9a10ca-e6a1-c310-c0a5-37d4fed6efd6@denx.de>
Date: Wed, 2 Mar 2022 17:22:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [RFC PATCH] drm/panel: simple: panel-dpi: use bus-format to set
 bpc and bus_format
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>, Max Krummenacher <max.oss.09@gmail.com>
References: <20220222084723.14310-1-max.krummenacher@toradex.com>
 <20220223134154.oo7xhf37bgtvm3ai@houat>
 <b5f471f4-0712-b798-efb8-b5b481cdb898@denx.de>
 <CAEHkU3Womyq09Lz62SJohix5JywfKvBRvuWedqF1D7gvb+T2tQ@mail.gmail.com>
 <20220302142142.zroy464l5etide2g@houat>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20220302142142.zroy464l5etide2g@houat>
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
 Max Krummenacher <max.krummenacher@toradex.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, dri-devel@lists.freedesktop.org,
 DenysDrozdov <denys.drozdov@toradex.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/2/22 15:21, Maxime Ripard wrote:
> Hi,

Hi,

> Please try to avoid top posting
> 
> On Wed, Feb 23, 2022 at 04:25:19PM +0100, Max Krummenacher wrote:
>> The goal here is to set the element bus_format in the struct
>> panel_desc. This is an enum with the possible values defined in
>> include/uapi/linux/media-bus-format.h.
>>
>> The enum values are not constructed in a way that you could calculate
>> the value from color channel width/shift/mapping/whatever. You rather
>> would have to check if the combination of color channel
>> width/shift/mapping/whatever maps to an existing value and otherwise
>> EINVAL out.
>>
>> I don't see the value in having yet another way of how this
>> information can be specified and then having to write a more
>> complicated parser which maps the dt data to bus_format.
> 
> Generally speaking, sending an RFC without explicitly stating what you
> want a comment on isn't very efficient.

Isn't that what RFC stands for -- Request For Comment ?

> That being said, what I (and I can only assume Marek) don't like is the
> string encoding. Especially when the similar bus-type property uses a
> integer with the various available bus options we have.

Right, the string encoding isn't good.

> Having an integer, with a set of defines that you would map to the
> proper MEDIA_BUS_* would be more efficient and more elegant.
> 
> That being said, the first question that needs to be answered is why
> does this have to be in the DT in the first place?

Because panel-simple panel-dpi , you may need to specify the bus format 
between the last bridge and the panel .
