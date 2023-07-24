Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3089175EB0B
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 07:54:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21AC910E0FA;
	Mon, 24 Jul 2023 05:54:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A74210E0FA
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 05:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1690178038; x=1721714038;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iAdk/7+R2bSdHduRIpNKb9qEGu6b0y2XoEyzclNICGc=;
 b=Ok/Ti3XMr8xhNnWyi979leV+DMf08zNlRQgJDojEiDikVKpqjus0f7ft
 4k/3HEow3vIzJqkpVfbdIUOn8/gSWpUvJY/N4b0vh8briDLGUx/Ib3ryP
 zhLPYM2iyj5ob5ADHZfnTH47ItIFrguDbKFrUQLsnl5m96ax7OoK2Ghvq
 3NnFEdmfSpXjRPilYg687rxaeRUEph9SfO9pOs8QI/Vzd15Af74R7UDkS
 IX07q6x40yZJxnARD1oIxTH+Ru7YpFuj1UlSXGG7PoVAUJUqrAKUQUYIY
 CJ1fZ5F9G6KJLDhfaBpap8F82B86bQjNAcIsLxYtrKtwyukGpsmfvxsEA Q==;
X-IronPort-AV: E=Sophos;i="6.01,228,1684792800"; d="scan'208";a="32069404"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 24 Jul 2023 07:53:55 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 8333A280078;
 Mon, 24 Jul 2023 07:53:55 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Aradhya Bhatia <a-bhatia1@ti.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/bridge: Add debugfs print for bridge chains
Date: Mon, 24 Jul 2023 07:53:55 +0200
Message-ID: <13315423.uLZWGnKmhe@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20230721-drm-bridge-chain-debugfs-v2-1-76df94347962@ideasonboard.com>
References: <20230721-drm-bridge-chain-debugfs-v2-1-76df94347962@ideasonboard.com>
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
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

Am Freitag, 21. Juli 2023, 17:01:39 CEST schrieb Tomi Valkeinen:
> DRM bridges are not visible to the userspace and it may not be
> immediately clear if the chain is somehow constructed incorrectly. I
> have had two separate instances of a bridge driver failing to do a
> drm_bridge_attach() call, resulting in the bridge connector not being
> part of the chain. In some situations this doesn't seem to cause issues,
> but it will if DRM_BRIDGE_ATTACH_NO_CONNECTOR flag is used.
>=20
> Add a debugfs file to print the bridge chains. For me, on this TI AM62
> based platform, I get the following output:
>=20
> encoder[39]
> 	bridge[0] type: 0, ops: 0x0
> 	bridge[1] type: 0, ops: 0x0, OF:
> /bus@f0000/i2c@20000000/dsi@e:toshiba,tc358778 bridge[2] type: 0, ops: 0x=
3,
> OF: /bus@f0000/i2c@20010000/hdmi@48:lontium,lt8912b bridge[3] type: 11,
> ops: 0x7, OF: /hdmi-connector:hdmi-connector

I like the idea and it works on an imx8mp based board for the DRI display=20
devices which have connectors attached:

$ cat /sys/kernel/debug/dri/1/bridge_chains=20
encoder[36]
        bridge[0] type: 16, ops: 0x0, OF: /soc@0/bus@32c00000/
dsi@32e60000:fsl,imx8mp-mipi-dsim
        bridge[1] type: 10, ops: 0x3, OF: /soc@0/bus@30800000/i2c@30a30000/
bridge@f:toshiba,tc9595

$ cat /sys/kernel/debug/dri/2/bridge_chains=20
encoder[36]
        bridge[0] type: 0, ops: 0x0, OF: /soc@0/bus@32c00000/display-
bridge@32fc4000:fsl,imx8mp-hdmi-pvi
        bridge[1] type: 0, ops: 0x7, OF: /soc@0/bus@32c00000/
hdmi@32fd8000:fsl,imx8mp-hdmi

Unfortunately this oopses on GPU device without connectors:

$ cat /sys/kernel/debug/dri/0/name=20
etnaviv dev=3Detnaviv unique=3Detnaviv
$ cat /sys/kernel/debug/dri/0/bridge_chains
Unable to handle kernel NULL pointer dereference at virtual address=20
0000000000000010
Mem abort info:
  ESR =3D 0x0000000096000004
  EC =3D 0x25: DABT (current EL), IL =3D 32 bits
  SET =3D 0, FnV =3D 0
  EA =3D 0, S1PTW =3D 0
  FSC =3D 0x04: level 0 translation fault
