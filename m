Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4A0A7A839
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 18:55:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9610E10E29E;
	Thu,  3 Apr 2025 16:54:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Sd1N/11d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35C8310E2CC
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Apr 2025 16:54:51 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-736ad42dfd6so962203b3a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Apr 2025 09:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743699291; x=1744304091; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=FDa5eNS7BwA8fLuFV+VPTYw9CpDmGbyK6UKEScOkVlM=;
 b=Sd1N/11d49UnVuWxspbUldunwXLsECNkxxCcjD1iwxRpr9QJOK8BaVr6HImJv4f0Xx
 3CylGuLsOrRRFPPl6Rs2tSCt1a97t9LwQyl5EMGN/iGBBrTh2dlQICouvrExahx/S1Nv
 v2qPpVuS/i5747R8J92FsJF9NkPMXov7mDk+CcmJUICYmWUtkv0BunIH9LQzAf+RS3FS
 CM0i4AIpfMW2/L/pkk0ztA5HzHGy5wX5oKCmShvjaMdiEMymSREWC9+a2GzC+LiMv4Ym
 lpvAUbTaVIsuzVEE1RDj1K7lykesYklwHJUn5GVkPTs6TFoZg2M2J4p9Hdxx/zeRbqDU
 1D9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743699291; x=1744304091;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FDa5eNS7BwA8fLuFV+VPTYw9CpDmGbyK6UKEScOkVlM=;
 b=N4K0Xb6nwtvODS5hibCG5FiRdHVPfLlMmlj1oxgtARKIT7x/A25PkVm3oBq+oqB2qS
 YcJK02wp9QShlABlJhrwEv3R4L78BTnlv2u1sTOgO71KEBXqGmtAD9N3eIJGAXw2g5VX
 MnRd/rxXDLuePfUg6h5KLr/vFYiREPRUcNx9J8dYv9xLlE55cWNX1NSTDl3yBdUv3bUz
 TSwwjAPxSrW5pI+y0Uwe3nSVk2WL2/GjZDNC3Ow2ZkK1Wkwywgv/GAYkeZ9vBpfjUGuZ
 V+cb6Q/mxW1mmnuJst+g47QE7uPyA8qhGbBGRN9ygGkHSXBBqz+kDavO4MKucwLdQePq
 jMug==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEJJhZlE8ppBOGJkwMFQ974PdaNO9Kl993ksM+yifIRdrIHsB3QEOXo+RFYfRWMN+ryEtYj0vyO6I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YymC2dWrZscJUT5Nzyz8wiFFQfpUjgw8ILNp4TOEuK/axmB+8C3
 Jkx2lfkHiLYwdTIuopEiT5u6Za+i4xnvMn9T/FuEOcecfGP5iW9V
X-Gm-Gg: ASbGncvKcuf/PgAe5ueYAJNTwLNwp6R10ygzPWlnWm0+KuSoR0SGWwcaWiso+1SxguA
 fd++wRsJD3nGmzBzNGEGHF5EDlTqRiPMu8dvfh1xQAO9VkQSYag5MgBZK8gagiPmuVyD6cqYVaY
 F8oZEyAXkXR1WZaqA2wY5qfOi3ONo+y6ESnAiQizR8H6hJElmmOQZTISj4Xc1oP/7NNg7BWj/k5
 ZpZU1bSEjCLRkqSeFKKUXUt8w3t2m3Qigt5peVSlgGB5l5xg7z5UwoF3r96Vaa73gi52Z6kbkQr
 mKRmTqZSnvIVmR3QZsw9ssP4I4Ji8kO078NxbkHaFCPTwQXe+co6nXcipJs9zQbl5tRTj3Tv
