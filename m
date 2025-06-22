Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C86AE2F87
	for <lists+dri-devel@lfdr.de>; Sun, 22 Jun 2025 13:23:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23B7610E01F;
	Sun, 22 Jun 2025 11:13:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ivz9/pr1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 494FA10E01F
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Jun 2025 11:13:50 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-3a4f72cba73so2793496f8f.1
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Jun 2025 04:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750590829; x=1751195629; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=MY722r7fjqtwDH04kCsFQsJl/eGG6zaBtiY49RCnDQs=;
 b=ivz9/pr1D0YHhKXjTQMYa9Ct6XjMMplzAnMZxkAcmH0ssjG666st2miBUEMNF/a6FU
 3D6ELPDsN4bjt+8juBjhBek7JK5KO5j0sr/lt6nyGRDjiuPUDI2lOaVc5x8Mi1uwektp
 lN2CyCl0ITD1MKZb9ACnFe+JoiPbPKhO8qU/NJSzUMLxX4Vj/Fs8ToPUcAA3hhj8EPXb
 DASbvjISmVHbLAWpoiFSUOZw2WJY2ceTqfxtO1jzFhFMCorcrqCMHwRlCeXmjlLS7c3x
 M8Nc6H2D3TCSMdttxSrcEF4Mbv2Nm7yzv8r2UUdpXPbkda2voANZHMPQpAL7fcSJ9rEv
 19Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750590829; x=1751195629;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MY722r7fjqtwDH04kCsFQsJl/eGG6zaBtiY49RCnDQs=;
 b=rizOJ4gYbdghj3oDk36g4o0MT52snX/Uky3wAELHBVzURchUzcjtpqjjVCGI9iV7vr
 d1g9DD5ViJ7QqubrA91uJNzVDnq9LpM+do5vpdZWj2slaE3mWMBMP64+MSYsE1nCTmV3
 ekCZaxySmeFgam0PuDbIT6ZrEQ8T69pOH2ajiP4rG9hl+dRSVrGJmKhe06kXGuJWAmwD
 JyDiLM1J2yni+d7mLulcPgGXufUBCoHjVMdY2KpB5YyYhFM9BOVLhwyAaLhTqNaAS4Kr
 PcLnmpN8l2LHC2vdcW3LeRraBnOglqHcwuqWUYNefD6ixN8GlVSP+N7BmqwgkXu2+9b2
 yfsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHgwUI5J5p3S4+pqnEScyhMPxu0TjfrEpugr1IQ6H6t1ryHtxkkpZ/i89zpXHfUGwvEhFLqKZ7x2w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxSjAoktEIfbk7eHiSJb56HwHtgDQbcjE0HGx8vtn+DhRezWiVp
 /Sf5RaBg+nTr7WXql+ZFYlNrvItaUo1/wBEer1N7cQoaBdGDazQwVltm
X-Gm-Gg: ASbGncuU6HTpxT98Da7j/3BHDtzWrAOFZDfX9qWrDLpUwSWiFXzpOJtCjS4JabxaMSC
 RK7Qhyj32p+h2ejMYMnF1pvRm7QsQpNK3m1JltfOr26SuHV4ZDbX2In5ogDwYj5p20We7Nz10Sa
 EPnqtii0TpoC41MQz+xEr3ZC5GcEuKdWx6950guz3MyBErwEOD3PgQmExYsbhCkZc8Neyjym0Ao
 LxXJGFUbMItR4zFQHuGGJnux4nnYoAhdlaiZqPWSl8MJ5VzxRHC6ddIheOZUqFlOEO1QAPFWrCI
 Atk9RN1ihad9cTjp2ytxDMPbjbe7kCBsvyCKF2EeLgH4PF2V5kXfZanOZSvdYSGTfdNAb596Phr
 pVf7Ix0pqtxsk/gFjdkoU3JjAzZ4vMfTwLVpH23oV
X-Google-Smtp-Source: AGHT+IG3zrYphVYrlGBAXA2y7n8eF2Xc/nmKRF7gU5JOUQ44PRhFzXNNRprLlU5eqnSCppCm70ausQ==
X-Received: by 2002:a05:6000:200d:b0:3a4:e231:8632 with SMTP id
 ffacd0b85a97d-3a6d278b163mr6831282f8f.12.1750590828483; 
 Sun, 22 Jun 2025 04:13:48 -0700 (PDT)
