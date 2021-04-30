Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1407D36FB86
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 15:32:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 013F76F4C3;
	Fri, 30 Apr 2021 13:32:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE9CB6F4C3
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 13:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619789564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AzXJGk/Asz2YQmGyxT/OLQ9QD9gVMig2LUL0+0My+AA=;
 b=gOvRyZd4tu1kEBj9N6m68DtP5FAO0i5L+C1IMMIGIztKrRXjtvKafpfB3MaybXsBbNC/Uj
 RSPLniDqF3CIGMYlPF7QLa9l0dZHH1+ur6g4CKJYEAdD5aB5DBNyY+03flBoFORVS/r4Sl
 Kkz/XAvpRexGoP7PlxlCUFtlsVgyBEA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-ldN1GOrPMQiGDYwUwz5L7w-1; Fri, 30 Apr 2021 09:32:42 -0400
X-MC-Unique: ldN1GOrPMQiGDYwUwz5L7w-1
Received: by mail-ed1-f70.google.com with SMTP id
 z12-20020aa7d40c0000b0290388179cc8bfso4162054edq.21
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 06:32:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AzXJGk/Asz2YQmGyxT/OLQ9QD9gVMig2LUL0+0My+AA=;
 b=uEe712+5CVuVYL2NHgGOvVvV3pzSce/FzKWWWJCDJXGFsDt1dVhmWqd4cHzEFx8jPs
 SMVNo3kXdCKMEfRSiNwf5XhKVsWyI+13bflWfCr9NsaEb+g/YjkVIEAELjpcmlbIiLmr
 aIN1WJZFf9kVDwZDwaiL+GioOqSMEia9dkL6IUW3dcVqSuiIFT7muZcCgc94IMuErK0W
 5xltXsDpn1WB2SPIOhBk2uE/mIuIbDlZOjrQB9GBGfo1doLfVQLdtbtazLtQ1/n46G6I
 1R6LKNUyu5/Tjxdwpukz4aNFoSZfRn6HRN1CMa+h00XzgeWmTIVTHi1uiIkgun1xX+yO
 mhWw==
X-Gm-Message-State: AOAM5326nJ84olY/DO9Phh1RjABpyo7V9Va5S0qDwb7wCIBFZG+/b6bP
 pYkRVBjEOLHyWYHbdMnAelU6e69fkU+bFLrNVBdcgZ4uqRuPLwwivIFjKsJpFrSMBouYOzOcs4N
 To/yeNF3CM9UW9qGpwqcLRfJjZTCR
X-Received: by 2002:a17:907:961d:: with SMTP id
 gb29mr4271667ejc.381.1619789561078; 
 Fri, 30 Apr 2021 06:32:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxBZh7V/G4xB8jyTHIE3C+6nCccdifcYxeeUo1/RBc5SJbLFsIwWKV6ge/d42wB3oCtUxR2YQ==
X-Received: by 2002:a17:907:961d:: with SMTP id
 gb29mr4271637ejc.381.1619789560841; 
 Fri, 30 Apr 2021 06:32:40 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id hg24sm714443ejc.99.2021.04.30.06.32.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Apr 2021 06:32:40 -0700 (PDT)
Subject: Re: [PATCH 1/9] drm/connector: Make the drm_sysfs connector->kdev
 device hold a reference to the connector
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210428215257.500088-1-hdegoede@redhat.com>
 <20210428215257.500088-2-hdegoede@redhat.com>
 <YIqbLDIeGXNSjSTS@phenom.ffwll.local> <YIqehmw+kG53LF3t@kroah.com>
 <YIqg59yageIUwiwy@phenom.ffwll.local>
 <4e78d188-f257-ad33-e703-bcbc54a30c31@redhat.com>
 <YIsEfAjFthAyHxUi@phenom.ffwll.local>
 <43ee221e-7151-c0c2-cc52-37b191778221@redhat.com>
 <CAKMK7uFf8n6QfRdSXeB6J+L7NPGbeEyJKhx1Vu7x8env=_7tkA@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <5a6fc5d6-a218-8566-6b19-b4ae7d763210@redhat.com>
Date: Fri, 30 Apr 2021 15:32:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAKMK7uFf8n6QfRdSXeB6J+L7NPGbeEyJKhx1Vu7x8env=_7tkA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Platform Driver <platform-driver-x86@vger.kernel.org>,
 USB list <linux-usb@vger.kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 4/30/21 1:38 PM, Daniel Vetter wrote:
