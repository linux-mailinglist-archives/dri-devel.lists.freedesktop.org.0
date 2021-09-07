Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6A2403037
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 23:24:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83EA76E0DB;
	Tue,  7 Sep 2021 21:24:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 145B46E0DB
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 21:24:25 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 0297481A26;
 Tue,  7 Sep 2021 23:24:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1631049863;
 bh=MpnORCZP4wWcRrnsqdj38UBjwNh7+AUhOVe8i3ZtCGU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=d+MYd14PCzSvc7/AjWQzOfQdrukiwgG//RK8iqNQvn1RX/8hLFi6SxTdyenjHO6z0
 ZgPfaT9OBqSDgU+VK9T0qe5oUS+6oQ4898NOWS1/80KWEmiB8QGyvrolBzn0W6oOqT
 Tk7vhzEPXj0Y2lLARkysnkHstFZ3nijW/beZdaAomoQ8Dw49Xn/8gCWtzlkwyXk+iE
 eQ4Ly11qa7a8riVQBGsTqD5TjKAeRhuKsF0ZfZHqS7t2s44CE3ie9CTeuvsSrQOVHq
 PmAygDDIBQRzMpjlpPN8zUGvPyE7MSisTvhk5C7cDp7fVI88cGWLRAyU7uv6SRSKTD
 wEDpKxk4h2rXA==
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi83: Check link status register
 after enabling the bridge
To: Andrzej Hajda <a.hajda@samsung.com>, dri-devel@lists.freedesktop.org
Cc: Jagan Teki <jagan@amarulasolutions.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Robert Foss <robert.foss@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
References: <20210907023948.871281-1-marex@denx.de>
 <CGME20210907073151eucas1p196543fbd114f34f6de700013fd0e4168@eucas1p1.samsung.com>
 <2f530ec2-3781-67eb-6f34-c7b6a29641ea@samsung.com>
 <6544aaba-a3e3-f3f6-32d9-5c396df52601@denx.de>
 <9b3d6595-0330-f716-b443-95f3f4783ac4@samsung.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <2bf8e1fe-3f55-85ab-715a-c53ad98bb6d2@denx.de>
