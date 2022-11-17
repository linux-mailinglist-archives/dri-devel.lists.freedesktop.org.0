Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC6F62DC1C
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 13:58:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFB3E10E5F2;
	Thu, 17 Nov 2022 12:58:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F6C310E5F2
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 12:58:03 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20221117125801euoutp0247569120a791d93dbf33b71ba65517ed~oYJs1ZsgD0078100781euoutp02w
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 12:58:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20221117125801euoutp0247569120a791d93dbf33b71ba65517ed~oYJs1ZsgD0078100781euoutp02w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1668689881;
 bh=sTiqRqTatUx/IYBDGwO9vZ9SRjcWoT3eLlRzZSD7HkA=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=uLhLgCdFKr7y/TjlYQMulcMH6pnhJgdCJzgL9TwvjTQz1HaYuaxq5CHsPYIahw73V
 +XmyLyjih11sbtViThRt89PIgkpkS4gXGhNBCkUdas+aNRS0+wjIlKjeYIqyWf8a+j
 2f05dFxcIyE6uszPB9jghnK3+8ZCX3py+J3mqhpc=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20221117125801eucas1p2c99246d14fbd4c6d30fa053f9e469de2~oYJsgoVbq2964129641eucas1p2B;
 Thu, 17 Nov 2022 12:58:01 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id EC.00.09561.9DF26736; Thu, 17
 Nov 2022 12:58:01 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20221117125800eucas1p29bc0adbe623ca0c42e903e771bf68b33~oYJsD3Pig1658416584eucas1p26;
 Thu, 17 Nov 2022 12:58:00 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20221117125800eusmtrp188821c0e3548d68fe5908f32e2f11c6b~oYJsDNipA2117021170eusmtrp1X;
 Thu, 17 Nov 2022 12:58:00 +0000 (GMT)
X-AuditID: cbfec7f2-0b3ff70000002559-b1-63762fd9b3c9
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 97.19.09026.8DF26736; Thu, 17
 Nov 2022 12:58:00 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20221117125759eusmtip1bb90944edee2abe11b8d921a0874ae0d~oYJqyH1kD0415604156eusmtip1a;
 Thu, 17 Nov 2022 12:57:59 +0000 (GMT)
