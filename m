Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD9C5118BF
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 16:26:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C929810F4C8;
	Wed, 27 Apr 2022 14:26:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D654D10F4C8
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 14:26:39 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id g6so3796656ejw.1
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 07:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=s/xoBqlPnf981010nRLcAM6ft457sCJZ4c8d2ZascDo=;
 b=ipMqOg6ulsU+/Bb9aZaJ5QJbLSoqNI+rGYo9SWY+ypFhT0sZcPG6G47pWEVvvxIV1W
 Bc6CpROX2Em60kCYQL9iFxBuH1yXx0wDcaIY/DbZmehP59vC5ptLaeRVZ9H8gmANLL0B
 Xz/csC7fjb+tmGid4aTYhKx4kE5eE5d1A+v/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=s/xoBqlPnf981010nRLcAM6ft457sCJZ4c8d2ZascDo=;
 b=IHSZ5yGi5b2QijPKje0L+WMiVIctoT/7YwmEUCMby1XJ7YLMx9mzXjh4FL4Y1Hydku
 q9ImzN4WTkrKMPCCpEOj4oBD1ehAu1KS99r/fkaoL2mN/0OEZ906G9cGFen6xAm+avej
 zxjRUa2yB1MTBnnADm+wdrx5/8C10hrxw4rjdFTs7MP7JJCbr2CRw23FjdWwjcpjC7aU
 eXHs5dul3FMJCjNkkVSHEKBrDkDDjFuFM+UEvXloTHa9SimUHoYze0zGIcHS5rZ45A7X
 y624Bmpgx0zXqa+maahBzT6NrveP28JJRjTTLpTbJVbZhBM/+RESz30Zvxm+kf6JEdTn
 XDtA==
X-Gm-Message-State: AOAM532bNNzvSiLLtneC5pd4dm0bOlVD8c2xl3hhuNmjfCLoBCDzJlLu
 bRc/tEtJKXuoETYwAxOO7XdGcQ==
X-Google-Smtp-Source: ABdhPJyKl+REErkY/w0pnRdeLxFvHDeAK+aZ3TUOpLpr/PJ/s76WxqB1dCPmUxNQvFBZh4hr9WNqVA==
X-Received: by 2002:a17:906:49d4:b0:6d6:e5ec:9a23 with SMTP id
 w20-20020a17090649d400b006d6e5ec9a23mr26865625ejv.79.1651069598183; 
 Wed, 27 Apr 2022 07:26:38 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 i19-20020a1709061cd300b006f38920dbeesm4829274ejh.134.2022.04.27.07.26.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 07:26:37 -0700 (PDT)
Date: Wed, 27 Apr 2022 16:26:35 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [RFC] drm/kms: control display brightness through drm_connector
 properties
Message-ID: <YmlSm/TC1a/0V00S@phenom.ffwll.local>
References: <CADnq5_OGtERRYUPLskgjVD4eLbb2PxKdzcr+xmR2mRMAK73Log@mail.gmail.com>
 <Yk/tOG+iga/wj/Gt@phenom.ffwll.local>
 <CADnq5_NT=pSZwvMN_0_S4duk-StRxh0JcsraJo+erPDkq+GyJg@mail.gmail.com>
 <4a3cf9b6-1e08-c08c-bebd-ec2ca648059c@redhat.com>
 <CADnq5_M2zLedFmAS+udyg1zRavv-aCm1hRY+t=qW7wD33JEALg@mail.gmail.com>
 <a42f03bf-bf85-b08e-fa4f-e36a226922bc@redhat.com>
 <CADnq5_MAx47Ju7_cOt-8rn3V0zRyH5MZNG_4GY+nUiVw6-+h-A@mail.gmail.com>
 <875yncezdt.fsf@intel.com> <YmlNQgaxU7fYnTh6@phenom.ffwll.local>
 <87fslytxk5.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87fslytxk5.fsf@intel.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Martin Roukala <martin.roukala@mupuf.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>,
 Christoph Grenz <christophg+lkml@grenz-bonn.de>,
 Yusuf Khan <yusisamerican@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 27, 2022 at 05:23:22PM +0300, Jani Nikula wrote:
