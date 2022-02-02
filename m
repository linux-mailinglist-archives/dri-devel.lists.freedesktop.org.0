Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D66E14A723F
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 14:53:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D82FB10E790;
	Wed,  2 Feb 2022 13:53:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50A9B10E790
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 13:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gyLaoh+vsDn3ZLnoONwAHHTpsR6J1Z9CuQ+OvRZ9enE=; b=flM2BnQ5KQAexOGKaVlzvwcnfr
 vn5QMPloAshCuKdKrAiW6O4odl5ey1mMlBIRh+7KLZt0IUL1ViO+OUpjE6S8Ep+iDXeTpkaAIRyuF
 owQUeJHuHHlW+4lFG6fymhacCupI+huRQzQvew+pkIhpMaHyNt/E2d/wpGh34rsC5/hB+IW5aaKCA
 QKIrVaihQYD7bX4zDxBJD9HxJu16lqG1173E7DKk2Pzp/2u15QZzs1lKwd4pv2OSkP3ZNLOMLimyQ
 Cnmi7tidaMjs6jeTdID7D7OPsZW7ZrXqb1WiwvJQhkBtCwRvVlAj4p5Mc/wY/GrGHzP4fVgbsP+iG
 oQ39TnWQ==;
Received: from [2a01:799:95e:a400:cca0:57ac:c55d:a485] (port=54700)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1nFG4l-0003AS-OS; Wed, 02 Feb 2022 14:53:35 +0100
Message-ID: <261c76d6-6bb9-1fe1-6560-58af5ba240dd@tronnes.org>
Date: Wed, 2 Feb 2022 14:53:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 3/3] drm/panel: Add MIPI DBI compatible SPI driver
To: Maxime Ripard <maxime@cerno.tech>
References: <20220125175700.37408-1-noralf@tronnes.org>
 <20220125175700.37408-4-noralf@tronnes.org>
 <20220127100452.bmxcgf6ye3nxrgtq@houat>
 <fff71d01-e1c9-2b0f-e4b2-9abb107f7770@tronnes.org>
 <20220202100953.pymb6blsqlaw7jv6@houat>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220202100953.pymb6blsqlaw7jv6@houat>
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
Cc: devicetree@vger.kernel.org, david@lechnology.com,
 dave.stevenson@raspberrypi.com, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, thierry.reding@gmail.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 02.02.2022 11.09, skrev Maxime Ripard:
> On Thu, Jan 27, 2022 at 06:53:48PM +0100, Noralf Trønnes wrote:
>>>> +struct panel_mipi_dbi_config {
>>>> +	/* Magic string: panel_mipi_dbi_magic */
>>>> +	u8 magic[15];
>>>> +
>>>> +	/* Config file format version */
>>>> +	u8 file_format_version;
>>>> +
>>>> +	/* Width in pixels */
>>>> +	__be16 width;
>>>> +	/* Height in pixels */
>>>> +	__be16 height;
>>>> +
>>>> +	/* Width in millimeters (optional) */
>>>> +	__be16 width_mm;
>>>> +	/* Height in millimeters (optional) */
>>>> +	__be16 height_mm;
>>>> +
>>>> +	/* X-axis panel offset */
>>>> +	__be16 x_offset;
>>>> +	/* Y-axis panel offset */
>>>> +	__be16 y_offset;
>>>> +
>>>> +	/* 4 pad bytes, must be zero */
>>>> +	u8 pad[4];
>>>> +
>>>> +	/*
>>>> +	 * Optional MIPI commands to execute when the display pipeline is enabled.
>>>> +	 * This can be used to configure the display controller.
>>>> +	 *
>>>> +	 * The commands are stored in a byte array with the format:
>>>> +	 *     command, num_parameters, [ parameter, ...], command, ...
>>>> +	 *
>>>> +	 * Some commands require a pause before the next command can be received.
>>>> +	 * Inserting a delay in the command sequence is done by using the NOP command with one
>>>> +	 * parameter: delay in miliseconds (the No Operation command is part of the MIPI Display
>>>> +	 * Command Set where it has no parameters).
>>>> +	 *
>>>> +	 * Example:
>>>> +	 *     command 0x11
>>>> +	 *     sleep 120ms
>>>> +	 *     command 0xb1 parameters 0x01, 0x2c, 0x2d
>>>> +	 *     command 0x29
>>>> +	 *
>>>> +	 * Byte sequence:
>>>> +	 *     0x11 0x00
>>>> +	 *     0x00 0x01 0x78
>>>> +	 *     0xb1 0x03 0x01 0x2c 0x2d
>>>> +	 *     0x29 0x00
>>>> +	 */
>>>> +	u8 commands[];
>>>> +};
>>>
>>> I'm not really a fan of parsing raw data in the kernel. I guess we can't
>>> really avoid the introduction of a special case to sleep, but we already
>>> have dt properties for all of the other properties (but X and Y offset,
>>> maybe?)
>>>
>>> Maybe we should use those instead?
>>
>> I don't understand your reluctance to parsing data, lots of ioctls do
>> it.
> 
> The reluctance comes from the parsing itself: you need to have input
> validation, and it's hard to get right. The less we have, the easier it
> gets.
> 
>> And this data can only be loaded by root. What I like about having
>> these properties in the config file is that the binding becomes a
>> fallback binding that can actually be made to work without changing the
>> Device Tree.
>>
>> For arguments sake let's say tiny/st7735r.c was not built and we had
>> this node:
>>
>> display@0{
>> 	compatible = "jianda,jd-t18003-t01", "sitronix,st7735r",
>> "panel-mipi-dbi-spi";
>> };
>>
>> It will still be possible to use this display without changing the
>> Device Tree. Just add a firmware/config file.
>>
>> Having the properties in DT it would have to look like this for the
>> fallback to work:
>>
>> display@0{
>> 	compatible = "jianda,jd-t18003-t01", "sitronix,st7735r",
>> "panel-mipi-dbi-spi";
>> 	panel-timing = {
>> 		hactive = <128>;
>> 		vactive = <128>;
>> 	};
>> 	width-mm = <25>;
>> 	height-mm = <26>;
>> 	x-offset = <2>;
>> 	y-offset = <3>;
>> };
>>
>> Is this important, I'm not sure. What do you think?
> 
> Parts of it is ergonomics I guess. We're used to having all those
> properties either in the DT or the driver, but here we introduce a new
> way that isn't done anywhere else.
> 
> And I don't see any real downside to putting it in the DT? It's going to
> be in an overlay, under the user's control anyway, right?
> 

Ok, I'll spin a new version using DT properties.

Noralf.
