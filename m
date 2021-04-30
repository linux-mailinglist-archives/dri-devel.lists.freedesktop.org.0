Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C3D36FC74
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 16:30:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E627D6E4AE;
	Fri, 30 Apr 2021 14:30:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8232E6F53F
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 14:30:39 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 z25-20020a9d65d90000b02902a560806ca7so5865782oth.11
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 07:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=trAT8TcE7p3ZrrSRRjP/Q3RuAn4aGdDSPB1cgjN0nFk=;
 b=emTnw/EIK3P9aUftxM4rwPHi8NaUrhnbS9DKZyBhMEqvwMV1vDRLr3eDOqMZrSXxfP
 xlH1ybhw2FcLSDVHLzJlUpXpJ+mo+wdfI+nZPnG0AIc4IyL2mTSddp1asU4F/kWgiNve
 9sK2EF7ZNPQPApUtIyGPA464JBKcgh9txijMg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=trAT8TcE7p3ZrrSRRjP/Q3RuAn4aGdDSPB1cgjN0nFk=;
 b=lykMcShBnxL70Ev3qVB4hlCKGq9ucKDxtlxMKs5tdEyUvtoIcfUo55Vtt9lYxz5TD2
 edLilrnf8EdrDAr5xag5hPn4uNT382vvUsGlcfoYA/2pgo7NaEqhZpawYrFelxmSBFPv
 GqDt4BR8Tw11PCDd+B81HIrlc//JAIWfqLcHIgv7+4KXGW4batr64J0cGtU/Rxw89q+D
 GnSyyQtGiaSBZEUoulW+BdXGiIv9h3d8A5Wdiv8Xdjky+Wj/MYqUUr9vpyk3VwDJGTNY
 I1iZF3Cvxeddt1BWJFMmTBVvmW5bsydQ7Uev1B+giBA9sCoekNeKfOznFz3ZTwS5vWp6
 +mTg==
X-Gm-Message-State: AOAM530nVITt5ff8V+LNTC7tp9/Nx45XHzCM8krDK1AWO2lLGU/n3ZR8
 Ljc1P7YGGgsA8a3/J0z0R2ildTuVVBylbFZs4qC5LA==
X-Google-Smtp-Source: ABdhPJyn1Dl1UqcgtWJiDpgbP2cGV8443KK8rEnmOhw8fRTJi6XE7RXOpPD6EratTK9gGNkphUty8HuXmUeTzUzpJx0=
X-Received: by 2002:a05:6830:1398:: with SMTP id
 d24mr3712169otq.281.1619793038721; 
 Fri, 30 Apr 2021 07:30:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210428215257.500088-1-hdegoede@redhat.com>
 <20210428215257.500088-2-hdegoede@redhat.com>
 <YIqbLDIeGXNSjSTS@phenom.ffwll.local> <YIqehmw+kG53LF3t@kroah.com>
 <YIqg59yageIUwiwy@phenom.ffwll.local>
 <4e78d188-f257-ad33-e703-bcbc54a30c31@redhat.com>
 <YIsEfAjFthAyHxUi@phenom.ffwll.local>
 <43ee221e-7151-c0c2-cc52-37b191778221@redhat.com>
 <CAKMK7uFf8n6QfRdSXeB6J+L7NPGbeEyJKhx1Vu7x8env=_7tkA@mail.gmail.com>
 <5a6fc5d6-a218-8566-6b19-b4ae7d763210@redhat.com>
In-Reply-To: <5a6fc5d6-a218-8566-6b19-b4ae7d763210@redhat.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 30 Apr 2021 16:30:27 +0200
Message-ID: <CAKMK7uGB=+ztEVLwkp_LZuG9Ka_o7oOZasEUGDV19Wj4p1Gfig@mail.gmail.com>
Subject: Re: [PATCH 1/9] drm/connector: Make the drm_sysfs connector->kdev
 device hold a reference to the connector
To: Hans de Goede <hdegoede@redhat.com>
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