> On Fri, Apr 30, 2021 at 1:28 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi,
>>
>> On 4/29/21 9:09 PM, Daniel Vetter wrote:
>>> On Thu, Apr 29, 2021 at 02:33:17PM +0200, Hans de Goede wrote:
>>>> Hi,
>>>>
>>>> On 4/29/21 2:04 PM, Daniel Vetter wrote:
>>>>> On Thu, Apr 29, 2021 at 01:54:46PM +0200, Greg Kroah-Hartman wrote:
>>>>>> On Thu, Apr 29, 2021 at 01:40:28PM +0200, Daniel Vetter wrote:
>>>>>>> On Wed, Apr 28, 2021 at 11:52:49PM +0200, Hans de Goede wrote:
>>>>>>>> Userspace could hold open a reference to the connector->kdev device,
>>>>>>>> through e.g. holding a sysfs-atrtribute open after
>>>>>>>> drm_sysfs_connector_remove() has been called. In this case the connector
>>>>>>>> could be free-ed while the connector->kdev device's drvdata is still
>>>>>>>> pointing to it.
>>>>>>>>
>>>>>>>> Give drm_connector devices there own device type, which allows
>>>>>>>> us to specify our own release function and make drm_sysfs_connector_add()
>>>>>>>> take a reference on the connector object, and have the new release
>>>>>>>> function put the reference when the device is released.
>>>>>>>>
>>>>>>>> Giving drm_connector devices there own device type, will also allow
>>>>>>>> checking if a device is a drm_connector device with a
>>>>>>>> "if (device->type == &drm_sysfs_device_connector)" check.
>>>>>>>>
>>>>>>>> Note that the setting of the name member of the device_type struct will
>>>>>>>> cause udev events for drm_connector-s to now contain DEVTYPE=drm_connector
>>>>>>>> as extra info. So this extends the uevent part of the userspace API.
>>>>>>>>
>>>>>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>>>>>
>>>>>>> Are you sure? I thought sysfs is supposed to flush out any pending
>>>>>>> operations (they complete fast) and handle open fd internally?
>>>>>>
>>>>>> Yes, it "should" :)
>>>>>
>>>>> Thanks for confirming my vague memories :-)
>>>>>
>>>>> Hans, pls drop this one.
>>>>
>>>> Please see my earlier reply to your review of this patch, it is
>>>> still needed but for a different reason:
>>>>
>>>> """
>>>> We still need this change though to make sure that the
>>>> "drm/connector: Add drm_connector_find_by_fwnode() function"
>>>> does not end up following a dangling drvdat pointer from one
>>>> if the drm_connector kdev-s.
>>>>
>>>> The class_dev_iter_init() in drm_connector_find_by_fwnode() gets
>>>> a reference on all devices and between getting that reference
>>>> and it calling drm_connector_get() - drm_connector_unregister()
>>>> may run and drop the possibly last reference to the
>>>> drm_connector object, freeing it and leaving the kdev's
>>>> drvdata as a dangling pointer.
>>>> """
>>>>
>>>> This is actually why I added it initially, and while adding it
>>>> I came up with this wrong theory of why it was necessary independently
>>>> of the drm_connector_find_by_fwnode() addition, sorry about that.
>>>
>>> Generally that's handled by a kref_get_unless_zero under the protection of
>>> the lock which protects the weak reference. Which I think is the right
>>> model here (at a glance at least) since this is a lookup function.
>>
>> I'm afraid that things are a bit more complicated here. The idea here
>> is that we have a subsystem outside of the DRM subsystem which received
>> a hotplug event for a drm-connector.  The only info which this subsystem
>> has is a reference on the fwnode level (either through device-tree or
>> to platform-code instantiating software-fwnode-s + links for this).
>>
>> So in order to deliver the hotplug event to the connector we need
>> to lookup the connector by fwnode.
>>
>> I've chosen to implement this by iterating over all drm_class
>> devices with a dev_type of drm_connector using class_dev_iter_init()
>> and friends. This makes sure that we either get a reference to
>> the device, or that we skip the device if it is being deleted.
>>
>> But this just gives us a reference to the connector->kdev, not
>> to the connector itself. A pointer to the connector itself is stored
>> as drvdata inside the device, but without taking a reference as
>> this patch does, there is no guarantee that that pointer does not
>> point to possibly free-ed mem.
>>
>> We could set drvdata to 0 from drm_sysfs_connector_remove()
>> Before calling device_unregister(connector->kdev) and then do
>> something like this inside drm_connector_find_by_fwnode():
>>
>> /*
>>  * Lock the device to ensure we either see the drvdata == NULL
>>  * set by drm_sysfs_connector_remove(); or we block the removal
>>  * from continuing until we are done with the device.
>>  */
>> device_lock(dev);
>> connector = dev_get_drvdata(dev);
>> if (connector && connector->fwnode == fwnode) {
>>         drm_connector_get(connector);
>>         found = connector;
>> }
>> device_unlock(dev);
> 
> Yes this is what I mean. Except not a drm_connector_get, but a
> kref_get_unless_zero. The connector might already be on it's way out,
> but the drvdata not yet cleared.

