Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A16FD6644C7
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 16:29:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA3D710E5E4;
	Tue, 10 Jan 2023 15:29:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7D8D10E5E4
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 15:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673364593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/yxSKjjiV63qZ4xo0c25jroyEZ10sbvlzXlHQFiTEoU=;
 b=I+sdX5Dqhfm/sGJG9EyY/V8QbN4G+NoS9IBBsbHaKg/bcWXPg0j0e9NPrY3tZBGBa54BQj
 k9PHhI4zaUFHsYbVE4zIN5rWXi4U4Yp3jjgkj3/2R7Ni9TLL43BjlBmgSRJUEmo/S3nXWK
 Jpve/WdzP6vEBk+185hLdyFmY3+wTRc=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-634-9v_gWGAVM3az4-ek6JG-Gw-1; Tue, 10 Jan 2023 10:29:52 -0500
X-MC-Unique: 9v_gWGAVM3az4-ek6JG-Gw-1
Received: by mail-ej1-f69.google.com with SMTP id
 qa18-20020a170907869200b007df87611618so7939833ejc.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 07:29:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/yxSKjjiV63qZ4xo0c25jroyEZ10sbvlzXlHQFiTEoU=;
 b=a1LkNWlw4ow7pggAKx7SrFY7ApY7htgN2mhebFblGNu/v8a7LtGaXC/XZSt/tRTpTL
 iY4QLDILupegwAfe0lDGDoHXlcDbSRDO2JN3n405ci9zQgHCzpZPOoIuEEmjbs6YA7mA
 GtrxFpscpRDSKzni6/0BCvVSOE3xRJrnFqD0hFbmDCVnB45ALzSEuPbeL5hfX6tNFD6k
 r4k8ga+A84iRLRJ9JKpEVfGx3E0377aqW1kj6+Js8g3vO+k7rk5+GS+O2pycMMwVmr/C
 CcPn/SWCPwykrka2Vw1tyIueb1JqpAM6Nj1Xg0OGJe7Qaadee4QFQvB7CW9sll77hBoK
 ejiw==
X-Gm-Message-State: AFqh2kqk5bmQYiGyQwjVFpm38+yIx07c2RywunMZQt313zKx0AFMnTUc
 lOPGvpyqrrBLGWdwkFFzG69AYEajOvCocCVNGcREvgglHh/T7umsKQWQUDMOW7pDjWDYh45zCcc
 OlzeQjXU6XV51QM0t46jYFjJdEiV+
X-Received: by 2002:a17:906:3f86:b0:7c1:765:9cfc with SMTP id
 b6-20020a1709063f8600b007c107659cfcmr61565008ejj.34.1673364591017; 
 Tue, 10 Jan 2023 07:29:51 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtEVA4ofr4j4JqGHp8OVl9qfYtoQ2s2XMhN02AeJYgDHGzZq8VIunQmZQ7bGyIOZRDWxX5rXw==
X-Received: by 2002:a17:906:3f86:b0:7c1:765:9cfc with SMTP id
 b6-20020a1709063f8600b007c107659cfcmr61564998ejj.34.1673364590818; 
 Tue, 10 Jan 2023 07:29:50 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 ex18-20020a170907955200b0081586470b7csm5106892ejc.173.2023.01.10.07.29.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jan 2023 07:29:50 -0800 (PST)
Message-ID: <f8d36fc8-6969-4e2c-6b64-7a13e15c970c@redhat.com>
Date: Tue, 10 Jan 2023 16:29:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] ACPI: Fix selecting the wrong ACPI fwnode for the iGPU on
 some Dell laptops
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
References: <20230109205721.60694-1-hdegoede@redhat.com>
 <5655985.DvuYhMxLoT@kreacher>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <5655985.DvuYhMxLoT@kreacher>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
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
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel@lists.freedesktop.org,
 linux-acpi@vger.kernel.org, Mika Westerberg <mika.westerberg@linux.intel.com>,
 Len Brown <lenb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rafael,

On 1/10/23 14:33, Rafael J. Wysocki wrote:
> On Monday, January 9, 2023 9:57:21 PM CET Hans de Goede wrote:
>> The Dell Latitude E6430 both with and without the optional NVidia dGPU
>> has a bug in its ACPI tables which is causing Linux to assign the wrong
>> ACPI fwnode / companion to the pci_device for the i915 iGPU.
>>
>> Specifically under the PCI root bridge there are these 2 ACPI Device()s :
>>
>>  Scope (_SB.PCI0)
>>  {
>>      Device (GFX0)
>>      {
>>          Name (_ADR, 0x00020000)  // _ADR: Address
>>      }
>>
>>      ...
>>
>>      Device (VID)
>>      {
>>          Name (_ADR, 0x00020000)  // _ADR: Address
>>          ...
>>
>>          Method (_DOS, 1, NotSerialized)  // _DOS: Disable Output Switching
>>          {
>>              VDP8 = Arg0
>>              VDP1 (One, VDP8)
>>          }
>>
>>          Method (_DOD, 0, NotSerialized)  // _DOD: Display Output Devices
>>          {
>>              ...
>>          }
>>          ...
>>      }
>>  }
>>
>> The non-functional GFX0 ACPI device is a problem, because this gets
>> returned as ACPI companion-device by acpi_find_child_device() for the iGPU.
>>
>> This is a long standing problem and the i915 driver does use the ACPI
>> companion for some things, but works fine without it.
>>
>> However since commit 63f534b8bad9 ("ACPI: PCI: Rework acpi_get_pci_dev()")
>> acpi_get_pci_dev() relies on the physical-node pointer in the acpi_device
>> and that is set on the wrong acpi_device because of the wrong
>> acpi_find_child_device() return. This breaks the ACPI video code, leading
>> to non working backlight control in some cases.
> 
> Interesting.  Sorry for the trouble.