Data abort info:
  ISV =3D 0, ISS =3D 0x00000004, ISS2 =3D 0x00000000
  CM =3D 0, WnR =3D 0, TnD =3D 0, TagAccess =3D 0
  GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0, Xs =3D 0
user pgtable: 4k pages, 48-bit VAs, pgdp=3D0000000045842000
[0000000000000010] pgd=3D0000000000000000, p4d=3D0000000000000000
Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
Modules linked in: dw_hdmi_cec mcp320x hantro_vpu snd_soc_fsl_asoc_card=20
snd_soc_fsl_sai snd_soc_tlv320aic32x4_i2c snd_soc_imx_audmux snd_soc_fsl_ut=
ils=20
snd_soc_tlv320aic32x4 snd_soc_simple_card_utils imx_pcm_dma snd_soc_core dw=
100=20
v4l2_vp9 8021q snd_pcm_dmaengine v4l2_h264 snd_pcm videobuf2_dma_contig gar=
p=20
imx8mp_hdmi crct10dif_ce v4l2_mem2mem mrp dw_hdmi tc358767 videobuf2_memops=
=20
stp bluetooth llc synopsys_edac videobuf2_v4l2 cec videobuf2_common=20
phy_fsl_samsung_hdmi imx8mp_hdmi_pvi samsung_dsim snd_timer cfg80211 snd=20
flexcan drm_display_helper imx_sdma soundcore virt_dma can_dev=20
clk_renesas_pcie coresight_etm4x coresight_tmc coresight_funnel pwm_imx27=20
coresight imx8mm_thermal iio_hwmon fuse ipv6
CPU: 3 PID: 485 Comm: cat Not tainted 6.5.0-rc3-next-20230724+ #1822=20
41dd31be02d36f174370d905469174492535c29d
Hardware name: TQ-Systems i.MX8MPlus TQMa8MPxL on MBa8MPxL (DT)
pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
pc : drm_bridge_chains_info+0xfc/0x1d0
lr : drm_bridge_chains_info+0xf8/0x1d0
sp : ffff8000831c39e0
x29: ffff8000831c39e0 x28: ffff8000811759f0 x27: ffff800081175a08
x26: ffff800081175000 x25: ffff000002d592b0 x24: ffff000002d59000
x23: ffff800081175a70 x22: ffff800081175a50 x21: fffffffffffffff8
x20: 0000000000000000 x19: 0000000000000000 x18: 0000000000000000
x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
x14: 0000000000000000 x13: 3836613136616661 x12: 3030303030303030
x11: 203a7473696c5f72 x10: 65646f636e65205d x9 : 6c5f7265646f636e
x8 : 65205d6d72645b20 x7 : 0000000000000003 x6 : ffff8000818627a0
x5 : 0000000000000000 x4 : 0000000000000000 x3 : 0000000000000000
x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff8000831c3a68
Call trace:
 drm_bridge_chains_info+0xfc/0x1d0
 seq_read_iter+0x1a8/0x484
 seq_read+0x88/0xbc
 full_proxy_read+0x5c/0xa8
 vfs_read+0xac/0x1e0
 ksys_read+0x68/0xf4
 __arm64_sys_read+0x18/0x20
 invoke_syscall+0x6c/0xec
 el0_svc_common.constprop.0+0xb8/0xd8
 do_el0_svc+0x28/0x34
 el0_svc+0x1c/0x50
 el0t_64_sync_handler+0xb8/0xbc
 el0t_64_sync+0x14c/0x150
Code: aa1903e2 f94037e1 9401d66f 910223e0 (b9401aa2)=20
=2D--[ end trace 0000000000000000 ]---

This boils down to the connector_list setup incorrectly? Here is some debug=
=20
output from drm_bridge_chains_info:
> etnaviv etnaviv: [drm] encoder_list: 00000000afa61a68
> etnaviv etnaviv: [drm] num_encoder: 0
> etnaviv etnaviv: [drm] list_empty: 0
> etnaviv etnaviv: [drm] encoder: fffffffffffffff8
> etnaviv etnaviv: [drm] encoder->head: 0000000000000000

list_empty(&config->encoder_list)) not returning true and num_encoder being=
 0=20
seems off to me.

Best regards,
Alexander

> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
> Changes in v2:
> - Fixed compilation issue when !CONFIG_OF
> - Link to v1:
> https://lore.kernel.org/r/20230721-drm-bridge-chain-debugfs-v1-1-8614ff7e=
89
> 0d@ideasonboard.com ---
>  drivers/gpu/drm/drm_bridge.c  | 50
> +++++++++++++++++++++++++++++++++++++++++++ drivers/gpu/drm/drm_debugfs.c=
 |