The function we race with is drm_sysfs_connector_remove() and either:

1. The lookup wins the race in which case drm_sysfs_connector_remove()
   can only complete after the drm_connector_get(); and the connector
   kref won't drop to 0 before drm_sysfs_connector_remove() completes; or
2. drm_sysfs_connector_remove() wins the race in which case drvdata will
   be 0.

So using kref_get_unless_zero here will not make a difference and
requires poking inside the drm_connector internals.

Note I will probably go with your suggestion below, so whether or
not to use kref_get_unless_zero here is likely no longer relevant.

>> With the device_lock() synchronizing against the device_lock()
>> in device_unregister(connector->kdev). So that we either see
>> drvdata == NULL if we race with unregistering; or we get
>> a reference on the drm_connector obj before its ref-count can
>> drop to 0.
> 
> The trouble is that most connectors aren't full drivers on their kdev.
> So this isn't the right lock. We need another lock which protects the
> drvdata pointer appropriately for drm connectors.
> 
>> There might be places though where we call code take the device_lock
>> while holding a lock necessary for the drm_connector_get() , so
>> this approach might lead to an AB BA deadlock. As such I think
>> my original approach is better (also see below).
>>
>>> Lookup tables holding full references tends to lead to all kinds of bad
>>> side effects.
>>
>> The proposed reference is not part of a lookup list, it is a
>> reference from the kdev on the drm_connector object which gets
>> dropped as soon as the kdev's refcount hits 0, which normally
>> happens directly after drm_connector_unregister() has run.
> 
> Yeah but the way you use it is for lookup purposes. What we're
> implementing is the "get me the drm_connector for this fwnode"
> functionality, and that _is_ a lookup.

Ack.

> How its implemented is an
> internal detail really, and somehow using full references for lookup
> functionality isn't great.

Ok, note that the caller of this only needs the reference for a
short while, what the caller does is:

        connector = drm_connector_find_by_fwnode(dp->connector_fwnode);
        if (connector) {
                drm_connector_oob_hotplug_event(connector, &data);
                drm_connector_put(connector);
        }

As a result of out discussion I have been thinking about enforcing this
short-lifetime of the reference by changing:

void drm_connector_oob_hotplug_event(struct drm_connector *connector,
                                     struct drm_connector_oob_hotplug_event_data *data);

to:

void drm_connector_oob_hotplug_event(struct fwnode_handle connector_fwnode,
                                     struct drm_connector_oob_hotplug_event_data *data);

And making that do the lookup (+ almost immediate put) internally, making
the connector-lookup a purely drm-subsys internal thing and enforcing code
outside of the drm-subsys not holding a long-time reference to the connector
this way.

Please let me know if you prefer the variant where the connector lookup
details are hidden from the callers ?

Then I can change this for for v2 of this patch/series.

> I'm also not sure why we have to use the kdev stuff here. For other
> random objects we need to look up we're building that functionality on
> that object. It means you need to keep another list_head around for
> that lookup, but that's really not a big cost. E.g. drm_bridge/panel
> work like that.

Using class_for_each_dev seemed like a good way to iterate over all
the connectors. But given the discussion this has caused, just adding
a new static list + mutex for this to drivers/gpu/drm/drm_connector.c
sounds like it might be a better approach indeed.

So shall I change thing over to this approach for v2 of this patch/series?

Regards,

Hans

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
