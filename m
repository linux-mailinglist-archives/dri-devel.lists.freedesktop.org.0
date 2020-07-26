Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C74C822DFE2
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jul 2020 17:03:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73D7889F2D;
	Sun, 26 Jul 2020 15:02:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA70289DFB
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jul 2020 10:17:49 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4BDzQh3DtGz1qrfg;
 Sun, 26 Jul 2020 12:17:48 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4BDzQh2grnz1qw6g;
 Sun, 26 Jul 2020 12:17:48 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id wIb5Xn2gAshz; Sun, 26 Jul 2020 12:17:47 +0200 (CEST)
X-Auth-Info: mVyJjM3NMiq81ULrxbJfIYiSRE8Ut2MZmTSlhp3fQ8Q=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Sun, 26 Jul 2020 12:17:46 +0200 (CEST)
Subject: Re: [PATCH 2/2] drm/bridge: tc358762: Add basic driver for Toshiba
 TC358762 DSI-to-DPI bridge
To: Sam Ravnborg <sam@ravnborg.org>
References: <20200725211457.5772-1-marex@denx.de>
 <20200725211457.5772-2-marex@denx.de> <20200726071517.GD1691925@ravnborg.org>
From: Marek Vasut <marex@denx.de>
Message-ID: <a8d6b9ad-a9c4-925b-e9f8-00c803b30e9a@denx.de>
Date: Sun, 26 Jul 2020 12:17:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200726071517.GD1691925@ravnborg.org>
Content-Language: en-US
X-Mailman-Approved-At: Sun, 26 Jul 2020 15:02:44 +0000
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
Cc: Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/26/20 9:15 AM, Sam Ravnborg wrote:
> Hi Marek.

Hi,

> On Sat, Jul 25, 2020 at 11:14:57PM +0200, Marek Vasut wrote:
>> Add very basic driver for Toshiba TC358762 DSI-to-DPI bridge, derived
>> from tc358764 driver and panel-raspberrypi-touchscreen. This driver is
>> meant to replace the panel-raspberrypi-touchscreen too, as the bridge
>> connection can be described in DT too.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> To: dri-devel@lists.freedesktop.org
>> Cc: Eric Anholt <eric@anholt.net>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: Sam Ravnborg <sam@ravnborg.org>
>> Cc: devicetree@vger.kernel.org
>> ---
> 
> Two general comments.
> - This driver should use the bridge panel - this will simplify the
>   driver in many places. We already have several good examples in-tree
>   that does this.

Can you list such an example ?

> - The driver does not respect the "flags" argument in the attach
>   operation. All new bridge drivers shall respect the flags operation to
>   prepare for use in a setup with chained bridges.
>   In short the flags is used to determine if the display driver or the
>   bridge creates the connector.
>   When the bridge panel is introduced you can drop all the connector
>   creation code and just pass the flag to the bridge panel.
>   The bridge panel will then create the connector if requested.
>   This is possible because this simple bridge driver does not add
>   anything to the connector that the bridge panel does not know.

OK
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