X-Google-Smtp-Source: AGHT+IFzbU3WoJeacDQdqibpo5DgjipppPJR8PTe9f3lGsTZ/tQbuHLEeyPY/scxBj5Gc9UqWtPEbg==
X-Received: by 2002:a05:6a21:9011:b0:1f3:418c:6281 with SMTP id
 adf61e73a8af0-2010446ceb8mr238059637.4.1743699290513; 
 Thu, 03 Apr 2025 09:54:50 -0700 (PDT)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af9bc31c00csm1453293a12.20.2025.04.03.09.54.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Apr 2025 09:54:49 -0700 (PDT)
Date: Fri, 4 Apr 2025 00:54:40 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Yury Norov <yury.norov@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>,
 David Laight <david.laight.linux@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Laurent.pinchart@ideasonboard.com, airlied@gmail.com,
 akpm@linux-foundation.org, alistair@popple.id.au,
 andrew+netdev@lunn.ch, andrzej.hajda@intel.com,
 arend.vanspriel@broadcom.com, awalls@md.metrocast.net, bp@alien8.de,
 bpf@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com,
 brcm80211@lists.linux.dev, dave.hansen@linux.intel.com,
 davem@davemloft.net, dmitry.torokhov@gmail.com,
 dri-devel@lists.freedesktop.org, eajames@linux.ibm.com,
 edumazet@google.com, eleanor15x@gmail.com,
 gregkh@linuxfoundation.org, hverkuil@xs4all.nl,
 jernej.skrabec@gmail.com, jirislaby@kernel.org, jk@ozlabs.org,
 joel@jms.id.au, johannes@sipsolutions.net, jonas@kwiboo.se,
 jserv@ccns.ncku.edu.tw, kuba@kernel.org, linux-fsi@lists.ozlabs.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-serial@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux@rasmusvillemoes.dk, louis.peens@corigine.com,
 maarten.lankhorst@linux.intel.com, mchehab@kernel.org,
 mingo@redhat.com, miquel.raynal@bootlin.com, mripard@kernel.org,
 neil.armstrong@linaro.org, netdev@vger.kernel.org,
 oss-drivers@corigine.com, pabeni@redhat.com,
 parthiban.veerasooran@microchip.com, rfoss@kernel.org,
 richard@nod.at, simona@ffwll.ch, tglx@linutronix.de,
 tzimmermann@suse.de, vigneshr@ti.com, x86@kernel.org
Subject: Re: [PATCH v3 00/16] Introduce and use generic parity16/32/64 helper
Message-ID: <Z+69UOemf+H/EHvN@visitorckw-System-Product-Name>
References: <Z824SgB9Dt5zdWYc@visitorckw-System-Product-Name>
 <Z9CyuowYsZyez36c@thinkpad>
 <80771542-476C-493E-858A-D2AF6A355CC1@zytor.com>
 <Z9GtcNJie8TRKywZ@thinkpad>
 <Z9G2Tyypb3iLoBjn@visitorckw-System-Product-Name>
 <Z9KMKwnZXA2mkD2s@visitorckw-System-Product-Name>
 <Z+AlyB461xwMxMtG@visitorckw-System-Product-Name>
 <eec0dfd7-5e4f-4a08-928c-b7714dbc4a17@zytor.com>
 <Z+6dh1ZVIKWWOKaP@visitorckw-System-Product-Name>
 <Z-6zzP2O-Q7zvTLt@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z-6zzP2O-Q7zvTLt@thinkpad>
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

