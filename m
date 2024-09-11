Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 696E19747F4
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 03:51:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6451B10E05B;
	Wed, 11 Sep 2024 01:51:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="qSkTsaeI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BDD510E05B
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 01:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1726019500;
 bh=1HGn3uyC8ElQZ5IOXvOPGHbQrRBeNXmGjRsj8x3CtwQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=qSkTsaeIggzSUHcRQN8wPjl2718WiRC7mpGclAm7NXhIJ/jcJ/Sk7tDhELcm4RsBd
 9lm5uXNrf/0VjXtiUnfNeMLmmRvJoNLRIauZks10rG0olP30WLw0KgWoVqzIehjz/F
 MkWmR+EUu29DqQ6dHZwv3JsUAgWuGwNdIv3KpYD/CckYMIYCgehRousd7K09tGTNUz
 bijxZtnoPVGPyVhK/FaKGsKTLhtNmMFEbaFVEOVIYNgaO6ymkMEfcbuefHJYaeS5s7
 JkyBILIhowkFwS7cRiedVMLGlMHo36uZhg7b+otTEKv68Ri1INS8roasan1LBNhfYI
 zD4/2cO+Wttlg==
Received: from [192.168.1.90] (unknown [188.27.55.48])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id D2B4F17E0E57;
 Wed, 11 Sep 2024 03:51:39 +0200 (CEST)
Message-ID: <33d4f09b-8490-41f2-92ac-b39949e89e62@collabora.com>
Date: Wed, 11 Sep 2024 04:51:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] drm/rockchip: Add basic RK3588 HDMI output support
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Mark Yao <markyao0591@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, kernel@collabora.com,
 Alexandre ARNOUD <aarnoud@me.com>, Luis de Arquer <ldearquer@gmail.com>,
 Algea Cao <algea.cao@rock-chips.com>
References: <20240906-b4-rk3588-bridge-upstream-v6-0-a3128fb103eb@collabora.com>
 <324b12ea-805a-499c-909d-3723f0bca7cb@collabora.com>
 <1796743.esFFXGZ24q@diego> <26154114.p16igRAIYV@diego>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Content-Language: en-US
In-Reply-To: <26154114.p16igRAIYV@diego>
Content-Type: text/plain; charset=UTF-8
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

