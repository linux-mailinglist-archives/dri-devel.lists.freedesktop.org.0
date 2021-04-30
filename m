Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E190236F951
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 13:28:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6EB26EE0F;
	Fri, 30 Apr 2021 11:28:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD0CB6EE0F
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 11:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619782106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3JFK72s4WgeXjVN5drGeID+sVQaIvMBZBVHsbJFKuQM=;
 b=R2ePpR2m0ExRg0asa7967gKus58yaU+xKEN4x4xXBbXnNOQxCYozhpy+YuwnWaOYAyIDSX
 u780ww/w2PAzOlqF9DKdPV5KsHOJXABIErhDFkjlPlDWXArMp3PRHWHsms0ImYNtKudwOz
 6Ww6llhpVM/oL310NlCsRWa8jlkjbv8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4-GSnsqlkgN6y_K514BJ8f_A-1; Fri, 30 Apr 2021 07:28:23 -0400
X-MC-Unique: GSnsqlkgN6y_K514BJ8f_A-1
Received: by mail-ej1-f72.google.com with SMTP id
 yh1-20020a17090706e1b029038d0f848c7aso5575680ejb.12
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 04:28:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3JFK72s4WgeXjVN5drGeID+sVQaIvMBZBVHsbJFKuQM=;
 b=IBnWO/M+ns/dge5whytQhtXmkWaRSqDoId9EYFS/NBmabSQNRtmLMAjTwjuvGPosT4
 0IfS20UH6WwkN7JqHTBWo2Qo0wkdNiec84rcbd/BHfjpdsXixo6EkO8ro6hF1kYFXTY7
 nj6vJ1CJea5Sv0WdcHD22GJvx41uFD2FDw9Q993EIRugzneKE+YhtET+lFok3PH6D0f/
 qD9AhCynbVGULXGov1JWUG3VnB5ylZ5jBmiRXdEEfW6sziSCypAHsZkFAJn5M+r0BbzI
 3l5cZClY9wLYr7byhGvo+JtTaWhAyBSuzZpJbqVojMWWtP+LLtS7wz8M1l1AgEkW1oOt
 PKuA==
X-Gm-Message-State: AOAM533A3CX13Jrs3XGFSz0VjWIer0hvwZNsbQUZGLK2piN1KBOkbkMN
 oapJ2IrsFWbpTDgmgzPLpeg1sQ5q6zj8s6fxi+JEVChHkGA0Jbn+z7ar4kr1JF9Mt87xlagzF/K
 m8vH3muwtUmwStTgBWCYj4oJvOVjN
X-Received: by 2002:a05:6402:17ca:: with SMTP id
 s10mr5400544edy.198.1619782101753; 
 Fri, 30 Apr 2021 04:28:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyfriSPaxv9UxvbfohsO7UTlieySCqCsfHiHvrzZKh1PX0V5hf98r7px+MwLMq3tT8LQ09Orw==
X-Received: by 2002:a05:6402:17ca:: with SMTP id
 s10mr5400531edy.198.1619782101508; 
 Fri, 30 Apr 2021 04:28:21 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id k9sm1841855eje.102.2021.04.30.04.28.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Apr 2021 04:28:21 -0700 (PDT)
Subject: Re: [PATCH 1/9] drm/connector: Make the drm_sysfs connector->kdev
 device hold a reference to the connector
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210428215257.500088-1-hdegoede@redhat.com>
 <20210428215257.500088-2-hdegoede@redhat.com>
 <YIqbLDIeGXNSjSTS@phenom.ffwll.local> <YIqehmw+kG53LF3t@kroah.com>
 <YIqg59yageIUwiwy@phenom.ffwll.local>
 <4e78d188-f257-ad33-e703-bcbc54a30c31@redhat.com>
 <YIsEfAjFthAyHxUi@phenom.ffwll.local>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <43ee221e-7151-c0c2-cc52-37b191778221@redhat.com>
