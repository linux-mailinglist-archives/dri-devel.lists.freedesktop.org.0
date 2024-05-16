Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D24CF8C76EB
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 14:51:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC07410ECEC;
	Thu, 16 May 2024 12:51:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="Cn7cbFZL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF27610ECEC
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 12:51:44 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-57510d3a6d3so21881a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 05:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1715863903; x=1716468703; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bN3c1sB+iVklhHV8ys6/CoK5+RSaNkuyQ6y8C9ymhqA=;
 b=Cn7cbFZLt2It0baf1tDu2FB09aazJDQcybWYGNogPVeK59beBAYrvhXi0d95QTBji7
 xKOG5wo9nGPWLIxJ5SE3qxusQyk5n9Q54i3au5ZoGYHSCLWo4uLd3nQHBrRnZ3qJyTx2
 iQ/pRWw8KPT42Y5nkse6oqsiph+f31u/KVwqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715863903; x=1716468703;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bN3c1sB+iVklhHV8ys6/CoK5+RSaNkuyQ6y8C9ymhqA=;
 b=fvInJvA+aMSJNSTqyqGQhDW+qnxYJGAbzFNE6+teZ00Orx79ovyL3qh9mGOzM0RVqC
 xXR5EEwNFTko91+C7NMK4Ka8GCWn+P2QRYLDBVlVLrTTUIrFBYG3oVnWQoubGhTGw6ri
 lqCxc81RTvX20caQnPOpCbtU2qflZo/XSr4dmxY+ByXLPTkmKa6waNg+LZ2NkJVBMfJY
 Kua8znWwSwGm4RbzasG7ZR4vxfOy5aiMdcsLxa88Zj7WY2eIlOXYvPigXgI46SvyjzGq
 al2lPX0LbxmSD+R7Cb1dBWqGaA2VoJlKHm2eOZcqb+xIAvjwwJDnBHFcNfrEWoDn0JQ0
 1nFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrTMoWBkp+EDKleNYF3uGqWDBXfI243CzHMVVi1NaVftG8O/UayLoF44QObNvDZgVXbi3GFsXATqxCkymYz9YlRgWwhcVk0fLCpwfS32OD
X-Gm-Message-State: AOJu0YyEQa+F8BLJS2ZSbCEdaiXRaNBFcRORxe7wnFtYkenDOemZ08I3
 v2X6UxjJGjIwtHQfK4O1fdvL+XSARGxlGmZ+Zx9XBhAHWg/E+K6rBL654SKyFKI=
X-Google-Smtp-Source: AGHT+IEkup55qeaKfO+32HXYxfIHVJSYg1htZFQZ3Q1H4DOYVQs44ejb7aDQZY9gHL5xZNrptcqCAg==
X-Received: by 2002:a17:907:b84:b0:a5a:1b61:bf44 with SMTP id
 a640c23a62f3a-a5a2d553543mr1137772166b.2.1715863902664; 
 Thu, 16 May 2024 05:51:42 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a179c7d7csm989056766b.140.2024.05.16.05.51.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 May 2024 05:51:40 -0700 (PDT)
Date: Thu, 16 May 2024 14:51:38 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: Devarsh Thakkar <devarsht@ti.com>, Maxime Ripard <mripard@kernel.org>,
 jyri.sarha@iki.fi, tomi.valkeinen@ideasonboard.com,
 airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, nm@ti.com, vigneshr@ti.com,
 kristo@kernel.org, praneeth@ti.com, a-bhatia1@ti.com, j-luthra@ti.com
Subject: Re: [RFC PATCH 2/3] drm/tidss: Add support for display sharing
Message-ID: <ZkYBWnQO8AbGAt06@phenom.ffwll.local>
Mail-Followup-To: Javier Martinez Canillas <javierm@redhat.com>,
 Devarsh Thakkar <devarsht@ti.com>,
 Maxime Ripard <mripard@kernel.org>, jyri.sarha@iki.fi,
 tomi.valkeinen@ideasonboard.com, airlied@gmail.com,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, nm@ti.com, vigneshr@ti.com,
 kristo@kernel.org, praneeth@ti.com, a-bhatia1@ti.com,
 j-luthra@ti.com
References: <20240116134142.2092483-1-devarsht@ti.com>
 <20240116134142.2092483-3-devarsht@ti.com>
 <vgfzhamtiwkpdyk5ndagsb63subclinotoe6tsi3wu6z7454ec@igxfzjc5gyqm>
 <88018f5f-a7db-7278-e5c3-bb1dbf0e3f14@ti.com>
 <qiqrhpqtnox47wj6az7t3fjp4vc6k32fw42tp5slqggrhe6utb@i7lkpaf3v3od>
 <2f4cf2a7-ce7a-bb34-f722-7e66ea41def7@ti.com>
 <20240314-hospitable-attractive-cuttlefish-a2f504@houat>
 <03e2d653-731c-bb30-321b-b5477d7b82b2@ti.com>
 <87ikzf16dm.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ikzf16dm.fsf@minerva.mail-host-address-is-not-set>