On 9/10/24 11:49 PM, Heiko Stübner wrote:
> Am Dienstag, 10. September 2024, 18:39:54 CEST schrieb Heiko Stübner:
>> Am Dienstag, 10. September 2024, 17:41:42 CEST schrieb Cristian Ciocaltea:
>>> On 9/10/24 6:21 PM, Heiko Stübner wrote:
>>>> Am Dienstag, 10. September 2024, 17:07:57 CEST schrieb Heiko Stübner:
>>>>> Am Freitag, 6. September 2024, 03:17:42 CEST schrieb Cristian Ciocaltea:
>>>>>> The RK3588 SoC family integrates the newer Synopsys DesignWare HDMI 2.1
>>>>>> Quad-Pixel (QP) TX controller IP and a HDMI/eDP TX Combo PHY based on a
>>>>>> Samsung IP block.
>>>>>>
>>>>>> Add just the basic support for now, i.e. RGB output up to 4K@60Hz,
>>>>>> without audio, CEC or any of the HDMI 2.1 specific features.
>>>>>>
>>>>>> Co-developed-by: Algea Cao <algea.cao@rock-chips.com>
>>>>>> Signed-off-by: Algea Cao <algea.cao@rock-chips.com>
>>>>>> Tested-by: Heiko Stuebner <heiko@sntech.de>
>>>>>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>>>>>
>>>>> I had switched from the v3 to this v6 in my playground-kernel today,
>>>>> with v3 I've never seen those, but now with v6 I have gotten multiple
>>>>> times:
>>>>>
>>>>> [  805.730608] Internal error: synchronous external abort: 0000000096000010 [#1] PREEMPT SMP
>>>>> [  805.739764] Modules linked in: snd_soc_simple_card crct10dif_ce snd_soc_simple_card_utils panthor drm_gpuvm drm_exec fuse
>>>>> [  805.752031] CPU: 3 UID: 0 PID: 775 Comm: Xorg Not tainted 6.11.0-rc7-00099-g459302f1f908-dirty #934
>>>>> [  805.762143] Hardware name: Theobroma Systems RK3588-Q7 SoM on Haikou devkit (DT)
>>>>> [  805.770407] pstate: 204000c9 (nzCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>>>>> [  805.778186] pc : regmap_mmio_read32le+0x8/0x20
>>>>> [  805.783155] lr : regmap_mmio_read+0x44/0x70
>>>>> [  805.787828] sp : ffff80008293b830
>>>>> [  805.791516] x29: ffff80008293b830 x28: ffff80008293bce8 x27: ffff0001f20ab080
>>>>> [  805.799495] x26: ffff800081139500 x25: 0000000000000000 x24: 0000000000000010
>>>>> [  805.807472] x23: 0000000000000000 x22: ffff0001f5a4b400 x21: ffff80008293b8c4
>>>>> [  805.815450] x20: 0000000000000968 x19: ffff0001f5a27a80 x18: 0000000000000070
>>>>> [  805.823428] x17: 0002441400000005 x16: 000004650441043c x15: 0438000008980804
>>>>> [  805.831406] x14: 07d8089807800780 x13: 0438000008980804 x12: ffff800081133630
>>>>> [  805.839384] x11: 0002441400000005 x10: 000004650441043c x9 : ffff800081a59000
>>>>> [  805.847361] x8 : 07d8089807800780 x7 : 0000000000000000 x6 : ffff0001f5b453c0
>>>>> [  805.855339] x5 : ffff800080750dc0 x4 : 0000000000000968 x3 : 0000000000000968
>>>>> [  805.863316] x2 : ffff800080751520 x1 : 0000000000000968 x0 : ffff800083b20968
>>>>> [  805.871294] Call trace:
>>>>> [  805.874012]  regmap_mmio_read32le+0x8/0x20
>>>>> [  805.878588]  _regmap_bus_reg_read+0x6c/0xac
>>>>> [  805.883262]  _regmap_read+0x60/0xd8
>>>>> [  805.887159]  _regmap_update_bits+0xf4/0x140
>>>>> [  805.891832]  regmap_update_bits_base+0x64/0xa0
>>>>> [  805.896797]  dw_hdmi_qp_bridge_atomic_enable+0x134/0x220
>>>>> [  805.902734]  drm_atomic_bridge_chain_enable+0x54/0xc8
>>>>> [  805.908380]  drm_atomic_helper_commit_modeset_enables+0x194/0x280
>>>>> [  805.915190]  drm_atomic_helper_commit_tail_rpm+0x50/0xa0
>>>>> [  805.921125]  commit_tail+0xa0/0x1a0
>>>>> [  805.925021]  drm_atomic_helper_commit+0x17c/0x1b0
>>>>> [  805.930276]  drm_atomic_commit+0xb8/0x100
>>>>> [  805.934754]  drm_atomic_connector_commit_dpms+0xe0/0x110
>>>>> [  805.940690]  drm_mode_obj_set_property_ioctl+0x1c0/0x420
>>>>> [  805.946626]  drm_connector_property_set_ioctl+0x3c/0x68
>>>>> [  805.952465]  drm_ioctl_kernel+0xc0/0x130
>>>>> [  805.956846]  drm_ioctl+0x214/0x4a0
>>>>> [  805.960643]  __arm64_sys_ioctl+0xac/0xf8
>>>>> [  805.965025]  invoke_syscall+0x48/0x104
>>>>> [  805.969214]  el0_svc_common.constprop.0+0x40/0xe0
>>>>> [  805.974470]  do_el0_svc+0x1c/0x28
>>>>> [  805.978171]  el0_svc+0x34/0xe0
>>>>> [  805.981582]  el0t_64_sync_handler+0x120/0x12c
>>>>> [  805.986449]  el0t_64_sync+0x190/0x194
>>>>> [  805.990540] Code: d503201f d503201f f9400000 8b214000 (b9400000)
>>>>>
>>>>> I guess that might be some clocking issue?
>>>>
>>>> Forgot to add, this happens when the display has blanked and then is
>>>> supposed to unblank again.
>>>
>>> Hmm, I've never encountered this while testing with my v6.11-rc1 based
>>> tree.  What is your current kernel base?  Did you change it while
>>> switching from v3 to v6?
>>>
>>> I'll rebase my tree onto latest linux-next and see if I can reproduce.
>>
>> The setup is 6.11-rc7 with your hdmi series + my wip dsi + X11 running
>> on top.
>>
>> At some point after being idle a while this blanks the display, which will
>> probably turn off clocks and such. After moving the mouse or just
>> doing anything else that unblanks the display, that splat happens.
>>
>> Apart from updating mesa from 24.2.0 to 24.2.2 I haven't changed
>> anything in my test-setup so far.
> 
> So now I've re-tested all :-) ... test scenario was that I reverted the v6
> patches and then applied the older versions (and fixed up the dts if
> needed wrt the vo{1}-grf thing). So now really only the hdmi driver
> changed. So I booted, waited for the display to blank and hit reboot
> on the serial console:
> 
> - v3 console output turned back on and rebooted fine
> - v4 console output turned back on and rebooted fine
> - v5 hit the error from above
> - v6 hit the error from above
> 
> So something between v4 and v5 seems to cause the hickup.

Thanks a lot for taking the time to bisect it!  This is indeed a clock
related regression introduced by the recent changes around scrambling.

I couldn't initially reproduce because I had the HDMI0 PHY clock provider
enabled, required to verify the high TMDS clock ratio and scrambling setup
in 4K@60Hz display mode.  Without that clock provider enabled, the PHY
eventually enters runtime PM suspend state, which for some reason causes
the splat when trying to access the LINK_CONFIG0 register.

To unblock the series, I would consider dropping the scrambling support for
now, as it turned to be far more complicated to have it properly handled
than I initially assumed.  Will move this to a separate WIP patch in my dev
tree, along the vop2 improvements for display modes handling, and resubmit
as soon as I get this work in a better shape.
