Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D56BEA9C1D1
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 10:45:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43B8C10E8CE;
	Fri, 25 Apr 2025 08:45:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=xs4all.nl header.i=@xs4all.nl header.b="t27exWrh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 667 seconds by postgrey-1.36 at gabe;
 Fri, 25 Apr 2025 08:45:51 UTC
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E9F410E8CE
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 08:45:47 +0000 (UTC)
X-KPN-MessageId: 38cf2ff0-21b0-11f0-bc2a-005056ab378f
Received: from smtp.kpnmail.nl (unknown [10.31.155.40])
 by ewsoutbound.so.kpn.org (Halon) with ESMTPS
 id 38cf2ff0-21b0-11f0-bc2a-005056ab378f;
 Fri, 25 Apr 2025 10:35:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=xs4all01;
 h=content-type:from:to:subject:mime-version:date:message-id;
 bh=8/yvxp3z86rFOheLRFHFBHKY1EtIc/D5T7iQnuCrnGI=;
 b=t27exWrhxfrd/PunXsL+ZON/teXOUj69jJjeYPGfTZDsKbU2UhY6QxA5jZzSC2UfHti+CtC2R3YA1
 2IsXKPGHqZyDmXCGVG1ocuiCaZbdz/PbJO+RwQmHPFtqnuQ379ia7IoJ56FXvxR5uyp2HBSvGXU/w1
 Z9p2CK+pULqCDhKP67uLZYhiaC3ymBvqV6fhQnTdg/GgMTgy6FvqbFqWiDPwTcQdqha3eAeMvwKqNV
 DS29lnDXjD4Qlvsq3awtRnnspWtKmCgoyMZW57lFwVfG6J+bJgoYIoDt5Ndg4YcB2cWAJUJqAqQOPS
 /PK7PcEKKutczhZAsCdqyck4dGTG43w==
X-KPN-MID: 33|RIBl8qxlgmujX1FKwnzX9VyDT0ZAKCskxgm1P0W9jXQ8nZR5BAM8OCvJo8UWjik
 QYKCL9im91mYQLHEnPxtOf00QLEo2aniGRp+aXvEOCRo=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|kGQgDhys4HLyRALAx1+V9H0952u3JpG31JHo29NpY2zKbQx4XFVTCuo4pjiOlhB
 VdHI+mBwEKxtWXkx1o1G1Nw==
X-Originating-IP: 80.60.128.215
Received: from [192.168.1.10] (80-60-128-215.fixed.kpn.net [80.60.128.215])
 by smtp.xs4all.nl (Halon) with ESMTPSA
 id 0336f9f5-21b0-11f0-855b-005056ab7584;
 Fri, 25 Apr 2025 10:34:36 +0200 (CEST)
Message-ID: <a00591dd-0698-4cd1-9715-446f973b877b@xs4all.nl>
Date: Fri, 25 Apr 2025 10:33:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/13] media: media/test_drivers: Replace open-coded
 parity calculation with parity_odd()
To: Kuan-Wei Chiu <visitorckw@gmail.com>, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
 jk@ozlabs.org, joel@jms.id.au, eajames@linux.ibm.com,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dmitry.torokhov@gmail.com,
 mchehab@kernel.org, awalls@md.metrocast.net, hverkuil@xs4all.nl,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 louis.peens@corigine.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, parthiban.veerasooran@microchip.com,
 arend.vanspriel@broadcom.com, johannes@sipsolutions.net,
 gregkh@linuxfoundation.org, jirislaby@kernel.org, yury.norov@gmail.com,
 akpm@linux-foundation.org, jdelvare@suse.com, linux@roeck-us.net,
 alexandre.belloni@bootlin.com, pgaj@cadence.com
Cc: hpa@zytor.com, alistair@popple.id.au, linux@rasmusvillemoes.dk,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, kuba@kernel.org, linux-kernel@vger.kernel.org,
 linux-fsi@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mtd@lists.infradead.org, oss-drivers@corigine.com,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
 linux-serial@vger.kernel.org, bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
 Frank.Li@nxp.com, linux-hwmon@vger.kernel.org,
 linux-i3c@lists.infradead.org, david.laight.linux@gmail.com,
 andrew.cooper3@citrix.com, Yu-Chun Lin <eleanor15x@gmail.com>
References: <20250409154356.423512-1-visitorckw@gmail.com>
 <20250409154356.423512-3-visitorckw@gmail.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20250409154356.423512-3-visitorckw@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 09/04/2025 17:43, Kuan-Wei Chiu wrote:
> Refactor parity calculations to use the standard parity_odd() helper.
> This change eliminates redundant implementations.
> 
> Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>

Reviewed-by: Hans Verkuil <hverkuil@xs4all.nl>

Regards,

	Hans

> ---
>  drivers/media/test-drivers/vivid/vivid-vbi-gen.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/test-drivers/vivid/vivid-vbi-gen.c b/drivers/media/test-drivers/vivid/vivid-vbi-gen.c
> index 70a4024d461e..5e1b7b1742e4 100644
> --- a/drivers/media/test-drivers/vivid/vivid-vbi-gen.c
> +++ b/drivers/media/test-drivers/vivid/vivid-vbi-gen.c
> @@ -5,6 +5,7 @@
>   * Copyright 2014 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
>   */
>  
> +#include <linux/bitops.h>
>  #include <linux/errno.h>
>  #include <linux/kernel.h>
>  #include <linux/ktime.h>
> @@ -165,12 +166,7 @@ static const u8 vivid_cc_sequence2[30] = {
>  
>  static u8 calc_parity(u8 val)
>  {
> -	unsigned i;
> -	unsigned tot = 0;
> -
> -	for (i = 0; i < 7; i++)
> -		tot += (val & (1 << i)) ? 1 : 0;
> -	return val | ((tot & 1) ? 0 : 0x80);
> +	return val | (parity_odd(val) ? 0 : 0x80);
>  }
>  
>  static void vivid_vbi_gen_set_time_of_day(u8 *packet)

