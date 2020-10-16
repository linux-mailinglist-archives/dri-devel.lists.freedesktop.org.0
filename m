Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 586232913F1
	for <lists+dri-devel@lfdr.de>; Sat, 17 Oct 2020 21:05:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F7946E20B;
	Sat, 17 Oct 2020 19:04:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2C906EE3F
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Oct 2020 17:16:28 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4CCXqt1MC1z1qs39;
 Fri, 16 Oct 2020 19:16:26 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4CCXqs6tWNz1qvgZ;
 Fri, 16 Oct 2020 19:16:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id rO_PnB00SBqX; Fri, 16 Oct 2020 19:16:23 +0200 (CEST)
X-Auth-Info: u48+n1/+Hd+tGuTlZUlVRaBSedtZemDDrMYmC6ozLN0=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Fri, 16 Oct 2020 19:16:23 +0200 (CEST)
Subject: Re: [RFC][PATCH] drm/bridge: lvds-codec: Add support for pixel data
 sampling edge select
To: Sam Ravnborg <sam@ravnborg.org>
References: <20201002230823.242147-1-marex@denx.de>
 <20201016162553.GA1333109@ravnborg.org>
From: Marek Vasut <marex@denx.de>
Message-ID: <42115980-41ed-b73c-9c46-16af2b3a51a7@denx.de>
Date: Fri, 16 Oct 2020 19:16:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201016162553.GA1333109@ravnborg.org>
Content-Language: en-US
X-Mailman-Approved-At: Sat, 17 Oct 2020 19:04:47 +0000
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
Cc: Benjamin Gaignard <benjamin.gaignard@st.com>,
 Antonio Borneo <antonio.borneo@st.com>, Philippe Cornu <philippe.cornu@st.com>,
 dri-devel@lists.freedesktop.org, Yannick Fertre <yannick.fertre@st.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, Vincent Abriou <vincent.abriou@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Alexandre Torgue <alexandre.torgue@st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/16/20 6:25 PM, Sam Ravnborg wrote:
> Hi Marek.

Hello Sam,

> On Sat, Oct 03, 2020 at 01:08:23AM +0200, Marek Vasut wrote:
>> The OnSemi FIN3385 Parallel-to-LVDS encoder has a dedicated input line to
>> select input pixel data sampling edge. Add DT property "pixelclk-active",
>> same as the one used by display timings, and configure bus flags based on
>> this DT property.
> 
> Why is it that this information cannot come from the panel driver?

Because the sampling edge of the panel can be different (is there even
such an edge for LVDS panel?). What we care about specifying here is the
edge on which the FIN3385 samples the data on the Parallel bus, and that
is a property of the FIN3385, because that is configured via a dedicated
pin on the FIN3385.

> The property tell when data are sampled and the FIN3385 Parallel-to-LVDS
> is the one that transmit the data - not then one that samples the data.
> Correct?

Not correct I'm afraid, see above.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
