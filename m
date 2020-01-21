Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A33144D86
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 09:23:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 987226FAED;
	Wed, 22 Jan 2020 08:22:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 477 seconds by postgrey-1.36 at gabe;
 Tue, 21 Jan 2020 21:30:20 UTC
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4167788830
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 21:30:20 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 482M1n32PCz1qqkg;
 Tue, 21 Jan 2020 22:22:21 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 482M1n0XB8z1qwXd;
 Tue, 21 Jan 2020 22:22:21 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id v1ehCpYUl4BC; Tue, 21 Jan 2020 22:22:19 +0100 (CET)
X-Auth-Info: JdDdtOo0Op1/Vvk/mJowZKUgz0y2r9iKg7GMIc8hnEc=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue, 21 Jan 2020 22:22:19 +0100 (CET)
Subject: Re: [PATCH] drm/imx: parallel-display: Adjust bus_flags and
 bus_format handling
To: Stefan Agner <stefan@agner.ch>
References: <20191114131751.26746-1-marex@denx.de>
 <6a2e711d186e216f34c6cbd5b66f2a19@agner.ch>
From: Marek Vasut <marex@denx.de>
Message-ID: <d52d2145-d260-eaf1-de3b-a140198dc0cc@denx.de>
Date: Tue, 21 Jan 2020 22:22:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <6a2e711d186e216f34c6cbd5b66f2a19@agner.ch>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 22 Jan 2020 08:21:10 +0000
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
Cc: David Airlie <airlied@linux.ie>, Sascha Hauer <s.hauer@pengutronix.de>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/14/19 2:50 PM, Stefan Agner wrote:
> On 2019-11-14 14:17, Marek Vasut wrote:
>> The bus_flags and bus_format handling logic does not seem to cover
>> all potential usecases. Specifically, this seems to fail with an
>> "edt,etm0700g0edh6" display attached to an 24bit display interface,
>> with interface-pix-fmt = "rgb24" set in DT.
>>
>> In this specific setup, the panel-simple.c driver entry for the display
>> sets .bus_flags to non-zero value. However, as imxpd->bus_format is set
>> from the DT property "interface-pix-fmt", imx_pd_encoder_atomic_check()
>> will set imx_crtc_state->bus_flags = imxpd->bus_flags even though the
>> imxpd->bus_flags is zero, while the di->bus_flags is correctly set by
>> the panel-simple.c and non-zero. The result is incorrect flags being
>> used for the display configuration and thus an image corruption.
>> (Specifically, DRM_BUS_FLAG_PIXDATA_POSEDGE is not propagated and thus
>> the ipuv3 clocks pixels on the wrong edge).
>>
>> This patch fixes the problem by overriding the imx_crtc_state->bus_format
>> from the imxpd->bus_format only if the DT property "interface-pix-fmt" is
>> present or if the DI provides no formats. Similarly for bus_flags, which
>> are set from imxpd->bus_flags only if the DI provides no formats.
> 
> So this basically prioritizes imxpd->bus_format over what the display
> provides? Is this correct in all situations?
> 
> I was thinking that interface-pix-fmt is the legacy way to define the
> bus format and it should be provided by the display nowadays.
> 
> However, I guess there is the case where you connect a 18-bit display to
> a 24-bit bus (leaving some bits unconnected). Depending on how the
> colors/bits are distributed one cannot use 18-bit mode on SoC side but
> has to use 24-bit. So the bus format becomes a connection specific
> property... I guess the interface-pix-fmt can serve that role. 

So, can this patch go in ? It's fixing an actual issue for me -- very
much what Stefan described above.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