Message-ID: <ee076724-cee3-cd6a-de44-191e058fddbb@samsung.com>
Date: Thu, 17 Nov 2022 13:57:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [v2,5/6] drm/fb-helper: Schedule deferred-I/O worker after
 writing to framebuffer
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, javierm@redhat.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20221115115819.23088-6-tzimmermann@suse.de>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0wTaRTNNzNMpzWVoUW4EV21icYnSOJjfEazG9PEH9jE9w9thUmrtkA6
 oKJRUZfagiF0RYESsFgVg1EUK1ZiEZBYsUrFoCAPiUoQqUQBeSihLO3oLv/OPfecnHtvLoVL
 KoKmU/vjk1h9vEorI0VE+ZMf9UveRh2KXWp3UczTpssYU/S+HWfGy8040zj4lWSKLhYjxpo/
 hTG33hYwRX33CMZguhbE2L+YgzaI5M4hKyF/YGkXyMtKTKS8sE4h78hwYfK7V07Kv1a+JuV3
 3ce2ULtFa+NY7f5DrD5qvVKkuXAzFyW+WXFk7JlbkIpuRaYjIQX0MqhrqRSkIxEloa8jGPCM
 I774jiDT+E7gV0noAQQfHgf/dvz4+T2IFxUjSGtq+uXoQ5D7whRwiOn14C6oJv2YoOdCwctu
 jOdDoC6vk/DjaXQcFNmbA7yUVsKQuR/5MU6HQ0vnpQAfShcisI0o/QE4fQOBo9ETaJB0NKT3
 pgcChPQqyDak4rx5Fpy5l4/7DUBnCME64sT4uf+CWpv7F5ZCj8su4PEMcJ8/R/CGswisox0Y
 X2QhSP3UgnjVGmir/zkRR01ELIDSiiie3gjWigyBnwZ6KjT3hvBDTIV/ynNwnhaD0SDh1fPA
 4rr1X2z1y1d4FpJZJt3FMml/y6R1LP/nWhFRgsLZZE6nZrnoePZwJKfSccnx6sjYBF0Zmngv
 t8/V70AFPX2RNQijUA0CCpeFinUNybEScZwq5SirT9irT9ayXA2KoAhZuJjMXRgrodWqJPYg
 yyay+t9djBJOT8XOi3Z/VGqa2nKdaVezFiEszKMczvEGK7J71Z2exYaDmT77KumutleZD7m+
 sB2PC5Zq7quXCRo9aaZBXeGlEmMEGWLTj3TN9jlnnW51vhPPzUiY5lPEPO+av2RolLlg6tG0
 esNXDAq926olmoZTqm9b9+70Bgslwx3mrr/XtEYUa9keQuvNCvPUzTyacuZPR+lY/ejykVpj
 18k5hrXdjhyhL4bcc64qpXtO5/H+L9WlG4jNtjuYcd126adv3ABnmamotZFjeXkHnMNl284S
 tQs+xBiOr9PgofVOZlOlY0vVifs79z1K1KiSFks3KvY0N/xBSbN1hqrV45/bV5aLZQSnUUUv
 xPWc6l/D+1UbzQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDIsWRmVeSWpSXmKPExsVy+t/xu7o39MuSDbYt1LU4cX0Rk8XCh3eZ
 Lf5vm8hsceXrezaLhdOWM1osmM1tMfH2BnaLhR+3sli0dS5jtdjyZiKrA5fH3m8LWDx2zrrL
 7rFpVSebx7yTgR73u48zeWxeUu/xft9VNo/Np6sDOKL0bIryS0tSFTLyi0tslaINLYz0DC0t
 9IxMLPUMjc1jrYxMlfTtbFJSczLLUov07RL0MqauncFYcM2s4u+p0+wNjOv0uhg5OSQETCR+
 /vrC2sXIxSEksJRR4vrR/4wQCRmJk9MaWCFsYYk/17rYIIreM0psaVvBApLgFbCTOD33IBuI
 zSKgKjH3wgsmiLigxMmZT4BqODhEBVIk1h2JAgkLCyRIfJv4CWw+s4C4xK0n85lAZooIzGOU
 uHL8AiOIwyywmlFiTUcv2CAhAQuJ6Y/eMoPYbAKGEl1vu8CWcQpYSkxpa2CGmGQm0bW1C2qq
 vETz1tnMExiFZiG5YxaShbOQtMxC0rKAkWUVo0hqaXFuem6xkV5xYm5xaV66XnJ+7iZGYLRu
 O/Zzyw7Gla8+6h1iZOJgPMQowcGsJMKbe7E0WYg3JbGyKrUoP76oNCe1+BCjKTAwJjJLiSbn
 A9NFXkm8oZmBqaGJmaWBqaWZsZI4r2dBR6KQQHpiSWp2ampBahFMHxMHp1QD0/Sndc9EHc/L
 7N5mMaddJOj6/6JFDdd/rPUwenRnB/s61QlLzp9Nm2Xkuo7t1+TJakVyvw0LFdsX5otqPmh9
 KmvQG99aqMMbZCt8N6O43WRHV56T2g+J2w4t229suRIdxnXIuO3e/1X20xdovNzSe+V20T7b
 Rl/DY0t/1fb7vNAWtfGok05IiPg5seLHF6WPe5Ykqm0y33u6ReODUthxp88JguKfq1IqNged
 82iaX/b0d792TG7qR8Yz16O/59kdbDtvFulZ+/5pYkXB0ycxx9RuVtyTU5D7c+nunCs3Pu7o
 XnP3hda2hBc1Iq3We+f+YWW6zNsys61NbfOftdenSfYHCrr+Fr2jbaPHJuUUrsRSnJFoqMVc
 VJwIAN9RmpNfAwAA
X-CMS-MailID: 20221117125800eucas1p29bc0adbe623ca0c42e903e771bf68b33
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20221117125800eucas1p29bc0adbe623ca0c42e903e771bf68b33
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20221117125800eucas1p29bc0adbe623ca0c42e903e771bf68b33
References: <20221115115819.23088-6-tzimmermann@suse.de>
 <CGME20221117125800eucas1p29bc0adbe623ca0c42e903e771bf68b33@eucas1p2.samsung.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On 15.11.2022 12:58, Thomas Zimmermann wrote:
> Schedule the deferred-I/O worker instead of the damage worker after
> writing to the fbdev framebuffer. The deferred-I/O worker then performs
> the dirty-fb update. The fbdev emulation will initialize deferred I/O
> for all drivers that require damage updates. It is therefore a valid
> assumption that the deferred-I/O worker is present.
>
> It would be possible to perform the damage handling directly from within
> the write operation. But doing this could increase the overhead of the
> write or interfere with a concurrently scheduled deferred-I/O worker.
> Instead, scheduling the deferred-I/O worker with its regular delay of
> 50 ms removes load off the write operation and allows the deferred-I/O
> worker to handle multiple write operations that arrived during the delay
> time window.
>
> v2:
> 	* keep drm_fb_helper_damage() (Daniel)
> 	* use fb_deferred_io_schedule_flush() (Daniel)
> 	* clarify comments (Daniel)
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

This patch, merged into today's linux-next as commit 7f5cc4a3e5e4 
("drm/fb-helper: Schedule deferred-I/O worker after writing to 
framebuffer"), triggers a following warning on Raspberry Pi 3 & 4 as 
well as all Amlogic Meson G12A/B based boards:

------------[ cut here ]------------
WARNING: CPU: 0 PID: 220 at drivers/video/fbdev/core/fb_defio.c:340 
soft_cursor+0x180/0x1f0
Modules linked in: brcmfmac brcmutil vc4(+) sha256_generic libsha256 
snd_soc_hdmi_codec sha256_arm cfg80211 snd_soc_core ac97_bus 
snd_pcm_dmaengine hci_uart btbcm snd_pcm snd_timer snd crc32_arm_ce 
soundcore raspberrypi_hwmon drm_dma_helper bluetooth bcm2835_thermal 
ecdh_generic ecc libaes
CPU: 0 PID: 220 Comm: systemd-udevd Not tainted 
6.1.0-rc5-next-20221117-00041-g13334c897c2b #5953
Hardware name: BCM2835
  unwind_backtrace from show_stack+0x10/0x14
  show_stack from dump_stack_lvl+0x40/0x4c
  dump_stack_lvl from __warn+0xc8/0x13c
  __warn from warn_slowpath_fmt+0x5c/0xb8
  warn_slowpath_fmt from soft_cursor+0x180/0x1f0
  soft_cursor from bit_cursor+0x320/0x4d0
  bit_cursor from fbcon_cursor+0xf4/0x124
  fbcon_cursor from hide_cursor+0x30/0x98
  hide_cursor from redraw_screen+0x1e8/0x230
  redraw_screen from fbcon_prepare_logo+0x390/0x44c
  fbcon_prepare_logo from fbcon_init+0x494/0x5ac
  fbcon_init from visual_init+0xc0/0x108
  visual_init from do_bind_con_driver+0x1b8/0x3a8
  do_bind_con_driver from do_take_over_console+0x13c/0x1e8
  do_take_over_console from do_fbcon_takeover+0x70/0xd0
  do_fbcon_takeover from fbcon_fb_registered+0x19c/0x1ac
  fbcon_fb_registered from register_framebuffer+0x1ec/0x2ec
  register_framebuffer from 
__drm_fb_helper_initial_config_and_unlock+0x3f0/0x5b8
  __drm_fb_helper_initial_config_and_unlock from 
drm_fbdev_client_hotplug+0xbc/0x120
  drm_fbdev_client_hotplug from drm_fbdev_generic_setup+0x88/0x174
  drm_fbdev_generic_setup from vc4_drm_bind+0x1fc/0x294 [vc4]
  vc4_drm_bind [vc4] from try_to_bring_up_aggregate_device+0x160/0x1bc
  try_to_bring_up_aggregate_device from 
component_master_add_with_match+0xc4/0xf8
  component_master_add_with_match from vc4_platform_drm_probe+0xa0/0xc0 
[vc4]
  vc4_platform_drm_probe [vc4] from platform_probe+0x5c/0xb8
  platform_probe from really_probe+0xc8/0x2f0
  really_probe from __driver_probe_device+0x84/0xe4
  __driver_probe_device from driver_probe_device+0x30/0x104
  driver_probe_device from __driver_attach+0x90/0x174
  __driver_attach from bus_for_each_dev+0x70/0xb0
  bus_for_each_dev from bus_add_driver+0x164/0x1f0
  bus_add_driver from driver_register+0x88/0x11c
  driver_register from vc4_drm_register+0x44/0x1000 [vc4]
  vc4_drm_register [vc4] from do_one_initcall+0x40/0x1e0
  do_one_initcall from do_init_module+0x44/0x1d4
  do_init_module from sys_finit_module+0xbc/0xf8
  sys_finit_module from ret_fast_syscall+0x0/0x54
Exception stack(0xf0d85fa8 to 0xf0d85ff0)
...
---[ end trace 0000000000000000 ]---
Console: switching to colour frame buffer device 90x30

It looks that at least the VC4 DRM and Meson DRM drivers needs some 
adjustments to avoid this warning. Am I right?


> ---
>   drivers/gpu/drm/drm_fb_helper.c     | 10 +++++++++-
>   drivers/video/fbdev/core/fb_defio.c | 16 ++++++++++++++++
>   include/linux/fb.h                  |  1 +
>   3 files changed, 26 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index cdbf03e941b2b..fbb9088f7defc 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -599,9 +599,17 @@ static void drm_fb_helper_add_damage_clip(struct drm_fb_helper *helper, u32 x, u
>   static void drm_fb_helper_damage(struct drm_fb_helper *helper, u32 x, u32 y,
>   				 u32 width, u32 height)
>   {
> +	struct drm_device *dev = helper->dev;
> +	struct fb_info *info = helper->info;
> +
>   	drm_fb_helper_add_damage_clip(helper, x, y, width, height);
>   
> -	schedule_work(&helper->damage_work);
> +	/*
> +	 * The current fbdev emulation only flushes buffers if a damage
> +	 * update is necessary. And we can assume that deferred I/O has
> +	 * been enabled as damage updates require deferred I/O for mmap.
> +	 */
> +	fb_deferred_io_schedule_flush(info);
>   }
>   
>   /*
> diff --git a/drivers/video/fbdev/core/fb_defio.c b/drivers/video/fbdev/core/fb_defio.c
> index c730253ab85ce..dec678f72a42f 100644
> --- a/drivers/video/fbdev/core/fb_defio.c
> +++ b/drivers/video/fbdev/core/fb_defio.c
> @@ -332,3 +332,19 @@ void fb_deferred_io_cleanup(struct fb_info *info)
>   	mutex_destroy(&fbdefio->lock);
>   }
>   EXPORT_SYMBOL_GPL(fb_deferred_io_cleanup);
> +
> +void fb_deferred_io_schedule_flush(struct fb_info *info)
> +{
> +	struct fb_deferred_io *fbdefio = info->fbdefio;
> +
> +	if (WARN_ON_ONCE(!fbdefio))
> +		return; /* bug in driver logic */
> +
> +	/*
> +	 * There's no requirement from callers to schedule the
> +	 * flush immediately. Rather schedule the worker with a
> +	 * delay and let a few more writes pile up.
> +	 */
> +	schedule_delayed_work(&info->deferred_work, fbdefio->delay);
> +}
> +EXPORT_SYMBOL_GPL(fb_deferred_io_schedule_flush);
> diff --git a/include/linux/fb.h b/include/linux/fb.h
> index bcb8658f5b64d..172f271520c78 100644
> --- a/include/linux/fb.h
> +++ b/include/linux/fb.h
> @@ -663,6 +663,7 @@ extern void fb_deferred_io_open(struct fb_info *info,
>   				struct inode *inode,
>   				struct file *file);
>   extern void fb_deferred_io_cleanup(struct fb_info *info);
> +extern void fb_deferred_io_schedule_flush(struct fb_info *info);
>   extern int fb_deferred_io_fsync(struct file *file, loff_t start,
>   				loff_t end, int datasync);
>   

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

