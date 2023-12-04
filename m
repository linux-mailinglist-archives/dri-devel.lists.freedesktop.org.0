Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA18802EEB
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 10:41:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6B3B10E2F6;
	Mon,  4 Dec 2023 09:40:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56BDC10E31C
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 09:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701682815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G9FuCuFX9js5B00H0QxB18DjoP2C8ptLAZ0KJppA/gY=;
 b=gM02SXt3cmQZWeoK4iv99pnSZWvia309bMhLdsFpQ5txdz4B25HwN5k1cxMF1dR4nyasOK
 Yorxb5oary1i2ZJlE9PyWUiSYvjhjFbqDahYoO24zoc1vMBzvKzK/ZVvqVIv+UPAY8txJ3
 QDGdnwFyxHGcOQFqgdShiPtQcfTWHNo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-8-tcKwaQrLN3yO6jmyINz1mw-1; Mon, 04 Dec 2023 04:39:58 -0500
X-MC-Unique: tcKwaQrLN3yO6jmyINz1mw-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-40b38501d82so31604595e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Dec 2023 01:39:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701682791; x=1702287591;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YjxQsqndp2YNOEtpcHkzhSj4Ex7oFFPfHpZ5413ZYNE=;
 b=uQmVRAIgcb0Ham/8JETA0j+s2/T0ea/o6B2PLop66eZc6ZxOekK7DlOD48a2VbjiwG
 x1kL6vfstH2SV8jGb6YzGVHoVhBy6rIi4noDRuphyo55LFvY2+MYA9XmP1Yj656l0e46
 RAU9m/T9HMf073jTRT4MBRHJQl/C2F0uBvFXbidr7VyhA48QQ7IREd9X+UIi7H0vQkpp
 fbPbPL3IsQAZDM3N/4H4vRdL80li2Y32P8Kh6FAMB0Yv9wi8r5rxmb+PwXbLQjKKsw1z
 Yh5bV8DlNDsslQk3giHFoPPLGeKHw5PVP7VLeeKYtUUX+6bitRfu5Lmf95//i/2FYAgP
 GoiQ==
X-Gm-Message-State: AOJu0YzalBP8lHpoS/kpc4fQ6QdIyKuhXP10uQ5WAH27MrIOa7QNXual
 tHH0rGh49XD7JmiGiiuAMHbiZ9N0HR4m4v3IkxdnOaGpzxbCUpC5rChMSqkIBxo9ru68KNa9arZ
 oOd2s/hjDxReT/Dvbpoc1G38Q7I3d
X-Received: by 2002:a7b:c2b2:0:b0:40b:5e59:ea12 with SMTP id
 c18-20020a7bc2b2000000b0040b5e59ea12mr2222049wmk.177.1701682791041; 
 Mon, 04 Dec 2023 01:39:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IExL00bqqXgrqIQyIEewRdVX5DUBUHVJDjGkpysRiiHgP6pn1w5E/Kzz/sPmNtx04t6PJhBKA==
X-Received: by 2002:a7b:c2b2:0:b0:40b:5e59:ea12 with SMTP id
 c18-20020a7bc2b2000000b0040b5e59ea12mr2222041wmk.177.1701682790651; 
 Mon, 04 Dec 2023 01:39:50 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 m40-20020a05600c3b2800b004042dbb8925sm18119091wms.38.2023.12.04.01.39.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 01:39:50 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [RFC PATCH] of/platform: Disable sysfb if a simple-framebuffer
 node is found
In-Reply-To: <CAL_JsqJbZ736iV+bRbSNNaimkbJLpB9MbeKLSct16Yi67ttFcw@mail.gmail.com>
References: <20231113085305.1823455-1-javierm@redhat.com>
 <CAL_JsqKHTN5hfd4qpg5RXbmQLKZNVywDkSj9mxvfGmjrcChQQg@mail.gmail.com>
 <87jzqi59bt.fsf@minerva.mail-host-address-is-not-set>
 <CAL_JsqJM9+cbNviwuKGB5+3YbyAP3UH+TxCxsU5nUtX-iRGP2w@mail.gmail.com>
 <CAMj1kXG7Xyk0ys9j-XRo7Rr8gYz1qJE8fFSixBOwVbm-pjeX+A@mail.gmail.com>
 <874jhj1fm3.fsf@minerva.mail-host-address-is-not-set>
 <58672ab8-99bf-4a2a-af79-031d1e8fcba0@suse.de>
 <87fs0mxlyp.fsf@minerva.mail-host-address-is-not-set>
 <CAL_JsqJbZ736iV+bRbSNNaimkbJLpB9MbeKLSct16Yi67ttFcw@mail.gmail.com>
Date: Mon, 04 Dec 2023 10:39:49 +0100
Message-ID: <87a5qqxq56.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: devicetree@vger.kernel.org, Sergio Lopez <slp@redhat.com>,
 Sima Vetter <daniel.vetter@ffwll.ch>, Hector Martin <marcan@marcan.st>,
 Andrew Worsley <amworsley@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Frank Rowand <frowand.list@gmail.com>, Ard Biesheuvel <ardb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rob Herring <robh@kernel.org> writes:

Hello Rob,

> On Fri, Dec 1, 2023 at 4:21=E2=80=AFAM Javier Martinez Canillas

[...]

>> >> I don't have a better idea than this patch but maybe Thomas or Sima d=
o?
>> >
>> > At SUSE, we've carried such a patch in our repos for some time. It wor=
ks
>> > around the double-framebuffer problem in a similar way. [1]
>> >
>>
>> Thanks for the information. I see that your patch is basically mine but
>> doing it unconditionally while this one only does the sysfb_disable() if
>> a "simple-framebuffer" DT node has been found.
>>
>> > As Javier mentioned, we do track the framebuffer ranges for EFI/VESA/O=
F
>> > framebuffers in the graphics aperture helpers. Fbdev has done this for
>> > decades, and the current codebase extends and harmonizes this
>> > functionality among fbdev and DRM drivers.
>> >
>> > WRT DT vs EFI: AFAIK the EFI support on affected platforms looks at th=
e
>> > DT to set up the EFI framebuffer. So IMHO the DT is the authoritative
>> > source on the framebuffer.
>> >
>>
>> Agreed. Sima Vetter also mentioned on IRC that they think this patch is
>> the least bad option. Rob, Ard any thoughts? Maybe we can land this as
>> a fix and then figure how this could be better handled in the long term?
>
> What about moving the DT setup code here to sysfb? Then we just setup
> the right thing up front.
>

Right now sysfb is pretty platform agnostic, in the sense that just looks
at the screen_info global struct and uses it to add the platform data that
contains the firmware provided framebuffer.

How the screen_info was filled (e.g: by the Linux EFI stub using the GOP
or the x86 early boot code using VESA) is transparent to sysfb. For this
reason adding platform specific logic there, like finding OF nodes, is not
desirable.

I also suggested to Thomas to move the DT setup code to sysfb but he said
that would be the wrong approach for the reason mentioned above. Please
correct me Thomas if I'm misremembering here.

> However, there might be one other issue with that and this fix. The DT
> simplefb can have resources such as clocks and regulators. With
> fw_devlink, the driver won't probe until those dependencies are met.
> So if you want the framebuffer console up early, then you may want to
> register the EFI framebuffer first and then handoff to the DT simplefb
> when it probes (rather than registering the device).
>
> But I agree, probably better to take this patch now and have those
> quirks instead of flat out not working.
>

If we do that what's the plan? Are you thinking about merging this patch
through your OF tree or do you want to go through drm-misc with your ack?

> Rob
>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