> On Wed, 27 Apr 2022, Daniel Vetter <daniel@ffwll.ch> wrote:
> > On Thu, Apr 14, 2022 at 01:24:30PM +0300, Jani Nikula wrote:
> >> On Mon, 11 Apr 2022, Alex Deucher <alexdeucher@gmail.com> wrote:
> >> > On Mon, Apr 11, 2022 at 6:18 AM Hans de Goede <hdegoede@redhat.com> wrote:
> >> >>
> >> >> Hi,
> >> >>
> >> >> On 4/8/22 17:11, Alex Deucher wrote:
> >> >> > On Fri, Apr 8, 2022 at 10:56 AM Hans de Goede <hdegoede@redhat.com> wrote:
> >> >> >>
> >> >> >> Hi,
> >> >> >>
> >> >> >> On 4/8/22 16:08, Alex Deucher wrote:
> >> >> >>> On Fri, Apr 8, 2022 at 4:07 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >> >> >>>>
> >> >> >>>> On Thu, Apr 07, 2022 at 05:05:52PM -0400, Alex Deucher wrote:
> >> >> >>>>> On Thu, Apr 7, 2022 at 1:43 PM Hans de Goede <hdegoede@redhat.com> wrote:
> >> >> >>>>>>
> >> >> >>>>>> Hi Simon,
> >> >> >>>>>>
> >> >> >>>>>> On 4/7/22 18:51, Simon Ser wrote:
> >> >> >>>>>>> Very nice plan! Big +1 for the overall approach.
> >> >> >>>>>>
> >> >> >>>>>> Thanks.
> >> >> >>>>>>
> >> >> >>>>>>> On Thursday, April 7th, 2022 at 17:38, Hans de Goede <hdegoede@redhat.com> wrote:
> >> >> >>>>>>>
> >> >> >>>>>>>> The drm_connector brightness properties
> >> >> >>>>>>>> =======================================
> >> >> >>>>>>>>
> >> >> >>>>>>>> bl_brightness: rw 0-int32_max property controlling the brightness setting
> >> >> >>>>>>>> of the connected display. The actual maximum of this will be less then
> >> >> >>>>>>>> int32_max and is given in bl_brightness_max.
> >> >> >>>>>>>
> >> >> >>>>>>> Do we need to split this up into two props for sw/hw state? The privacy screen
> >> >> >>>>>>> stuff needed this, but you're pretty familiar with that. :)
> >> >> >>>>>>
> >> >> >>>>>> Luckily that won't be necessary, since the privacy-screen is a security
> >> >> >>>>>> feature the firmware/embedded-controller may refuse our requests
> >> >> >>>>>> (may temporarily lock-out changes) and/or may make changes without
> >> >> >>>>>> us requesting them itself. Neither is really the case with the
> >> >> >>>>>> brightness setting of displays.
> >> >> >>>>>>
> >> >> >>>>>>>> bl_brightness_max: ro 0-int32_max property giving the actual maximum
> >> >> >>>>>>>> of the display's brightness setting. This will report 0 when brightness
> >> >> >>>>>>>> control is not available (yet).
> >> >> >>>>>>>
> >> >> >>>>>>> I don't think we actually need that one. Integer KMS props all have a
> >> >> >>>>>>> range which can be fetched via drmModeGetProperty. The max can be
> >> >> >>>>>>> exposed via this range. Example with the existing alpha prop:
> >> >> >>>>>>>
> >> >> >>>>>>>     "alpha": range [0, UINT16_MAX] = 65535
> >> >> >>>>>>
> >> >> >>>>>> Right, I already knew that, which is why I explicitly added a range
> >> >> >>>>>> to the props already. The problem is that the range must be set
> >> >> >>>>>> before registering the connector and when the backlight driver
> >> >> >>>>>> only shows up (much) later during boot then we don't know the
> >> >> >>>>>> range when registering the connector. I guess we could "patch-up"
> >> >> >>>>>> the range later. But AFAIK that would be a bit of abuse of the
> >> >> >>>>>> property API as the range is intended to never change, not
> >> >> >>>>>> even after hotplug uevents. At least atm there is no infra
> >> >> >>>>>> in the kernel to change the range later.
> >> >> >>>>>>
> >> >> >>>>>> Which is why I added an explicit bl_brightness_max property
> >> >> >>>>>> of which the value gives the actual effective maximum of the
> >> >> >>>>>> brightness.
> >> >> >>>>
> >> >> >>>> Uh ... I'm not a huge fan tbh. The thing is, if we allow hotplugging
> >> >> >>>> brightness control later on then we just perpetuate the nonsense we have
> >> >> >>>> right now, forever.
> >> >> >>>>
> >> >> >>>> Imo we should support two kinds of drivers:
> >> >> >>>>
> >> >> >>>> - drivers which are non-crap, and make sure their backlight driver is
> >> >> >>>>   loaded before they register the drm_device (or at least the
> >> >> >>>>   drm_connector). For those we want the drm_connector->backlight pointer
> >> >> >>>>   to bit static over the lifetime of the connector, and then we can also
> >> >> >>>>   set up the brightness range correctly.
> >> >> >>>>
> >> >> >>>> - funny drivers which implement the glorious fallback dance which
> >> >> >>>>   libbacklight implements currently in userspace. Imo for these drivers we
> >> >> >>>>   should have a libbacklight_heuristics_backlight, which normalizes or
> >> >> >>>>   whatever, and is also ways there. And then internally handles the
> >> >> >>>>   fallback mess to the "right" backlight driver.
> >> >> >>>>
> >> >> >>>> We might have some gaps on acpi systems to make sure the drm driver can
> >> >> >>>> wait for the backlight driver to show up, but that's about it.
> >> >> >>>>
> >> >> >>>> Hotplugging random pieces later on is really not how drivers work nowadays
> >> >> >>>> with deferred probe and component framework and all that.
> >> >> >>>>
> >> >> >>>>>> I did consider using the range for this and updating it
> >> >> >>>>>> on the fly I think nothing is really preventing us from
> >> >> >>>>>> doing so, but it very much feels like abusing the generic
> >> >> >>>>>> properties API.
> >> >> >>>>>>
> >> >> >>>>>>>> bl_brightness_0_is_min_brightness: ro, boolean
> >> >> >>>>>>>> When this is set to true then it is safe to set brightness to 0
> >> >> >>>>>>>> without worrying that this completely turns the backlight off causing
> >> >> >>>>>>>> the screen to become unreadable. When this is false setting brightness
> >> >> >>>>>>>> to 0 may turn the backlight off, but this is not guaranteed.
> >> >> >>>>>>>> This will e.g. be true when directly driving a PWM and the video-BIOS
> >> >> >>>>>>>> has provided a minimum (non 0) duty-cycle below which the driver will
> >> >> >>>>>>>> never go.
> >> >> >>>>>>>
> >> >> >>>>>>> Hm. It's quite unfortunate that it's impossible to have strong guarantees
> >> >> >>>>>>> here.
> >> >> >>>>>>>
> >> >> >>>>>>> Is there any way we can avoid this prop?
> >> >> >>>>>>
> >> >> >>>>>> Not really, the problem is that we really don't know if 0 is off
> >> >> >>>>>> or min-brightness. In the given example where we actually never go
> >> >> >>>>>> down to a duty-cycle of 0% because the video BIOS tables tell us
> >> >> >>>>>> not to, we can be certain that setting the brightness prop to 0
> >> >> >>>>>> will not turn of the backlight, since we then set the duty-cycle
> >> >> >>>>>> to the VBT provided minimum. Note the intend here is to only set
> >> >> >>>>>> the boolean to true if the VBT provided minimum is _not_ 0, 0
> >> >> >>>>>> just means the vendor did not bother to provide a minimum.
> >> >> >>>>>>
> >> >> >>>>>> Currently e.g. GNOME never goes lower then something like 5%
> >> >> >>>>>> of brightness_max to avoid accidentally turning the screen off.
> >> >> >>>>>>
> >> >> >>>>>> Turning the screen off is quite bad to do on e.g. tablets where
> >> >> >>>>>> the GUI is the only way to undo the brightness change and now
> >> >> >>>>>> the user can no longer see the GUI.
> >> >> >>>>>>
> >> >> >>>>>> The idea behind this boolean is to give e.g. GNOME a way to
> >> >> >>>>>> know that it is safe to go down to 0% and for it to use
> >> >> >>>>>> the entire range.
> >> >> >>>>>
> >> >> >>>>> Why not just make it policy that 0 is defined as minimum brightness,
> >> >> >>>>> not off, and have all drivers conform to that?
> >> >> >>>>
> >> >> >>>> Because the backlight subsystem isn't as consistent on this, and it's been
> >> >> >>>> an epic source of confusion since forever.
> >> >> >>>>
> >> >> >>>> What's worse, there's both userspace out there which assumes brightness =
> >> >> >>>> 0 is a really fast dpms off _and_ userspace that assumes that brightness =
> >> >> >>>> 0 is the lowest setting. Of course on different sets of machines.
> >> >> >>>>
> >> >> >>>> So yeah we're screwed. I have no idea how to get out of this.
> >> >> >>>
> >> >> >>> Yes, but this is a new API.  So can't we do better?  Sure the old
> >> >> >>> backlight interface is broken, but why carry around clunky workarounds
> >> >> >>> for new interfaces?
> >> >> >>
> >> >> >> Right we certainly need to define the behavior of the new API
> >> >> >> clearly, so that userspace does not misuse / misinterpret it.
> >> >> >>
> >> >> >> The intend is for brightness=0 to mean minimum brightness
> >> >> >> to still be able to see what is on the screen. But the problem
> >> >> >> is that in many cases the GPU driver directly controls a PWM
> >> >> >> output, no minimum PWM value is given in the video BIOS tables
> >> >> >> and actually setting the PWM to 0% dutycycle turns off the
> >> >> >> screen.
> >> >> >
> >> >> > Sure.  So have the GPU driver map 0 to some valid minimum if that is
> >> >> > the case or might be the case.  If bugs come up, we can add quirks in
> >> >> > the GPU drivers.
> >> >>
> >> >> The problem is that when 0% duty-cycle is not off, but minimum
> >> >> brightness because there is some smart backlight-controller involved
> >> >> downstream of the pwm, then of we limit it to say min 5% then we
> >> >> have just limited the range of the brightness. GNOME already does
> >> >> this in userspace now and it is already receiving bug-reports
> >> >> from users that GNOME does not allow the brightness to go as low
> >> >> as they like to have it in a dark(ish) room.
> >> >>
> >> >> And in some cases 5% is likely not enough for the backlight to
> >> >> actually turn on. So it will be wrong in one direction on some
> >> >> devices and wrong in the other direction in other devices.
> >> >>
> >> >> Which means that to satisfy everyone here we will need a ton
> >> >> of quirks, much too many to maintain in the kernel IMHO.
> >> >>
> >> >>
> >> >> >> So we can only promise a best-effort to make brightness=0
> >> >> >> mean minimum brightness, combined with documenting that it
> >> >> >> may turn off the backlight and that userspace _must_ never
> >> >> >> depend on it turning off the backlight.
> >> >> >>
> >> >> >> Also note that setting a direct PWM output to duty-cycle 0%
> >> >> >> does not guarantee that the backlight goes off, this may be
> >> >> >> an input for a special backlight LED driver IC like the
> >> >> >> TI LP855x series which can have an internal lookup
> >> >> >> table causing it to actually output a minimum brightness
> >> >> >> when its PWM input is at 0% dutycycle.  So this is a case
> >> >> >> where we just don't get enough info from the fw/hw to be able
> >> >> >> to offer the guarantees which we would like to guarantee.
> >> >> >
> >> >> > So set it to a level we can guarantee can call it 0.  If we have the
> >> >> > flag we are just punting on the problem in my opinion.
> >> >>
> >> >> Right this an impossible problem to solve so the intent is indeed
> >> >> to punt this to userspace, which IMHO is the best thing we can do
> >> >> here.  The idea behind the "bl_brightness_0_is_min_brightness:
> >> >> ro, boolean" property is to provide a hint to userspace to help
> >> >> userspace deal with this (and if userspace ends up using e.g.
> >> >> systemd's hwdb for this to avoid unnecessary entries in hwdb).
> >> >>
> >> >> >  The kernel
> >> >> > driver would seem to have a better idea what is a valid minimum than
> >> >> > some arbitrary userspace application.
> >> >>
> >> >> If the kernel driver knows the valid minimum then it can make 0
> >> >> actually be that valid minimum as you suggest and it can set the
> >> >> hint flag to let userspace know this. OTOH there are many cases
> >> >> where the kernel's guess is just as bad as userspace's guess and
> >> >> there are too many laptops where this is the case to quirk
> >> >> ourselves out of this situation.
> >> >>
> >> >> > Plus then if we need a
> >> >> > workaround for what is the minimum valid brightness, we can fix it one
> >> >> > place rather than letting every application try and fix it.
> >> >>
> >> >> I wish we could solve this in the kernel, but at least on
> >> >> laptops with Intel integrated gfx many vendors don't bother
> >> >> to put a non 0 value in the minimum duty-cycle field of the
> >> >> VBT, so there really is no good way to solve this.
> >> >
> >> > We have similar issues with AMD platforms.  Some platforms don't
> >> > populate the min value tables, but in the driver we set the minimum
> >> > safe value as the default min value when that happens.  It may not
> >> > always go as low as the platform may be capable of, but at least we
> >> > have consistent behavior and it's all controlled in one place.
> >> >
> >> >>
> >> >> If the userspace folks ever want to do a database for this,
> >> >> I would expect them to do something with hwdb + udev which
> >> >> can then be shared between the different desktop-environments.
> >> >
> >> > So why not do it in the kernel?  At least that way everyone will get
> >> > it the fixes as they happen.  A big user database may or may not
> >> > happen and behavior will be inconsistent across desktop environments
> >> > until that does.  I don't really see any value in having the flag.
> >> > There will be cases where the flag is wrong and will require kernel
> >> > fixes anyway (e.g., OEM switches panel due to supply chain issues and
> >> > forgets to update the vbios, etc.), so why not just define 0 as
> >> > minimum safe backlight value?  If it's too low and flickers or turns
> >> > the backlight off, we quirk it.  If a particular platform can go
> >> > lower, we can quirk it.  If we add the flag then we need to not only
> >> > add quirks for the minimum value, but we also have to deal with quirks
> >> > for when the flag is set wrong.  So now we are maintaining two quirks
> >> > instead of one.
> >> 
> >> Just chiming in, there are certainly plenty of panels and designs where
> >> 0 PWM duty cycle is physically not possible, and thus 0 brightness
> >> simply can't universally mean off.
> >> 
> >> Daniel referred to a case where 0 brightness was used as fast mini dpms
> >> off, and I think it's fundamentally a broken use case. We can't
> >> guarantee to be able to support that. I think the appeal was partly in
> >> being able to do it without access to kms api, quick and dirty via
> >> sysfs.
> >> 
> >> Please let's just make 0 the minimum but not off. If you want off, you
> >> do modeset, and the driver can follow panel timings etc.
> >> 
> >> I think that's also something the kernel can actually guarantee, while
> >> we can't guarantee 0 is off.
> >
> > Yes.
> >
> > The trouble is that we have platforms where it works like this, and so
> > retroactively redefining what brightness 0 means would be a regression. I
> > guess just another reason for why we should roll this out step by step,
> > with latest platforms first.
> >
> > Or we shrug and decide to break things like that and redefine the
> > backlight semantics a bit. Or well define them properly to begin with :-)
> 
> I say it's a new interface, and does not have to follow old interface
> semantics. When userspace switches over, it has to adapt. Just shrug off
> any "regression" reports where the comparison is against the old
> interface.

Not sure we can fix the new interface without changing the old one. Like
when we specifiy that 0 means lowest setting, people will be annoyed when
it's actually off, and then fixing the backlight driver would break the
old stuff.

I'm leaning towards breaking the old stuff a bit and making this clean :-)
The regression is just power usage when you close the lid and stuff like
that, should be ok-ish for these older machines with funny userspace that
doesn't do a dpms off.
-Daniel

> 
> BR,
> Jani.
> 
> 
> > -Daniel
> >
> >> 
> >> 
> >> BR,
> >> Jani.
> >> 
> >> 
> >> 
> >> 
> >> -- 
> >> Jani Nikula, Intel Open Source Graphics Center
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