Date: Tue, 7 Sep 2021 23:24:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <9b3d6595-0330-f716-b443-95f3f4783ac4@samsung.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/7/21 7:29 PM, Andrzej Hajda wrote:
> 
> W dniu 07.09.2021 o 16:25, Marek Vasut pisze:
>> On 9/7/21 9:31 AM, Andrzej Hajda wrote:
>>> On 07.09.2021 04:39, Marek Vasut wrote:
>>>> In rare cases, the bridge may not start up correctly, which usually
>>>> leads to no display output. In case this happens, warn about it in
>>>> the kernel log.
>>>>
>>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>>> Cc: Jagan Teki <jagan@amarulasolutions.com>
>>>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>>> Cc: Linus Walleij <linus.walleij@linaro.org>
>>>> Cc: Robert Foss <robert.foss@linaro.org>
>>>> Cc: Sam Ravnborg <sam@ravnborg.org>
>>>> Cc: dri-devel@lists.freedesktop.org
>>>> ---
>>>> NOTE: See the following:
>>>> https://e2e.ti.com/support/interface-group/interface/f/interface-forum/942005/sn65dsi83-dsi83-lvds-bridge---sporadic-behavior---no-video
>>>>
>>>> https://community.nxp.com/t5/i-MX-Processors/i-MX8M-MIPI-DSI-Interface-LVDS-Bridge-Initialization/td-p/1156533
>>>>
>>>> ---
>>>>     drivers/gpu/drm/bridge/ti-sn65dsi83.c | 5 +++++
>>>>     1 file changed, 5 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
>>>> b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
>>>> index a32f70bc68ea4..4ea71d7f0bfbc 100644
>>>> --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
>>>> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
>>>> @@ -520,6 +520,11 @@ static void sn65dsi83_atomic_enable(struct
>>>> drm_bridge *bridge,
>>>>         /* Clear all errors that got asserted during initialization. */
>>>>         regmap_read(ctx->regmap, REG_IRQ_STAT, &pval);
>>>>         regmap_write(ctx->regmap, REG_IRQ_STAT, pval);
>>>
>>>
>>> It does not look as correct error handling, maybe it would be good to
>>> analyze and optionally report 'unexpected' errors here as well.
>>
>> The above is correct -- it clears the status register because the
>> setup might've set random bits in that register. Then we wait a bit,
>> let the link run, and read them again to get the real link status in
>> this new piece of code below, hence the usleep_range there. And then
>> if the link indicates a problem, we know it is a problem.
> 
> 
> Usually such registers are cleared on very beginning of the
> initialization, and tested (via irq handler, or via reading), during
> initalization, if initialization phase goes well. If it is not the case
> forgive me.

The init just flips the bit at random in the IRQ_STAT register, so no, 
that's not really viable here. That's why we clear them at the end, and 
then wait a bit, and then check whether something new appeared in them.

If not, all is great.

Sure, we could generate an IRQ, but then IRQ line is not always 
connected to this chip on all hardware I have available. So this gives 
the user at least some indication that something is wrong with their HW.

>>>> +
>>>> +    usleep_range(10000, 12000);
>>>> +    regmap_read(ctx->regmap, REG_IRQ_STAT, &pval);
>>>> +    if (pval)
>>>> +        dev_err(ctx->dev, "Unexpected link status 0x%02x\n", pval);
>>>
>>>
>>> I am not sure what is the case here but it looks like 'we do not know
>>> what is going on, so let's add some diagnostic messages to gather info
>>> and figure it out later'.
>>
>> That's pretty much the case, see the two links above in the NOTE
>> section. If something goes wrong, we print the value for the user
>> (usually developer) so they can fix their problems. We cannot do much
>> better in the attach callback.
>>
>> The issue I ran into (and where this would be helpful information to
>> me during debugging, since the issue happened real seldom, see also
>> the NOTE links above) is that the DSI controller driver started
>> streaming video on the data lanes before the DSI83 had a chance to
>> initialize. This worked most of the time, except for a few exceptions
>> here and there, where the video didn't start. This does set link
>> status bits consistently. In the meantime, I fixed the controller
>> driver (so far downstream, due to ongoing discussion).
> 
> 
> Maybe drm_connector_set_link_status_property(conn,
> DRM_MODE_LINK_STATUS_BAD) would be usefule here.

Hmm, this works on connector, the dsi83 is a bridge and it can be stuck 
between two other bridges. That doesn't seem like the right tool, no ?

>>> Whole driver lacks IRQ handler which IMO could perform better diagnosis,
>>> and I guess it could also help in recovery, but this is just my guess.
>>> So if this patch is enough for now you can add:
>>
>> No, IRQ won't help you here, because by the time you get the IRQ, the
>> DSI host already started streaming video on data lanes and you won't
>> be able to correctly reinit the DSI83 unless you communicate to the
>> DSI host that it should switch the data lanes back to LP11.
>>
>> And for that, there is a bigger chunk missing really. What needs to be
>> added is a way for the DSI bridge / panel to communicate its needs to
>> the DSI host -- things like "I need DSI clock lane frequency f MHz, I
>> need clock lane in HS mode and data lanes in LP11 mode". If you look
>> at the way DSI hosts and bridges/panels work out the DSI link
>> parameters, you will notice they basically do it each on their own,
>> there is no such API or communication channel.
> 
> 
> There is one-time communication channel via mipi_dsi_attach, it allows
> to set max frequency i HS and LP, choose mode of operation (HS/LPM) and
> few more things. If it is necessary to extend it please propse sth.

Well, take for example the drivers/gpu/drm/exynos/exynos_drm_dsi.c , 
there is this:

static void exynos_dsi_enable(struct drm_encoder *encoder)
...
                 list_for_each_entry_reverse(iter, &dsi->bridge_chain,
                                             chain_node) {
                         if (iter->funcs->pre_enable)
                                 iter->funcs->pre_enable(iter);
...
         exynos_dsi_set_display_mode(dsi);
         exynos_dsi_set_display_enable(dsi, true);
...
                 list_for_each_entry(iter, &dsi->bridge_chain, chain_node) {
                         if (iter->funcs->enable)
                                 iter->funcs->enable(iter);
                 }
...

So the bridge enable callback is called with clock lane already in HS 
mode, and data lanes streaming video. This doesn't work with the DSI83, 
which would need clock lane in HS and providing clock , but data lanes 
in LP11 with no video.

Sure, I could probably move exynos_dsi_set_display_enable(dsi, true); 
after the enable call, but is that really the right solution ? What 
about bridges which need some other specific configuration of the data 
lanes during init ?

> Regarding requesting LP11 I am not sure if we really should have such
> low level communication. LP11, as I remember ,is initial state in HS so
> it should be set anyway, before starting video transmission.

Well, see above, that's the problem I ran across recently.

> And maybe this is the main problem:
> 
> DRM core calls:
> 
> crtc->enable
> 
> bridges->pre_enable,
> 
> encoder->enable,
> 
> bridges->enable.
> 
> 
> Usually video transmission starts in crtc->enable (CRTC->Encoder), and
> in encoder->enable (encoder->bridge), so in bridges->enable it would be
> too late for LP11 state - transmission can be already in progress.
> 
> It shows well that this order of calls does not fit well to DSI, and
> probably many other protocols.
> 
> Maybe moving most of the bridge->enable code to bridge->pre_enable would
> help, but I am not sur if it will not pose another issues.

Yep, that won't work e.g. with the exynos DSIM, because 
exynos_dsi_set_display_mode() sets the data lanes to LP11.

> This is quick analysis, so please fix me if I am wrong.

I pretty much agree that the current state of things does not fit with 
DSI too well.
