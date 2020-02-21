Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C17301683BB
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 17:38:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ADEE6F4CF;
	Fri, 21 Feb 2020 16:38:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4267C6E28E
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 11:37:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id C43CB278760
Subject: Re: [PATCH v8 0/6] arm/arm64: mediatek: Fix mmsys device probing
To: CK Hu <ck.hu@mediatek.com>, Matthias Brugger <mbrugger@suse.com>
References: <20200220172147.919996-1-enric.balletbo@collabora.com>
 <1582259996.1846.7.camel@mtksdaap41>
 <7a87b486-1622-7f27-f5af-427b94a14c00@collabora.com>
 <1582277229.25992.9.camel@mtksdaap41>
 <1393a8c5-065f-cccb-2563-8b159c951d4b@suse.com>
 <1582283518.5889.10.camel@mtksdaap41>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <6deab0a4-44a6-a15f-ac01-374f818b267c@collabora.com>
Date: Fri, 21 Feb 2020 12:37:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1582283518.5889.10.camel@mtksdaap41>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 21 Feb 2020 16:38:28 +0000
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
Cc: mark.rutland@arm.com, Kate Stewart <kstewart@linuxfoundation.org>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, airlied@linux.ie,
 mturquette@baylibre.com, dri-devel@lists.freedesktop.org,
 Richard Fontana <rfontana@redhat.com>, laurent.pinchart@ideasonboard.com,
 ulrich.hecht+renesas@gmail.com, Collabora Kernel ML <kernel@collabora.com>,
 linux-clk@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>,
 Weiyi Lu <weiyi.lu@mediatek.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 wens@csie.org, linux-arm-kernel@lists.infradead.org,
 mtk01761 <wendell.lin@mediatek.com>, Owen Chen <owen.chen@mediatek.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 frank-w@public-files.de, Seiya Wang <seiya.wang@mediatek.com>,
 sean.wang@mediatek.com, Houlong Wei <houlong.wei@mediatek.com>,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Allison Randal <allison@lohutok.net>, Fabien Parent <fparent@baylibre.com>,
 sboyd@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 rdunlap@infradead.org, linux-kernel@vger.kernel.org, matthias.bgg@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi CK and Matthias,