X-Operating-System: Linux phenom 6.6.15-amd64 
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

On Wed, May 15, 2024 at 04:45:09PM +0200, Javier Martinez Canillas wrote:
> Devarsh Thakkar <devarsht@ti.com> writes:
> 
> Hello Devarsh and Maxime,
> 
> > Hi Maxime,
> >
> > On 14/03/24 20:04, Maxime Ripard wrote:
> >> Hi,
> >> 
> >> On Wed, Feb 14, 2024 at 09:17:12PM +0530, Devarsh Thakkar wrote:
> >>> On 13/02/24 19:34, Maxime Ripard wrote:
> >>>> On Thu, Feb 08, 2024 at 06:26:17PM +0530, Devarsh Thakkar wrote:
> >>>>> On 26/01/24 17:45, Maxime Ripard wrote:
> >>>>>> Hi,
> >>>>>>
> >>>>>> Thanks a lot for working on that.
> >>>>>>
> >>>>>> On Tue, Jan 16, 2024 at 07:11:41PM +0530, Devarsh Thakkar wrote:
> >>>>>>> Display subsystem present in TI Keystone family of devices supports sharing
> >>>>>>> of display between multiple hosts as it provides separate register space
> >>>>>>> (common* region) for each host to programming display controller and also a
> >>>>>>> unique interrupt line for each host.
> >>>>>>>
> >>>>>>> This adds support for display sharing, by allowing partitioning of
> >>>>>>> resources either at video port level or at video plane level as
> >>>>>>> described below :
> >>>>>>>
> >>>>>>> 1) Linux can own (i.e have write access) completely one or more of video
> >>>>>>> ports along with corresponding resources (viz. overlay managers,
> >>>>>>> video planes) used by Linux in context of those video ports.
> >>>>>>> Even if Linux is owning
> >>>>>>> these video ports it can still share this video port with a remote core
> >>>>>>> which can own one or more video planes associated with this video port.
> >>>>>>>
> >>>>>>> 2) Linux owns one or more of the video planes with video port
> >>>>>>> (along with corresponding overlay manager) associated with these planes
> >>>>>>> being owned and controlled by a remote core. Linux still has read-only
> >>>>>>> access to the associated video port and overlay managers so that it can
> >>>>>>> parse the settings made by remote core.
> >>>>>>
> >>>>>> So, just to make sure we're on the same page. 1) means Linux drives the
> >>>>>> whole display engine, but can lend planes to the R5? How does that work,
> >>>>>> is Linux aware of the workload being there (plane size, format, etc) ?
> >>>>>>
> >>>>>
> >>>>> Well, there is no dynamic procedure being followed for lending. The
> >>>>> partitioning scheme is decided and known before hand, and the remote
> >>>>> core firmware updated and compiled accordingly, and similarly the
> >>>>> device-tree overlay for Linux is also updated with partitioning
> >>>>> information before bootup.
> >>>>>
> >>>>> What would happen here is that Linux will know before-hand this
> >>>>> partitioning information via device-tree properties and won't enumerate
> >>>>> the plane owned by RTOS, but it will enumerate the rest of the display
> >>>>> components and initialize the DSS, after which user can load the DSS
> >>>>> firmware on remote core and this firmware will only have control of
> >>>>> plane as it was compiled with that configuration.
> >>>>
> >>>> Right. If the RTOS is in control of a single plane, how it is expected
> >>>> to deal with Linux shutting the CRTC down, or enforcing a configuration
> >>>> that isn't compatible with what the RTOS expects (like a plane with a
> >>>> higher zpos masking its plane), what is the mechanism to reconcile it?
> >>>>
> >>>
> >>> Just for the note, for this "RTOS control single plane" mode, we don't have a
> >>> firmware available to test (right now we are only supporting example for "RTOS
> >>> controlling the display mode" as shared here [1]) and hence this is not
> >>> validated but the idea was to keep dt-bindings generic enough to support them
> >>> in future and that's why I referred to it here.
> >>>
> 
> 
> If I understand you correctly, for now the only real use case is when the
> the RTOS owns / manages the complete display pipeline and Linux can only
> own video planes.
> 
> The opposite is supported by the DSS hardware (thanks to its feature that
> allows partitioning the register space and having multiple per-host IRQs) 
> but it's not a real use case yet. The reason why this case is added to the
> DT binding is as you said for flexiblity and make the design future-proof.
> 
> >>> separate irq
> >>> Coming back to your questions, with the current scheme the Linux (tidss) would
> >>> be expected to make sure the CRTC being shared with RTOS is never shutdown and
> >>> the RTOS plane should never gets masked.
> >> 
> >> I'm probably missing something then here, but if the Linux side of
> >> things is expected to keep the current configuration and keep it active
> >> for it to work, what use-case would it be useful for?
> >> 
> >
> > It's just one of the partitioning possibilities that I mentioned here, that
> > Linux is in control of DSS as a whole and the user want the other host (be it
> > RTOS or any other core) to control a single plane. For e.g it could be Linux
> > (with GPU rendering) displaying the graphics and RTOS overlaying a real time
> > clock or any other signs which need to be displayed in real-time.
> > But more than the use-case this is inspired by the fact that we want to be
> > flexible and support in the linux driver whatever partitioning scheme
> > possibilities are there which are supported in hardware and we let user decide
> > on the partitioning scheme.
> >
> 
> A possible use case here could be if Linux is safer than the other host
> owning a single plane, right? Then in that case the RTOS could fail but
> the display pipeline won't be teared down.
> 
> That is, if your safety tell-tales would be driven by Linux and having
> other OS dislay the GPU-rendered QT based application on another plane.
> 
> But as said, for now that's a theorethical use case since the one you
> mentioned is the opposite.
> 
> [....]
> 
> >>>
> >>>> It's not just about interrupts, it's also about how your arbitrate
> >>>> between what Linux wants and what the RTOS wants. Like if the RTOS still
> >>>> wants to output something but Linux wants to disable it, how do you
> >>>> reconcile the two?
> >>>>
> >>>
> >>> The scheme involves static partitioning of display resource which are assigned
> >>> compile-time to RTOS and Linux. Here the RTOS firmware is compiled with
> >>> specific ownership/display resources as desired by user and this assignment
> >>> stays intact.
> >>>
> >>> If there is a more complex use-case which requires dynamic
> >>> assignment/arbitration of resources then I agree those require some sort of
> >>> IPC scheme but this is not what we target with these series. This series is
> >>> simply to support static partitioning feature (separate register space,
> >>> separate irq, firewalling support etc) of TI DSS hardware across the multiple
> >>> hosts and there are use-cases too for which this scheme suffices.
> >> 
> >> I think you're right and we have a misunderstanding. My initial
> >> assumption was that it was to prevent the Linux side of sides from
> >> screwing up the output if it was to crash.
> >> 
> >> But it looks like it's not the main point of this series, so could you
> >> share some use-cases you're trying to address?
> >> 
> >
> > The end use-case we have demonstrated right now with this series is a
> > proof-of-concept display cluster use-case where RTOS boots early on MCU core
> > (launched at bootloader stage) and initializes the display (using the global
> > common0 register space and irq) and starts displaying safety tell-tales on one
> > plane, and once Linux boots up on application processor,
> > Linux (using common1 register space and irq) controls the other plane with GPU
> > rendering using a QT based application. And yes, we also support the scenario
> > where Linux crashes but RTOS being the DSS master and in control of DSS power,
> > clock domain and global register space is not impacted by the crash.
> 
> You mention 2 scenarios but are actually the same? Or did I misunderstand?
> 
> In both cases the RTOS own the display pipeline and Linux can just display
> using a single plane.
> 
> That's why I think that agree with Maxime, that a fwkms could be a simpler
> solution to your use case instead of adding all this complexity to the DSS
> driver. Yes, I understand the HW supports all this flexibility but there's
> no real use case yet (you mentioned that don't even have firmware for this
> single plane owned by the RTOS in the R5F case).
> 
> The DT binding for a fwkms driver would be trivial, in fact maybe we might
> even leverage simpledrm for this case and not require a new driver at all.

I guess you can still do things like pageflipping and maybe use some of
the color/blending hardware? Maybe even have more than one plane
available? fwkms/simpledrm conceptually cannot really support pageflipping
even, so that's a much, much reduced feature set.

That all aside I do think we should limit the support to just the first
case, where linux gets a few pieces assigned to it and is not the DSS
master. From what I'm understanding you could assign entire crtc with
planes and everything to linux, so this shouldn't really constraint
real-world usage?

At least until there's support in firmware for this it's all way too
theoretical, and I agree with Maxime and Javier that there's some serious
design questions about how this kind of static leasing should work with
drm sitting on top.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
