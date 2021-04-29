Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BB436EA82
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 14:30:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECBF96E213;
	Thu, 29 Apr 2021 12:30:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C07C66E213
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 12:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619699446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qoRcKrEBi+H+iVZRyW+ljvC5IV1Vv5Cz1J3NdxbYP4A=;
 b=ZBKSR6IWbs9kcEId6AmoOUGoTDfG5F5xsVRj/TgLZGRpISpaz6/SO9t0VaBaedUCm0VRQf
 726z4hr1I5As5dEMdUIcGOIop55NNqEqEdu6mMJJ5xnUbYO2BJfnnq+ifZM/4ClD9iij1o
 JdRFsyOnbvRYFx9OHGj64iganCPP4wQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-xQz71E_wOMq_rBWj8M7wVA-1; Thu, 29 Apr 2021 08:30:44 -0400
X-MC-Unique: xQz71E_wOMq_rBWj8M7wVA-1
Received: by mail-ed1-f69.google.com with SMTP id
 i2-20020a0564020542b02903875c5e7a00so9221524edx.6
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 05:30:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qoRcKrEBi+H+iVZRyW+ljvC5IV1Vv5Cz1J3NdxbYP4A=;
 b=IFfzJ+vRX0/0vAHN1gSx0HQbG2zXugj1hruBuZi5uSX4Y3/oyyZvAkpe6aRQq3znt4
 ERRytA787drYxUM1ulG6GLf3Md5ZqdvDiK4/vn9hiMMN2PTE4pTF5pt150jgUq6LVBKs
 THwBCchzrKOGnKIIiRdMaTPGlGuzr4wUceglQJOCjgSlp7Dzb36lQhFssNdDB04qMSe7
 9IxkSgSZXVLyO+0vvegb1WX0e6xdsC51/ksddaFs9fQYHnCVjcW7nV3dqeRbXQY+26+5
 tgHeQjg92Sy1oEfDNGoQPVF0eH1W+kmU2lDZxzto951WEd4GbouOf5vJOLHp1ULJHZAY
 15mw==
X-Gm-Message-State: AOAM530l9wqFytKJv7VQocpZHjE8buPfuU4ImaGjMPDZjRF+kIlur1O1
 oXuVmu76jllQpP7Yj5Bx2g7h94ua8BTs/yAqKvXjmBtKVQYN5+Vpz8arBG8efwsKD+D02n2eJde
 IPAyvZYbh8fHTxGXG5iClPtMCF4QL
X-Received: by 2002:a05:6402:3079:: with SMTP id
 bs25mr3025313edb.146.1619699443174; 
 Thu, 29 Apr 2021 05:30:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxNcIBbNbA+SRuNCwCr/ceTjghEYdGJyByGUWLDGJ81xcqUBqc3v2oKaXHrS7s4xTknidqyOg==
X-Received: by 2002:a05:6402:3079:: with SMTP id
 bs25mr3025276edb.146.1619699442924; 
 Thu, 29 Apr 2021 05:30:42 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id y2sm1719269ejg.123.2021.04.29.05.30.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Apr 2021 05:30:42 -0700 (PDT)
Subject: Re: [PATCH 1/9] drm/connector: Make the drm_sysfs connector->kdev
 device hold a reference to the connector
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210428215257.500088-1-hdegoede@redhat.com>
 <20210428215257.500088-2-hdegoede@redhat.com>
 <YIqbLDIeGXNSjSTS@phenom.ffwll.local>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <1d6a190a-7492-0de3-2fce-595d3b710fdd@redhat.com>
Date: Thu, 29 Apr 2021 14:30:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YIqbLDIeGXNSjSTS@phenom.ffwll.local>
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

On 4/29/21 1:40 PM, Daniel Vetter wrote:
> On Wed, Apr 28, 2021 at 11:52:49PM +0200, Hans de Goede wrote:
>> Userspace could hold open a reference to the connector->kdev device,
>> through e.g. holding a sysfs-atrtribute open after
>> drm_sysfs_connector_remove() has been called. In this case the connector
>> could be free-ed while the connector->kdev device's drvdata is still
>> pointing to it.
>>
>> Give drm_connector devices there own device type, which allows
>> us to specify our own release function and make drm_sysfs_connector_add()
>> take a reference on the connector object, and have the new release
>> function put the reference when the device is released.
>>
>> Giving drm_connector devices there own device type, will also allow
>> checking if a device is a drm_connector device with a
>> "if (device->type == &drm_sysfs_device_connector)" check.
>>
>> Note that the setting of the name member of the device_type struct will
>> cause udev events for drm_connector-s to now contain DEVTYPE=drm_connector
>> as extra info. So this extends the uevent part of the userspace API.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> Are you sure? I thought sysfs is supposed to flush out any pending
> operations (they complete fast) and handle open fd internally?

So I did some digging in fs/kernfs and it looks like you right,
once the file has been removed from sysfs any accesses through an
open fd will fail with -ENODEV, interesting I did not know this.

We still need this change though to make sure that the 
"drm/connector: Add drm_connector_find_by_fwnode() function"
does not end up following a dangling drvdat pointer from one
if the drm_connector kdev-s.