On Fri, Apr 30, 2021 at 3:32 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 4/30/21 1:38 PM, Daniel Vetter wrote:
> > On Fri, Apr 30, 2021 at 1:28 PM Hans de Goede <hdegoede@redhat.com> wrote:
> >>
> >> Hi,
> >>
> >> On 4/29/21 9:09 PM, Daniel Vetter wrote:
> >>> On Thu, Apr 29, 2021 at 02:33:17PM +0200, Hans de Goede wrote:
> >>>> Hi,
> >>>>
> >>>> On 4/29/21 2:04 PM, Daniel Vetter wrote:
> >>>>> On Thu, Apr 29, 2021 at 01:54:46PM +0200, Greg Kroah-Hartman wrote:
> >>>>>> On Thu, Apr 29, 2021 at 01:40:28PM +0200, Daniel Vetter wrote:
> >>>>>>> On Wed, Apr 28, 2021 at 11:52:49PM +0200, Hans de Goede wrote:
> >>>>>>>> Userspace could hold open a reference to the connector->kdev device,
> >>>>>>>> through e.g. holding a sysfs-atrtribute open after
> >>>>>>>> drm_sysfs_connector_remove() has been called. In this case the connector
> >>>>>>>> could be free-ed while the connector->kdev device's drvdata is still
> >>>>>>>> pointing to it.
> >>>>>>>>
> >>>>>>>> Give drm_connector devices there own device type, which allows
> >>>>>>>> us to specify our own release function and make drm_sysfs_connector_add()
> >>>>>>>> take a reference on the connector object, and have the new release
> >>>>>>>> function put the reference when the device is released.
> >>>>>>>>
> >>>>>>>> Giving drm_connector devices there own device type, will also allow
> >>>>>>>> checking if a device is a drm_connector device with a
> >>>>>>>> "if (device->type == &drm_sysfs_device_connector)" check.
> >>>>>>>>
> >>>>>>>> Note that the setting of the name member of the device_type struct will
> >>>>>>>> cause udev events for drm_connector-s to now contain DEVTYPE=drm_connector
> >>>>>>>> as extra info. So this extends the uevent part of the userspace API.
> >>>>>>>>
> >>>>>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> >>>>>>>
> >>>>>>> Are you sure? I thought sysfs is supposed to flush out any pending
> >>>>>>> operations (they complete fast) and handle open fd internally?
> >>>>>>
> >>>>>> Yes, it "should" :)
> >>>>>
> >>>>> Thanks for confirming my vague memories :-)
> >>>>>
> >>>>> Hans, pls drop this one.
> >>>>
> >>>> Please see my earlier reply to your review of this patch, it is
> >>>> still needed but for a different reason:
> >>>>
> >>>> """
> >>>> We still need this change though to make sure that the
> >>>> "drm/connector: Add drm_connector_find_by_fwnode() function"
> >>>> does not end up following a dangling drvdat pointer from one
> >>>> if the drm_connector kdev-s.
> >>>>
> >>>> The class_dev_iter_init() in drm_connector_find_by_fwnode() gets
> >>>> a reference on all devices and between getting that reference
> >>>> and it calling drm_connector_get() - drm_connector_unregister()
> >>>> may run and drop the possibly last reference to the
> >>>> drm_connector object, freeing it and leaving the kdev's
> >>>> drvdata as a dangling pointer.
> >>>> """
> >>>>
> >>>> This is actually why I added it initially, and while adding it
> >>>> I came up with this wrong theory of why it was necessary independently
> >>>> of the drm_connector_find_by_fwnode() addition, sorry about that.
> >>>
> >>> Generally that's handled by a kref_get_unless_zero under the protection of
> >>> the lock which protects the weak reference. Which I think is the right
> >>> model here (at a glance at least) since this is a lookup function.
> >>
> >> I'm afraid that things are a bit more complicated here. The idea here
> >> is that we have a subsystem outside of the DRM subsystem which received
> >> a hotplug event for a drm-connector.  The only info which this subsystem
> >> has is a reference on the fwnode level (either through device-tree or
> >> to platform-code instantiating software-fwnode-s + links for this).
> >>
> >> So in order to deliver the hotplug event to the connector we need
> >> to lookup the connector by fwnode.
> >>
> >> I've chosen to implement this by iterating over all drm_class
> >> devices with a dev_type of drm_connector using class_dev_iter_init()
> >> and friends. This makes sure that we either get a reference to
> >> the device, or that we skip the device if it is being deleted.
> >>
> >> But this just gives us a reference to the connector->kdev, not
> >> to the connector itself. A pointer to the connector itself is stored
> >> as drvdata inside the device, but without taking a reference as
> >> this patch does, there is no guarantee that that pointer does not
> >> point to possibly free-ed mem.
> >>
> >> We could set drvdata to 0 from drm_sysfs_connector_remove()
> >> Before calling device_unregister(connector->kdev) and then do
> >> something like this inside drm_connector_find_by_fwnode():
> >>
> >> /*
> >>  * Lock the device to ensure we either see the drvdata == NULL
> >>  * set by drm_sysfs_connector_remove(); or we block the removal
> >>  * from continuing until we are done with the device.
> >>  */
> >> device_lock(dev);
> >> connector = dev_get_drvdata(dev);
> >> if (connector && connector->fwnode == fwnode) {
> >>         drm_connector_get(connector);
> >>         found = connector;
> >> }
> >> device_unlock(dev);
> >
> > Yes this is what I mean. Except not a drm_connector_get, but a
> > kref_get_unless_zero. The connector might already be on it's way out,
> > but the drvdata not yet cleared.
>
> The function we race with is drm_sysfs_connector_remove() and either:
>
> 1. The lookup wins the race in which case drm_sysfs_connector_remove()
>    can only complete after the drm_connector_get(); and the connector
>    kref won't drop to 0 before drm_sysfs_connector_remove() completes; or
> 2. drm_sysfs_connector_remove() wins the race in which case drvdata will
>    be 0.
>
> So using kref_get_unless_zero here will not make a difference and
> requires poking inside the drm_connector internals.
>
> Note I will probably go with your suggestion below, so whether or
> not to use kref_get_unless_zero here is likely no longer relevant.

