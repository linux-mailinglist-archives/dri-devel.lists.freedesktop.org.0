Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D334694FA66
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 01:47:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2DB010E194;
	Mon, 12 Aug 2024 23:47:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="t43A0KxR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4C8E10E194
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 23:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1723506454; x=1724111254; i=wahrenst@gmx.net;
 bh=l6OouXenCvAZE1JaCg4HpNacCouIsLa/UOywMg/akPQ=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=t43A0KxRTShwhq51DmI0Hx9L+gPZrgr8r00BkJx0VDqA+AIo08KkR7JQ0dN6tOrH
 qovMsbM5X7bSgi2yOq4xKC/IZxVpLd2xejYCjVJPnC6z+gPltVxGfvgxKrR8gXZUt
 1Z0ccgiWaaLB6ANTDP8rFNYS4MJOsPDw85eXzompgU1MK5HzTuZ+jBKdDmoRfFdM2
 K4P+5acYr+5/PaN+1ZQ0UMhGiBhnW/i1JqxdLMD93A7MQAaDHqDn/lopnaj9jJo5W
 NmX9u90FIMpYEZ++rcIbXTcDe0VVs03SbcCReqheJ0paHtnmddE/hJEtyEAETwbEt
 J23elkwHdIEPzPmN1A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.127] ([37.4.248.43]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MzQkK-1sHZZ80T5c-00wJPv; Tue, 13
 Aug 2024 01:47:34 +0200
Message-ID: <65de7db8-4f81-4c31-be8d-3a03c9aee989@gmx.net>
Date: Tue, 13 Aug 2024 01:47:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 14/16] WIP: usb: dwc2: Implement recovery after PM
 domain off
To: Douglas Anderson <dianders@chromium.org>
Cc: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Minas Harutyunyan <hminas@synopsys.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lukas Wunner <lukas@wunner.de>,
 Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
 Peter Robinson <pbrobinson@gmail.com>, dri-devel@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, linux-pm@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel-list@raspberrypi.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Maxime Ripard <mripard@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Jiri Slaby <jirislaby@kernel.org>
References: <20240728114200.75559-1-wahrenst@gmx.net>
 <20240728130029.78279-1-wahrenst@gmx.net>
 <20240728130029.78279-6-wahrenst@gmx.net>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20240728130029.78279-6-wahrenst@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Ik08zjVVUi5qEx5fIPQKnKhjJUj59/tBCsiGz1eN2Pm7Quoj1iB
 SNlD/gQNZC+VslWH4bG/F4WMdl+kUsV+eZR5HGLwXPDSsYua5jSrb0wMxxwJF3fvDSbd6FT
 HB0bM/UR6ghRTw2R16IKIywSoWG8yUg48pEenKwPKiTxdr6jNEj3vV7Un2zBIDF+c2rtGeE
 ewOqTvQZHzg7flD1ehlfg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:NX0Jg3iPZl8=;vEzuC2Ms0J1UDvbMW+dkF3nw9v6
 QxRDXzBRZ88Xu+UB/MqvguubkOqslla23fyby/q23PArECBFoJWaarYRKhLBMfcQsuWQOmgFO
 HolMSpEnntoeKW2xxoA3N8xiNTCFhSQRfK7ZTDpvnx2IeUDuGJHNKva99JSE5tGhgrECIAUJn
 kWoRj+3clw6L+Gjch16MVT14HC3Z3ZxSEqnnjnY4XUaTK61DlkOSbOIBEkRT13XILgGld8geF
 WIw2kv2mwmLD/mscf0/S8vYoAGMbY9E0GLLiiKcaDqQeJNLYNgiELj3iNEPYGcpPZqcj6pJlP
 LWJUchihGQf9fccffqoUkmq47mHYsX/BCGUKvgRPvyLp/+7JeyKad0p29iT55Xi2v57bAgz0s
 MwAxN4f0Kb/YA3RDoF2ZJtc5HPvw89Q1uTnyGrEuCwg4bnL9GG2pwB8lPWPXrg77YMlWNQGTD
 GLCVlqju1pNSwXxOdUEOEWH6PUP3oGeH2qNInXNkuGhbJAnbK8kg1U9zqk+eW7oS3Fhfnwgmj
 igtuxme4puuD9cVZJZjHpok5o5HdA3eIk5tICxeB3+cgdNdH3sb02DFmsnByOR3uU3kchJ/Mm
 ZYj3juRMZawas6N9kBtUmP2CkBqniww9tkOPUtDSq82u58l+puwNazQc4xr9icO3mqDbEoN1K
 LoNFygfIHNY75rxXJGoUBUJq948Edj0nJG09QpRFCf/4Nrh0BPU6Hrkc7OxWyQ25pmD6uAanJ
 WWOgvP0dVejplW6rwX9h9gUz3rWxuKnt9HT6cYsZb7W2paYAQs9uf1w7ztYA0wWbCYEbc5oRL
 +SV9+eiPUC+YpeQ4WL55vhAA==
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

