Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 746647A93B3
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 12:53:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5266C10E5B6;
	Thu, 21 Sep 2023 10:53:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F9B310E5B6
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 10:53:51 +0000 (UTC)
Received: from [192.168.88.20] (91-154-35-171.elisa-laajakaista.fi
 [91.154.35.171])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2D9361221;
 Thu, 21 Sep 2023 12:52:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1695293533;
 bh=evsrHftkQwFAxL8amZWxtP/1lqAGbj0iizDgAfNOiGc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=GTpuehWEjiEy2hxVAiR3Ku96s1dd8dttvDDsLbOHZRECt4msxNU2ugIxPPfebTFlU
 J0zud40J3oO+9Q8xmfAO5kmQA+78GfHwIfTOcUmtxpLfr3V+Jkl999w+IkBMUq8a7Y
 tIdh3m6JY89vtWMo3GYl+qufioD85LlAq+SbhKQU=
Message-ID: <6200f2c7-4e56-ee07-ec1e-589ba81c1b32@ideasonboard.com>
Date: Thu, 21 Sep 2023 13:53:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] omap: dsi: do not WARN on detach if dsidev was never
 attached
Content-Language: en-US
To: "H. Nikolaus Schaller" <hns@goldelico.com>, tony@atomide.com,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Douglas Anderson <dianders@chromium.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 sre@kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Arnd Bergmann <arnd@arndb.de>
References: <929c46beecf77f2ebfa9f8c9b1c09f6ec610c31a.1695130648.git.hns@goldelico.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <929c46beecf77f2ebfa9f8c9b1c09f6ec610c31a.1695130648.git.hns@goldelico.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: letux-kernel@openphoenux.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel@pyra-handheld.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 19/09/2023 16:37, H. Nikolaus Schaller wrote:
> dsi_init_output() called by dsi_probe() may fail. In that
> case mipi_dsi_host_unregister() is called which may call
> omap_dsi_host_detach() with uninitialized dsi->dsidev
> because omap_dsi_host_attach() was never called before.
> 
> This happens if the panel driver asks for an EPROBE_DEFER.
> 
> So let's suppress the WARN() in this special case.
> 
> [    7.416759] WARNING: CPU: 0 PID: 32 at drivers/gpu/drm/omapdrm/dss/dsi.c:4419 omap_dsi_host_detach+0x3c/0xbc [omapdrm]
> [    7.436053] Modules linked in: ina2xx_adc snd_soc_ts3a227e bq2429x_charger bq27xxx_battery_i2c(+) bq27xxx_battery ina2xx tca8418_keypad as5013(+) omapdrm hci_uart cec palmas_pwrbutton btbcm bmp280_spi palmas_gpadc bluetooth usb3503 ecdh_generic bmc150_accel_i2c bmg160_i2c ecc bmc150_accel_core bmg160_core bmc150_magn_i2c bmp280_i2c bmc150_magn bno055 industrialio_triggered_buffer bmp280 kfifo_buf snd_soc_omap_aess display_connector drm_kms_helper syscopyarea snd_soc_omap_mcbsp snd_soc_ti_sdma sysfillrect ti_tpd12s015 sysimgblt fb_sys_fops wwan_on_off snd_soc_gtm601 generic_adc_battery drm snd_soc_w2cbw003_bt industrialio drm_panel_orientation_quirks pwm_bl pwm_omap_dmtimer ip_tables x_tables ipv6 autofs4
> [    7.507068] CPU: 0 PID: 32 Comm: kworker/u4:2 Tainted: G        W          6.1.0-rc3-letux-lpae+ #11107
> [    7.516964] Hardware name: Generic OMAP5 (Flattened Device Tree)
> [    7.523284] Workqueue: events_unbound deferred_probe_work_func
> [    7.529456]  unwind_backtrace from show_stack+0x10/0x14
> [    7.534972]  show_stack from dump_stack_lvl+0x40/0x4c
> [    7.540315]  dump_stack_lvl from __warn+0xb0/0x164
> [    7.545379]  __warn from warn_slowpath_fmt+0x70/0x9c
> [    7.550625]  warn_slowpath_fmt from omap_dsi_host_detach+0x3c/0xbc [omapdrm]
> [    7.558137]  omap_dsi_host_detach [omapdrm] from mipi_dsi_remove_device_fn+0x10/0x20
> [    7.566376]  mipi_dsi_remove_device_fn from device_for_each_child+0x60/0x94
> [    7.573729]  device_for_each_child from mipi_dsi_host_unregister+0x20/0x54
> [    7.580992]  mipi_dsi_host_unregister from dsi_probe+0x5d8/0x744 [omapdrm]
> [    7.588315]  dsi_probe [omapdrm] from platform_probe+0x58/0xa8
> [    7.594542]  platform_probe from really_probe+0x144/0x2ac
> [    7.600249]  really_probe from __driver_probe_device+0xc4/0xd8
> [    7.606411]  __driver_probe_device from driver_probe_device+0x3c/0xb8
> [    7.613216]  driver_probe_device from __device_attach_driver+0x58/0xbc
> [    7.620115]  __device_attach_driver from bus_for_each_drv+0xa0/0xb4
> [    7.626737]  bus_for_each_drv from __device_attach+0xdc/0x150
> [    7.632808]  __device_attach from bus_probe_device+0x28/0x80
> [    7.638792]  bus_probe_device from deferred_probe_work_func+0x84/0xa0
> [    7.645595]  deferred_probe_work_func from process_one_work+0x1a4/0x2d8
> [    7.652587]  process_one_work from worker_thread+0x214/0x2b8
> [    7.658567]  worker_thread from kthread+0xe4/0xf0
> [    7.663542]  kthread from ret_from_fork+0x14/0x1c
> [    7.668515] Exception stack(0xf01b5fb0 to 0xf01b5ff8)
> [    7.673827] 5fa0:                                     00000000 00000000 00000000 00000000
> [    7.682435] 5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> [    7.691038] 5fe0: 00000000 00000000 00000000 00000000 00000013 00000000
> 
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>   drivers/gpu/drm/omapdrm/dss/dsi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
> index ea63c64d3a1ab..c37eb6b1b9a39 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -4411,7 +4411,7 @@ static int omap_dsi_host_detach(struct mipi_dsi_host *host,
>   {
>   	struct dsi_data *dsi = host_to_omap(host);
>   
> -	if (WARN_ON(dsi->dsidev != client))
> +	if (!dsi->dsidev || WARN_ON(dsi->dsidev != client))
>   		return -EINVAL;
>   
>   	cancel_delayed_work_sync(&dsi->dsi_disable_work);

I sent a patch to the DSI framework code,
"[PATCH] drm/mipi-dsi: Fix detach call without attach".

If that fixes the issue (please test, I don't have a suitable platform), 
perhaps it's a better fix as detach really shouldn't be called if attach 
has not been called.

  Tomi