Ah I missed that nuance, it's what I get for not reading the patchset
:-/ I was assuming that this is a lookup function which races rather
freely. The way you explain it's wired up here it's clear that we
remove the lookup entry as part of hotunplug, not as part of final
drm_connector cleanup.

So in that special case the additional refcount due to the lookup
entry isn't a problem, but it's still better to aim for something
where we only deal with a single refcount for drm_connector.

> >> With the device_lock() synchronizing against the device_lock()
> >> in device_unregister(connector->kdev). So that we either see
> >> drvdata == NULL if we race with unregistering; or we get
> >> a reference on the drm_connector obj before its ref-count can
> >> drop to 0.
> >
> > The trouble is that most connectors aren't full drivers on their kdev.
> > So this isn't the right lock. We need another lock which protects the
> > drvdata pointer appropriately for drm connectors.
> >
> >> There might be places though where we call code take the device_lock
> >> while holding a lock necessary for the drm_connector_get() , so
> >> this approach might lead to an AB BA deadlock. As such I think
> >> my original approach is better (also see below).
> >>
> >>> Lookup tables holding full references tends to lead to all kinds of bad
> >>> side effects.
> >>
> >> The proposed reference is not part of a lookup list, it is a
> >> reference from the kdev on the drm_connector object which gets
> >> dropped as soon as the kdev's refcount hits 0, which normally
> >> happens directly after drm_connector_unregister() has run.
> >
> > Yeah but the way you use it is for lookup purposes. What we're
> > implementing is the "get me the drm_connector for this fwnode"
> > functionality, and that _is_ a lookup.
>
> Ack.
>
> > How its implemented is an
> > internal detail really, and somehow using full references for lookup
> > functionality isn't great.
>
> Ok, note that the caller of this only needs the reference for a
> short while, what the caller does is:
>
>         connector = drm_connector_find_by_fwnode(dp->connector_fwnode);
>         if (connector) {
>                 drm_connector_oob_hotplug_event(connector, &data);
>                 drm_connector_put(connector);
>         }
>
> As a result of out discussion I have been thinking about enforcing this
> short-lifetime of the reference by changing:
>
> void drm_connector_oob_hotplug_event(struct drm_connector *connector,
>                                      struct drm_connector_oob_hotplug_event_data *data);
>
> to:
>
> void drm_connector_oob_hotplug_event(struct fwnode_handle connector_fwnode,
>                                      struct drm_connector_oob_hotplug_event_data *data);
>
> And making that do the lookup (+ almost immediate put) internally, making
> the connector-lookup a purely drm-subsys internal thing and enforcing code
> outside of the drm-subsys not holding a long-time reference to the connector
> this way.
>
> Please let me know if you prefer the variant where the connector lookup
> details are hidden from the callers ?

Yeah I think that's a very nice idea. The kref_get_unless_zero is for
when the lookup entry is really decoupled from the lifetime of the
object, and you want to be able to get a long term access. If we can
outright hide the refcounting, even better.

Also this preps us for a world where v4l would also want to get these
oob hotplug event, so that's a nice bonus. It's just the function name
that would need to loose the drm_ prefix for that case maybe.

> Then I can change this for for v2 of this patch/series.
>
> > I'm also not sure why we have to use the kdev stuff here. For other
> > random objects we need to look up we're building that functionality on
> > that object. It means you need to keep another list_head around for
> > that lookup, but that's really not a big cost. E.g. drm_bridge/panel
> > work like that.
>
> Using class_for_each_dev seemed like a good way to iterate over all
> the connectors. But given the discussion this has caused, just adding
> a new static list + mutex for this to drivers/gpu/drm/drm_connector.c
> sounds like it might be a better approach indeed.

Yeah I think kobject lifetimes are complex enough already that if
there is no need to tie ourselves to the driver model lifetime rules,
our own notifier list with our own locking is better.

Also before Greg rolls in: This imo only applies for notifiers like
we're talking about here. When we want actual references to
drivers/devices and all that, then it's better to deal with all the
kobject model and use it correctly. Because a lot of thought has been
put into handling all the corner cases there. E.g. drm_bridge is
hitting a lot of the problems which the driver model has solutions
for, similarly component.c is also a bit awkward.

Anyway, we still need the refcount dance because calling the oob
hotplug with the lock held could deadlock with hotunplug processing
and removal of the drm_connector, which needs the same lock. So it's
still tricky.

> So shall I change thing over to this approach for v2 of this patch/series?

Yeah I think we've explored all the options and found something that
fits neatly now for v2.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