Hi Doug,

Am 28.07.24 um 15:00 schrieb Stefan Wahren:
> DO NOT MERGE
>
> According to the dt-bindings there are some platforms, which have a
> dedicated USB power domain for DWC2 IP core supply. If the power domain
> is switched off during system suspend then all USB register will lose
> their settings.
>
> So use the power on/off notifier in order to save & restore the USB
> registers during system suspend.
sorry for bothering you with this DWC2 stuff, but it would great if you
can gave some feedback about this patch. I was working a lot to get
suspend to idle working on Raspberry Pi. And this patch is the most
complex part of the series.

Would you agree with this approach or did i miss something?

The problem is that the power domain driver acts independent from dwc2,
so we cannot prevent the USB domain power down except declaring a USB
device as wakeup source. So i decided to use the notifier approach. This
has been successful tested on some older Raspberry Pi boards.

Best regards
>
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---
>
> Any feedback is appreciated.
>
>   drivers/usb/dwc2/core.c     | 16 ++++++++++++
>   drivers/usb/dwc2/core.h     | 17 +++++++++++++
>   drivers/usb/dwc2/gadget.c   | 49 +++++++++++++++++++++++++++++++++++++
>   drivers/usb/dwc2/hcd.c      | 49 +++++++++++++++++++++++++++++++++++++
>   drivers/usb/dwc2/platform.c | 32 ++++++++++++++++++++++++
>   5 files changed, 163 insertions(+)
>
> diff --git a/drivers/usb/dwc2/core.c b/drivers/usb/dwc2/core.c
> index 9919ab725d54..a3263cfdedac 100644
> --- a/drivers/usb/dwc2/core.c
> +++ b/drivers/usb/dwc2/core.c
> @@ -391,6 +391,22 @@ int dwc2_exit_hibernation(struct dwc2_hsotg *hsotg,=
 int rem_wakeup,
>   		return dwc2_gadget_exit_hibernation(hsotg, rem_wakeup, reset);
>   }
>
> +int dwc2_enter_poweroff(struct dwc2_hsotg *hsotg)
> +{
> +	if (dwc2_is_host_mode(hsotg))
> +		return dwc2_host_enter_poweroff(hsotg);
> +	else
> +		return dwc2_gadget_enter_poweroff(hsotg);
> +}
> +
> +int dwc2_exit_poweroff(struct dwc2_hsotg *hsotg)
> +{
> +	if (dwc2_is_host_mode(hsotg))
> +		return dwc2_host_exit_poweroff(hsotg);
> +	else
> +		return dwc2_gadget_exit_poweroff(hsotg);
> +}
> +
>   /*
>    * Do core a soft reset of the core.  Be careful with this because it
>    * resets all the internal state machines of the core.
> diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
> index 2bd74f3033ed..9ab755cc3081 100644
> --- a/drivers/usb/dwc2/core.h
> +++ b/drivers/usb/dwc2/core.h
> @@ -9,6 +9,7 @@
>   #define __DWC2_CORE_H__
>
>   #include <linux/acpi.h>
> +#include <linux/notifier.h>
>   #include <linux/phy/phy.h>
>   #include <linux/regulator/consumer.h>
>   #include <linux/usb/gadget.h>
> @@ -1080,6 +1081,8 @@ struct dwc2_hsotg {
>   	struct regulator *vbus_supply;
>   	struct regulator *usb33d;
>
> +	struct notifier_block genpd_nb;
> +
>   	spinlock_t lock;
>   	void *priv;
>   	int     irq;
> @@ -1316,6 +1319,8 @@ int dwc2_exit_partial_power_down(struct dwc2_hsotg=
 *hsotg, int rem_wakeup,
>   int dwc2_enter_hibernation(struct dwc2_hsotg *hsotg, int is_host);
>   int dwc2_exit_hibernation(struct dwc2_hsotg *hsotg, int rem_wakeup,
>   		int reset, int is_host);
> +int dwc2_enter_poweroff(struct dwc2_hsotg *hsotg);
> +int dwc2_exit_poweroff(struct dwc2_hsotg *hsotg);
>   void dwc2_init_fs_ls_pclk_sel(struct dwc2_hsotg *hsotg);
>   int dwc2_phy_init(struct dwc2_hsotg *hsotg, bool select_phy);
>
> @@ -1435,6 +1440,8 @@ int dwc2_hsotg_tx_fifo_total_depth(struct dwc2_hso=
tg *hsotg);
>   int dwc2_hsotg_tx_fifo_average_depth(struct dwc2_hsotg *hsotg);
>   void dwc2_gadget_init_lpm(struct dwc2_hsotg *hsotg);
>   void dwc2_gadget_program_ref_clk(struct dwc2_hsotg *hsotg);
> +int dwc2_gadget_enter_poweroff(struct dwc2_hsotg *hsotg);
> +int dwc2_gadget_exit_poweroff(struct dwc2_hsotg *hsotg);
>   static inline void dwc2_clear_fifo_map(struct dwc2_hsotg *hsotg)
>   { hsotg->fifo_map =3D 0; }
>   #else
> @@ -1482,6 +1489,10 @@ static inline int dwc2_hsotg_tx_fifo_average_dept=
h(struct dwc2_hsotg *hsotg)
>   { return 0; }
>   static inline void dwc2_gadget_init_lpm(struct dwc2_hsotg *hsotg) {}
>   static inline void dwc2_gadget_program_ref_clk(struct dwc2_hsotg *hsot=
g) {}
> +static inline int dwc2_gadget_enter_poweroff(struct dwc2_hsotg *hsotg)
> +{ return 0; }
> +static inline int dwc2_gadget_exit_poweroff(struct dwc2_hsotg *hsotg)
> +{ return 0; }
>   static inline void dwc2_clear_fifo_map(struct dwc2_hsotg *hsotg) {}
>   #endif
>
> @@ -1505,6 +1516,8 @@ int dwc2_host_exit_partial_power_down(struct dwc2_=
hsotg *hsotg,
>   void dwc2_host_enter_clock_gating(struct dwc2_hsotg *hsotg);
>   void dwc2_host_exit_clock_gating(struct dwc2_hsotg *hsotg, int rem_wak=
eup);
>   bool dwc2_host_can_poweroff_phy(struct dwc2_hsotg *dwc2);
> +int dwc2_host_enter_poweroff(struct dwc2_hsotg *hsotg);
> +int dwc2_host_exit_poweroff(struct dwc2_hsotg *hsotg);
>   static inline void dwc2_host_schedule_phy_reset(struct dwc2_hsotg *hso=
tg)
>   { schedule_work(&hsotg->phy_reset_work); }
>   #else
> @@ -1544,6 +1557,10 @@ static inline void dwc2_host_exit_clock_gating(st=
ruct dwc2_hsotg *hsotg,
>   					       int rem_wakeup) {}
>   static inline bool dwc2_host_can_poweroff_phy(struct dwc2_hsotg *dwc2)
>   { return false; }
> +static inline int dwc2_host_enter_poweroff(struct dwc2_hsotg *hsotg)
> +{ return 0; }
> +static inline int dwc2_host_exit_poweroff(struct dwc2_hsotg *hsotg)
> +{ return 0; }
>   static inline void dwc2_host_schedule_phy_reset(struct dwc2_hsotg *hso=
tg) {}
>
>   #endif
> diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
> index e7bf9cc635be..38f0112970fe 100644
> --- a/drivers/usb/dwc2/gadget.c
> +++ b/drivers/usb/dwc2/gadget.c
> @@ -5710,3 +5710,52 @@ void dwc2_gadget_exit_clock_gating(struct dwc2_hs=
otg *hsotg, int rem_wakeup)
>   	hsotg->lx_state =3D DWC2_L0;
>   	hsotg->bus_suspended =3D false;
>   }
> +
> +int dwc2_gadget_enter_poweroff(struct dwc2_hsotg *hsotg)
> +{
> +	int ret;
> +
> +	dev_dbg(hsotg->dev, "Entering device power off.\n");
> +
> +	/* Backup all registers */
> +	ret =3D dwc2_backup_global_registers(hsotg);
> +	if (ret) {
> +		dev_err(hsotg->dev, "%s: failed to backup global registers\n",
> +			__func__);
> +		return ret;
> +	}
> +
> +	ret =3D dwc2_backup_device_registers(hsotg);
> +	if (ret) {
> +		dev_err(hsotg->dev, "%s: failed to backup device registers\n",
> +			__func__);
> +		return ret;
> +	}
> +
> +	dev_dbg(hsotg->dev, "Entering device power off completed.\n");
> +	return 0;
> +}
> +
> +int dwc2_gadget_exit_poweroff(struct dwc2_hsotg *hsotg)
> +{
> +	int ret;
> +
> +	dev_dbg(hsotg->dev, "Exiting device power off.\n");
> +
> +	ret =3D dwc2_restore_global_registers(hsotg);
> +	if (ret) {
> +		dev_err(hsotg->dev, "%s: failed to restore registers\n",
> +			__func__);
> +		return ret;
> +	}
> +
> +	ret =3D dwc2_restore_device_registers(hsotg, 0);
> +	if (ret) {
> +		dev_err(hsotg->dev, "%s: failed to restore device registers\n",
> +			__func__);
> +		return ret;
> +	}
> +
> +	dev_dbg(hsotg->dev, "Exiting device power off completed.\n");
> +	return 0;
> +}
> diff --git a/drivers/usb/dwc2/hcd.c b/drivers/usb/dwc2/hcd.c
> index cb54390e7de4..22afdafb474e 100644
> --- a/drivers/usb/dwc2/hcd.c
> +++ b/drivers/usb/dwc2/hcd.c
> @@ -5993,3 +5993,52 @@ void dwc2_host_exit_clock_gating(struct dwc2_hsot=
g *hsotg, int rem_wakeup)
>   			  jiffies + msecs_to_jiffies(71));
>   	}
>   }
> +
> +int dwc2_host_enter_poweroff(struct dwc2_hsotg *hsotg)
> +{
> +	int ret;
> +
> +	dev_dbg(hsotg->dev, "Entering host power off.\n");
> +
> +	/* Backup all registers */
> +	ret =3D dwc2_backup_global_registers(hsotg);
> +	if (ret) {
> +		dev_err(hsotg->dev, "%s: failed to backup global registers\n",
> +			__func__);
> +		return ret;
> +	}
> +
> +	ret =3D dwc2_backup_host_registers(hsotg);
> +	if (ret) {
> +		dev_err(hsotg->dev, "%s: failed to backup host registers\n",
> +			__func__);
> +		return ret;
> +	}
> +
> +	dev_dbg(hsotg->dev, "Entering host power off completed.\n");
> +	return 0;
> +}
> +
> +int dwc2_host_exit_poweroff(struct dwc2_hsotg *hsotg)
> +{
> +	int ret;
> +
> +	dev_dbg(hsotg->dev, "Exiting host power off.\n");
> +
> +	ret =3D dwc2_restore_global_registers(hsotg);
> +	if (ret) {
> +		dev_err(hsotg->dev, "%s: failed to restore registers\n",
> +			__func__);
> +		return ret;
> +	}
> +
> +	ret =3D dwc2_restore_host_registers(hsotg);
> +	if (ret) {
> +		dev_err(hsotg->dev, "%s: failed to restore host registers\n",
> +			__func__);
> +		return ret;
> +	}
> +
> +	dev_dbg(hsotg->dev, "Exiting host power off completed.\n");
> +	return 0;
> +}
> diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
> index 7b84416dfc2b..b97eefc18a6b 100644
> --- a/drivers/usb/dwc2/platform.c
> +++ b/drivers/usb/dwc2/platform.c
> @@ -16,6 +16,7 @@
>   #include <linux/platform_device.h>
>   #include <linux/phy/phy.h>
>   #include <linux/platform_data/s3c-hsotg.h>
> +#include <linux/pm_domain.h>
>   #include <linux/reset.h>
>
>   #include <linux/usb/of.h>
> @@ -307,6 +308,8 @@ static void dwc2_driver_remove(struct platform_devic=
e *dev)
>   	struct dwc2_gregs_backup *gr;
>   	int ret =3D 0;
>
> +	dev_pm_genpd_remove_notifier(&dev->dev);
> +
>   	gr =3D &hsotg->gr_backup;
>
>   	/* Exit Hibernation when driver is removed. */
> @@ -421,6 +424,31 @@ int dwc2_check_core_version(struct dwc2_hsotg *hsot=
g)
>   	return 0;
>   }
>
> +static int dwc2_power_notifier(struct notifier_block *nb,
> +			       unsigned long action, void *data)
> +{
> +	struct dwc2_hsotg *hsotg =3D container_of(nb, struct dwc2_hsotg,
> +						genpd_nb);
> +	int ret;
> +
> +	switch (action) {
> +	case GENPD_NOTIFY_ON:
> +		ret =3D dwc2_exit_poweroff(hsotg);
> +		if (ret)
> +			dev_err(hsotg->dev, "exit poweroff failed\n");
> +		break;
> +	case GENPD_NOTIFY_PRE_OFF:
> +		ret =3D dwc2_enter_poweroff(hsotg);
> +		if (ret)
> +			dev_err(hsotg->dev, "enter poweroff failed\n");
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return NOTIFY_OK;
> +}
> +
>   /**
>    * dwc2_driver_probe() - Called when the DWC_otg core is bound to the =
DWC_otg
>    * driver
> @@ -620,6 +648,10 @@ static int dwc2_driver_probe(struct platform_device=
 *dev)
>   		}
>   	}
>   #endif /* CONFIG_USB_DWC2_PERIPHERAL || CONFIG_USB_DWC2_DUAL_ROLE */
> +
> +	hsotg->genpd_nb.notifier_call =3D dwc2_power_notifier;
> +	dev_pm_genpd_add_notifier(&dev->dev, &hsotg->genpd_nb);
> +
>   	return 0;
>
>   #if IS_ENABLED(CONFIG_USB_DWC2_PERIPHERAL) || \
> --
> 2.34.1
>