No problem, as mentioned this is actually a long standing issue / bug
in the ACPI tables, it just never surfaced before.

>> Make find_child_checks() return a higher score for children which have
>> pnp-ids set by various scan helpers like acpi_is_video_device(), so
>> that it picks the right companion-device.
> 
> This has a potential of changing the behavior in some cases that are not
> relevant here which is generally risky.
> 
>> An alternative approach would be to directly call acpi_is_video_device()
>> from find_child_checks() but that would be somewhat computationally
>> expensive given that acpi_find_child_device() iterates over all the
>> PCI0 children every time it is called.
> 
> I agree with the above, but my fix would be something like the patch below (not
> really tested, but it builds).

Thanks, I have just given this a spin on my E6430 and I can confirm
it still fixes things.

I'll send out this version (re-using most of the v1 commitmsg) as a v2
right away.

Regards,

Hans





> 
> ---
>  drivers/acpi/glue.c     |   14 ++++++++++++--
>  drivers/acpi/scan.c     |    7 +++++--
>  include/acpi/acpi_bus.h |    3 ++-
>  3 files changed, 19 insertions(+), 5 deletions(-)
> 
> Index: linux-pm/include/acpi/acpi_bus.h
> ===================================================================
> --- linux-pm.orig/include/acpi/acpi_bus.h
> +++ linux-pm/include/acpi/acpi_bus.h
> @@ -230,7 +230,8 @@ struct acpi_pnp_type {
>  	u32 hardware_id:1;
>  	u32 bus_address:1;
>  	u32 platform_id:1;
> -	u32 reserved:29;
> +	u32 backlight:1;
> +	u32 reserved:28;
>  };
>  
>  struct acpi_device_pnp {
> Index: linux-pm/drivers/acpi/scan.c
> ===================================================================
> --- linux-pm.orig/drivers/acpi/scan.c
> +++ linux-pm/drivers/acpi/scan.c
> @@ -1370,9 +1370,12 @@ static void acpi_set_pnp_ids(acpi_handle
>  		 * Some devices don't reliably have _HIDs & _CIDs, so add
>  		 * synthetic HIDs to make sure drivers can find them.
>  		 */
> -		if (acpi_is_video_device(handle))
> +		if (acpi_is_video_device(handle)) {
>  			acpi_add_id(pnp, ACPI_VIDEO_HID);
> -		else if (acpi_bay_match(handle))
> +			pnp->type.backlight = 1;
> +			break;
> +		}
> +		if (acpi_bay_match(handle))
>  			acpi_add_id(pnp, ACPI_BAY_HID);
>  		else if (acpi_dock_match(handle))
>  			acpi_add_id(pnp, ACPI_DOCK_HID);
> Index: linux-pm/drivers/acpi/glue.c
> ===================================================================
> --- linux-pm.orig/drivers/acpi/glue.c
> +++ linux-pm/drivers/acpi/glue.c
> @@ -75,7 +75,8 @@ static struct acpi_bus_type *acpi_get_bu
>  }
>  
>  #define FIND_CHILD_MIN_SCORE	1
> -#define FIND_CHILD_MAX_SCORE	2
> +#define FIND_CHILD_MID_SCORE	2
> +#define FIND_CHILD_MAX_SCORE	3
>  
>  static int match_any(struct acpi_device *adev, void *not_used)
>  {
> @@ -96,8 +97,17 @@ static int find_child_checks(struct acpi
>  		return -ENODEV;
>  
>  	status = acpi_evaluate_integer(adev->handle, "_STA", NULL, &sta);
> -	if (status == AE_NOT_FOUND)
> +	if (status == AE_NOT_FOUND) {
> +		/*
> +		 * Special case: backlight device objects without _STA are
> +		 * preferred to other objects with the same _ADR value, because
> +		 * it is more likely that they are actually useful.
> +		 */
> +		if (adev->pnp.type.backlight)
> +			return FIND_CHILD_MID_SCORE;
> +
>  		return FIND_CHILD_MIN_SCORE;
> +	}
>  
>  	if (ACPI_FAILURE(status) || !(sta & ACPI_STA_DEVICE_ENABLED))
>  		return -ENODEV;
> 
> 
> 