On 21/2/20 12:11, CK Hu wrote:
> Hi, Matthias:
> 
> On Fri, 2020-02-21 at 11:24 +0100, Matthias Brugger wrote:
>>
>> On 21/02/2020 10:27, CK Hu wrote:
>>> Hi, Enric:
>>>
>>> On Fri, 2020-02-21 at 09:56 +0100, Enric Balletbo i Serra wrote:
>>>> Hi CK,
>>>>
>>>> Thanks for your quick answer.
>>>>
>>>> On 21/2/20 5:39, CK Hu wrote:
>>>>> Hi, Enric:
>>>>>
>>>>> On Thu, 2020-02-20 at 18:21 +0100, Enric Balletbo i Serra wrote:
>>>>>> Dear all,
>>>>>>
>>>>>> Those patches are intended to solve an old standing issue on some
>>>>>> Mediatek devices (mt8173, mt2701 and mt2712) in a slightly different way
>>>>>> to the precedent series.
>>>>>>
>>>>>> Up to now both drivers, clock and drm are probed with the same device tree
>>>>>> compatible. But only the first driver get probed, which in effect breaks
>>>>>> graphics on those devices.
>>>>>>
>>>>>> The version eight of the series tries to solve the problem with a
>>>>>> different approach than the previous series but similar to how is solved
>>>>>> on other Mediatek devices.
>>>>>>
>>>>>> The MMSYS (Multimedia subsystem) in Mediatek SoCs has some registers to
>>>>>> control clock gates (which is used in the clk driver) and some registers
>>>>>> to set the routing and enable the differnet blocks of the display
>>>>>> and MDP (Media Data Path) subsystem. On this series the clk driver is
>>>>>> not a pure clock controller but a system controller that can provide
>>>>>> access to the shared registers between the different drivers that need
>>>>>> it (mediatek-drm and mediatek-mdp). And the biggest change is, that in
>>>>>> this version, clk driver is the entry point (parent) which will trigger
>>>>>> the probe of the corresponding mediatek-drm driver and pass its MMSYS
>>>>>> platform data for display configuration.
>>>>>
>>>>> When mmsys is a system controller, I prefer to place mmsys in
>>>>> drivers/soc/mediatek, and it share registers for clock, display, and mdp
>>>>> driver. This means the probe function is placed in
>>>>> drivers/soc/mediatek ,its display clock function, mdp clock function are
>>>>> placed in drivers/clk, display routing are placed in drivers/gpu/drm,
>>>>> and mdp routing are placed in dirvers/video.
>>>>>
>>>>
>>>> I understand what you mean but I am not sure this makes the code clearer and
>>>> useful. The driver in drivers/soc/mediatek will be a simple dummy implementation
>>>> of a "simple-mfd" device (a driver that simply matches with
>>>> "mediatek,mt8173-mmsys" and instantiates the "clk-mt8173-mm" and the
>>>> "mediatek-drm" driver (note that mediatek-mdp" is already instantiated via
>>>> device-tree).
>>>>
>>>
>>> It's clear that mmsys is neither a pure clock controller nor a pure
>>> routing controller for display and mdp. 
>>>
>>>> It'd be nice had a proper device-tree with a "simple-mfd" for mmsys from the
>>>> beginning representing how really hardwware is, but I think that, change this
>>>> now, will break backward compatibility.
>>>
>>> Maybe this is a solution. Current device tree would work only on old
>>> kernel version with a bug, so this mean there is no any device tree
>>> works on kernel version without bug. Why do we compatible with such
>>> device tree?
>>>
>>

So the only reason why current DT worked at some point is because there was a
kernel bug?

If that's the case I think we shouldn't worry about break DT compatibility (I'm
sorry for those that having a buggy kernel makes display working)

>> The idea behind this is, that the device-tree could be passed by some boot
>> firmware, so that the OS do not care about it. For this we need a stable DTS as
>> otherwise newer kernel with older FW would break.
>>
>> DTS is supposed to be just a different description of the HW like ACPI. So it
>> has to be compatible (newer kernel with older DTS and if possible vice versa).
> 
> In my view, there is no FW (except some bug-inside FW) which works on
> this dts, so this dts is in a initial state. I think the compatibility
> is based on that dts correctly describe the HW. If we find this dts does
> not correctly describe the HW and it's in a initial state, should we
> still make it compatible?
> 

In this case I think we don't need to worry about buggy kernels, the only thing
that we need to take in consideration is that mmsys is instantiated on both (the
old DT and the new DT), we shouldn't expect display working (because never
worked, right?)

With that in mind, I agree that is a good opportunity to fix properly the HW
topology.

What thing that worries me is that I see this pattern on all Mediatek SoCs, does
this mean that display was never well supported for Mediatek SoCs?

Thanks.

