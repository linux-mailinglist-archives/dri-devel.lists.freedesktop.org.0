Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACDEB1E39F
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 09:39:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 928F410E4DB;
	Fri,  8 Aug 2025 07:39:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=grimler.se header.i=@grimler.se header.b="nA+S0+y1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com
 [95.215.58.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AE6E10E4DC
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Aug 2025 07:39:48 +0000 (UTC)
Date: Fri, 8 Aug 2025 09:39:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grimler.se; s=key1;
 t=1754638786;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0PgcJqY7piVMe4TqAZpbZAh/XwpMd15g8rkb2eWQ+P0=;
 b=nA+S0+y1ZwxrRdleSyjhsoPj011FiJ27Kyq/aNLv3Y9bteLeu5MAhVAUNc+5ApSON9ch2w
 qW4M3kf+Nx73kPxeKZRQcEMAo316jMFtQ7xEnz8KmTXwDa2UvQ8iRGE2YwRLz3JAqghmJ1
 pqWAcgxOsT5W+bJ7RmSD25h+D42IbRc=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Henrik Grimler <henrik@grimler.se>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, replicant@osuosl.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] drm/bridge: sii9234: use extcon cable detection
 logic to detect MHL
Message-ID: <20250808073413.GA19227@grimfrac.localdomain>
References: <20250721-exynos4-sii9234-driver-v1-0-2e47ed02f677@grimler.se>
 <CGME20250721094425eucas1p2a427e209cd0f1933118b2046c01e1c3f@eucas1p2.samsung.com>
 <20250721-exynos4-sii9234-driver-v1-3-2e47ed02f677@grimler.se>
 <ef676bc4-a4e8-45d8-9db7-5f9843241d0c@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef676bc4-a4e8-45d8-9db7-5f9843241d0c@samsung.com>
X-Migadu-Flow: FLOW_OUT
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

Hi Marek,

On Fri, Aug 01, 2025 at 10:09:08AM +0200, Marek Szyprowski wrote:
> On 21.07.2025 11:43, Henrik Grimler wrote:
> > To use MHL we currently need the MHL chip to be permanently on, which
> > consumes unnecessary power. Let's use extcon attached to MUIC to enable
> > the MHL chip only if it detects an MHL cable.
> >
> > Signed-off-by: Henrik Grimler <henrik@grimler.se>
> > ---
> 
> Thanks!
> 
> Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

Thanks for testing! On trats2 I assume? After some more testing I
noticed that mhl hotplugging only works reliably if device screen is
on when cable is plugged in, otherwise I get errors like:

[  281.203520] exynos-hdmi 12d00000.hdmi: [drm:hdmiphy_enable.part.0] *ERROR* PLL could not reach steady state
[  281.313816] exynos-mixer 12c10000.mixer: timeout waiting for VSYNC
[  281.420637] ------------[ cut here ]------------
[  281.423861] WARNING: CPU: 3 PID: 1189 at drivers/gpu/drm/drm_atomic_helper.c:1720 drm_atomic_helper_wait_for_vblanks.part.0+0x264/0x26c
[  281.436172] [CRTC:71:crtc-1] vblank wait timed out
[  281.440870] Modules linked in: cpufreq_conservative rfcomm aes_arm aes_generic nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 cmac nft_reject algif_hash algif_skcipher nft_ct nf_conntrack af_alg nf_defrag_ipv6 nf_defrag_ipv4 bnep nf_tables ntc_thermistor hwmon brcmfmac_wcc s5k6a3 st_accel_spi spi_s3c64xx st_gyro_spi hci_uart st_sensors_spi btbcm btintel pwm_samsung bluetooth st_gyro_i2c st_accel_i2c st_gyro st_sensors_i2c st_accel st_sensors brcmfmac ecdh_generic ecc s5c73m3 libaes lima cfg80211 drm_shmem_helper gpu_sched exynos_adc brcmutil rfkill panel_samsung_s6e8aa0 s5p_sss exynos_rng s5p_g2d tm2_touchkey leds_an30259a cm36651 leds_aat1290 led_class_flash led_class ak8975 industrialio_triggered_buffer kfifo_buf gpio_keys uhid hid uinput ledtrig_pattern zram zsmalloc fuse loop nfnetlink ipv6 evdev [last unloaded: cpufreq_conservative]
[  281.514974] CPU: 3 UID: 10000 PID: 1189 Comm: phoc Tainted: G        W           6.16.0-postmarketos-exynos4 #38 PREEMPT 
[  281.515007] Tainted: [W]=WARN
[  281.515013] Hardware name: Samsung Exynos (Flattened Device Tree)
[  281.515027] Call trace: 
[  281.515062]  unwind_backtrace from show_stack+0x18/0x1c
[  281.515155]  show_stack from dump_stack_lvl+0x50/0x64
[  281.515219]  dump_stack_lvl from __warn+0x88/0x15c
[  281.515271]  __warn from warn_slowpath_fmt+0x118/0x1ac
[  281.515285]  warn_slowpath_fmt from drm_atomic_helper_wait_for_vblanks.part.0+0x264/0x26c
[  281.515340]  drm_atomic_helper_wait_for_vblanks.part.0 from drm_atomic_helper_commit_tail_rpm+0x84/0x94
[  281.515363]  drm_atomic_helper_commit_tail_rpm from commit_tail+0xa8/0x1a0
[  281.515385]  commit_tail from drm_atomic_helper_commit+0x164/0x19c
[  281.515402]  drm_atomic_helper_commit from drm_atomic_commit+0xd0/0x104
[  281.515489]  drm_atomic_commit from drm_mode_atomic_ioctl+0x9f8/0xd14
[  281.515512]  drm_mode_atomic_ioctl from drm_ioctl+0x20c/0x4cc
[  281.515562]  drm_ioctl from sys_ioctl+0x5a8/0xc10
[  281.515634]  sys_ioctl from ret_fast_syscall+0x0/0x54
[  281.515651] Exception stack(0xc5d05fa8 to 0xc5d05ff0)
[  281.515665] 5fa0:                   beb4be88 beb4be88 0000000d c03864bc beb4be88 0000000d
[  281.515675] 5fc0: beb4be88 beb4be88 c03864bc 00000036 acbe4450 ad8edc70 acbe4490 acd46cf0
[  281.515682] 5fe0: beb4be58 beb4bd38 b6e5651f b6ebb040
[  281.515693] ---[ end trace 0000000000000000 ]---

or device just hangs. I suppose this might not be an issue in the
sii9234 driver though, so will collect your tags (unless I do further
changes)!

> You should also add "select EXTCON" (like in case of Sii8620) to Kconfig 
> to avoid potential build break if extcon support is built as a module.

Kernel robot also reported this issue, so I have added the select in
v2:
https://lore.kernel.org/linux-samsung-soc/20250724-exynos4-sii9234-driver-v2-0-faee244f1d40@grimler.se/

Best regards,
Henrik Grimler

