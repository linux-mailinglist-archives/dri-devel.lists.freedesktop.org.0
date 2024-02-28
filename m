Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A65586B933
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 21:41:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C12310E02F;
	Wed, 28 Feb 2024 20:41:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="YXfRMGWf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
 [209.85.166.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D05410E02F
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 20:41:44 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id
 e9e14a558f8ab-365a681e949so918635ab.3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 12:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709152903; x=1709757703;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Baw+xs3ggfXLm4MxOGqTtw4oYWjUFXR4qcJc+3eX6ws=;
 b=YXfRMGWfnfsQP0vhyOSHcTuQH5g11bjz3zjhyo7ufOd5LK9UAiOoP0dNDdw2Bu+gpL
 c4+DFyt/a3/sI7l8fbg8F+umDQFhMQkTr9H+4NG//mJmN4u1Jnssb6mEDYO7UNTO9zYk
 Hv5LPtDZUvSnPoQAed9N89BeIbFiPSLrknmOc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709152903; x=1709757703;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Baw+xs3ggfXLm4MxOGqTtw4oYWjUFXR4qcJc+3eX6ws=;
 b=AmTYH0Az331fQUcocG6h5rT5KZcwArtfiiOxm6tuyiTh4jtHBn0lT5BBS333p1HCzq
 WEpJlXtj+gCNC4qoOyMb5qMaX7cFsZMMIsGg0q3EajUa6iFKo5Wn3Xr4/LFm2eQWd4Jq
 3njZcZKH7H5tZ9LwOLI2zUsm2xCgehyT3rvmjcZMLsqI0ecDxKZShc8n6jz9cG1Ptkq6
 70RDXExD4dDNFxwaH4afCaUj8h3bezkCzYfVopY8f5v6Mszt88RCKI1I0RduvfAIl2IQ
 K//f3exX6A5g6v10ZvhyrT9ftRni0XGR/XNnCCta7iJs/PcFpvv3MVQ5yKlnLPu3m7EL
 EEPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6DmePvdv0i/Tna1xZ9wfVqi9jWEsSaUh5PcMFkAS19tW+ILsPYxcm1/NFWAOXw0+ja1yN/SMQKOZCO9IA1M2hJLrQqDIRKblRaElURxcN
X-Gm-Message-State: AOJu0YzvEzYAC7Gwq2h1w47Q8gjRK3iN4WlOCJVIc9qr3Xz377Hz0Onw
 2gzUvnjnBfTfAiLM95pHHO641XSfEUJge2j/GGh3wNxrjhBzUh46cXm13wdG+w==
X-Google-Smtp-Source: AGHT+IH3ZpBdW2jBIz8fH0FB8KIQ7tWY8SxlmUVGC6UzHIlrtZ3R+qNemBz8OtGIPciy1hbt6wwyWw==
X-Received: by 2002:a92:d2cd:0:b0:365:b5aa:135d with SMTP id
 w13-20020a92d2cd000000b00365b5aa135dmr322432ilg.32.1709152903571; 
 Wed, 28 Feb 2024 12:41:43 -0800 (PST)
Received: from localhost (144.57.222.35.bc.googleusercontent.com.
 [35.222.57.144]) by smtp.gmail.com with UTF8SMTPSA id
 bc29-20020a056e02009d00b00364372c5b5asm49554ilb.15.2024.02.28.12.41.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Feb 2024 12:41:43 -0800 (PST)
Date: Wed, 28 Feb 2024 20:41:42 +0000
From: Matthias Kaehlcke <mka@chromium.org>
To: Javier Carrasco <javier.carrasco@wolfvision.net>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helen Koike <helen.koike@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Russell King <linux@armlinux.org.uk>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 6/8] usb: misc: onboard_dev: add support for non-hub
 devices
Message-ID: <Zd-ahtPpI8zbAYQ9@google.com>
References: <20240228-onboard_xvf3500-v5-0-76b805fd3fe6@wolfvision.net>
 <20240228-onboard_xvf3500-v5-6-76b805fd3fe6@wolfvision.net>
 <Zd93JZTlN4BCxWm7@google.com>
 <ecf303c3-d7a1-49d5-a997-32596215e43d@wolfvision.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ecf303c3-d7a1-49d5-a997-32596215e43d@wolfvision.net>
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

