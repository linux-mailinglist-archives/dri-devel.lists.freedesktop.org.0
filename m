Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F08D4457238
	for <lists+dri-devel@lfdr.de>; Fri, 19 Nov 2021 16:56:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 721BF6ECFF;
	Fri, 19 Nov 2021 15:56:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49E276ECF3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Nov 2021 15:56:05 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id z5so44610241edd.3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Nov 2021 07:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=/tKsxSEfsYBwSluuYOLprfcJui1VZ7odSBnyxo6MzeA=;
 b=cmORIRUfx88TR56Bemm+KdlRbNS5Fm4HGjHKHYa9KE4Tvlz3qaOh9U2IFJD/BhDMpK
 0AKpO60Iosrbqn1gsPFpkQbJpe7NJU6c1U9n3cAo2VpUBVMIXV4Bv5XoSVbQm0jmtgo6
 Iqr6H3xnJs4GWEXxTtFNbusM2Iz2v2UaXYYyc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=/tKsxSEfsYBwSluuYOLprfcJui1VZ7odSBnyxo6MzeA=;
 b=q2dnlt/uYPPEazv4G472eVFAlAx5q6SFFDr33ryUD15ALlEoJ9+jZ//VjSklKUdmqr
 bDxxPQU/b0yg1FCg1F6NPANo0oKtX9mpCxL2y+ht8TWzZUDwIiY1T4Bge8tCmYUxGU4r
 xxMM2W/zMqYFtCG29b3EAq4FSPI+g3fYE3HPiX7ETqPDXAEt54vQBvYql4wMmOxg+2Y0
 8kgf5+X5DzJ1sg5dLyIjdczFZrxG5Ih5yHYuu9fG4AUHBY+906T7ckAv3Oe74v7RAsaz
 6MC4AXOt4KkkEXOV5VvkVIZItLAU6PNjyjmY3ykD45ynMF7K3medhJOui75r3LLApv+b
 dK2w==
X-Gm-Message-State: AOAM531lfHWLKlp3vWsxhxrTJPuZFhOjdvyWwkvmiP+MFDjsNmicZ279
 rstFQ1Sngvu3VB7IYQY8k5d7ig==
X-Google-Smtp-Source: ABdhPJwUfsvKoAXImN0ctJFSv9mqYmIe6+r/s/xfHWgFamuUb00KlG/yNCuxGBbOwCLL8IkakZ83jg==
X-Received: by 2002:a17:906:a215:: with SMTP id
 r21mr9126381ejy.21.1637337363469; 
 Fri, 19 Nov 2021 07:56:03 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h10sm83825edr.95.2021.11.19.07.56.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 07:56:02 -0800 (PST)
Date: Fri, 19 Nov 2021 16:56:01 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH v2 1/2] drm/input_helper: Add new input-handling helper
Message-ID: <YZfJET55LjuW4BP+@phenom.ffwll.local>
Mail-Followup-To: Pekka Paalanen <ppaalanen@gmail.com>,
 Brian Norris <briannorris@chromium.org>,
 Rob Clark <robdclark@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Peter Hutterer <peter.hutterer@who-t.net>,
 David Airlie <airlied@linux.ie>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-kernel@vger.kernel.org, Doug Anderson <dianders@chromium.org>,
 linux-rockchip@lists.infradead.org,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-input@vger.kernel.org
References: <20211117224841.3442482-1-briannorris@chromium.org>
 <20211117144807.v2.1.I09b516eff75ead160a6582dd557e7e7e900c9e8e@changeid>
 <20211118123928.545dec8a@eldfell> <YZcB4ooqpvP3gHdx@google.com>
 <20211119123841.1d628cb6@eldfell>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211119123841.1d628cb6@eldfell>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-rockchip@lists.infradead.org,
 David Airlie <airlied@linux.ie>, Brian Norris <briannorris@chromium.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Doug Anderson <dianders@chromium.org>,
 Peter Hutterer <peter.hutterer@who-t.net>,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-input@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 19, 2021 at 12:38:41PM +0200, Pekka Paalanen wrote:
> On Thu, 18 Nov 2021 17:46:10 -0800
> Brian Norris <briannorris@chromium.org> wrote:
> 
> > Hi Pekka,
> > 
> > Thanks for the thoughts and review. I've tried to respond below:
> > 
> > On Thu, Nov 18, 2021 at 12:39:28PM +0200, Pekka Paalanen wrote:
> > > On Wed, 17 Nov 2021 14:48:40 -0800
> > > Brian Norris <briannorris@chromium.org> wrote:
> > >   
> > > > A variety of applications have found it useful to listen to
> > > > user-initiated input events to make decisions within a DRM driver, given
> > > > that input events are often the first sign that we're going to start
> > > > doing latency-sensitive activities:
> > > > 
> > > >  * Panel self-refresh: software-directed self-refresh (e.g., with
> > > >    Rockchip eDP) is especially latency sensitive. In some cases, it can
> > > >    take 10s of milliseconds for a panel to exit self-refresh, which can
> > > >    be noticeable. Rockchip RK3399 Chrome OS systems have always shipped
> > > >    with an input_handler boost, that preemptively exits self-refresh
> > > >    whenever there is input activity.
> > > > 
> > > >  * GPU drivers: on GPU-accelerated desktop systems, we may need to
> > > >    render new frames immediately after user activity. Powering up the
> > > >    GPU can take enough time that it is worthwhile to start this process
> > > >    as soon as there is input activity. Many Chrome OS systems also ship
> > > >    with an input_handler boost that powers up the GPU.
> > > > 
> > > > This patch provides a small helper library that abstracts some of the
> > > > input-subsystem details around picking which devices to listen to, and
> > > > some other boilerplate. This will be used in the next patch to implement
> > > > the first bullet: preemptive exit for panel self-refresh.
> > > > 
> > > > Bits of this are adapted from code the Android and/or Chrome OS kernels
> > > > have been carrying for a while.
> > > > 
> > > > Signed-off-by: Brian Norris <briannorris@chromium.org>
> > > > ---  
> > > 
> > > Thanks Simon for the CC.
> > > 
> > > Hi Brian,
> > > 
> > > while this feature in general makes sense and sounds good, to start
> > > warming up display hardware early when something might start to happen,
> > > this particular proposal has many problems from UAPI perspective (as it
> > > has none). Comments below.
> > > 
> > > Btw. if PSR is that slow to wake up from, how much do you actually gain
> > > from this input event watching? I would imagine the improvement to not
> > > be noticeable.  
> > 
> > Patch 2 has details. It's not really about precisely how slow PSR is,
> > but how much foresight we can gain: in patch 2, I note that with my
> > particular user space and system, I can start PSR-exit 50ms earlier than
> > I would otherweise. (FWIW, this measurement is exactly the same it was
> > with the original version written 4 years ago.)
> > 
> > For how long PSR-exit takes: the measurements I'm able to do (via
> > ftrace) show that drm_self_refresh_transition() takes between 35 and 55
> > ms. That's noticeable at 60 fps. And quite conveniently, the input-boost
> > manages to hide nearly 100% of that latency.
> > 
> > Typical use cases where one notices PSR latency (and where this 35-55ms
> > matters) involve simply moving a cursor; it's very noticeable when you
> > have more than a few frames of latency to "get started".
> 
> Hi Brian,
> 
> that is very interesting, thanks.
> 
> I would never have expected to have userspace take *that* long to
> react. But, that sounds like it could be just your userspace software
> stack.

In the other subthread we're talking about making this more explicit.
Maybe we need to combine this with a "I expect to take this many
milliseconds to get the first frame out" value.

