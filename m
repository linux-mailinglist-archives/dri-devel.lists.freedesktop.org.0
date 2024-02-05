Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3F58495A3
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 09:48:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D7B81121AE;
	Mon,  5 Feb 2024 08:48:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fmZh1Zlo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C50D21121AE;
 Mon,  5 Feb 2024 08:48:45 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-51121637524so6222690e87.1; 
 Mon, 05 Feb 2024 00:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707122924; x=1707727724; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2ydA0TsnU465lLz9wxK97OfQIetnhQ94qrcei325RlU=;
 b=fmZh1Zlo7DcSy6fH4ki656DWCsniZE6PdeQ0u+jHjXVJ3KkuJILabTlaX/FpZLC/+X
 kQWC3erm4cVxjQki2QjFEHsuvSiCcXdbcVPG7uwZtkIJ5C4jhdnOFzAumlUigrB09OD8
 oY4GBFt3Q3/1nSJE494QeY5+DQFMYTI1ZP14TwpPwHQUy2PZnYUkNOlfyvNCHYVzA80m
 6uD97lmacgGEKv+I6Mv5+E8Phxfnx621gMoKczr2BFd3hpFfIf03WWP1/+TMjQqHfTH7
 gwjSv3lUUf6NH68+WtjyodYIp66W3HLtNig71LbzjbAoQp222w3YCzYzoU53vdYSHUXp
 4jMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707122924; x=1707727724;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2ydA0TsnU465lLz9wxK97OfQIetnhQ94qrcei325RlU=;
 b=QPuliCb4YzPn1bCUUnpzjVJjrdIw0v0Wsxp5QjnORor1rF1wuKnKeJdQvBXc/oNVB+
 Do93tUtzy1HLuEz2VIgnQ9dky7F33OwRpLI4ljOeariNg+sHvTpm1i9lGpBMDr9TYaRH
 Pv0YVUGEcroN5TtLMZxfipc1m8W1WRCgKnXjk/YysaG+MjgGh6EgYrWaljIRp0/AocAq
 mIvAczQwv85KQsZPCYGFasHfPcL0pqIvgPGUGbjPc5WVrOgweK8qwp9NXemTU6aAklgJ
 WMUY2pfVYFUl7aZECn34OfbIqnTYjuKLwoGY3KZW2GHhpVt6EShOsNaWbd7Ri5t/F4jV
 4hTA==
X-Gm-Message-State: AOJu0YytQlkdYEQmEtMPZM67UuD83caeQwKWE3hSH+4ADXpY5yh+TUjd
 n075Y3yxtQvzVwaq2gCGjMc9a/4CmFU69/VNSpTiqDvACWHnY6gR