The class_dev_iter_init() in drm_connector_find_by_fwnode() gets
a reference on all devices and between getting that reference
and it calling drm_connector_get() - drm_connector_unregister()
may run and drop the possibly last reference to the
drm_connector object, freeing it and leaving the kdev's
drvdata as a dangling pointer.

But I obviously need to rewrite the commit message of this
commit as it currently is completely wrong.

Maybe I should even squash this into the commit adding
drm_connector_find_by_fwnode()  ?

Note sure about that though I personally think this is best
kept as a new preparation patch but with a new commit msg.

> Also I'd assume this creates a loop since the connector holds a reference
> on the kdev?

So I was wondering the same thing when working on this code and
I checked. the reference on the kdev is dropped from:
drm_connector_unregister() -> drm_sysfs_connector_remove()
and then happens independent of the reference count on the
connector-drm-obj dropping to 0.

So what this change does is it keeps a reference to the
drm_connector obj as long as someone is keeping a reference
to the connnector->kdev device around after drm_connector_unregister()
but as soon as that kdev device ref is dropped, so will the
drm_connector's obj reference.

I also tested this using a dock with DP MST, which dynamically
adds/removes connectors on plug-in / plug-out of the dock-cable
and I added a printk to the new drm_sysfs_connector_release() this
adds and that printk triggered pretty much immediately on unplug
as expected, releasing the extra drm_connector obj as soon as
drm_connector_unregister() got called.

Regards,

Hans




> -Daniel
> 
>> ---
>>  drivers/gpu/drm/drm_sysfs.c | 54 +++++++++++++++++++++++++++++++------
>>  1 file changed, 46 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
>> index f0336c804639..c344c6d5e738 100644
>> --- a/drivers/gpu/drm/drm_sysfs.c
>> +++ b/drivers/gpu/drm/drm_sysfs.c
>> @@ -50,6 +50,10 @@ static struct device_type drm_sysfs_device_minor = {
>>  	.name = "drm_minor"
>>  };
>>  
>> +static struct device_type drm_sysfs_device_connector = {
>> +	.name = "drm_connector",
>> +};
>> +
>>  struct class *drm_class;
>>  
>>  static char *drm_devnode(struct device *dev, umode_t *mode)
>> @@ -271,30 +275,64 @@ static const struct attribute_group *connector_dev_groups[] = {
>>  	NULL
>>  };
>>  
>> +static void drm_sysfs_connector_release(struct device *dev)
>> +{
>> +	struct drm_connector *connector = to_drm_connector(dev);
>> +
>> +	drm_connector_put(connector);
>> +	kfree(dev);
>> +}
>> +
>>  int drm_sysfs_connector_add(struct drm_connector *connector)
>>  {
>>  	struct drm_device *dev = connector->dev;
>> +	struct device *kdev;
>> +	int r;
>>  
>>  	if (connector->kdev)
>>  		return 0;
>>  
>> -	connector->kdev =
>> -		device_create_with_groups(drm_class, dev->primary->kdev, 0,
>> -					  connector, connector_dev_groups,
>> -					  "card%d-%s", dev->primary->index,
>> -					  connector->name);
>> +	kdev = kzalloc(sizeof(*kdev), GFP_KERNEL);
>> +	if (!kdev)
>> +		return -ENOMEM;
>> +
>> +	device_initialize(kdev);
>> +	kdev->class = drm_class;
>> +	kdev->type = &drm_sysfs_device_connector;
>> +	kdev->parent = dev->primary->kdev;
>> +	kdev->groups = connector_dev_groups;
>> +	kdev->release = drm_sysfs_connector_release;
>> +	dev_set_drvdata(kdev, connector);
>> +
>> +	r = dev_set_name(kdev, "card%d-%s", dev->primary->index, connector->name);
>> +	if (r)
>> +		goto err_free;
>> +
>>  	DRM_DEBUG("adding \"%s\" to sysfs\n",
>>  		  connector->name);
>>  
>> -	if (IS_ERR(connector->kdev)) {
>> -		DRM_ERROR("failed to register connector device: %ld\n", PTR_ERR(connector->kdev));
>> -		return PTR_ERR(connector->kdev);
>> +	r = device_add(kdev);
>> +	if (r) {
>> +		DRM_ERROR("failed to register connector device: %d\n", r);
>> +		goto err_free;
>>  	}
>>  
>> +	/*
>> +	 * Ensure the connector object does not get free-ed if userspace still has
>> +	 * references open to the device through e.g. the connector sysfs-attributes.
>> +	 */
>> +	drm_connector_get(connector);
>> +
>> +	connector->kdev = kdev;
>> +
>>  	if (connector->ddc)
>>  		return sysfs_create_link(&connector->kdev->kobj,
>>  				 &connector->ddc->dev.kobj, "ddc");
>>  	return 0;
>> +
>> +err_free:
>> +	put_device(kdev);
>> +	return r;
>>  }
>>  
>>  void drm_sysfs_connector_remove(struct drm_connector *connector)
>> -- 
>> 2.31.1
>>
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
