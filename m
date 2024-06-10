Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4943E901D11
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 10:39:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AF2610E040;
	Mon, 10 Jun 2024 08:39:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="xWpdOjmH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E199710E040
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 08:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1718008745;
 bh=JfuTg9AWx/6iM2XhkYJvz5goUYOT/V3jlMgafxaU03A=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=xWpdOjmHA4qZzIZRZOvV6HK8X1qfG2n059NYDH3XsYJCm7uDJty2y7t45UmgzC23d
 4LC6fl3C9fc+t0CVjI1giDBiJKPsZvN9IcjQ+7jZTPH1tG0EmCI7954dHo3GELpsVN
 YBxrON/8NKYyzL66K8KHeFwaPMLRJbbaKRnHQoOCKROGPNZdghoncmsgiJVAKHHtvQ
 X1ITKJgrr+kCFGB64fO+33SgP+6+Bap4IhUmrXNGDng4J+u7EzaSDQU6EuYm62Z39O
 Iut8k1LmHFywPsuKY/YociPBMslENS/4LSwQxgQGR6hyNVb9PtMjlcPLEcTXrWP8nv
 JxsTylKNUPumg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id D8F33378148F;
 Mon, 10 Jun 2024 08:39:03 +0000 (UTC)
Message-ID: <c5a0223c-574e-481e-b64e-26353243ae08@collabora.com>
Date: Mon, 10 Jun 2024 10:39:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] drm/mediatek: Add support for OF graphs
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: chunkuang.hu@kernel.org, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 matthias.bgg@gmail.com, shawn.sung@mediatek.com, yu-chang.lee@mediatek.com,
 ck.hu@mediatek.com, jitao.shi@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 wenst@chromium.org, kernel@collabora.com
References: <20240516081104.83458-1-angelogioacchino.delregno@collabora.com>
 <1b23531d-0365-4163-a443-4ebece2c445e@notapiano>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <1b23531d-0365-4163-a443-4ebece2c445e@notapiano>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 07/06/24 01:25, Nícolas F. R. A. Prado ha scritto:
> On Thu, May 16, 2024 at 10:11:01AM +0200, AngeloGioacchino Del Regno wrote:
>> Changes in v4:
>>   - Fixed a typo that caused pure OF graphs pipelines multiple
>>     concurrent outputs to not get correctly parsed (port->id);
>>   - Added OVL_ADAPTOR support for OF graph specified pipelines;
>>   - Now tested with fully OF Graph specified pipelines on MT8195
>>     Chromebooks and MT8395 boards;
>>   - Rebased on next-20240516
>>
>> Changes in v3:
>>   - Rebased on next-20240502 because of renames in mediatek-drm
>>
>> Changes in v2:
>>   - Fixed wrong `required` block indentation in commit [2/3]
>>
>>
>> The display IPs in MediaTek SoCs are *VERY* flexible and those support
>> being interconnected with different instances of DDP IPs (for example,
>> merge0 or merge1) and/or with different DDP IPs (for example, rdma can
>> be connected with either color, dpi, dsi, merge, etc), forming a full
>> Display Data Path that ends with an actual display.
>>
>> This series was born because of an issue that I've found while enabling
>> support for MT8195/MT8395 boards with DSI output as main display: the
>> current mtk_drm_route variations would not work as currently, the driver
>> hardcodes a display path for Chromebooks, which have a DisplayPort panel
>> with DSC support, instead of a DSI panel without DSC support.
>>
>> There are other reasons for which I wrote this series, and I find that
>> hardcoding those paths - when a HW path is clearly board-specific - is
>> highly suboptimal. Also, let's not forget about keeping this driver from
>> becoming a huge list of paths for each combination of SoC->board->disp
>> and... this and that.
>>
>> For more information, please look at the commit description for each of
>> the commits included in this series.
>>
>> This series is essential to enable support for the MT8195/MT8395 EVK,
>> Kontron i1200, Radxa NIO-12L and, mainly, for non-Chromebook boards
>> and Chromebooks to co-exist without conflicts.
>>
>> Besides, this is also a valid option for MT8188 Chromebooks which might
>> have different DSI-or-eDP displays depending on the model (as far as I
>> can see from the mtk_drm_route attempt for this SoC that is already
>> present in this driver).
>>
>> This series was tested on MT8195 Cherry Tomato and on MT8395 Radxa
>> NIO-12L with both hardcoded paths, OF graph support and partially
>> hardcoded paths, and pure OF graph support including pipelines that
>> require OVL_ADAPTOR support.
>>
>> AngeloGioacchino Del Regno (3):
>>    dt-bindings: display: mediatek: Add OF graph support for board path
>>    dt-bindings: arm: mediatek: mmsys: Add OF graph support for board path
>>    drm/mediatek: Implement OF graphs support for display paths
>>
>>   .../bindings/arm/mediatek/mediatek,mmsys.yaml |  28 ++
>>   .../display/mediatek/mediatek,aal.yaml        |  40 +++
>>   .../display/mediatek/mediatek,ccorr.yaml      |  21 ++
>>   .../display/mediatek/mediatek,color.yaml      |  22 ++
>>   .../display/mediatek/mediatek,dither.yaml     |  22 ++
>>   .../display/mediatek/mediatek,dpi.yaml        |  25 +-
>>   .../display/mediatek/mediatek,dsc.yaml        |  24 ++
>>   .../display/mediatek/mediatek,dsi.yaml        |  27 +-
>>   .../display/mediatek/mediatek,ethdr.yaml      |  22 ++
>>   .../display/mediatek/mediatek,gamma.yaml      |  19 ++
>>   .../display/mediatek/mediatek,merge.yaml      |  23 ++
>>   .../display/mediatek/mediatek,od.yaml         |  22 ++
>>   .../display/mediatek/mediatek,ovl-2l.yaml     |  22 ++
>>   .../display/mediatek/mediatek,ovl.yaml        |  22 ++
>>   .../display/mediatek/mediatek,postmask.yaml   |  21 ++
>>   .../display/mediatek/mediatek,rdma.yaml       |  22 ++
>>   .../display/mediatek/mediatek,ufoe.yaml       |  21 ++
>>   drivers/gpu/drm/mediatek/mtk_disp_drv.h       |   1 +
>>   .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   |  40 ++-
>>   drivers/gpu/drm/mediatek/mtk_dpi.c            |  16 +-
>>   drivers/gpu/drm/mediatek/mtk_drm_drv.c        | 282 ++++++++++++++++--
>>   drivers/gpu/drm/mediatek/mtk_drm_drv.h        |   2 +-
>>   drivers/gpu/drm/mediatek/mtk_dsi.c            |  10 +-
>>   23 files changed, 713 insertions(+), 41 deletions(-)
>>
>> -- 
>> 2.45.0
>>
> 
> Hi Angelo,
> 
> I'm seeing issues with this series on MT8195-Tomato running on next-20240606:

Thanks Nicolas - yes I've recently seen that too, I also had feedback for that
something like 3 weeks ago.

I wanted to fix that but had no time to do the job as I had to care about some
other stuff....

Anyway, I should be able to send a v5 with a fix for that issue tomorrow.

Thanks again!
Angelo

> 
> [    4.770965] refcount_t: addition on 0; use-after-free.
> [    4.770975] WARNING: CPU: 5 PID: 171 at lib/refcount.c:25 refcount_warn_saturate+0xa0/0x144
> [    4.770983] Modules linked in: videobuf2_common rfkill(+) kfifo_buf onboard_usb_dev(+) mc hid_multitouch(+) cros_ec_chardev cros_kbd_led_backlight snd_sof_mt8195 elan_i2c mtk_adsp_common sbs_battery snd_soc_mt8195_afe snd_sof_xtensa_dsp pwm_bl lvts_thermal(+) mt6577_auxadc pcie_mediatek_gen3(+) snd_sof_of coreboot_table backlight mtk_scp mtk_rpmsg snd_sof mtk_svs snd_sof_utils mtk_scp_ipi mt8195_mt6359 ramoops reed_solomon
> [    4.771000] CPU: 5 PID: 171 Comm: (udev-worker) Not tainted 6.10.0-rc2-next-20240606-00005-gf8e90366fe4b #472
> [    4.771002] Hardware name: Acer Tomato (rev2) board (DT)
> [    4.771003] pstate: 604000c9 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [    4.771005] pc : refcount_warn_saturate+0xa0/0x144
> [    4.771007] lr : refcount_warn_saturate+0xa0/0x144
> [    4.771008] sp : ffff800080ce3950
> [    4.771009] x29: ffff800080ce3950 x28: ffff800080ce3c70 x27: ffff800080ce3c70
> [    4.771011] x26: 0000000000000000 x25: ffffaec95d6b53f0 x24: ffff5054d9468368
> [    4.771012] x23: ffff5054c0a81968 x22: 0000000000000000 x21: 0000000000000000
> [    4.771014] x20: ffff800080ce39d8 x19: ffff5054c0a81c68 x18: 0000000000000038
> [    4.771015] x17: ffffa18b9ed32000 x16: ffff800080028000 x15: fffffffffffeab58
> [    4.771017] x14: ffffaec95d181f48 x13: 00000000000006c6 x12: 0000000000000242
> [    4.771018] x11: fffffffffffeab58 x10: ffffaec95d1d9f48 x9 : 00000000fffff000
> [    4.771020] x8 : ffffaec95d181f48 x7 : ffffaec95d1d9f48 x6 : 0000000000000000
> [    4.771021] x5 : 80000000fffff000 x4 : 000000000000aff5 x3 : 00000000ffffffff
> [    4.771023] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff5054d8af33c0
> [    4.771024] Call trace:
> [    4.771025]  refcount_warn_saturate+0xa0/0x144
> [    4.771027]  klist_next+0x184/0x1a8
> [    4.771030]  bus_for_each_dev+0x60/0xd4
> [    4.771033]  driver_attach+0x24/0x30
> [    4.771035]  bus_add_driver+0xe4/0x208
> [    4.771037]  driver_register+0x60/0x128
> [    4.771039]  __platform_driver_register+0x28/0x34
> [    4.771041]  lvts_driver_init+0x20/0x1000 [lvts_thermal]
> [    4.771046]  do_one_initcall+0x6c/0x1b0
> [    4.771048]  do_init_module+0x60/0x1f0
> [    4.771050]  load_module+0x191c/0x1b04
> [    4.771052]  init_module_from_file+0x84/0xc0
> [    4.771054]  __arm64_sys_finit_module+0x1b8/0x27c
> [    4.771056]  invoke_syscall+0x48/0x118
> [    4.771059]  el0_svc_common.constprop.0+0x40/0xe0
> [    4.771061]  do_el0_svc+0x1c/0x28
> [    4.771063]  el0_svc+0x34/0xdc
> [    4.771065]  el0t_64_sync_handler+0xc0/0xc4
> [    4.771067]  el0t_64_sync+0x190/0x194
> 
> 
> [    4.837189] refcount_t: saturated; leaking memory.
> [    4.837197] WARNING: CPU: 7 PID: 170 at lib/refcount.c:22 refcount_warn_saturate+0x74/0x144
> [    4.837205] Modules linked in: phy_mtk_dp(+) videodev videobuf2_common rfkill kfifo_buf onboard_usb_dev(+) mc hid_multitouch(+) cros_ec_chardev cros_kbd_led_backlight snd_sof_mt8195 elan_i2c mtk_adsp_common sbs_battery snd_soc_mt8195_afe snd_sof_xtensa_dsp pwm_bl lvts_thermal mt6577_auxadc pcie_mediatek_gen3(+) snd_sof_of coreboot_table backlight mtk_scp mtk_rpmsg snd_sof mtk_svs snd_sof_utils mtk_scp_ipi mt8195_mt6359 ramoops reed_solomon
> [    4.837221] CPU: 7 PID: 170 Comm: (udev-worker) Tainted: G        W          6.10.0-rc2-next-20240606-00005-gf8e90366fe4b #472
> [    4.837224] Tainted: [W]=WARN
> [    4.837224] Hardware name: Acer Tomato (rev2) board (DT)
> [    4.837225] pstate: 604000c9 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [    4.837227] pc : refcount_warn_saturate+0x74/0x144
> [    4.837229] lr : refcount_warn_saturate+0x74/0x144
> [    4.837230] sp : ffff800080cdb950
> [    4.837231] x29: ffff800080cdb950 x28: ffff800080cdbc70 x27: ffff800080cdbc70
> [    4.837232] x26: 0000000000000000 x25: ffffaec95d6b53f0 x24: ffff5054d66544e8
> [    4.837234] x23: ffff5054c0a81968 x22: 0000000000000000 x21: 0000000000000000
> [    4.837235] x20: ffff800080cdb9d8 x19: ffff5054c0a81c68 x18: 0000000000000030
> [    4.837236] x17: 0000000000000000 x16: ffffaec95b03d998 x15: fffffffffffecb70
> [    4.837238] x14: ffffaec95d181f48 x13: 0000000000000825 x12: 00000000000002b7
> [    4.837239] x11: fffffffffffecb70 x10: ffffaec95d1d9f48 x9 : 00000000fffff000
> [    4.837240] x8 : ffffaec95d181f48 x7 : ffffaec95d1d9f48 x6 : 0000000000000000
> [    4.837242] x5 : 80000000fffff000 x4 : 000000000000aff5 x3 : 00000000ffffffff
> [    4.837243] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff5054d8af4500
> [    4.837245] Call trace:
> [    4.837246]  refcount_warn_saturate+0x74/0x144
> [    4.837247]  klist_next+0x178/0x1a8
> [    4.837250]  bus_for_each_dev+0x60/0xd4
> [    4.837253]  driver_attach+0x24/0x30
> [    4.837255]  bus_add_driver+0xe4/0x208
> [    4.837257]  driver_register+0x60/0x128
> [    4.837259]  __platform_driver_register+0x28/0x34
> [    4.837260]  mtk_dp_phy_driver_init+0x20/0x1000 [phy_mtk_dp]
> [    4.837263]  do_one_initcall+0x6c/0x1b0
> [    4.837265]  do_init_module+0x60/0x1f0
> [    4.837268]  load_module+0x191c/0x1b04
> [    4.837269]  init_module_from_file+0x84/0xc0
> [    4.837271]  __arm64_sys_finit_module+0x1b8/0x27c
> [    4.837273]  invoke_syscall+0x48/0x118
> [    4.837276]  el0_svc_common.constprop.0+0x40/0xe0
> [    4.837277]  do_el0_svc+0x1c/0x28
> [    4.837279]  el0_svc+0x34/0xdc
> [    4.837282]  el0t_64_sync_handler+0xc0/0xc4
> [    4.837284]  el0t_64_sync+0x190/0x194
> 
> 
> and many more occurrences.
> 
> Config: http://0x0.st/XbqI.txt
> Full kernel logs: http://0x0.st/Xbq6.txt
> 
> Thanks,
> Nícolas


