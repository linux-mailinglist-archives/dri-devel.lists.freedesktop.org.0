Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7AFC6664C9
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 21:23:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E94CD10E7FA;
	Wed, 11 Jan 2023 20:23:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61A2110E807
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 20:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673468629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aMv6U1k47MNOEk9sfwI9QilOLzK5STfNRG3e4PRXyIs=;
 b=Ws4Sg8YZDvX9WJzhwST5ULdp123AKRwZ6yiXTstBymhJQQ8yPwyECOyfUZfhoRcXnKB8Sn
 /DY+8WZ/9Npuc0m2R4ZRzWuIEA7QEFZfXRFBCm4DPfEAXvwUNFSinGUuIIh2Esg3E1sj+C
 5HsnL1XCbSUsLauIouIBvf/ibQd4LJc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-526-dmfcARwZP3SXZxLXWsY8Qw-1; Wed, 11 Jan 2023 15:23:48 -0500
X-MC-Unique: dmfcARwZP3SXZxLXWsY8Qw-1
Received: by mail-ed1-f71.google.com with SMTP id
 i8-20020a05640242c800b004852914ce42so10584440edc.6
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 12:23:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aMv6U1k47MNOEk9sfwI9QilOLzK5STfNRG3e4PRXyIs=;
 b=KQHJQvUDLS+idJqi9mUycUveMuywqOR/GtzktP7FR9/y1Z2vxyOYeYTmwIP6c9voBg
 gmFXLjMPB1x/0C96fst5rVIGLDL1LRMsHRi+w6V49qGLyTfuQQKX0iWkaKUW7UDQc8H8
 nEF0JM7pAcGwyLEpqWQLytdEl98mP9NPF7qIvhFhwFFIsJpx+ZHe49RNgJ2szYBJyGlV
 PeIPRIPZwr8xi+ZWN+lje531gedQeN9OipwVKGNm0N4Q2JjvQWmfdcA4+sDZwFRpfUC+
 /fkxYqTDICfRUczOTEPUmm698J42v1T72DIIyhrKQE+kgbLEtEEQsPy7xKUgYFlU85r6
 OCGg==
X-Gm-Message-State: AFqh2ko3ERG64FjAn5YPTWtwY5Gzo3kY/2h8p5rqmF71pecgw8+/ZQA3
 Sk8oeUCQcPvUXG6NtUw7H2aC+Ln4rry8IWKBwcd+Logjny1zJkii4Km7L++6yViMwos6vzftk5A
 LnBdiw+Pe+0N7aPZ0mUvi4kd15eXA
X-Received: by 2002:a17:906:3451:b0:857:b916:94bd with SMTP id
 d17-20020a170906345100b00857b91694bdmr5340193ejb.60.1673468627143; 
 Wed, 11 Jan 2023 12:23:47 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs3CAAzJBUrDGXoBagV23U+GqCwogEHctwSu/p+R+vu/DCfMhh35UsBtI6FZ0EC5mXogPTSdA==
X-Received: by 2002:a17:906:3451:b0:857:b916:94bd with SMTP id
 d17-20020a170906345100b00857b91694bdmr5340181ejb.60.1673468626896; 
 Wed, 11 Jan 2023 12:23:46 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 p5-20020a17090653c500b007ae32daf4b9sm6591852ejo.106.2023.01.11.12.23.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 12:23:46 -0800 (PST)
Message-ID: <ea35e7a1-276e-2997-a3a8-e55ae7855fa6@redhat.com>
Date: Wed, 11 Jan 2023 21:23:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2] ACPI: Fix selecting the wrong ACPI fwnode for the iGPU
 on some Dell laptops
To: "Rafael J. Wysocki" <rafael@kernel.org>
References: <20230110153028.183294-1-hdegoede@redhat.com>
 <CAJZ5v0gVJtvuO-G1DiO3WffWTMJMjt-N_W4XKNgTTw0R5F1iOQ@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAJZ5v0gVJtvuO-G1DiO3WffWTMJMjt-N_W4XKNgTTw0R5F1iOQ@mail.gmail.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 dri-devel@lists.freedesktop.org, linux-acpi@vger.kernel.org,
 Mika Westerberg <mika.westerberg@linux.intel.com>, Len Brown <lenb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 1/11/23 21:16, Rafael J. Wysocki wrote:
