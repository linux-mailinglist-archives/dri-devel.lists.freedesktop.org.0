Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 052FF704794
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 10:17:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD62710E31E;
	Tue, 16 May 2023 08:17:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6479610E31E
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 08:17:21 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 30E228468B;
 Tue, 16 May 2023 10:17:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1684225037;
 bh=yPvt5y5uhVz+sR5dtIEiz9w9QTbalB57AOA/IUnmgDQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=0OnDW8Ok8Seps6JdjIbOkblnQL1BFVGL3zr9heLWV+mMbfoNU5+VR0G90NKXIE6tY
 tItrjew4iZdEBD2FdO/tjUP4NPbFAV11AIubueSVjrW+zsUH+HuvaV+sm3byYQg37E
 NtoSrMSPBVeoiaJIAfwmEBb6f5JK5rVDOYykrip/PaDuexe4/AuhIulGPH6bG1n9gY
 UVyhQeIuIeQ8KdPDPWcOedDaSWXjazlhkM0bkMM1uI3TdhD3P0sE1Q08KHs13XAWl6
 iSGUAtxUN8A5y1JrrnhBLkULZNzgFdDJfBGwOVmtBPn33OoroePCtKBLvlAD0M6pf1
 XTPI74rPmJP/w==
Message-ID: <62a849cf-46f4-b01b-15b7-6b2bafe2972f@denx.de>
Date: Tue, 16 May 2023 10:17:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm: bridge: dw-mipi-dsi: Drop panel_bridge post_disable
 call
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20230513201030.514861-1-marex@denx.de>
 <CAMty3ZCYCzawWuEGUWhsxSmuMORoeij=VEGGhn0-yRaQ7_1_uA@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAMty3ZCYCzawWuEGUWhsxSmuMORoeij=VEGGhn0-yRaQ7_1_uA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
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
Cc: Antonio Borneo <antonio.borneo@foss.st.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Robert Foss <robert.foss@linaro.org>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/16/23 10:12, Jagan Teki wrote:
> Hi Marek and Neil,
> 
> On Sun, May 14, 2023 at 1:40 AM Marek Vasut <marex@denx.de> wrote:
>>
>> This panel_bridge post_disable callback is called from the bridge chain now,
>> so drop the explicit call here. This fixes call imbalance, where this driver
>> does not call ->pre_enable, but does call ->post_disable . In case either of
>> the two callbacks implemented in one of the panel or bridge drivers contains
>> any operation with refcounted object, like regulator, this would make kernel
>> complain about the imbalance.
>>
>> This can be triggered e.g. with ST7701 driver, which operates on regulators
>> in its prepare/unprepare callbacks, which are called from pre_enable/post_disable
>> callbacks respectively. The former is called once, the later twice, during
>> entry to suspend.
>>
>> Drop the post_disable call to fix the imbalance.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
>> Cc: Antonio Borneo <antonio.borneo@foss.st.com>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
>> Cc: Jonas Karlman <jonas@kwiboo.se>
>> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
>> Cc: Marek Vasut <marex@denx.de>
>> Cc: Neil Armstrong <neil.armstrong@linaro.org>
>> Cc: Philipp Zabel <p.zabel@pengutronix.de>
>> Cc: Philippe Cornu <philippe.cornu@foss.st.com>
>> Cc: Robert Foss <robert.foss@linaro.org>
>> Cc: Vincent Abriou <vincent.abriou@st.com>
>> Cc: Yannick Fertre <yannick.fertre@foss.st.com>
>> Cc: dri-devel@lists.freedesktop.org
>> ---
>>   drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 9 ---------
>>   1 file changed, 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
>> index b2efecf7d1603..63ac972547361 100644
>> --- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
>> @@ -859,15 +859,6 @@ static void dw_mipi_dsi_bridge_post_atomic_disable(struct drm_bridge *bridge,
>>           */
>>          dw_mipi_dsi_set_mode(dsi, 0);
>>
>> -       /*
>> -        * TODO Only way found to call panel-bridge post_disable &
>> -        * panel unprepare before the dsi "final" disable...
>> -        * This needs to be fixed in the drm_bridge framework and the API
>> -        * needs to be updated to manage our own call chains...
>> -        */
>> -       if (dsi->panel_bridge->funcs->post_disable)
>> -               dsi->panel_bridge->funcs->post_disable(dsi->panel_bridge);
>> -
> 
> If my understanding was correct, the controller set the low-speed DCS
> in pre_enable and high-speed DCS in enable. So I'm thinking this
> explicit post_disable still needs to revert the operation within the
> bridge chain. I didn't test this but trying to understand how the
> existing behaviour is satisfied if we drop this.

Did I miss a panel_bridge pre_enable call somewhere in the driver ?
Where is it ?