On Wed, Feb 28, 2024 at 09:21:00PM +0100, Javier Carrasco wrote:
> On 28.02.24 19:10, Matthias Kaehlcke wrote:
> > On Wed, Feb 28, 2024 at 02:51:33PM +0100, Javier Carrasco wrote:
> >> Most of the functionality this driver provides can be used by non-hub
> >> devices as well.
> >>
> >> To account for the hub-specific code, add a flag to the device data
> >> structure and check its value for hub-specific code.
> >>
> >> The 'always_powered_in_supend' attribute is only available for hub
> >> devices, keeping the driver's default behavior for non-hub devices (keep
> >> on in suspend).
> >>
> >> Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>
> >> ---
> >>  drivers/usb/misc/onboard_usb_dev.c | 25 +++++++++++++++++++++++--
> >>  drivers/usb/misc/onboard_usb_dev.h | 10 ++++++++++
> >>  2 files changed, 33 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
> >> index e1779bd2d126..df0ed172c7ec 100644
> >> --- a/drivers/usb/misc/onboard_usb_dev.c
> >> +++ b/drivers/usb/misc/onboard_usb_dev.c
> >> @@ -132,7 +132,8 @@ static int __maybe_unused onboard_dev_suspend(struct device *dev)
> >>  	struct usbdev_node *node;
> >>  	bool power_off = true;
> >>  
> >> -	if (onboard_dev->always_powered_in_suspend)
> >> +	if (onboard_dev->always_powered_in_suspend &&
> >> +	    !onboard_dev->pdata->is_hub)
> >>  		return 0;
> > 
> > With this non-hub devices would always be powered down, since
> > 'always_powerd_in_suspend' is not set for them. This should be:
> > 
> 
> May I ask you what you meant in v4 with this comment?
> 
> > Even without the sysfs attribute the field 'always_powered_in_suspend'
> > could
> > be set to true by probe() for non-hub devices.

struct onboard_dev always has the field 'always_powered_in_suspend',
even for non-hubs, that don't have the corresponding sysfs attribute.
Currently it is left uninitialized (i.e. false) for non-hubs. Instead
it could be initialized to true by probe() for non-hubs, which would
be semantically correct. With that it wouldn't be necessary to check
here whether a device is hub, because the field would provide the
necessary information.

> >   if (!onboard_dev->pdata->is_hub ||
> >        onboard_dev->always_powered_in_suspend)
> > 
> > Checking for the (non-)hub status first is clearer IMO, also it avoids
> > an unneccessary check of 'always_powered' for non-hub devices.
> > 
> 
> That makes sense and will be fixed.
> 
> > Without code context: for hubs there can be multiple device tree nodes
> > for the same physical hub chip (e.g. one for the USB2 and another for
> > the USB3 part). I suppose this could also be the case for non-hub
> > devices. For hubs there is the 'peer-hub' device tree property to
> > establish a link between the two USB devices, as a result the onboard
> > driver only creates a single platform device (which is desired,
> > otherwise two platform devices would be in charge for power sequencing
> > the same phyiscal device. For non-hub devices there is currently no such
> > link. In many cases I expect there will be just one DT entry even though
> > the device has multiple USB interfaces, but it could happen and would
> > actually be a more accurate representation.
> > 
> > General support is already there (the code dealing with 'peer-hub'), but
> > we'd have to come up with a suitable name. 'peer-device' is the first
> > thing that comes to my mind, but there might be better options. If such
> > a generic property is added then we should deprecate 'peer-hub', but
> > maintain backwards compatibility.
> 
> I have nothing against that, but the first non-hub device that will be
> added does not have multiple DT nodes, so I have nothing to test that
> extension with real hardware.

I see, the XVF3500 is USB 2.0 only, so it isn't suitable for testing.

> That could be added in the future, though, if the need ever arises.

I expect it will, when a DT maintainer asks the hardware to be
represented correctly for a device that is connected to more than one USB
bus. IIRC that's how 'peer-hub' was born :)

Ok, we can leave it out for now. I might send a dedicated patch after your
series landed. If a switch to 'peer-device' or similar is anticipated then
it's probably best to deprecate 'peer-hub' ASAP, to avoid it from getting
added to more bindings.
