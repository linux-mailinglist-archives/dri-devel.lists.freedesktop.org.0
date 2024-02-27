Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DD7869E5A
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 18:55:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3D8B10E30B;
	Tue, 27 Feb 2024 17:55:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="SPLX7Ly/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
 [209.85.166.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D00710E30B
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 17:55:10 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id
 ca18e2360f4ac-7c788332976so146280139f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 09:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709056509; x=1709661309;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0z6oy3tLEwRGgu8/omrsseYREQZqlDjlucfwbridRR4=;
 b=SPLX7Ly/gazrYa1S6GBAaIx0C2cgwjoWR3I5dsUikoufb5LEXSns+44GKbzwJjkoIF
 +0zNSAb5WbYPgGZ/WenAnBzPU9/Q0jSc1ARAKnSRLS2IoTIG3yRA4N4GrngUzF8vqZXP
 NkSJExbkPPhuebJ1y5swuGoCPUPHHC7ao5/LA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709056509; x=1709661309;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0z6oy3tLEwRGgu8/omrsseYREQZqlDjlucfwbridRR4=;
 b=eCNbOZTlxeELuhepZrXtmS3njh2uJJH4lxOKdeHI5QSy8pPXk3fV5pjsHZD6sh7ywj
 a63gt1xWp2Oyw9yiZdWDOwa5GFKYSuwoMnGNEFyhMizHIHlY7dhBBR4NoKCuR9ASdhYc
 6uECrTNNNPldVM9Qd+EQ2cp3LPcDIQ61ZPGPe68HkoA5ytKP2NaTXTzved1L91piIVcp
 SAdnuE6ui0U458KbV2EWdd/OCMR2TnEgpxG4r6p91/Lml0i0zcOwPOdUTQezY+zbpKJU
 Xw5/Rx/pjuZdNH7V0Ui+y/06+PVWxU4fcPcwG3askDEqYCn6Mr+vv90lg0qgdu4oBQn3
 yyFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVD0VNiU0ctIGDNO5zKjhidBJ3jPOzLrHgM0o5xJouhR4owpXkL4nQ3INHcsxn1+12Yl3lw8P4+XwqiyqkmLD6UvkcVNlKyZoU7d5bTBv/p
X-Gm-Message-State: AOJu0Yzj6Iwm/KBtGOS38+hT27gMaUMxMi9B3SjgXEbcKNukhlAhYh1a
 KM76P99KwmEqKnc99WiegNWe8tPJB/KD1kYmVSyhybAKuhd27wCom3f053nciA==
X-Google-Smtp-Source: AGHT+IE99IEm1bwDJq2IEwn8DzuSvhEObNZduooC8XEtgQeAr6li7TB9E5Onf6yMe4pPR4UCVj/fTw==
X-Received: by 2002:a5e:c007:0:b0:7c7:9184:df98 with SMTP id
 u7-20020a5ec007000000b007c79184df98mr13293582iol.12.1709056509170; 
 Tue, 27 Feb 2024 09:55:09 -0800 (PST)
Received: from localhost (147.220.222.35.bc.googleusercontent.com.
 [35.222.220.147]) by smtp.gmail.com with UTF8SMTPSA id
 u14-20020a02b1ce000000b0047464deaba5sm1816183jah.114.2024.02.27.09.55.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Feb 2024 09:55:08 -0800 (PST)
Date: Tue, 27 Feb 2024 17:55:07 +0000
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
Subject: Re: [PATCH v4 2/8] usb: misc: onboard_dev: add support for non-hub
 devices
Message-ID: <Zd4h-4Nm0Kl-7mqp@google.com>
References: <20240220-onboard_xvf3500-v4-0-dc1617cc5dd4@wolfvision.net>
 <20240220-onboard_xvf3500-v4-2-dc1617cc5dd4@wolfvision.net>
 <ZdZN3FIS4zcKe4Kw@google.com>
 <174ce57a-3197-4251-831f-205ec5cfeae9@wolfvision.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <174ce57a-3197-4251-831f-205ec5cfeae9@wolfvision.net>
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

On Thu, Feb 22, 2024 at 03:42:26PM +0100, Javier Carrasco wrote:
> On 21.02.24 20:24, Matthias Kaehlcke wrote:
> > On Tue, Feb 20, 2024 at 03:05:46PM +0100, Javier Carrasco wrote:
> >> Most of the functionality this driver provides can be used by non-hub
> >> devices as well.
> >>
> >> To account for the hub-specific code, add a flag to the device data
> >> structure and check its value for hub-specific code.
> > 
> > Please mention that the driver doesn't power off non-hub devices
> > during system suspend.
> > 
> >> Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>
> >> ---
> >>  drivers/usb/misc/onboard_usb_dev.c |  3 ++-
> >>  drivers/usb/misc/onboard_usb_dev.h | 10 ++++++++++
> >>  2 files changed, 12 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
> >> index 2103af2cb2a6..f43130a6786f 100644
> >> --- a/drivers/usb/misc/onboard_usb_dev.c
> >> +++ b/drivers/usb/misc/onboard_usb_dev.c
> >> @@ -129,7 +129,8 @@ static int __maybe_unused onboard_dev_suspend(struct device *dev)
> >>  		if (!device_may_wakeup(node->udev->bus->controller))
> >>  			continue;
> >>  
> >> -		if (usb_wakeup_enabled_descendants(node->udev)) {
> >> +		if (usb_wakeup_enabled_descendants(node->udev) ||
> >> +		    !onboard_dev->pdata->is_hub) {
> > 
> > 
> > This check isn't dependent on characteristics of the USB devices processed
> > in this loop, therefore it can be performed at function entry. Please combine
> > it with the check of 'always_powered_in_suspend'. It's also an option to
> > omit the check completely, 'always_powered_in_suspend' will never be set for
> > non-hub devices (assuming the sysfs attribute isn't added).
> > 
> 
> The attribute will not be available for non-hub devices in v5. However,
> if the check is completely removed, will power_off not stay true at the
> end of the function, always leading to a device power off? As you said,
> 'always_powered_in_suspend' will not be set for non-hub devices.

Even without the sysfs attribute the field 'always_powered_in_suspend' could
be set to true by probe() for non-hub devices.
