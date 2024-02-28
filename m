Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0CB86B9FE
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 22:34:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8125D10E028;
	Wed, 28 Feb 2024 21:34:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="aCBAjpCB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com
 [209.85.166.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 687AF10E028
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 21:34:35 +0000 (UTC)
Received: by mail-il1-f174.google.com with SMTP id
 e9e14a558f8ab-36423c819a3so1657045ab.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 13:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709156074; x=1709760874;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Ud3jsbNEeuU2tmgvB1e9X78Ey55SQRcSwnTZ1T/aebs=;
 b=aCBAjpCBt9PCRqfnmQPUByq5pGIeVWw09jFBkrzn1AAP9OfjCycxYei+ZOANna9IXK
 MLGkEpvBRBGgOF0IQ52EPfV1dLKxZ4soeT4WiW+gnQaqQAIyvqtAfGvVd6X/VRVdFUnT
 6k/H50W8narzsEtkNp9j7Z94YSh0JzsOgRvMg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709156074; x=1709760874;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ud3jsbNEeuU2tmgvB1e9X78Ey55SQRcSwnTZ1T/aebs=;
 b=w9dccNSejSIHSZiHAvmt4HG2l5n8r0c8aONVrxxN44A2iQVDsGEkIO7+RCfZJEehkY
 xxRpDS/Z35QLRZV+e5qD/qV+W7ueEz8THlmDBtucAL29hUGN/Virb1ampW/ElusSRgaO
 /6CZKONyjqO60yHGKQtQAVXtcE+yp7G/Ok7KAXjDCmxIbi8x8GW1B7pGajj4pQxigz/e
 ire/EmDVqe2qNfgDyBFij6Qst5AC6p37sVFdSEzs9hTbV5hbaTd5w71dNxVgUJEBnhEk
 5JlRYfOkeIID7gICGKiVVnslhnRGhq4AxX6Tazj/dMoMhWg9BTwHXOQZwopU44SjyQMh
 1Fig==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMl8Wo2C36HdblLETWJbNI59XcGLpP5a8gJTLKXGwab0gJKOLT7jmDhCLBdy07b2OZ+el2HHCqpIgYFQtbZc4DMHmgAjlVaBt80tHx47Pi
X-Gm-Message-State: AOJu0YzvnlqmhuekGmIk0jjDOoNq0RH1S80SswipxpJ8GjNXT86KxCx0
 xkOqR7MAjcwax9HPZFpn3VVxdgwV7KXwl1sZ3My/9XGXH1EthqlMEKmtJK8Xww==
X-Google-Smtp-Source: AGHT+IFRn4MDh7nvzu0eSOUCvjYdM8/HpCDcsTdPwQHR4UeGWg9wLpczoWIYWROWR4Qj4A2q46iIUg==
X-Received: by 2002:a05:6e02:524:b0:365:1749:cadf with SMTP id
 h4-20020a056e02052400b003651749cadfmr613056ils.16.1709156074288; 
 Wed, 28 Feb 2024 13:34:34 -0800 (PST)
Received: from localhost (144.57.222.35.bc.googleusercontent.com.
 [35.222.57.144]) by smtp.gmail.com with UTF8SMTPSA id
 e4-20020a92de44000000b00365760eb777sm68026ilr.81.2024.02.28.13.34.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Feb 2024 13:34:33 -0800 (PST)
Date: Wed, 28 Feb 2024 21:34:33 +0000
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
Message-ID: <Zd-m6WNd5ukXyJGx@google.com>
References: <20240228-onboard_xvf3500-v5-0-76b805fd3fe6@wolfvision.net>
 <20240228-onboard_xvf3500-v5-6-76b805fd3fe6@wolfvision.net>
 <Zd93JZTlN4BCxWm7@google.com>
 <ecf303c3-d7a1-49d5-a997-32596215e43d@wolfvision.net>
 <Zd-ahtPpI8zbAYQ9@google.com>
 <63d9be60-40dd-49f6-9a75-72d4be746024@wolfvision.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <63d9be60-40dd-49f6-9a75-72d4be746024@wolfvision.net>
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

On Wed, Feb 28, 2024 at 09:50:22PM +0100, Javier Carrasco wrote:
> On 28.02.24 21:41, Matthias Kaehlcke wrote:
> > On Wed, Feb 28, 2024 at 09:21:00PM +0100, Javier Carrasco wrote:
> >> On 28.02.24 19:10, Matthias Kaehlcke wrote:
> >>> On Wed, Feb 28, 2024 at 02:51:33PM +0100, Javier Carrasco wrote:
> >>>> Most of the functionality this driver provides can be used by non-hub
> >>>> devices as well.
> >>>>
> >>>> To account for the hub-specific code, add a flag to the device data
> >>>> structure and check its value for hub-specific code.
> >>>>
> >>>> The 'always_powered_in_supend' attribute is only available for hub
> >>>> devices, keeping the driver's default behavior for non-hub devices (keep
> >>>> on in suspend).
> >>>>
> >>>> Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>
> >>>> ---
> >>>>  drivers/usb/misc/onboard_usb_dev.c | 25 +++++++++++++++++++++++--
> >>>>  drivers/usb/misc/onboard_usb_dev.h | 10 ++++++++++
> >>>>  2 files changed, 33 insertions(+), 2 deletions(-)
> >>>>
> >>>> diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
> >>>> index e1779bd2d126..df0ed172c7ec 100644
> >>>> --- a/drivers/usb/misc/onboard_usb_dev.c
> >>>> +++ b/drivers/usb/misc/onboard_usb_dev.c
> >>>> @@ -132,7 +132,8 @@ static int __maybe_unused onboard_dev_suspend(struct device *dev)
> >>>>  	struct usbdev_node *node;
> >>>>  	bool power_off = true;
> >>>>  
> >>>> -	if (onboard_dev->always_powered_in_suspend)
> >>>> +	if (onboard_dev->always_powered_in_suspend &&
> >>>> +	    !onboard_dev->pdata->is_hub)
> >>>>  		return 0;
> >>>
> >>> With this non-hub devices would always be powered down, since
> >>> 'always_powerd_in_suspend' is not set for them. This should be:
> >>>
> >>
> >> May I ask you what you meant in v4 with this comment?
> >>
> >>> Even without the sysfs attribute the field 'always_powered_in_suspend'
> >>> could
> >>> be set to true by probe() for non-hub devices.
> > 
> > struct onboard_dev always has the field 'always_powered_in_suspend',
> > even for non-hubs, that don't have the corresponding sysfs attribute.
> > Currently it is left uninitialized (i.e. false) for non-hubs. Instead
> > it could be initialized to true by probe() for non-hubs, which would
> > be semantically correct. With that it wouldn't be necessary to check
> > here whether a device is hub, because the field would provide the
> > necessary information.
> > 
> 
> That is maybe what is confusing me a bit. Should it not be false for
> non-hub devices? That property is only meant for hubs, so why should
> non-hub devices be always powered in suspend? I thought it should always
> be false for non-hub devices, and configurable for hubs.

I suspect the confusion stems from the sysfs attribute 'always_powered_...'
vs. the struct field with the same name.

The sysfs attribute defaults to 'false', which results in USB devices
being powered down in suspend. That was the desired behavior for a device
I was working on when I implemented this driver, but in hindsight I think
the default should have been 'true'.

We agreed that non-hub devices shouldn't be powered down in suspend. It
would be unexpected for users and could have side effects like delays
or losing status. Since (I think) we can't change the default of the
attribute we said we'd limit it to hubs, and not create it for other
types of USB devices. Other USB devices would remain powered during
system suspend.

Are we in agreement up to this point, in particular that non-hub
devices should remain powered?

struct onboard_dev has the field 'always_powered_...', which in the
existing code is *always* associated with the sysfs attribute of
the same name. But there is no reason to not to use the field when
the sysfs attribute does not exist. For any device at any given time
the field could indicate whether the device should be remain powered
during suspend. For hubs the value can be changed at runtime
through the sysfs attribute, for non-hubs it would be static and
always indicate that the device should remain powered.

Does that clarify your doubts?