On Thu, Apr 03, 2025 at 12:14:04PM -0400, Yury Norov wrote:
> On Thu, Apr 03, 2025 at 10:39:03PM +0800, Kuan-Wei Chiu wrote:
> > On Tue, Mar 25, 2025 at 12:43:25PM -0700, H. Peter Anvin wrote:
> > > On 3/23/25 08:16, Kuan-Wei Chiu wrote:
> > > > 
> > > > Interface 3: Multiple Functions
> > > > Description: bool parity_odd8/16/32/64()
> > > > Pros: No need for explicit casting; easy to integrate
> > > >        architecture-specific optimizations; except for parity8(), all
> > > >        functions are one-liners with no significant code duplication
> > > > Cons: More functions may increase maintenance burden
> > > > Opinions: Only I support this approach
> > > > 
> > > 
> > > OK, so I responded to this but I can't find my reply or any of the
> > > followups, so let me go again:
> > > 
> > > I prefer this option, because:
> > > 
> > > a. Virtually all uses of parity is done in contexts where the sizes of the
> > > items for which parity is to be taken are well-defined, but it is *really*
> > > easy for integer promotion to cause a value to be extended to 32 bits
> > > unnecessarily (sign or zero extend, although for parity it doesn't make any
> > > difference -- if the compiler realizes it.)
> > > 
> > > b. It makes it easier to add arch-specific implementations, notably using
> > > __builtin_parity on architectures where that is known to generate good code.
> > > 
> > > c. For architectures where only *some* parity implementations are
> > > fast/practical, the generic fallbacks will either naturally synthesize them
> > > from components via shift-xor, or they can be defined to use a larger
> > > version; the function prototype acts like a cast.
> > > 
> > > d. If there is a reason in the future to add a generic version, it is really
> > > easy to do using the size-specific functions as components; this is
> > > something we do literally all over the place, using a pattern so common that
> > > it, itself, probably should be macroized:
> > > 
> > > #define parity(x) 				\
> > > ({						\
> > > 	typeof(x) __x = (x);			\
> > > 	bool __y;				\
> > > 	switch (sizeof(__x)) {			\
> > > 		case 1:				\
> > > 			__y = parity8(__x);	\
> > > 			break;			\
> > > 		case 2:				\
> > > 			__y = parity16(__x);	\
> > > 			break;			\
> > > 		case 4:				\
> > > 			__y = parity32(__x);	\
> > > 			break;			\
> > > 		case 8:				\
> > > 			__y = parity64(__x);	\
> > > 			break;			\
> > > 		default:			\
> > > 			BUILD_BUG();		\
> > > 			break;			\
> > > 	}					\
> > > 	__y;					\
> > > })
> > >
> > Thank you for your detailed response and for explaining the rationale
> > behind your preference. The points you outlined in (a)–(d) all seem
> > quite reasonable to me.
> > 
> > Yury,
> > do you have any feedback on this?
> > Thank you.
> 
> My feedback to you:
> 
> I asked you to share any numbers about each approach. Asm listings,
> performance tests, bloat-o-meter. But you did nothing or very little
> in that department. You move this series, and it means you should be
> very well aware of alternative solutions, their pros and cons.
>
I'm willing to run micro-benchmarks, but even with performance data, I
lack the domain knowledge to determine which users care about parity
efficiency. No one in Cc has clarified this either.

> Instead, you started a poll to pick the best solution. This is not
> what I expected, and this is not how the best solution can be found.
> 
> To H. Peter and everyone:
> 
> Thank you for sharing your opinion on this fixed parity(). Your
> arguments may or may not be important, depending on what existing
> users actually need. Unfortunately, Kuan-Wei didn't collect
> performance numbers and opinions from those proposed users.
> 
> I already told that, and I will say again: with the lack of any
> evidence that performance and/or code generation is important here,
> the best solution is one that minimizes maintainers' (my!) burden.
> 
> In other words, bool parity(unsigned long long). I'm OK to maintain
> a macro, as well. I understand that more complicated solutions may be
> more effective. I will take them only if they will be well advocated.
> 
Before Peter suggested an arch-specific implementation, I planned to go
with approach #1, as it minimizes maintenance overhead in the absence
of clear user requirements.

Peter,
Have you identified any users who care about parity efficiency?
If not, do we still need to introduce an arch-specific implementation?

Regards,
Kuan-Wei

> I hope this will help us to stop moving this discussion back and forth
> and save our time, guys.
> 
> Thanks,
> Yury
