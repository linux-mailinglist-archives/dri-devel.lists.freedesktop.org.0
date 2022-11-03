Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BAE0618449
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 17:26:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76CBF10E6FC;
	Thu,  3 Nov 2022 16:26:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AD0B10E6FC
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Nov 2022 16:26:04 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id BDD68851A0;
 Thu,  3 Nov 2022 17:26:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1667492763;
 bh=EVpiTL21LLWyJWLj3jAATwRKdOChMdmXNQfgNQ5inOs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Z46gvj2SUgjqF8l8TidhCOu4q6BI+e4OPqeRUSdW2SuXubbtRD9ywFIxSg6F+CsOz
 Tv1H6BqrRgOszVUkIIQCjjuY+PDkH5hps16v/ORrqS/P78nRmYMfir8hu6EN13VVNC
 x2IE3Ozti3UI5a/sigyexBoXhYuXQeEBUW/QPI+LhLg2lxDOU7P7LieEzctiwEu822
 yr6koc/dsTYE6WJz7Stw1bpGaZdW/bfkRnycWW0SnQnmqNlY4jJR72bEVkINWCHXw6
 lWXVMYyYObxbjux2NqqxeaJi246gBx4u9Qjfipu5ZGE8h6joDNkCt1fOlx076/4exI
 lPTVY8ufK/zFQ==
Message-ID: <96bed121-3841-5776-8a35-e630e168ea83@denx.de>
Date: Thu, 3 Nov 2022 17:03:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v7 07/10] drm: bridge: samsung-dsim: Add
 atomic_get_input_bus_fmts
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>
References: <20221005151309.7278-1-jagan@amarulasolutions.com>
 <20221005151309.7278-8-jagan@amarulasolutions.com>
 <d837f6e3-d869-6543-2361-a7843c00ed8a@denx.de>
 <CAMty3ZAAmeHFG-n6LKeq6Mb2GcHxFBJr5DDPJcxrgYn=J_XHmg@mail.gmail.com>
 <a5788a69-d9bf-a998-3c1b-223903721696@denx.de>
 <CAMty3ZC4k+5s0LgV=bCRrCugVLzwz5AWvRajdZz=b9+UKgyQVA@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAMty3ZC4k+5s0LgV=bCRrCugVLzwz5AWvRajdZz=b9+UKgyQVA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
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
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Neil Armstrong <narmstrong@linaro.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, NXP Linux Team <linux-imx@nxp.com>,
 Fancy Fang <chen.fang@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/3/22 08:40, Jagan Teki wrote:
> On Mon, Oct 17, 2022 at 12:54 PM Marek Vasut <marex@denx.de> wrote:
>>
>> On 10/17/22 05:58, Jagan Teki wrote:
>>> On Sun, Oct 16, 2022 at 3:31 AM Marek Vasut <marex@denx.de> wrote:
>>>>
>>>> On 10/5/22 17:13, Jagan Teki wrote:
>>>>
>>>> [...]
>>>>
>>>>> @@ -1321,6 +1322,32 @@ static void samsung_dsim_atomic_post_disable(struct drm_bridge *bridge,
>>>>>         pm_runtime_put_sync(dsi->dev);
>>>>>     }
>>>>>
>>>>> +#define MAX_INPUT_SEL_FORMATS        1
>>>>> +
>>>>> +static u32 *
>>>>> +samsung_dsim_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
>>>>> +                                    struct drm_bridge_state *bridge_state,
>>>>> +                                    struct drm_crtc_state *crtc_state,
>>>>> +                                    struct drm_connector_state *conn_state,
>>>>> +                                    u32 output_fmt,
>>>>> +                                    unsigned int *num_input_fmts)
>>>>> +{
>>>>> +     u32 *input_fmts;
>>>>> +
>>>>> +     *num_input_fmts = 0;
>>>>> +
>>>>> +     input_fmts = kcalloc(MAX_INPUT_SEL_FORMATS, sizeof(*input_fmts),
>>>>> +                          GFP_KERNEL);
>>>>> +     if (!input_fmts)
>>>>> +             return NULL;
>>>>> +
>>>>> +     /* This is the DSI-end bus format */
>>>>> +     input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
>>>>> +     *num_input_fmts = 1;
>>>>
>>>> Is this the only supported format ? NXP AN13573 lists the following:
>>>
>>> At least it only formats I have tested on my panel.
>>>
>>>>
>>>> i.MX 8/RT MIPI DSI/CSI-2, Rev. 0, 21 March 2022
>>>> 3.7.4 Pixel formats
>>>> Table 14. DSI pixel packing formats
>>>>
>>>> Loosely Packed Pixel Stream, 20-bit YCbCr, 4:2:2
>>>> Packed Pixel Stream, 24-bit YCbCr, 4:2:2
>>>> Packed Pixel Stream, 16-bit YCbCr, 4:2:2
>>>> Packed Pixel Stream, 30-bit RGB, 10-10-10
>>>> Packed Pixel Stream, 36-bit RGB, 12-12-12
>>>> Packed Pixel Stream, 12-bit YCbCr, 4:2:0
>>>> Packed Pixel Stream, 16-bit RGB, 5-6-5
>>>> Packed Pixel Stream, 18-bit RGB, 6-6-6
>>>> Loosely Packed Pixel Stream, 18-bit RGB, 6-6-6
>>>> Packed Pixel Stream, 24-bit RGB, 8-8-8 Format
>>>>
>>>> The MX8MM/MN LCDIF can generate all of those RGB formats , the MX8MP
>>>> LCDIFv3 can also generate the 16bit YCbCr .
>>>>
>>>> It seems there should be more formats here.
>>>
>>> The idea of this patch is to support the default format first, and can
>>> possibly add future patches with the addition of new formats.
>>
>> Since you already know about the list, please add all the formats, so we
>> won't be adding known broken code first, only to fix it later.
> 
> Okay. I can see the DSI section Mini TRM shown below formats. (13.6.2 Features)
> 
> Supports pixel format: 16bpp, 18bpp packed, 18bpp loosely packed (3 byte
> format), and 24bpp
> 
> I will try to add these 4 formats. let me know.

You should be able to add all but the 'Packed Pixel Stream, 12-bit 
YCbCr, 4:2:0' which would have to be defined (that's a few lines patch?).
