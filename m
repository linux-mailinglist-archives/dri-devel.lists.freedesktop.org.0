Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 194AC973B5D
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 17:19:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F36210E4F8;
	Tue, 10 Sep 2024 15:19:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="bQZuqxW3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE8BD10E4F8
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 15:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OHTaPFU7IxdysyuX/tN5EzMTydhIoay+K+w5Wew1vlA=; b=bQZuqxW3egMUmeGk2K3dn2mgUk
 q3z7m1ypz51hUzQgzkUHrTUpWt87uhkuU1OnJJ7etrwMpzri+/kULWEqoqwUKNHEBk/0d1ZzUxcDT
 wqXjn/kTM8kryz9l14qJmPu8l9DG5I6szJnMuyZATk0cP364QUbVXTlznzOJ6O/77yNSkhGFpuEpq
 VZj0zVumkA2nWca9W34f8xR0Y09m3uAE6zg5VpxqlfWG4DesKKmrheyYiupz9rHdoe5CZU/ex1nve
 ybZzNk2gc+4B19S2EeNAA2WN420714viUaqfPd4MKyZoEezfjNxYiVTLjOQ/oIRJO1Zi8oy8ixKgd
 hHEo5Fsw==;
Received: from i53875a02.versanet.de ([83.135.90.2] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1so2dx-0005bU-1b; Tue, 10 Sep 2024 17:19:01 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Mark Yao <markyao0591@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, kernel@collabora.com,
 Alexandre ARNOUD <aarnoud@me.com>, Luis de Arquer <ldearquer@gmail.com>,
 Algea Cao <algea.cao@rock-chips.com>
Subject: Re: [PATCH v6 3/3] drm/rockchip: Add basic RK3588 HDMI output support
Date: Tue, 10 Sep 2024 17:21:27 +0200
Message-ID: <1899262.u6TykanW85@diego>
In-Reply-To: <1785617.Ii9rTq9gLj@diego>
References: <20240906-b4-rk3588-bridge-upstream-v6-0-a3128fb103eb@collabora.com>
 <20240906-b4-rk3588-bridge-upstream-v6-3-a3128fb103eb@collabora.com>
 <1785617.Ii9rTq9gLj@diego>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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

Am Dienstag, 10. September 2024, 17:07:57 CEST schrieb Heiko St=FCbner:
> Am Freitag, 6. September 2024, 03:17:42 CEST schrieb Cristian Ciocaltea:
> > The RK3588 SoC family integrates the newer Synopsys DesignWare HDMI 2.1
> > Quad-Pixel (QP) TX controller IP and a HDMI/eDP TX Combo PHY based on a
> > Samsung IP block.
> >=20
> > Add just the basic support for now, i.e. RGB output up to 4K@60Hz,
> > without audio, CEC or any of the HDMI 2.1 specific features.
> >=20
> > Co-developed-by: Algea Cao <algea.cao@rock-chips.com>
> > Signed-off-by: Algea Cao <algea.cao@rock-chips.com>
> > Tested-by: Heiko Stuebner <heiko@sntech.de>
> > Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>=20
> I had switched from the v3 to this v6 in my playground-kernel today,
> with v3 I've never seen those, but now with v6 I have gotten multiple
> times:
>=20
> [  805.730608] Internal error: synchronous external abort: 00000000960000=
10 [#1] PREEMPT SMP
> [  805.739764] Modules linked in: snd_soc_simple_card crct10dif_ce snd_so=
c_simple_card_utils panthor drm_gpuvm drm_exec fuse
> [  805.752031] CPU: 3 UID: 0 PID: 775 Comm: Xorg Not tainted 6.11.0-rc7-0=
0099-g459302f1f908-dirty #934
> [  805.762143] Hardware name: Theobroma Systems RK3588-Q7 SoM on Haikou d=
evkit (DT)
> [  805.770407] pstate: 204000c9 (nzCv daIF +PAN -UAO -TCO -DIT -SSBS BTYP=
E=3D--)
> [  805.778186] pc : regmap_mmio_read32le+0x8/0x20
> [  805.783155] lr : regmap_mmio_read+0x44/0x70
> [  805.787828] sp : ffff80008293b830
> [  805.791516] x29: ffff80008293b830 x28: ffff80008293bce8 x27: ffff0001f=
20ab080
> [  805.799495] x26: ffff800081139500 x25: 0000000000000000 x24: 000000000=
0000010
> [  805.807472] x23: 0000000000000000 x22: ffff0001f5a4b400 x21: ffff80008=
293b8c4
> [  805.815450] x20: 0000000000000968 x19: ffff0001f5a27a80 x18: 000000000=
0000070
> [  805.823428] x17: 0002441400000005 x16: 000004650441043c x15: 043800000=
8980804
> [  805.831406] x14: 07d8089807800780 x13: 0438000008980804 x12: ffff80008=
1133630
> [  805.839384] x11: 0002441400000005 x10: 000004650441043c x9 : ffff80008=
1a59000
> [  805.847361] x8 : 07d8089807800780 x7 : 0000000000000000 x6 : ffff0001f=
5b453c0
> [  805.855339] x5 : ffff800080750dc0 x4 : 0000000000000968 x3 : 000000000=
0000968
> [  805.863316] x2 : ffff800080751520 x1 : 0000000000000968 x0 : ffff80008=
3b20968
> [  805.871294] Call trace:
> [  805.874012]  regmap_mmio_read32le+0x8/0x20
> [  805.878588]  _regmap_bus_reg_read+0x6c/0xac
> [  805.883262]  _regmap_read+0x60/0xd8
> [  805.887159]  _regmap_update_bits+0xf4/0x140
> [  805.891832]  regmap_update_bits_base+0x64/0xa0
> [  805.896797]  dw_hdmi_qp_bridge_atomic_enable+0x134/0x220
> [  805.902734]  drm_atomic_bridge_chain_enable+0x54/0xc8
> [  805.908380]  drm_atomic_helper_commit_modeset_enables+0x194/0x280
> [  805.915190]  drm_atomic_helper_commit_tail_rpm+0x50/0xa0
> [  805.921125]  commit_tail+0xa0/0x1a0
> [  805.925021]  drm_atomic_helper_commit+0x17c/0x1b0
> [  805.930276]  drm_atomic_commit+0xb8/0x100
> [  805.934754]  drm_atomic_connector_commit_dpms+0xe0/0x110
> [  805.940690]  drm_mode_obj_set_property_ioctl+0x1c0/0x420
> [  805.946626]  drm_connector_property_set_ioctl+0x3c/0x68
> [  805.952465]  drm_ioctl_kernel+0xc0/0x130
> [  805.956846]  drm_ioctl+0x214/0x4a0
> [  805.960643]  __arm64_sys_ioctl+0xac/0xf8
> [  805.965025]  invoke_syscall+0x48/0x104
> [  805.969214]  el0_svc_common.constprop.0+0x40/0xe0
> [  805.974470]  do_el0_svc+0x1c/0x28
> [  805.978171]  el0_svc+0x34/0xe0
> [  805.981582]  el0t_64_sync_handler+0x120/0x12c
> [  805.986449]  el0t_64_sync+0x190/0x194
> [  805.990540] Code: d503201f d503201f f9400000 8b214000 (b9400000)
>=20
> I guess that might be some clocking issue?

=46orgot to add, this happens when the display has blanked and then is
supposed to unblank again.

Heiko


