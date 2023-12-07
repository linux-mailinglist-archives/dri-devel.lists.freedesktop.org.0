Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C41E808EAA
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 18:30:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56B8610E1A2;
	Thu,  7 Dec 2023 17:30:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com
 [209.85.161.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BB4A10E1A2
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 17:30:40 +0000 (UTC)
Received: by mail-oo1-f52.google.com with SMTP id
 006d021491bc7-58e28e0461bso511621eaf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Dec 2023 09:30:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701970239; x=1702575039;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aqj0z6kEygULbYJbl9fDvMATmV0n6DPZZ0Ol7473clQ=;
 b=CtnwFTqJZk1jwv9/50HcIivWYYhu/n1MQYzMToEWP4oEgv9hx42XBpZy/FXSuCW3px
 WC5O4rOnh7Xna3xcwUxbOL+vW93OsDtuGvrykIKWZLPVnluCliPDGd/2I/iQg6nqW+j7
 cIUMccvawPDfzzWLun4Ei2p1x9N9Iw1iSAAbnsHTtPgL7rPAGip9exN8PuQ8/Z+5w9ri
 4Cbekq+hUIMPAG7m2N38W8qVF6KC9JCKN8jcr/JCNOCNZXiylknOOPpVVmQ30EajwF1+
 M9yXcyfBxob9wvgrtQvM42Cg0sK+MaLCAbA33MFMnLc62NplefuJbtQIZWlWKqvbUglq
 pwew==
X-Gm-Message-State: AOJu0YytwKCPlPXT7ldyFyzkR90TJgm/184nNwAFv/UjqOIO4AdPsdCX
 NApArY645eZoqkUmhV5OVvlrAZhSbw==
X-Google-Smtp-Source: AGHT+IF3F8YBAWZBvd1RIa5py5Lvvl2NkA72wnpM8EkmUcXD/AJYQyxVqC4by4fUaPk/uragnrGJtQ==
X-Received: by 2002:a05:6820:1c90:b0:58d:9ff4:7646 with SMTP id
 ct16-20020a0568201c9000b0058d9ff47646mr3042277oob.4.1701970239382; 
 Thu, 07 Dec 2023 09:30:39 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 w21-20020a4a3555000000b00587947707aasm10168oog.4.2023.12.07.09.30.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Dec 2023 09:30:38 -0800 (PST)
Received: (nullmailer pid 2946014 invoked by uid 1000);
 Thu, 07 Dec 2023 17:30:37 -0000
Date: Thu, 7 Dec 2023 11:30:37 -0600
From: Rob Herring <robh@kernel.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [RFC PATCH] of/platform: Disable sysfb if a simple-framebuffer
 node is found
Message-ID: <20231207173037.GA2944721-robh@kernel.org>
References: <87jzqi59bt.fsf@minerva.mail-host-address-is-not-set>
 <CAL_JsqJM9+cbNviwuKGB5+3YbyAP3UH+TxCxsU5nUtX-iRGP2w@mail.gmail.com>
 <CAMj1kXG7Xyk0ys9j-XRo7Rr8gYz1qJE8fFSixBOwVbm-pjeX+A@mail.gmail.com>
 <874jhj1fm3.fsf@minerva.mail-host-address-is-not-set>
 <58672ab8-99bf-4a2a-af79-031d1e8fcba0@suse.de>
 <87fs0mxlyp.fsf@minerva.mail-host-address-is-not-set>
 <CAL_JsqJbZ736iV+bRbSNNaimkbJLpB9MbeKLSct16Yi67ttFcw@mail.gmail.com>
 <87a5qqxq56.fsf@minerva.mail-host-address-is-not-set>
 <CAL_Jsq+7AwuLt9pfX0zr8g=65zSVLUFzFds82ENaspEFQNK=gg@mail.gmail.com>
 <87zfyqvtpx.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87zfyqvtpx.fsf@minerva.mail-host-address-is-not-set>
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

On Mon, Dec 04, 2023 at 05:05:30PM +0100, Javier Martinez Canillas wrote:
> Rob Herring <robh@kernel.org> writes:
> 
> > On Mon, Dec 4, 2023 at 3:39 AM Javier Martinez Canillas
> > <javierm@redhat.com> wrote:
> >> Rob Herring <robh@kernel.org> writes:
> >> > On Fri, Dec 1, 2023 at 4:21 AM Javier Martinez Canillas
> 
> [...]
> 
> >>
> >> > However, there might be one other issue with that and this fix. The DT
> >> > simplefb can have resources such as clocks and regulators. With
> >> > fw_devlink, the driver won't probe until those dependencies are met.
> >> > So if you want the framebuffer console up early, then you may want to
> >> > register the EFI framebuffer first and then handoff to the DT simplefb
> >> > when it probes (rather than registering the device).
> >> >
> >> > But I agree, probably better to take this patch now and have those
> >> > quirks instead of flat out not working.
> >> >
> >>
> >> If we do that what's the plan? Are you thinking about merging this patch
> >> through your OF tree or do you want to go through drm-misc with your ack?
> >
> > I can take it. Do we need this in 6.7 and stable?
> >
> 
> IMO this can wait for v6.8 since is not a fix for a change introduced in
> the v6.7 merge window and something that only happens on a very specific
> setup (DT systems booting with u-boot EFI and providing an EFI-GOP table).
> 
> Also the -rc cycle is already in -rc5, so it seems risky to push a change
> at this point. And distros can pick the patch if want to have it earlier.

Okay, I've applied it for 6.8.

Rob