Received: from localhost (tor-exit-96.digitalcourage.de. [185.220.101.96])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a6d1187e5fsm6760648f8f.70.2025.06.22.04.13.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Jun 2025 04:13:47 -0700 (PDT)
Date: Sun, 22 Jun 2025 14:13:39 +0300
From: Ahmed Salem <x0rw3ll@gmail.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: airlied@redhat.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [RFC PATCH] amd64-agp: do not bind to pci driver if probing fails
Message-ID: <vzbw4vskuqsiyha4tmjgoybaet667oed2czai4evvxbzewzofb@v6xb2p2m6qmf>
References: <c5kqcudzrcafm24nr5ixgalhxdkxl3uoueerjlp6tbksj3hzy7@klytjugpkvdm>
 <aFZ_YJH30f1WDneD@wunner.de>
 <7rv3j2it6wbv4gu7jgsews3niste5y52h67scwwjpblhy2royh@hqfmpbjzdj77>
 <aFcGSaxeaDphIhUU@wunner.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFcGSaxeaDphIhUU@wunner.de>
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

On 25/06/21 09:21PM, Lukas Wunner wrote:
> On Sat, Jun 21, 2025 at 07:15:31PM +0300, Ahmed Salem wrote:
> > On 25/06/21 11:46AM, Lukas Wunner wrote:
> > > On Sat, Jun 21, 2025 at 04:55:52AM +0300, Ahmed Salem wrote:
> > > > --- a/drivers/char/agp/amd64-agp.c
> > > > +++ b/drivers/char/agp/amd64-agp.c
> > > > @@ -768,10 +768,15 @@ int __init agp_amd64_init(void)
> > > >  
> > > >  		/* Look for any AGP bridge */
> > > >  		agp_amd64_pci_driver.id_table = agp_amd64_pci_promisc_table;
> > > > -		err = driver_attach(&agp_amd64_pci_driver.driver);
> > > > -		if (err == 0 && agp_bridges_found == 0) {
> > > > +		if ((int *)agp_amd64_pci_driver.probe != 0) {
> > > >  			pci_unregister_driver(&agp_amd64_pci_driver);
> > > >  			err = -ENODEV;
> > > > +		} else {
> > > > +			err = driver_attach(&agp_amd64_pci_driver.driver);
> > > > +			if (err == 0 && agp_bridges_found == 0) {
> > > > +				pci_unregister_driver(&agp_amd64_pci_driver);
> > > > +				err = -ENODEV;
> > > > +			}
> > > 
> > > Is the "probe" member in agp_amd64_pci_driver overwritten with a
> > > zero pointer anywhere?  I don't see that it is, so it seems the
> > > else-branch is never entered.
> > 
> > That is a great question. I thought since pci_register_driver calls the
> > probe function, it would return with or without a zero, saving that
> > value in the .probe member.
> 
> You'd have to add parentheses and parameters, i.e.
> 
>   agp_amd64_pci_driver.probe(...)
> 
> to invoke the probe hook directly.  However, that wouldn't be an
> acceptable approach, one needs to go through the API of the
> driver core and not do things behind the driver core's back.
> 

Noted!

> 
> > > I had already prepared a fix for this, but waited for 0-day to
> > > crunch through it.  I've just submitted it, so that's what I had
> > > in mind:
> > > 
> > > https://lore.kernel.org/r/f8ff40f35a9a5836d1371f60e85c09c5735e3c5e.1750497201.git.lukas@wunner.de/
> > 
> > That one I've seen even prior to catching this one, and this is
> > originally what I had in mind based on what commit 6fd024893911
> > ("amd64-agp: Probe unknown AGP devices the right way") removed (i.e.
> > !pci_find_capability) when you suggested checking for caps beforehand,
> > but I figured "why make other calls when .probe already does it right
> > off the bat?"
> 
> Right, it is somewhat silly, but this driver is for 20+ year old hardware
> which is likely no longer in heavy use, the driver itself isn't actively
> maintained anymore and might be dropped in a few years, so this approach
> seemed like the least ugly and most acceptable option.
> 
> The real crime was to probe *any* PCI device and even make that the
> default.  I think vfio_pci is probably the only other driver that
> probes *any* PCI device and it does that only if requested by user
> space I believe.  We'd risk regressing users if we changed the
> "probe everything by default" behavior, so that's not a good option.
> 

Gotcha..That clarifies a whole lot, thank you so much!

--
Best regards,
Ahmed Salem <x0rw3ll@gmail.com>

> Thanks,
> 
> Lukas