That way compositors which take 50ms (which frankly is shocking slow) can
set that, and kms can enable sr exit (since sr exit will actually help
here). But other compositors which expect to get the first frame out in
maybe 20 can spec that, and then the driver will not sr exit (because too
high chances we'll just make shit slower), and instead will only boost
render clocks.

Thoughts?
-Daniel

> 
> > > I think some numbers about how much this feature helps would be really
> > > good, even if they are quite specific use cases. You also need to
> > > identify the userspace components, because I think different display
> > > servers are very different in their reaction speed.  
> > 
> > If my email address isn't obvious, I'm testing Chrome OS. I'm frankly
> > not that familiar with the user space display stack, but for what I
> > know, it's rather custom, developed within the Chromium project. Others
> > on CC here could probably give you more detail, if you want specific
> > answers, besides docs like this:
> > 
> > https://chromium.googlesource.com/chromium/src/+/HEAD/docs/ozone_overview.md
> > 
> > > If KMS gets a pageflip or modeset in no time after an input event, then
> > > what's the gain. OTOH, if the display server is locking on to vblank,
> > > there might be a delay worth avoiding. But then, is it worth
> > > short-circuiting the wake-up in kernel vs. adding a new ioctl that
> > > userspace could hit to start the warming up process?  
> > 
> > Rob responded to the first part to some extent (there is definitely gain
> > to be had).
> > 
> > To the last part: I wrote a simple debugfs hook to allow user space to
> > force a PSR exit, and then a simple user space program to read input
> > events and smash that debugfs file whenever it sees one. Testing in the
> > same scenarios, this appears to lose less than 100 microseconds versus
> > the in-kernel approach, which is negligible for this use case. (I'm not
> > sure about the other use cases.)
> > 
> > So, this is technically doable in user space.
> 
> This is crucial information I would like you to include in some commit
> message. I think it is very interesting for the reviewers. Maybe also
> copy that in the cover letter.
> 
> In my opinion there is a clear and obvious decision due that
> measurement: Add the new ioctl for userspace to hit, do not try to
> hardcode or upload the wake-up policy into the kernel.
> 
> > I can't speak to the ease of _actually_ integrating this into even our
> > own Chrome display manager, but I highly doubt it will get integrated
> > into others. I'd posit this should weigh into the relative worth, but
> > otherwise can't really give you an answer there.
> 
> I think such a thing would be very simple to add to any display server.
> They already have hooks for things like resetting idle timeout timers on
> any relevant input event.
> 
> > I'd also note, software-directed PSR is so far designed to be completely
> > opaque to user space. There's no way to disable it; no way to know it's
> > active; and no way to know anything about the parameters it's computing
> > (like average entry/exit delay). Would you suggest a whole set of new
> > IOCTLs for this?
> 
> Just one ioctl on the DRM device: "Hey, wake up!". Because that's what
> your patch does in-kernel, right?
> 
> If there are use case specific parameters, then how did you intend to
> allow adjusting those in your proposal?
> 
> > > > diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> > > > index 1c41156deb5f..9a6494aa45e6 100644
> > > > --- a/drivers/gpu/drm/Makefile
> > > > +++ b/drivers/gpu/drm/Makefile
> > > > @@ -56,6 +56,8 @@ drm_kms_helper-y := drm_bridge_connector.o drm_crtc_helper.o drm_dp_helper.o \
> > > >  		drm_atomic_state_helper.o drm_damage_helper.o \
> > > >  		drm_format_helper.o drm_self_refresh_helper.o drm_rect.o
> > > >  
> > > > +drm_kms_helper-$(CONFIG_DRM_INPUT_HELPER) += drm_input_helper.o
> > > > +
> > > >  drm_kms_helper-$(CONFIG_DRM_PANEL_BRIDGE) += bridge/panel.o
> > > >  drm_kms_helper-$(CONFIG_DRM_FBDEV_EMULATION) += drm_fb_helper.o
> > > >  drm_kms_helper-$(CONFIG_DRM_KMS_CMA_HELPER) += drm_fb_cma_helper.o
> > > > diff --git a/drivers/gpu/drm/drm_input_helper.c b/drivers/gpu/drm/drm_input_helper.c
> > > > new file mode 100644
> > > > index 000000000000..470f90865c7c
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/drm_input_helper.c  
> > 
> > > > +static int drm_input_connect(struct input_handler *handler,
> > > > +			     struct input_dev *dev,
> > > > +			     const struct input_device_id *id)
> > > > +{
> > > > +	struct input_handle *handle;
> > > > +	int error;
> > > > +
> > > > +	handle = kzalloc(sizeof(struct input_handle), GFP_KERNEL);
> > > > +	if (!handle)
> > > > +		return -ENOMEM;
> > > > +
> > > > +	handle->dev = dev;
> > > > +	handle->handler = handler;
> > > > +	handle->name = "drm-input-helper";
> > > > +
> > > > +	error = input_register_handle(handle);
> > > > +	if (error)
> > > > +		goto err2;
> > > > +
> > > > +	error = input_open_device(handle);  
> > > 
> > > Does this literally open the input device, just like when userspace
> > > opens the input device?  
> > 
> > I believe so. Dmitry mentioned something to this effect on earlier
> > versions, but I found that the input_handler does not operate at all if
> > this specific handle wasn't opened. (All handles are independent, and
> > each over their own |open| count.)
> > 
> > This part is unfortunate, I agree. If we really want this in-kernel,
> > perhaps I could find a way to tweak the input_handler API.
> 
> Ok. Sounds like this can have a clear technical solution, and then this
> issue is solved for good. This might also remove the device type
> filtering problem.
> 
> > > How do you know userspace is using this input device at all? If
> > > userspace is not using the input device, then DRM should not be opening
> > > it either, as it must have no effect on anything.
> > > 
> > > If you open an input device that userspace does not use, you also cause
> > > a power consumption regression, because now the input device itself is
> > > active and possibly flooding the kernel with events (e.g. an
> > > accelerometer).  
> > 
> > Well, I don't think accelerometers show up as input devices, but I
> > suppose your point could apply to actual input devices.
> 
> My understanding is that accelerometers are evdev (input) devices,
> especially when used as input e.g. for controlling games. I'm not aware
> of any other interface for it.
> 
> Even audio sockets are input devices for detecting whether a plug has
> been plugged in, but those probably wouldn't flood anything.
> 
> 
> > > > +	if (error)
> > > > +		goto err1;
> > > > +
> > > > +	return 0;
> > > > +
> > > > +err1:
> > > > +	input_unregister_handle(handle);
> > > > +err2:
> > > > +	kfree(handle);
> > > > +	return error;
> > > > +}
> > > > +
> > > > +static void drm_input_disconnect(struct input_handle *handle)
> > > > +{
> > > > +	input_close_device(handle);
> > > > +	input_unregister_handle(handle);
> > > > +	kfree(handle);
> > > > +}
> > > > +
> > > > +static const struct input_device_id drm_input_ids[] = {
> > > > +	{
> > > > +		.flags = INPUT_DEVICE_ID_MATCH_EVBIT |
> > > > +			 INPUT_DEVICE_ID_MATCH_ABSBIT,
> > > > +		.evbit = { BIT_MASK(EV_ABS) },
> > > > +		.absbit = { [BIT_WORD(ABS_MT_POSITION_X)] =
> > > > +			    BIT_MASK(ABS_MT_POSITION_X) |
> > > > +			    BIT_MASK(ABS_MT_POSITION_Y) },
> > > > +	}, /* multi-touch touchscreen */
> > > > +	{
> > > > +		.flags = INPUT_DEVICE_ID_MATCH_EVBIT,
> > > > +		.evbit = { BIT_MASK(EV_ABS) },
> > > > +		.absbit = { [BIT_WORD(ABS_X)] = BIT_MASK(ABS_X) }
> > > > +
> > > > +	}, /* stylus or joystick device */
> > > > +	{
> > > > +		.flags = INPUT_DEVICE_ID_MATCH_EVBIT,
> > > > +		.evbit = { BIT_MASK(EV_KEY) },
> > > > +		.keybit = { [BIT_WORD(BTN_LEFT)] = BIT_MASK(BTN_LEFT) },
> > > > +	}, /* pointer (e.g. trackpad, mouse) */
> > > > +	{
> > > > +		.flags = INPUT_DEVICE_ID_MATCH_EVBIT,
> > > > +		.evbit = { BIT_MASK(EV_KEY) },
> > > > +		.keybit = { [BIT_WORD(KEY_ESC)] = BIT_MASK(KEY_ESC) },
> > > > +	}, /* keyboard */
> > > > +	{
> > > > +		.flags = INPUT_DEVICE_ID_MATCH_EVBIT |
> > > > +			 INPUT_DEVICE_ID_MATCH_KEYBIT,
> > > > +		.evbit = { BIT_MASK(EV_KEY) },
> > > > +		.keybit = {[BIT_WORD(BTN_JOYSTICK)] = BIT_MASK(BTN_JOYSTICK) },
> > > > +	}, /* joysticks not caught by ABS_X above */
> > > > +	{
> > > > +		.flags = INPUT_DEVICE_ID_MATCH_EVBIT |
> > > > +			 INPUT_DEVICE_ID_MATCH_KEYBIT,
> > > > +		.evbit = { BIT_MASK(EV_KEY) },
> > > > +		.keybit = { [BIT_WORD(BTN_GAMEPAD)] = BIT_MASK(BTN_GAMEPAD) },
> > > > +	}, /* gamepad */  
> > > 
> > > I don't think this hardcoded policy belongs in the kernel, nor even
> > > works.  
> > 
> > Define "works"?
> 
> Makes the right decision in at least all those cases where current
> desktop userspace (udev + hwdb + libinput) already makes the correct
> decision. From what I've seen, it looks like end users come with bug
> reports every now and then when some hardware manufacturer was lazy or
> inventive with their HID descriptors.
> 
> > It's shipping in various forms on a variety of Android
> > and Chrome OS systems, where it has a noticeable performance benefit,
> > and isn't known to have significant power-consumption issues.
> 
> Peter Hutterer could probably say more, I confess I am quite
> pessimistic.
> 
> > > I believe classifying input devices is not that simple. Spearheading
> > > that is libinput which relies on udev tagging the devices with their
> > > types, and that is done based on a hwdb maintained by I think the
> > > systemd project. Or maybe libinput has its own db nowadays as well, I'm
> > > not sure.  
> > 
> > I'm not that familiar with libinput, etc., but I expect most of what it
> > needs to do is irrelevant to these kinds of use cases. We don't care at
> > all about what character sets or even what type of device is in use, in
> > most cases. As long as it could reasonably be called user input, it's
> > good enough.
> > 
> > Also, for most use cases here, the penalty for small inaccuracies is
> > small. Especially for something like panel self-refresh, we'd rather not
> > have it enabled at all, than have it performing poorly.
> 
> This problem will diminish once your patches stop literally opening the
> input devices and listens only on input devices that are actually
> opened by userspace. When that happens, I'm not sure you even need this
> device type filtering at all. The remaining problem is the seat
> designation.
> 
> > > Also, joysticks and gamepads are something display servers generally do
> > > not open. An application might open some while it's running, but not
> > > all the time. Joysticks could be very chatty while opened, game
> > > controllers might have accelerometers, etc.
> > >   
> > > > +	{ },
> > > > +};
> > > > +
> > > > +int drm_input_handle_register(struct drm_device *dev,
> > > > +			      struct drm_input_handler *handler)
> > > > +{
> > > > +	int ret;
> > > > +
> > > > +	if (!handler->callback)
> > > > +		return -EINVAL;
> > > > +
> > > > +	handler->handler.event = drm_input_event;
> > > > +	handler->handler.connect = drm_input_connect;
> > > > +	handler->handler.disconnect = drm_input_disconnect;
> > > > +	handler->handler.name = kasprintf(GFP_KERNEL, "drm-input-helper-%s",
> > > > +					  dev_name(dev->dev));
> > > > +	if (!handler->handler.name)
> > > > +		return -ENOMEM;
> > > > +
> > > > +	handler->handler.id_table = drm_input_ids;
> > > > +	handler->handler.private = handler;
> > > > +
> > > > +	ret = input_register_handler(&handler->handler);  
> > > 
> > > Yet another problem here is that this completely ignores the concept of
> > > physical seats. Of course it does so, because seats are a pure
> > > userspace concept.
> > > 
> > > The kernel VT console already has problems because the kernel has no
> > > concept of seats, which means that if there is a second seat defined and
> > > a desktop running on it, while the first seat is in the normal VT text
> > > mode, then everything typed in the desktop will be delivered to the VT
> > > shell as well! (This has a possible workaround in userspace [1], by opening
> > > the evdev input devices in some kind of exclusive mode - which is not
> > > common practise AFAIK.)  
> > 
> > Sure.
> > 
> > I'd bet the intersection of systems that use SW-directed PSR and
> > "multi-seat" is negligibly close to zero, but I can't guarantee that.
> > Chalk one up for a user space policy.
> 
> Your cover letter has also the other bullet point: ramping up GPUs.
> That applies to a lot more systems than PSR, right?
> 
> Maybe that is an acceptable trade-off: be 100 µs faster (your
> measurement) by ramping up all GPUs in a system instead of only the
> relevant ones?
> 
> Or maybe that will hurt normal gaming computers by ramping up the iGPU
> when the OS and game only uses the dGPU, which makes iGPU eat away the
> CPU power budget, causing the CPU to slow down? I suppose that would be
> handled by ramping up only GPUs that userspace has opened.
> 
> > > Btw. if userspace does use EVIOCGRAB, then will your in-kernel handler
> > > stop getting events?  
> > 
> > I believe so.
> 
> I suppose you would not want that?
> 
> The solution to the VT console problem is for userspace to start using
> EVIOCGRAB and that could regress the warm-up machinery.
> 
> In summary, there are all these open questions and annoying little
> problems, and none of these issues would exist if userspace would drive
> the warm-up explicitly.
> 
> 
> Thanks,
> pq



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