> On Tue, Jan 10, 2023 at 4:30 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
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
>> acpi_find_child_device() return. This breaks the ACPI video code,
>> leading to non working backlight control in some cases.
>>
>> Add a type.backlight flag, mark ACPI video bus devices with this and make
>> find_child_checks() return a higher score for children with this flag set,
>> so that it picks the right companion-device.
>>
>> Co-developed-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>> Changes in v2:
>> - Switch to Rafael's suggested implementation using a type.backlight flag
>>   and only make find_child_checks() return a higher score when this is set
>> ---
>>  drivers/acpi/glue.c     | 14 ++++++++++++--
>>  drivers/acpi/scan.c     |  7 +++++--
>>  include/acpi/acpi_bus.h |  3 ++-
>>  3 files changed, 19 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/acpi/glue.c b/drivers/acpi/glue.c
>> index 204fe94c7e45..a194f30876c5 100644
>> --- a/drivers/acpi/glue.c
>> +++ b/drivers/acpi/glue.c
>> @@ -75,7 +75,8 @@ static struct acpi_bus_type *acpi_get_bus_type(struct device *dev)
>>  }
>>
>>  #define FIND_CHILD_MIN_SCORE   1
>> -#define FIND_CHILD_MAX_SCORE   2
>> +#define FIND_CHILD_MID_SCORE   2
>> +#define FIND_CHILD_MAX_SCORE   3
>>
>>  static int match_any(struct acpi_device *adev, void *not_used)
>>  {
>> @@ -96,8 +97,17 @@ static int find_child_checks(struct acpi_device *adev, bool check_children)
>>                 return -ENODEV;
>>
>>         status = acpi_evaluate_integer(adev->handle, "_STA", NULL, &sta);
>> -       if (status == AE_NOT_FOUND)
>> +       if (status == AE_NOT_FOUND) {
>> +               /*
>> +                * Special case: backlight device objects without _STA are
>> +                * preferred to other objects with the same _ADR value, because
>> +                * it is more likely that they are actually useful.
>> +                */
>> +               if (adev->pnp.type.backlight)
>> +                       return FIND_CHILD_MID_SCORE;
>> +
>>                 return FIND_CHILD_MIN_SCORE;
>> +       }
>>
>>         if (ACPI_FAILURE(status) || !(sta & ACPI_STA_DEVICE_ENABLED))
>>                 return -ENODEV;
>> diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
>> index 274344434282..0c6f06abe3f4 100644
>> --- a/drivers/acpi/scan.c
>> +++ b/drivers/acpi/scan.c
>> @@ -1370,9 +1370,12 @@ static void acpi_set_pnp_ids(acpi_handle handle, struct acpi_device_pnp *pnp,
>>                  * Some devices don't reliably have _HIDs & _CIDs, so add
>>                  * synthetic HIDs to make sure drivers can find them.
>>                  */
>> -               if (acpi_is_video_device(handle))
>> +               if (acpi_is_video_device(handle)) {
>>                         acpi_add_id(pnp, ACPI_VIDEO_HID);
>> -               else if (acpi_bay_match(handle))
>> +                       pnp->type.backlight = 1;
>> +                       break;
>> +               }
>> +               if (acpi_bay_match(handle))
>>                         acpi_add_id(pnp, ACPI_BAY_HID);
>>                 else if (acpi_dock_match(handle))
>>                         acpi_add_id(pnp, ACPI_DOCK_HID);
>> diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
>> index cd3b75e08ec3..e44be31115a6 100644
>> --- a/include/acpi/acpi_bus.h
>> +++ b/include/acpi/acpi_bus.h
>> @@ -230,7 +230,8 @@ struct acpi_pnp_type {
>>         u32 hardware_id:1;
>>         u32 bus_address:1;
>>         u32 platform_id:1;
>> -       u32 reserved:29;
>> +       u32 backlight:1;
>> +       u32 reserved:28;
>>  };
>>
>>  struct acpi_device_pnp {
>> --
> 
> Applied as 6.2-rc material, thanks!

Thanks.

I just realized this probably needs a:

Fixes: 63f534b8bad9 ("ACPI: PCI: Rework acpi_get_pci_dev()")

tag, so that it gets picked up for 6.1.y

Regards,

Hans