X-Google-Smtp-Source: AGHT+IGj2EJGaW3ePkdcXnqMICBr00UnLOrY2sn4RNzOXXc74BszNhMhBcvP3UIS16mAc/2cBo9nZg==
X-Received: by 2002:a05:6512:31cb:b0:511:3a70:b954 with SMTP id
 j11-20020a05651231cb00b005113a70b954mr6520932lfe.18.1707122923640; 
 Mon, 05 Feb 2024 00:48:43 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCXCoeSRFEtdkJcbTVUZ54U6K3KuWSeDkOfG2db1WYNHjJg/nRAjfbybs8KpLWSO1Pd6zr/YZ1svqmlZm3as6lC4UXHrL8TY5kWDNRXZcSECchOZt7VOzWEOSZwTxyfdBG5C7Olmv98tvr3AJSpdHITAI4o4A4z9GXYiyuWRN7poAITWXzkE3R6XPIZzZuzXD0GbAVB7ZvDKq8QGk3AJWHP4M8M/vTc9EQbuMiZZ/lbWB7idgBKgmJF2e9TbSZ/UYrwAPfhGUqWy0tPvhlBIXTLmZqXKxuoGfHZIJPBDpEp8Dte+UPe0/0cSTYPWBQswSUjTIr2o6duH2IRJ4ZQifAdzdHstuXQXoPuIEoNilHlJ+tACRHpFcMflp4iXhQYmITMGnspvl5B/crOIO1VlE1TDsjqzHjr26JaJJA87UhBR/oRT1OESDFQR3wsT+hrt572U9hyNVRRPJmfTDnyj07yhzV9tmHz26k0DxnAjbED3HFwVFZvc5Jz7oM6ml7r6csJrkara0EX0K+SpkKEDPk72N8lHRAam64iIulwa+3ApOaXISqm2IbqnMcHOnBtjUQSFe0VRfiDE/iC25pS6mWi+Tl436sPlbsRc/uDAqOcI1vXRFXjXLolBujD2yLQ1AETm27yRExX8o88gC9denL3Qi4GZ9K1lMq3PzMenHfEOVCr5QNP08F7af5epMZMFvTTQ3Ozi8p1fSQc++S64TL4KrhUvtnj2Q3uNCAMx6um8ytlvJZRqIh25Z97b
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 l30-20020a05600c1d1e00b0040e541ddcb1sm7877780wms.33.2024.02.05.00.48.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 00:48:43 -0800 (PST)
Message-ID: <fe098f5a-b0b0-4698-ad8f-2d302fa37626@gmail.com>
Date: Mon, 5 Feb 2024 09:48:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] driver core: bus: introduce can_remove()
Content-Language: en-US
To: Hamza Mahfooz <hamza.mahfooz@amd.com>, linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>, Le Ma <le.ma@amd.com>,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 James Zhu <James.Zhu@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Joerg Roedel <jroedel@suse.de>, Iwona Winiarska <iwona.winiarska@intel.com>,
 Robin Murphy <robin.murphy@arm.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-pci@vger.kernel.org
References: <20240202222603.141240-1-hamza.mahfooz@amd.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20240202222603.141240-1-hamza.mahfooz@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 02.02.24 um 23:25 schrieb Hamza Mahfooz:
> Currently, drivers have no mechanism to block requests to unbind
> devices. However, this can cause resource leaks and leave the device in
> an inconsistent state, such that rebinding the device may cause a hang
> or otherwise prevent the device from being rebound. So, introduce
> the can_remove() callback to allow drivers to indicate if it isn't
> appropriate to remove a device at the given time.

Well that is nonsense. When you physically remove a device (e.g. unplug 
it) then there is nothing in software you can do to prevent that.

Regards,
Christian.

>
> Cc: stable@vger.kernel.org
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
> ---
>   drivers/base/bus.c         | 4 ++++
>   include/linux/device/bus.h | 2 ++
>   2 files changed, 6 insertions(+)
>
> diff --git a/drivers/base/bus.c b/drivers/base/bus.c
> index daee55c9b2d9..7c259b01ea99 100644
> --- a/drivers/base/bus.c
> +++ b/drivers/base/bus.c
> @@ -239,6 +239,10 @@ static ssize_t unbind_store(struct device_driver *drv, const char *buf,
>   
>   	dev = bus_find_device_by_name(bus, NULL, buf);
>   	if (dev && dev->driver == drv) {
> +		if (dev->bus && dev->bus->can_remove &&
> +		    !dev->bus->can_remove(dev))
> +			return -EBUSY;
> +
>   		device_driver_detach(dev);
>   		err = count;
>   	}
> diff --git a/include/linux/device/bus.h b/include/linux/device/bus.h
> index 5ef4ec1c36c3..c9d4af0ed3b8 100644
> --- a/include/linux/device/bus.h
> +++ b/include/linux/device/bus.h
> @@ -46,6 +46,7 @@ struct fwnode_handle;
>    *		be called at late_initcall_sync level. If the device has
>    *		consumers that are never bound to a driver, this function
>    *		will never get called until they do.
> + * @can_remove: Called before attempting to remove a device from this bus.
>    * @remove:	Called when a device removed from this bus.
>    * @shutdown:	Called at shut-down time to quiesce the device.
>    *
> @@ -85,6 +86,7 @@ struct bus_type {
>   	int (*uevent)(const struct device *dev, struct kobj_uevent_env *env);
>   	int (*probe)(struct device *dev);
>   	void (*sync_state)(struct device *dev);
> +	bool (*can_remove)(struct device *dev);
>   	void (*remove)(struct device *dev);
>   	void (*shutdown)(struct device *dev);
>   

