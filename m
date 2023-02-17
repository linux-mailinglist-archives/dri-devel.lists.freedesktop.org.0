Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE63769B33A
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 20:38:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 600C710E15B;
	Fri, 17 Feb 2023 19:38:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58FF310E15B
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 19:38:33 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id bv17so1881155wrb.9
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 11:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1676662711;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=MRfg5s5bL4eWfLlWSeXUeuLFli4OyN1xuiSoHNqWGEM=;
 b=Jc+xVLqHIyTBkd9hPSJWjtzVHNozZMOgLwjMiQbmKnuYF5CuCa8fD3VHOLYk1ZrU6u
 DbVeSea1lOw6+8JZnIWp9qDEq60ciu0AvBkyjU8/80wzD4Uq+mhyLQKbDU2Di1cifpkM
 MumFMZ3uO+5SHJ28hmj2KinzCequ3i06zDF0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676662711;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MRfg5s5bL4eWfLlWSeXUeuLFli4OyN1xuiSoHNqWGEM=;
 b=qmxF8BP9892+AHm73ER+TEvNRXOm1qyhQeWWoACRyooCq+CpZRgkANVGxZ+HtZ0c3t
 qC0/9XZPv6GKRJXGzHBmDKezCQ0JlQo2wfzjPDlATr0bazVLy6YQrm0WP+UsiZDa1ZTW
 XdPcf0Jmd6ln0lfMzSmtSuop2RCRGy4jt9Mx/vMkczloYxCJtstmBfnp3HoQDAg6vsRn
 CR6Hez7ZLVJ+34Ui3KhdtDAl1ufOmiFtDXX1/oH9Z14koL7yc3IoaHq0grmrruBqgT59
 HFGP7g6CfJLXwNge+jknE9F8acQrm8TBAJvz/JR3gMPAqYfNuGLEUvDvRpjtx3yV/CiA
 +yvw==
X-Gm-Message-State: AO0yUKV1WBBjacvERrEPfQ51oUeqGXwlat3vpCs6GbikW+bEATXplIwQ
 7YPEg4MfcYAYMF1shIwL7w8ePQ==
X-Google-Smtp-Source: AK7set/8pmXumAGId6GKxQiQP6y7sd7uOI+GZwFun/z5sgAu1cBvTCjxbSnJoPoUBf8sHKNIQw+5/A==
X-Received: by 2002:adf:f989:0:b0:2c5:592b:b70a with SMTP id
 f9-20020adff989000000b002c5592bb70amr1594588wrr.5.1676662711294; 
 Fri, 17 Feb 2023 11:38:31 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 i16-20020a5d5590000000b002c5584d0e3dsm5054476wrv.24.2023.02.17.11.38.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 11:38:30 -0800 (PST)
Date: Fri, 17 Feb 2023 20:38:28 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Subject: Re: [PATCH 3/3] drm/debugfs: remove dev->debugfs_list and
 debugfs_mutex
Message-ID: <Y+/XtJu750cftFuY@phenom.ffwll.local>
References: <20230209081838.45273-1-christian.koenig@amd.com>
 <20230209081838.45273-4-christian.koenig@amd.com>
 <Y+4UdBzk6RkQzcsI@phenom.ffwll.local>
 <f555bda0-80b6-c0bc-566f-0ef49c96da0a@amd.com>
 <87sff5zhgs.fsf@intel.com>
 <694091b5-dca0-fff5-3dd5-548bfa8733fc@amd.com>
 <87ilg1zgf2.fsf@intel.com> <Y+6JyNNkLdDnxaer@phenom.ffwll.local>
 <4904cea7-3440-1e52-f5ea-71b9069506a6@amd.com>
 <20230217100118.GB2862577@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230217100118.GB2862577@linux.intel.com>
X-Operating-System: Linux phenom 6.0.0-6-amd64 
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
Cc: daniel.vetter@ffwll.ch, mcanal@igalia.com, mwen@igalia.com,
 mairacanal@riseup.net, dri-devel@lists.freedesktop.org,
 wambui.karugax@gmail.com,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 17, 2023 at 11:01:18AM +0100, Stanislaw Gruszka wrote:
> On Fri, Feb 17, 2023 at 10:22:25AM +0100, Christian König wrote:
> > Am 16.02.23 um 20:54 schrieb Daniel Vetter:
> > > On Thu, Feb 16, 2023 at 07:08:49PM +0200, Jani Nikula wrote:
> > > > On Thu, 16 Feb 2023, Christian König <christian.koenig@amd.com> wrote:
> > > > > Am 16.02.23 um 17:46 schrieb Jani Nikula:
> > > > > > On Thu, 16 Feb 2023, Christian König <christian.koenig@amd.com> wrote:
> > > > > > > Am 16.02.23 um 12:33 schrieb Daniel Vetter:
> > > > > > > > On Thu, Feb 09, 2023 at 09:18:38AM +0100, Christian König wrote:
> > > > > > > > > The mutex was completely pointless in the first place since any
> > > > > > > > > parallel adding of files to this list would result in random
> > > > > > > > > behavior since the list is filled and consumed multiple times.
> > > > > > > > > 
> > > > > > > > > Completely drop that approach and just create the files directly.
> > > > > > > > > 
> > > > > > > > > This also re-adds the debugfs files to the render node directory and
> > > > > > > > > removes drm_debugfs_late_register().
> > > > > > > > > 
> > > > > > > > > Signed-off-by: Christian König <christian.koenig@amd.com>
> > > > > > > > > ---
> > > > > > > > >     drivers/gpu/drm/drm_debugfs.c     | 32 +++++++------------------------
> > > > > > > > >     drivers/gpu/drm/drm_drv.c         |  3 ---
> > > > > > > > >     drivers/gpu/drm/drm_internal.h    |  5 -----
> > > > > > > > >     drivers/gpu/drm/drm_mode_config.c |  2 --
> > > > > > > > >     include/drm/drm_device.h          | 15 ---------------
> > > > > > > > >     5 files changed, 7 insertions(+), 50 deletions(-)
> > > > > > > > > 
> > > > > > > > > diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
> > > > > > > > > index 558e3a7271a5..a40288e67264 100644
> > > > > > > > > --- a/drivers/gpu/drm/drm_debugfs.c
> > > > > > > > > +++ b/drivers/gpu/drm/drm_debugfs.c
> > > > > > > > > @@ -246,31 +246,9 @@ void drm_debugfs_dev_register(struct drm_device *dev)
> > > > > > > > >     void drm_debugfs_minor_register(struct drm_minor *minor)
> > > > > > > > >     {
> > > > > > > > >     	struct drm_device *dev = minor->dev;
> > > > > > > > > -	struct drm_debugfs_entry *entry, *tmp;
> > > > > > > > >     	if (dev->driver->debugfs_init)
> > > > > > > > >     		dev->driver->debugfs_init(minor);
> > > > > > > > > -
> > > > > > > > > -	list_for_each_entry_safe(entry, tmp, &dev->debugfs_list, list) {
> > > > > > > > > -		debugfs_create_file(entry->file.name, 0444,
> > > > > > > > > -				    minor->debugfs_root, entry, &drm_debugfs_entry_fops);
> > > > > > > > > -		list_del(&entry->list);
> > > > > > > > > -	}
> > > > > > > > > -}
> > > > > > > > > -
> > > > > > > > > -void drm_debugfs_late_register(struct drm_device *dev)
> > > > > > > > > -{
> > > > > > > > > -	struct drm_minor *minor = dev->primary;
> > > > > > > > > -	struct drm_debugfs_entry *entry, *tmp;
> > > > > > > > > -
> > > > > > > > > -	if (!minor)
> > > > > > > > > -		return;
> > > > > > > > > -
> > > > > > > > > -	list_for_each_entry_safe(entry, tmp, &dev->debugfs_list, list) {
> > > > > > > > > -		debugfs_create_file(entry->file.name, 0444,
> > > > > > > > > -				    minor->debugfs_root, entry, &drm_debugfs_entry_fops);
> > > > > > > > > -		list_del(&entry->list);
> > > > > > > > > -	}
> > > > > > > > >     }
> > > > > > > > >     int drm_debugfs_remove_files(const struct drm_info_list *files, int count,
> > > > > > > > > @@ -343,9 +321,13 @@ void drm_debugfs_add_file(struct drm_device *dev, const char *name,
> > > > > > > > >     	entry->file.data = data;
> > > > > > > > >     	entry->dev = dev;
> > > > > > > > > -	mutex_lock(&dev->debugfs_mutex);
> > > > > > > > > -	list_add(&entry->list, &dev->debugfs_list);
> > > > > > > > > -	mutex_unlock(&dev->debugfs_mutex);
> > > > > > > > > +	debugfs_create_file(name, 0444, dev->primary->debugfs_root, entry,
> > > > > > > > > +			    &drm_debugfs_entry_fops);
> > > > > > > > > +
> > > > > > > > > +	/* TODO: This should probably only be a symlink */
> > > > > > > > > +	if (dev->render)
> > > > > > > > > +		debugfs_create_file(name, 0444, dev->render->debugfs_root,
> > > > > > > > > +				    entry, &drm_debugfs_entry_fops);
> > > > > > > > Nope. You are fundamentally missing the point of all this, which is:
> > > > > > > > 
> > > > > > > > - drivers create debugfs files whenever they want to, as long as it's
> > > > > > > >      _before_ drm_dev_register is called.
> > > > > > > > 
> > > > > > > > - drm_dev_register will set them all up.
> > > > > > > > 
> > > > > > > > This is necessary because otherwise you have the potential for some nice
> > > > > > > > oops and stuff when userspace tries to access these files before the
> > > > > > > > driver is ready.
> > > > > > > > 
> > > > > > > > Note that with sysfs all this infrastructure already exists, which is why
> > > > > > > > you can create sysfs files whenever you feel like, and things wont go
> > > > > > > > boom.
> > > > > > > Well Yeah I've considered that, I just don't think it's a good idea for
> > > > > > > debugfs.
> > > > > > > 
> > > > > > > debugfs is meant to be a helper for debugging things and that especially
> > > > > > > includes the time between drm_dev_init() and drm_dev_register() because
> > > > > > > that's where we probe the hardware and try to get it working.
> > > > > > > 
> > > > > > > Not having the debugfs files which allows for things like hardware
> > > > > > > register access and reading internal state during that is a really and I
> > > > > > > mean REALLY bad idea. This is essentially what we have those files for.
> > > > > > So you mean you want to have early debugfs so you can have some script
> > > > > > hammering the debugfs to get info out between init and register during
> > > > > > probe?
> > > > > Well not hammering. What we usually do in bringup is to set firmware
> > > > > timeout to infinity and the driver then sits and waits for the hw.
> > > > > 
> > > > > The tool used to access registers then goes directly through the PCI bar
> > > > > at the moment, but that's essentially a bad idea for registers which you
> > > > > grab a lock for to access (like index/data).
> > > > > 
> > > > > > I just think registering debugfs before everything is ready is a recipe
> > > > > > for disaster. All of the debugfs needs to check all the conditions that
> > > > > > they need across all of the probe stages. It'll be difficult to get it
> > > > > > right. And you'll get cargo culted checks copy pasted all over the
> > > > > > place.
> > > > > Yeah, but it's debugfs. That is not supposed to work under all conditions.
> > > > > 
> > > > > Just try to read amdgpu_regs on a not existing register index. This will
> > > > > just hang or reboot your box immediately on APUs.
> > > > I'm firmly in the camp that debugfs does not need to work under all
> > > > conditions, but that it must fail gracefully instead of crashing.
> > > Yeah I mean once we talk bring-up, you can just hand-roll the necessary
> > > bring debugfs things that you need to work before the driver is ready to
> > > do anything.
> > > 
> > > But bring-up debugfs fun is rather special, same way pre-silicon support
> > > tends to be rather special. Shipping that in distros does not sound like a
> > > good idea at all to me.
> > 
> > Yeah, that's indeed a really good point.
> > 
> > I can't remember how often I had to note that module parameters would also
> > be used by end users.
> > 
> > How about if the create the debugfs directory with a "." as name prefix
> > first and then rename it as soon as the device is registered?
> 
> Good idea. Or the dir could have this drm_dev->unique name and be created
> during alloc, and link in minor created during registration. That would
> mean minor link is safe to use and unique potentially dangerous before
> registration.
> 
> > Alternatively
> > we could clear the i_mode of the directory.
> 
> I checked that yesterday and this does not prevent to access the file
> for root user. Perhaps there is other smart way for blocking
> root access in vfs just by modifying some inode field, but just
> 'chmod 0000 file' does not prevent that.
> 
> > If a power user or engineer wants to debug startup problems stuff it should
> > be trivial to work around that from userspace, and if people do such things
> > they should also know the potential consequences.
> 
> Fully agree.

So what about a drm module option instead (that taints the kernel as usual
for these), which:
- registers the debugfs dir right away
- registers any debugfs files as soon as they get populated, instead of
  postponing until drm_dev_register

It would only neatly work with the add_file stuff, but I guess drivers
could still hand-roll this if needed.

I think funny games with trying to hide the files while not hiding them is
not a great idea, and explicit "I'm debugging stuff, please stand back"
knob sounds much better to me.
-Daniel

> 
> Regards
> Stanislaw
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