Date: Fri, 30 Apr 2021 13:28:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YIsEfAjFthAyHxUi@phenom.ffwll.local>
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
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 platform-driver-x86@vger.kernel.org, linux-usb@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 4/29/21 9:09 PM, Daniel Vetter wrote:
> On Thu, Apr 29, 2021 at 02:33:17PM +0200, Hans de Goede wrote:
>> Hi,
>>
>> On 4/29/21 2:04 PM, Daniel Vetter wrote:
>>> On Thu, Apr 29, 2021 at 01:54:46PM +0200, Greg Kroah-Hartman wrote:
>>>> On Thu, Apr 29, 2021 at 01:40:28PM +0200, Daniel Vetter wrote:
>>>>> On Wed, Apr 28, 2021 at 11:52:49PM +0200, Hans de Goede wrote:
>>>>>> Userspace could hold open a reference to the connector->kdev device,
>>>>>> through e.g. holding a sysfs-atrtribute open after
>>>>>> drm_sysfs_connector_remove() has been called. In this case the connector
>>>>>> could be free-ed while the connector->kdev device's drvdata is still
>>>>>> pointing to it.
>>>>>>
>>>>>> Give drm_connector devices there own device type, which allows
>>>>>> us to specify our own release function and make drm_sysfs_connector_add()
>>>>>> take a reference on the connector object, and have the new release
>>>>>> function put the reference when the device is released.
>>>>>>
>>>>>> Giving drm_connector devices there own device type, will also allow
>>>>>> checking if a device is a drm_connector device with a
>>>>>> "if (device->type == &drm_sysfs_device_connector)" check.
>>>>>>
>>>>>> Note that the setting of the name member of the device_type struct will
>>>>>> cause udev events for drm_connector-s to now contain DEVTYPE=drm_connector
>>>>>> as extra info. So this extends the uevent part of the userspace API.
>>>>>>
>>>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>>>
>>>>> Are you sure? I thought sysfs is supposed to flush out any pending
>>>>> operations (they complete fast) and handle open fd internally?
>>>>
>>>> Yes, it "should" :)
>>>
>>> Thanks for confirming my vague memories :-)
>>>
>>> Hans, pls drop this one.
>>
>> Please see my earlier reply to your review of this patch, it is
>> still needed but for a different reason:
>>
>> """
>> We still need this change though to make sure that the 
>> "drm/connector: Add drm_connector_find_by_fwnode() function"
>> does not end up following a dangling drvdat pointer from one
>> if the drm_connector kdev-s.
>>
>> The class_dev_iter_init() in drm_connector_find_by_fwnode() gets
>> a reference on all devices and between getting that reference
>> and it calling drm_connector_get() - drm_connector_unregister()
>> may run and drop the possibly last reference to the
>> drm_connector object, freeing it and leaving the kdev's
>> drvdata as a dangling pointer.
>> """
>>
>> This is actually why I added it initially, and while adding it
>> I came up with this wrong theory of why it was necessary independently
>> of the drm_connector_find_by_fwnode() addition, sorry about that.
> 
> Generally that's handled by a kref_get_unless_zero under the protection of
> the lock which protects the weak reference. Which I think is the right
> model here (at a glance at least) since this is a lookup function.

I'm afraid that things are a bit more complicated here. The idea here
is that we have a subsystem outside of the DRM subsystem which received
a hotplug event for a drm-connector.  The only info which this subsystem
has is a reference on the fwnode level (either through device-tree or
to platform-code instantiating software-fwnode-s + links for this).

So in order to deliver the hotplug event to the connector we need
to lookup the connector by fwnode.

I've chosen to implement this by iterating over all drm_class
devices with a dev_type of drm_connector using class_dev_iter_init()
and friends. This makes sure that we either get a reference to
the device, or that we skip the device if it is being deleted.

But this just gives us a reference to the connector->kdev, not
to the connector itself. A pointer to the connector itself is stored
as drvdata inside the device, but without taking a reference as
this patch does, there is no guarantee that that pointer does not
point to possibly free-ed mem.

We could set drvdata to 0 from drm_sysfs_connector_remove()
Before calling device_unregister(connector->kdev) and then do
something like this inside drm_connector_find_by_fwnode():

/*
 * Lock the device to ensure we either see the drvdata == NULL
 * set by drm_sysfs_connector_remove(); or we block the removal
 * from continuing until we are done with the device.
 */
device_lock(dev);
connector = dev_get_drvdata(dev);
if (connector && connector->fwnode == fwnode) {
	drm_connector_get(connector);
	found = connector;
}
device_unlock(dev);

With the device_lock() synchronizing against the device_lock()
in device_unregister(connector->kdev). So that we either see
drvdata == NULL if we race with unregistering; or we get
a reference on the drm_connector obj before its ref-count can
drop to 0.

There might be places though where we call code take the device_lock
while holding a lock necessary for the drm_connector_get() , so
this approach might lead to an AB BA deadlock. As such I think
my original approach is better (also see below).

> Lookup tables holding full references tends to lead to all kinds of bad
> side effects.

The proposed reference is not part of a lookup list, it is a
reference from the kdev on the drm_connector object which gets
dropped as soon as the kdev's refcount hits 0, which normally
happens directly after drm_connector_unregister() has run.

In many other places in the kernel problems like this are
solved by embedding the device struct inside the containing
data struct (so the drm_connector struct) and using the
device_struct's refcounting for all refcounting and using
the device struct's release callback as the release callback for
the entire object.

That is not doable here since the drm_object code has its own
refcounting going on. What this patch is in essence doing is
simulating having only 1 refcount, by making sure the
main-object release callback does not get run until
the drm_objects' refcount and the device's refcount have
both reached 0 (by keeping the drm_object's refcount at
a minimum of 1 as long as there are references to the
device).

Regards,

Hans

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
