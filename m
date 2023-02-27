Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F026A4AC4
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 20:24:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD1EA10E3BA;
	Mon, 27 Feb 2023 19:24:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDE8A10E3BA
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 19:24:13 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 02A94809A6;
 Mon, 27 Feb 2023 20:24:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1677525845;
 bh=vytISvPfXQkjMXyvekc7jlg9CKuNw6X469YOCiL6X+I=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=bwErhCxyI/maaNta8xkPKrj1DbgNB+/U/NYj+z8SjxwvZ3LH5rRW9+MwgBIkMTIjP
 r/j+4daH934+lWJCsMistGxqiiahEFlSzwOeOZ13PJia1iqvYkRl2EVCsh+T3kjLJC
 uyQtgpaq0gMepwNKVSQlYFzKMetxmanRLAOSoNafa3JxV6NaeuKxl1VYc/hiPJJI7j
 iXW4D7d7u79KtsGjnE73zWipy09BfIa50346jAmS3+63ZYqhEDycEa9YS7Cucob5K6
 KEDXKMWcRU9a5nidl4Tf3KfFyhMgpwRqfQ3bQ3/ekA6WhQviVyqXzq5oFT2gbF7bK5
 Sc5MZM4O06Ppg==
Message-ID: <6066dff9-5a66-0da5-14d9-66162a2fbb39@denx.de>
Date: Mon, 27 Feb 2023 20:24:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v13 04/18] drm: exynos: dsi: Switch to DSI panel or bridge
 find helper
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>
References: <20230227113925.875425-1-jagan@amarulasolutions.com>
 <20230227113925.875425-5-jagan@amarulasolutions.com>
 <3c2f91d3-0406-7730-d4e4-c94868f23c91@denx.de>
 <CAMty3ZA6_pKiOK6gWq4iQFtKsoxfUgnSFBqkgDBzEp1DcBEt3A@mail.gmail.com>
 <7b59aaf9-1f72-fd9f-29ac-1857ec3f91f3@denx.de>
 <CAMty3ZC6vqpFfdh2F=KUsAgm_KCksVXBV9ON1csjJd1m+gJpVQ@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAMty3ZC6vqpFfdh2F=KUsAgm_KCksVXBV9ON1csjJd1m+gJpVQ@mail.gmail.com>
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
 Matteo Lisi <matteo.lisi@engicam.com>, Maxime Ripard <maxime@cerno.tech>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, NXP Linux Team <linux-imx@nxp.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Adam Ford <aford173@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/27/23 20:15, Jagan Teki wrote:
> On Tue, Feb 28, 2023 at 12:38 AM Marek Vasut <marex@denx.de> wrote:
>>
>> On 2/27/23 20:01, Jagan Teki wrote:
>>> On Tue, Feb 28, 2023 at 12:25 AM Marek Vasut <marex@denx.de> wrote:
>>>>
>>>> On 2/27/23 12:39, Jagan Teki wrote:
>>>>> drm_of_dsi_find_panel_or_bridge is capable of looking up the
>>>>> downstream DSI bridge and panel and trying to add a panel bridge
>>>>> if the panel is found.
>>>>>
>>>>> Replace explicit finding calls with drm_of_dsi_find_panel_or_bridge
>>>>> followed with drmm_panel_bridge_add.
>>>>>
>>>>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>>>>> ---
>>>>> Changes for v13, v12, v11:
>>>>> - none
>>>>> Changes for v10:
>>>>> - new patch
>>>>>
>>>>>     drivers/gpu/drm/exynos/exynos_drm_dsi.c | 25 +++++++++++++------------
>>>>>     1 file changed, 13 insertions(+), 12 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>>>>> index df15501b1075..12a6dd987e8f 100644
>>>>> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>>>>> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>>>>> @@ -25,6 +25,7 @@
>>>>>     #include <drm/drm_atomic_helper.h>
>>>>>     #include <drm/drm_bridge.h>
>>>>>     #include <drm/drm_mipi_dsi.h>
>>>>> +#include <drm/drm_of.h>
>>>>>     #include <drm/drm_panel.h>
>>>>>     #include <drm/drm_print.h>
>>>>>     #include <drm/drm_probe_helper.h>
>>>>> @@ -1470,24 +1471,26 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
>>>>>         struct device *dev = dsi->dev;
>>>>>         struct drm_encoder *encoder = &dsi->encoder;
>>>>>         struct drm_device *drm = encoder->dev;
>>>>> +     struct drm_bridge *bridge;
>>>>>         struct drm_panel *panel;
>>>>>         int ret;
>>>>>
>>>>> -     panel = of_drm_find_panel(device->dev.of_node);
>>>>> -     if (!IS_ERR(panel)) {
>>>>> -             dsi->out_bridge = devm_drm_panel_bridge_add(dev, panel);
>>>>> -     } else {
>>>>> -             dsi->out_bridge = of_drm_find_bridge(device->dev.of_node);
>>>>> -             if (!dsi->out_bridge)
>>>>> -                     dsi->out_bridge = ERR_PTR(-EINVAL);
>>>>> -     }
>>>>
>>>> As far as I understand this from my conversation with Maxime (please put
>>>> him on CC of V15), the change here should instead perform the panel look
>>>> up NOT in exynos_dsi_host_attach() , but in exynos_dsi_bind() , i.e. in
>>>> the component_ops .bind callback . Here is an example of correct
>>>> implementation:
>>>>
>>>> https://cgit.freedesktop.org/drm-misc/tree/drivers/gpu/drm/vc4/vc4_dsi.c#n1805
>>>
>>> But, we don't have component_ops.bind for imx8m case, so where do we
>>> want to place the panel hook?
>>>
>>> Exynos drm drivers are component-based but, imx8mm is not.
>>
>> In 14/18 patch, the same should be added to generic_dsim_register_host()
>> , which is called from the driver .probe() callback, but that is OK.
>>
>> That's ^ is the iMX part.
> 
> Ohh. You mean, we need to find the panel hook separately in two places like
> - bind for exynos
> - probe for imx8mm

Yes

> If so? how can I find the drm_device pointer in the probe?

What for ? The panel lookup uses OF graph . Where do you need the 
drm_device in it ?