> If you have better solution, just let's forget this.
> 
> Regards,
> CK
> 
>>
>> Regards,
>> Matthias
>>
>>> Regards,
>>> CK
>>>
>>>>
>>>> IMHO I think that considering the clk driver as entry point is fine, but this is
>>>> something that the clock maintainers should decide.
>>>>
>>>> Also note that this is not only a MT8173 problem I am seeing the same problem on
>>>> all other Mediatek SoCs.
>>>>
>>>> Thanks.
>>>>
>>>>> Regards,
>>>>> CK
>>>>>
>>>>>>
>>>>>> All this series was tested on the Acer R13 Chromebook only.
>>>>>>
>>>>>> For reference, here are the links to the old discussions:
>>>>>>
>>>>>> * v7: https://patchwork.kernel.org/project/linux-mediatek/list/?series=241217
>>>>>> * v6: https://patchwork.kernel.org/project/linux-mediatek/list/?series=213219
>>>>>> * v5: https://patchwork.kernel.org/project/linux-mediatek/list/?series=44063
>>>>>> * v4:
>>>>>>   * https://patchwork.kernel.org/patch/10530871/
>>>>>>   * https://patchwork.kernel.org/patch/10530883/
>>>>>>   * https://patchwork.kernel.org/patch/10530885/
>>>>>>   * https://patchwork.kernel.org/patch/10530911/
>>>>>>   * https://patchwork.kernel.org/patch/10530913/
>>>>>> * v3:
>>>>>>   * https://patchwork.kernel.org/patch/10367857/
>>>>>>   * https://patchwork.kernel.org/patch/10367861/
>>>>>>   * https://patchwork.kernel.org/patch/10367877/
>>>>>>   * https://patchwork.kernel.org/patch/10367875/
>>>>>>   * https://patchwork.kernel.org/patch/10367885/
>>>>>>   * https://patchwork.kernel.org/patch/10367883/
>>>>>>   * https://patchwork.kernel.org/patch/10367889/
>>>>>>   * https://patchwork.kernel.org/patch/10367907/
>>>>>>   * https://patchwork.kernel.org/patch/10367909/
>>>>>>   * https://patchwork.kernel.org/patch/10367905/
>>>>>> * v2: No relevant discussion, see v3
>>>>>> * v1:
>>>>>>   * https://patchwork.kernel.org/patch/10016497/
>>>>>>   * https://patchwork.kernel.org/patch/10016499/
>>>>>>   * https://patchwork.kernel.org/patch/10016505/
>>>>>>   * https://patchwork.kernel.org/patch/10016507/
>>>>>>
>>>>>> Best regards,
>>>>>>  Enric
>>>>>>
>>>>>> Changes in v8:
>>>>>> - Be a builtin_platform_driver like other mediatek mmsys drivers.
>>>>>> - New patches introduced in this series.
>>>>>>
>>>>>> Changes in v7:
>>>>>> - Add R-by from CK
>>>>>> - Add R-by from CK
>>>>>> - Fix check of return value of of_clk_get
>>>>>> - Fix identation
>>>>>> - Free clk_data->clks as well
>>>>>> - Get rid of private data structure
>>>>>>
>>>>>> Enric Balletbo i Serra (2):
>>>>>>   drm/mediatek: Move MMSYS configuration to include/linux/platform_data
>>>>>>   clk/drm: mediatek: Fix mediatek-drm device probing
>>>>>>
>>>>>> Matthias Brugger (4):
>>>>>>   drm/mediatek: Use regmap for register access
>>>>>>   drm/mediatek: Omit warning on probe defers
>>>>>>   media: mtk-mdp: Check return value of of_clk_get
>>>>>>   clk: mediatek: mt8173: Switch MMSYS to platform driver
>>>>>>
>>>>>>  drivers/clk/mediatek/Kconfig                  |   6 +
>>>>>>  drivers/clk/mediatek/Makefile                 |   1 +
>>>>>>  drivers/clk/mediatek/clk-mt2701-mm.c          |  30 +++
>>>>>>  drivers/clk/mediatek/clk-mt2712-mm.c          |  44 +++++
>>>>>>  drivers/clk/mediatek/clk-mt8173-mm.c          | 172 ++++++++++++++++++
>>>>>>  drivers/clk/mediatek/clk-mt8173.c             | 104 -----------
>>>>>>  drivers/gpu/drm/mediatek/mtk_disp_color.c     |   5 +-
>>>>>>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c       |   5 +-
>>>>>>  drivers/gpu/drm/mediatek/mtk_disp_rdma.c      |   5 +-
>>>>>>  drivers/gpu/drm/mediatek/mtk_dpi.c            |  12 +-
>>>>>>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c       |   4 +-
>>>>>>  drivers/gpu/drm/mediatek/mtk_drm_ddp.c        |  53 +++---
>>>>>>  drivers/gpu/drm/mediatek/mtk_drm_ddp.h        |   4 +-
>>>>>>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |  56 +-----
>>>>>>  drivers/gpu/drm/mediatek/mtk_drm_drv.c        | 113 +-----------
>>>>>>  drivers/gpu/drm/mediatek/mtk_drm_drv.h        |  13 +-
>>>>>>  drivers/gpu/drm/mediatek/mtk_dsi.c            |   8 +-
>>>>>>  drivers/gpu/drm/mediatek/mtk_hdmi.c           |   4 +-
>>>>>>  drivers/media/platform/mtk-mdp/mtk_mdp_comp.c |   6 +
>>>>>>  include/linux/platform_data/mtk_mmsys.h       |  73 ++++++++
>>>>>>  20 files changed, 401 insertions(+), 317 deletions(-)
>>>>>>  create mode 100644 drivers/clk/mediatek/clk-mt8173-mm.c
>>>>>>  create mode 100644 include/linux/platform_data/mtk_mmsys.h
>>>>>>
>>>>>
>>>>
>>>> _______________________________________________
>>>> Linux-mediatek mailing list
>>>> Linux-mediatek@lists.infradead.org
>>>> http://lists.infradead.org/mailman/listinfo/linux-mediatek
>>>
>>
>> _______________________________________________
>> Linux-mediatek mailing list
>> Linux-mediatek@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-mediatek
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
