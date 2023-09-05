Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DF57920B6
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 09:29:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84B9F10E170;
	Tue,  5 Sep 2023 07:28:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34CFE10E170
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Sep 2023 07:28:58 +0000 (UTC)
Received: from [192.168.88.20] (91-154-35-171.elisa-laajakaista.fi
 [91.154.35.171])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 010F875A;
 Tue,  5 Sep 2023 09:27:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1693898850;
 bh=YDBn83stNaIyB8qi40ouh5bQCgQ5cePLUssJVTBscBA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=glrpcfk66Xeaj4rD/X7cGTI3QLZznxGWzhXfktYs9PRo/v+M01AoA47sOKTUEhnhX
 F2CO4ObFlFKymwUcsBMwBxiUiV4wUUoUdE+gEOQPd0egI7dxDl2RMEGw9W6Pwu07hO
 DEX/9xJui3eNbpfl2JFusUv/lMhlyJilKj6t0LWw=
Message-ID: <139ce49f-43b4-928d-b11d-460917bf08bb@ideasonboard.com>
Date: Tue, 5 Sep 2023 10:28:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 12/12] drm/bridge: tc358768: Attempt to fix DSI
 horizontal timings
Content-Language: en-US
To: Marcel Ziswiler <marcel.ziswiler@toradex.com>
References: <20230822-tc358768-v3-0-c82405dac0c1@ideasonboard.com>
 <20230822-tc358768-v3-12-c82405dac0c1@ideasonboard.com>
 <303db6b68b5cb4bc73cd0b8c190e3e92498caab3.camel@toradex.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <303db6b68b5cb4bc73cd0b8c190e3e92498caab3.camel@toradex.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "rfoss@kernel.org" <rfoss@kernel.org>,
 "francesco@dolcini.it" <francesco@dolcini.it>,
 "a-bhatia1@ti.com" <a-bhatia1@ti.com>, "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "maxim.schwalm@gmail.com" <maxim.schwalm@gmail.com>,
 "peter.ujfalusi@gmail.com" <peter.ujfalusi@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/09/2023 21:46, Marcel Ziswiler wrote:
> Hi Tomi
> 
> Looks good. Thanks! Tested both on Verdin AM62 as well as on Verdin iMX8M Mini.
> 
> Just a minor nit-pick in your code comment further below.
> 
> On Tue, 2023-08-22 at 19:19 +0300, Tomi Valkeinen wrote:
>> The DSI horizontal timing calculations done by the driver seem to often
>> lead to underflows or overflows, depending on the videomode.
>>
>> There are two main things the current driver doesn't seem to get right:
>> DSI HSW and HFP, and VSDly. However, even following Toshiba's
>> documentation it seems we don't always get a working display.
>>
>> This patch attempts to fix the horizontal timings for DSI event mode, and
>> on a system with a DSI->HDMI encoder, a lot of standard HDMI modes now
>> seem to work. The work relies on Toshiba's documentation, but also quite
>> a bit on empirical testing.
>>
>> This also adds timing related debug prints to make it easier to improve
>> on this later.
>>
>> The DSI pulse mode has only been tested with a fixed-resolution panel,
>> which limits the testing of different modes on DSI pulse mode. However,
>> as the VSDly calculation also affects pulse mode, so this might cause a
>> regression.
>>
>> Reviewed-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> 
> For the whole series:
> 
> Tested-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Thanks! I have fixed the typo in the comment.

  Tomi