>  3 +++
>  include/drm/drm_bridge.h      |  5 +++++
>  3 files changed, 58 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index c3d69af02e79..d3eb62d5ef3b 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -27,8 +27,10 @@
>  #include <linux/mutex.h>
>=20
>  #include <drm/drm_atomic_state_helper.h>
> +#include <drm/drm_debugfs.h>
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_encoder.h>
> +#include <drm/drm_file.h>
>  #include <drm/drm_of.h>
>  #include <drm/drm_print.h>
>=20
> @@ -1345,6 +1347,54 @@ struct drm_bridge *of_drm_find_bridge(struct
> device_node *np) EXPORT_SYMBOL(of_drm_find_bridge);
>  #endif
>=20
> +#ifdef CONFIG_DEBUG_FS
> +static int drm_bridge_chains_info(struct seq_file *m, void *data)
> +{
> +	struct drm_debugfs_entry *entry =3D m->private;
> +	struct drm_device *dev =3D entry->dev;
> +	struct drm_printer p =3D drm_seq_file_printer(m);
> +	struct drm_mode_config *config =3D &dev->mode_config;
> +	struct drm_encoder *encoder;
> +	unsigned int bridge_idx =3D 0;
> +
> +	list_for_each_entry(encoder, &config->encoder_list, head) {
> +		struct drm_bridge *bridge;
> +
> +		drm_printf(&p, "encoder[%u]\n", encoder->base.id);
> +
> +		bridge =3D drm_bridge_chain_get_first_bridge(encoder);
> +
> +		while (bridge) {
> +			drm_printf(&p, "\tbridge[%u] type: %u, ops:=20
%#x",
> +				   bridge_idx, bridge->type, bridge-
>ops);
> +
> +#ifdef CONFIG_OF
> +			if (bridge->of_node)
> +				drm_printf(&p, ", OF: %pOFfc", bridge-
>of_node);
> +#endif
> +
> +			drm_printf(&p, "\n");
> +
> +			bridge_idx++;
> +			bridge =3D drm_bridge_get_next_bridge(bridge);
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +/* any use in debugfs files to dump individual planes/crtc/etc? */
> +static const struct drm_debugfs_info drm_bridge_debugfs_list[] =3D {
> +	{"bridge_chains", drm_bridge_chains_info, 0},
> +};
> +
> +void drm_bridge_debugfs_init(struct drm_minor *minor)
> +{
> +	drm_debugfs_add_files(minor->dev, drm_bridge_debugfs_list,
> +			      ARRAY_SIZE(drm_bridge_debugfs_list));
> +}
> +#endif
> +
>  MODULE_AUTHOR("Ajay Kumar <ajaykumar.rs@samsung.com>");
>  MODULE_DESCRIPTION("DRM bridge infrastructure");
>  MODULE_LICENSE("GPL and additional rights");
> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
> index c90dbcffa0dc..3e89559d68cd 100644
> --- a/drivers/gpu/drm/drm_debugfs.c
> +++ b/drivers/gpu/drm/drm_debugfs.c
> @@ -31,6 +31,7 @@
>=20
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_auth.h>
> +#include <drm/drm_bridge.h>
>  #include <drm/drm_client.h>
>  #include <drm/drm_debugfs.h>
>  #include <drm/drm_device.h>
> @@ -272,6 +273,8 @@ int drm_debugfs_init(struct drm_minor *minor, int
> minor_id,
>=20
>  	drm_debugfs_add_files(minor->dev, drm_debugfs_list,=20
DRM_DEBUGFS_ENTRIES);
>=20
> +	drm_bridge_debugfs_init(minor);
> +
>  	if (drm_drv_uses_atomic_modeset(dev)) {
>  		drm_atomic_debugfs_init(minor);
>  	}
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index bf964cdfb330..60dbee6bd1e6 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -949,4 +949,9 @@ static inline struct drm_bridge
> *drmm_of_get_bridge(struct drm_device *drm, }
>  #endif
>=20
> +#ifdef CONFIG_DEBUG_FS
> +struct drm_minor;
> +void drm_bridge_debugfs_init(struct drm_minor *minor);
> +#endif
> +
>  #endif
>=20
> ---
> base-commit: c7a472297169156252a50d76965eb36b081186e2
> change-id: 20230721-drm-bridge-chain-debugfs-0bbc1522f57a
>=20
> Best regards,


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


