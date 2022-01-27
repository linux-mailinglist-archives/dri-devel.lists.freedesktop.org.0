Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4775C49EC71
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 21:26:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D8E910E79D;
	Thu, 27 Jan 2022 20:26:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36B1610E79D
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 20:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Yfi4JO+rb2gOsgn4TFlquEVKiqVN/RBXx2TthsuV8Jk=; b=CBs8jEnBavzR6azVsJMjoM8W9A
 SDdzXZTTaH8ENzaAwqQq2Sh3oJK83ItcQpiCZczJSKjBfu0ZJT0FIAhQSTFuL4CBguZwlpLwLJ9Ph
 2z6Uitc4tOs/3gFgiWDIBznXtzw9ekimAKNbxXgP/+MAjOSK8g0Y12oZkqJ0VUCjiuTAo/7t5QMh5
 DvetSQ08xx5cw/uv5cCTR7aQlvJFqw1dTxbKF4ErXdThx4y2k6+U0r2wqih/PfRfyqMtOT6bH+3c0
 U3quUgoO8439bIb5IYenNvkP8c65A32pc4CGXvIrd2LslqcU6neKhqNvZAXhGbyN5rt3fiDzt5Zsk
 SCurYt6w==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:63033
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1nDBLl-0004V0-3i; Thu, 27 Jan 2022 21:26:33 +0100
Message-ID: <d7bc7ab2-29bc-12bc-db9c-466592addfc1@tronnes.org>
Date: Thu, 27 Jan 2022 21:26:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 3/3] drm/panel: Add MIPI DBI compatible SPI driver
To: Sam Ravnborg <sam@ravnborg.org>
References: <20220125175700.37408-1-noralf@tronnes.org>
 <20220125175700.37408-4-noralf@tronnes.org> <YfL5ptT3Kw1ohC/1@ravnborg.org>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <YfL5ptT3Kw1ohC/1@ravnborg.org>
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
 robh+dt@kernel.org, thierry.reding@gmail.com, maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 27.01.2022 20.59, skrev Sam Ravnborg:
> Hi Noralf,
> 
> On Tue, Jan 25, 2022 at 06:57:00PM +0100, Noralf Trønnes wrote:
>> Add a driver that will work with most MIPI DBI compatible SPI panels.
>> This avoids adding a driver for every new MIPI DBI compatible controller
>> that is to be used by Linux. The 'compatible' Device Tree property with
>> a '.bin' suffix will be used to load a firmware file that contains the
>> controller configuration.
> 
> Loading a configuration from a firmware file is very
> elegant - I like.
> This will be very useful in a million cases with a lot of small panels!
> 

Yes I really hope we can find a way to get this accepted.

>> +
>> +	/*
>> +	 * Optional MIPI commands to execute when the display pipeline is enabled.
>> +	 * This can be used to configure the display controller.
>> +	 *
>> +	 * The commands are stored in a byte array with the format:
>> +	 *     command, num_parameters, [ parameter, ...], command, ...
>> +	 *
>> +	 * Some commands require a pause before the next command can be received.
>> +	 * Inserting a delay in the command sequence is done by using the NOP command with one
>> +	 * parameter: delay in miliseconds (the No Operation command is part of the MIPI Display
>> +	 * Command Set where it has no parameters).
>> +	 *
>> +	 * Example:
>> +	 *     command 0x11
>> +	 *     sleep 120ms
>> +	 *     command 0xb1 parameters 0x01, 0x2c, 0x2d
>> +	 *     command 0x29
>> +	 *
>> +	 * Byte sequence:
>> +	 *     0x11 0x00
>> +	 *     0x00 0x01 0x78
>> +	 *     0xb1 0x03 0x01 0x2c 0x2d
>> +	 *     0x29 0x00
>> +	 */
> Using a binary file that is unreadable when it is first created is less
> elegant.
> I am sure you have considered a txt file - and I know parsing a txt file
> in prone for more errros than parsing a binary file.
> 
> 
> But if the text file looked like:
> "
> 	# The is a comment
> 	cmd 0x11 0x00
> 
> 	# We need to sleep
> 	sleepms 120
> 
> 	# Do something more
> 	cmd 0xb1 0x03 0x01 0x2c 0x2d
> 	cmd 0x29 0x00
> "
> 
> The file is easier to comment (document) and easier to read and
> modify.
> The suffix could be ".panel" to tell this is something specific for
> a panel.
> Using lib/parser could make the code somewhat simple but I did not try
> to code it myself.
> 
> The code you included below for the binary file is very simple,
> but you shift the burden to the people who have to create binary files.
> And people using obscure displays are not always so good at this stuff.
> 

Parsing text files in the kernel sounds very scary, not something that I
would like to try.

I will make a script that generates and parses the binary representation
(which is big endian so it's somewhat readable with xxd or the like).
There's a wiki link in the MAINTAINERS entry that will have info about
the format including the script. It will also serve as a place to share
config snippets/script incantations for displays.

I will make the script when the file format is decided upon. Here's the
hack I currently use:
https://gist.github.com/notro/3ca61c48e7dcc4a0ef34dbadbc30bfa5

Noralf.
