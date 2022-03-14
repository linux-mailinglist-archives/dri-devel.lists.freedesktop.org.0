Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6EF4D8941
	for <lists+dri-devel@lfdr.de>; Mon, 14 Mar 2022 17:34:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0789F10E2E7;
	Mon, 14 Mar 2022 16:34:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3815910E625
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Mar 2022 16:34:31 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A6E5ED6E;
 Mon, 14 Mar 2022 09:34:30 -0700 (PDT)
Received: from [10.57.42.204] (unknown [10.57.42.204])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3C0F63F766;
 Mon, 14 Mar 2022 09:34:28 -0700 (PDT)
Message-ID: <74afb713-0413-bd49-c3f1-f6a094df2e17@arm.com>
Date: Mon, 14 Mar 2022 16:34:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] drm/bridge: synopsys/dw-hdmi: set cec clock rate
Content-Language: en-GB
From: Robin Murphy <robin.murphy@arm.com>
To: Peter Geis <pgwipeout@gmail.com>,
 Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
References: <20220126202427.3047814-1-pgwipeout@gmail.com>
 <3AFD1DD4-AF0A-4ECC-B4F5-E6BD6B9F1BB7@gmail.com>
 <CAMdYzYq06QSmFAwCuTmBYy4LfQAQDxzx2PGc8HOB1iEjxXHGyg@mail.gmail.com>
 <c6766e6e-3c90-f0e6-86b3-4afdf41fbbb1@arm.com>
In-Reply-To: <c6766e6e-3c90-f0e6-86b3-4afdf41fbbb1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: dri-devel@lists.freedesktop.org, Archit Taneja <architt@codeaurora.org>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Neil Armstrong <narmstrong@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Pierre-Hugues Husson <phh@phh.me>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-03-14 11:31, Robin Murphy wrote:
> On 2022-03-13 12:56, Peter Geis wrote:
>> On Sun, Mar 13, 2022 at 6:13 AM Piotr Oniszczuk
>> <piotr.oniszczuk@gmail.com> wrote:
>>>
>>>
>>>
>>>> Wiadomość napisana przez Peter Geis <pgwipeout@gmail.com> w dniu 
>>>> 26.01.2022, o godz. 21:24:
>>>>
>>>> The hdmi-cec clock must be 32khz in order for cec to work correctly.
>>>> Ensure after enabling the clock we set it in order for the hardware to
>>>> work as expected.
>>>> Warn on failure, in case this is a static clock that is slighty off.
>>>> Fixes hdmi-cec support on Rockchip devices.
>>>>
>>>> Fixes: ebe32c3e282a ("drm/bridge: synopsys/dw-hdmi: Enable cec clock")
>>>>
>>>> Signed-off-by: Peter Geis <pgwipeout@gmail.com>
>>>> ---
>>>> drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 7 +++++++
>>>> 1 file changed, 7 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c 
>>>> b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>>>> index 54d8fdad395f..1a96da60e357 100644
>>>> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>>>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>>>> @@ -48,6 +48,9 @@
>>>>
>>>> #define HDMI14_MAX_TMDSCLK    340000000
>>>>
>>>> +/* HDMI CEC needs a clock rate of 32khz */
>>>> +#define HDMI_CEC_CLK_RATE    32768
>>>> +
>>>> enum hdmi_datamap {
>>>>        RGB444_8B = 0x01,
>>>>        RGB444_10B = 0x03,
>>>> @@ -3347,6 +3350,10 @@ struct dw_hdmi *dw_hdmi_probe(struct 
>>>> platform_device *pdev,
>>>>                                ret);
>>>>                        goto err_iahb;
>>>>                }
>>>> +
>>>> +             ret = clk_set_rate(hdmi->cec_clk, HDMI_CEC_CLK_RATE);
>>>> +             if (ret)
>>>> +                     dev_warn(hdmi->dev, "Cannot set HDMI cec clock 
>>>> rate: %d\n", ret);
>>>>        }
>>>>
>>>>        /* Product and revision IDs */
>>>> -- 
>>>> 2.25.1
>>>>
>>>>
>>>> _______________________________________________
>>>> Linux-rockchip mailing list
>>>> Linux-rockchip@lists.infradead.org
>>>> http://lists.infradead.org/mailman/listinfo/linux-rockchip
>>>
>>> Peter,
>>>
>>> On my 5.17-rc7 with applied rk356x VOP2 v8 series - this patch makes 
>>> CEC working on rk3566.
>>> Unfortunately it breaks working ok CEC on rk3399 rockpi-4b.
>>>
>>> Reverting this patch brings back CEC on rk3399 - but rk3366 becomes 
>>> with non working CEC
>>>
>>> I'm not sure how to move forward with this....
>>
>> I was worried about that, thanks for testing it.
>> Can you send me the cec_clk rate before and after this patch?
> 
> Hmm, looks like there might be a bug in the RK3399 clock driver - 
> although it's treated as having mux_pll_p as parents, according to the 
> public TRM the CEC clock appears unique in being backwards compared to 
> every other mux of those two inputs. I'm now tempted to test this on my 
> board tonight and see if I can see 24MHz on the CEC pin... :)

Nope, turns out that's an error in the TRM and the mux is fine. The bug 
is between the clock driver blindly assuming xin32k is usable, and 
nearly all RK3399 boards forgetting to claim the pinctrl to actually 
enable the input :/

Robin.
