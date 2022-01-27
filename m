Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F1949EC54
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 21:15:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5986210E6F5;
	Thu, 27 Jan 2022 20:15:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 964 seconds by postgrey-1.36 at gabe;
 Thu, 27 Jan 2022 20:15:44 UTC
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88DA210E6F5
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 20:15:44 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id c8b4e11e-7fab-11ec-b20b-0050568c148b;
 Thu, 27 Jan 2022 20:00:32 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 3B1CE194B3D;
 Thu, 27 Jan 2022 20:59:38 +0100 (CET)
Date: Thu, 27 Jan 2022 20:59:34 +0100
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v2 3/3] drm/panel: Add MIPI DBI compatible SPI driver
Message-ID: <YfL5ptT3Kw1ohC/1@ravnborg.org>
References: <20220125175700.37408-1-noralf@tronnes.org>
 <20220125175700.37408-4-noralf@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220125175700.37408-4-noralf@tronnes.org>
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

Hi Noralf,

On Tue, Jan 25, 2022 at 06:57:00PM +0100, Noralf Trønnes wrote:
> Add a driver that will work with most MIPI DBI compatible SPI panels.
> This avoids adding a driver for every new MIPI DBI compatible controller
> that is to be used by Linux. The 'compatible' Device Tree property with
> a '.bin' suffix will be used to load a firmware file that contains the
> controller configuration.

Loading a configuration from a firmware file is very
elegant - I like.
This will be very useful in a million cases with a lot of small panels!

> +
> +	/*
> +	 * Optional MIPI commands to execute when the display pipeline is enabled.
> +	 * This can be used to configure the display controller.
> +	 *
> +	 * The commands are stored in a byte array with the format:
> +	 *     command, num_parameters, [ parameter, ...], command, ...
> +	 *
> +	 * Some commands require a pause before the next command can be received.
> +	 * Inserting a delay in the command sequence is done by using the NOP command with one
> +	 * parameter: delay in miliseconds (the No Operation command is part of the MIPI Display
> +	 * Command Set where it has no parameters).
> +	 *
> +	 * Example:
> +	 *     command 0x11
> +	 *     sleep 120ms
> +	 *     command 0xb1 parameters 0x01, 0x2c, 0x2d
> +	 *     command 0x29
> +	 *
> +	 * Byte sequence:
> +	 *     0x11 0x00
> +	 *     0x00 0x01 0x78
> +	 *     0xb1 0x03 0x01 0x2c 0x2d
> +	 *     0x29 0x00
> +	 */
Using a binary file that is unreadable when it is first created is less
elegant.
I am sure you have considered a txt file - and I know parsing a txt file
in prone for more errros than parsing a binary file.


But if the text file looked like:
"
	# The is a comment
	cmd 0x11 0x00

	# We need to sleep
	sleepms 120

	# Do something more
	cmd 0xb1 0x03 0x01 0x2c 0x2d
	cmd 0x29 0x00
"

The file is easier to comment (document) and easier to read and
modify.
The suffix could be ".panel" to tell this is something specific for
a panel.
Using lib/parser could make the code somewhat simple but I did not try
to code it myself.

The code you included below for the binary file is very simple,
but you shift the burden to the people who have to create binary files.
And people using obscure displays are not always so good at this stuff.

Sorry that I do not include code to do the above, but let me know if
this would help to convince you.

	Sam - who has been absent due to house renovation and such
