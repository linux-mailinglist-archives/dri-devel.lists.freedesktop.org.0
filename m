Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A117293578
	for <lists+dri-devel@lfdr.de>; Tue, 20 Oct 2020 09:05:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3974F6F42D;
	Tue, 20 Oct 2020 07:05:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7515A6EB33
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Oct 2020 22:13:42 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4CFWHT0mPTz1qs10;
 Tue, 20 Oct 2020 00:13:41 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4CFWHS6L9cz1qryN;
 Tue, 20 Oct 2020 00:13:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id KEx5f7bPGeSX; Tue, 20 Oct 2020 00:13:39 +0200 (CEST)
X-Auth-Info: pag2wJTMLh7Zd9lzZX5MS4JwxYpJf59o8e7wrPqoe48=
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue, 20 Oct 2020 00:13:39 +0200 (CEST)
Subject: Re: [PATCH] drm/stm: Fix bus_flags handling
To: Sam Ravnborg <sam@ravnborg.org>
References: <20201002230726.242035-1-marex@denx.de>
 <20201016174455.GB1333109@ravnborg.org>
From: Marek Vasut <marex@denx.de>
Message-ID: <643e1594-99aa-cd2a-fa6f-836d60e57cab@denx.de>
Date: Tue, 20 Oct 2020 00:13:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201016174455.GB1333109@ravnborg.org>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 20 Oct 2020 07:05:14 +0000
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
Cc: Alexandre Torgue <alexandre.torgue@st.com>,
 Antonio Borneo <antonio.borneo@st.com>, Philippe Cornu <philippe.cornu@st.com>,
 dri-devel@lists.freedesktop.org, Yannick Fertre <yannick.fertre@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Benjamin Gaignard <benjamin.gaignard@st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/16/20 7:44 PM, Sam Ravnborg wrote:
> Hi Marek.

Hi,

> On Sat, Oct 03, 2020 at 01:07:26AM +0200, Marek Vasut wrote:
>> The drm_display_mode_to_videomode() does not populate DISPLAY_FLAGS_DE_LOW
>> or DISPLAY_FLAGS_PIXDATA_NEGEDGE flags in struct videomode.
> 
> So after reading this paragrahp I assumed this patch would fix this, alas
> there is no changes to drm_modes.c.
> Rather than introducing hacks could we try to fix the root cause here?

Nope, this is a driver fix, hence the drm/stm tags.

> Root cause - as you point out is that there is missing some flags in
> the conversion.
> Another point is that the stm driver could drop the use of
> drm_display_mode_to_videomode() - all the information is available in drm_display_mode
> and using drm_display_mode_to_videomode() does not help much.

I kinda already have such a patch in the tree to remove this, but I want
to have a patch which fixes the problem described here and can be easily
backported to stable too.

> If the point is to have easier access to hsync and friendns maybe we
> should have a few helpers operating direct on display_mode and not this
> conversion to video_mode which is something that belongs to fbdev and
> should IMO not be used inside a drm driver.

Yep, that is for another patch though, because if that one breaks
something, I want to be able to bisect it.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