> 
> >   drivers/gpu/drm/bridge/sii9234.c | 89 ++++++++++++++++++++++++++++++++++++++--
> >   1 file changed, 86 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/sii9234.c b/drivers/gpu/drm/bridge/sii9234.c
> > index 0e0bb1bf71fdcef788715cfd6fa158a6992def33..4d84ba01ea76816bebdbc29d48a041c9c6cd508e 100644
> > --- a/drivers/gpu/drm/bridge/sii9234.c
> > +++ b/drivers/gpu/drm/bridge/sii9234.c
> > @@ -19,6 +19,7 @@
> >   
> >   #include <linux/delay.h>
> >   #include <linux/err.h>
> > +#include <linux/extcon.h>
> >   #include <linux/gpio/consumer.h>
> >   #include <linux/i2c.h>
> >   #include <linux/interrupt.h>
> > @@ -26,6 +27,7 @@
> >   #include <linux/kernel.h>
> >   #include <linux/module.h>
> >   #include <linux/mutex.h>
> > +#include <linux/of_graph.h>
> >   #include <linux/regulator/consumer.h>
> >   #include <linux/slab.h>
> >   
> > @@ -170,8 +172,12 @@ struct sii9234 {
> >   	struct drm_bridge bridge;
> >   	struct device *dev;
> >   	struct gpio_desc *gpio_reset;
> > -	int i2c_error;
> >   	struct regulator_bulk_data supplies[4];
> > +	struct extcon_dev *extcon;
> > +	struct notifier_block extcon_nb;
> > +	struct work_struct extcon_wq;
> > +	int cable_state;
> > +	int i2c_error;
> >   
> >   	struct mutex lock; /* Protects fields below and device registers */
> >   	enum sii9234_state state;
> > @@ -864,6 +870,70 @@ static int sii9234_init_resources(struct sii9234 *ctx,
> >   	return 0;
> >   }
> >   
> > +static void sii9234_extcon_work(struct work_struct *work)
> > +{
> > +	struct sii9234 *ctx =
> > +		container_of(work, struct sii9234, extcon_wq);
> > +	int state = extcon_get_state(ctx->extcon, EXTCON_DISP_MHL);
> > +
> > +	if (state == ctx->cable_state)
> > +		return;
> > +
> > +	ctx->cable_state = state;
> > +
> > +	if (state > 0)
> > +		sii9234_cable_in(ctx);
> > +	else
> > +		sii9234_cable_out(ctx);
> > +}
> > +
> > +static int sii9234_extcon_notifier(struct notifier_block *self,
> > +			unsigned long event, void *ptr)
> > +{
> > +	struct sii9234 *ctx =
> > +		container_of(self, struct sii9234, extcon_nb);
> > +
> > +	schedule_work(&ctx->extcon_wq);
> > +
> > +	return NOTIFY_DONE;
> > +}
> > +
> > +static int sii9234_extcon_init(struct sii9234 *ctx)
> > +{
> > +	struct extcon_dev *edev;
> > +	struct device_node *musb, *muic;
> > +	int ret;
> > +
> > +	/* Get micro-USB connector node */
> > +	musb = of_graph_get_remote_node(ctx->dev->of_node, 1, -1);
> > +	/* Then get micro-USB Interface Controller node */
> > +	muic = of_get_next_parent(musb);
> > +
> > +	if (!muic) {
> > +		dev_info(ctx->dev,
> > +			 "no extcon found, switching to 'always on' mode\n");
> > +		return 0;
> > +	}
> > +
> > +	edev = extcon_find_edev_by_node(muic);
> > +	of_node_put(muic);
> > +	if (IS_ERR(edev)) {
> > +		dev_err_probe(ctx->dev, PTR_ERR(edev),
> > +			      "invalid or missing extcon\n");
> > +	}
> > +
> > +	ctx->extcon = edev;
> > +	ctx->extcon_nb.notifier_call = sii9234_extcon_notifier;
> > +	INIT_WORK(&ctx->extcon_wq, sii9234_extcon_work);
> > +	ret = extcon_register_notifier(edev, EXTCON_DISP_MHL, &ctx->extcon_nb);
> > +	if (ret) {
> > +		dev_err(ctx->dev, "failed to register notifier for MHL\n");
> > +		return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >   static enum drm_mode_status sii9234_mode_valid(struct drm_bridge *bridge,
> >   					 const struct drm_display_info *info,
> >   					 const struct drm_display_mode *mode)
> > @@ -916,12 +986,17 @@ static int sii9234_probe(struct i2c_client *client)
> >   	if (ret < 0)
> >   		return ret;
> >   
> > +	ret = sii9234_extcon_init(ctx);
> > +	if (ret < 0)
> > +		return ret;
> > +
> >   	i2c_set_clientdata(client, ctx);
> >   
> >   	ctx->bridge.of_node = dev->of_node;
> >   	drm_bridge_add(&ctx->bridge);
> >   
> > -	sii9234_cable_in(ctx);
> > +	if (!ctx->extcon)
> > +		sii9234_cable_in(ctx);
> >   
> >   	return 0;
> >   }
> > @@ -930,7 +1005,15 @@ static void sii9234_remove(struct i2c_client *client)
> >   {
> >   	struct sii9234 *ctx = i2c_get_clientdata(client);
> >   
> > -	sii9234_cable_out(ctx);
> > +	if (ctx->extcon) {
> > +		extcon_unregister_notifier(ctx->extcon, EXTCON_DISP_MHL,
> > +					   &ctx->extcon_nb);
> > +		flush_work(&ctx->extcon_wq);
> > +		if (ctx->cable_state > 0)
> > +			sii9234_cable_out(ctx);
> > +	} else {
> > +		sii9234_cable_out(ctx);
> > +	}
> >   	drm_bridge_remove(&ctx->bridge);
> >   }
> >   
> >
> Best regards
> -- 
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
> 
