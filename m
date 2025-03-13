Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 748B8A5ED28
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 08:41:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52B7210E110;
	Thu, 13 Mar 2025 07:41:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nlDonYH9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D62010E110
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 07:41:50 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-2241053582dso16163065ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 00:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741851710; x=1742456510; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=q+GuHgctQUjPu8SmpY2/kJHnsOJEHrIhv+etu/GaNm0=;
 b=nlDonYH9LhrSkvHQ6NwEjVkmDJxaWfAAlKC7LyESYbsY/Ynr8u1QYTfwsc/IaCwlYC
 4lds2j1dH3p8iBdHpDahtNDDDh3z0D0x/qCRLdybOiQxLQt6xYl2R9uFz7MhUN1lj7ex
 x4tAwwKv5A840WWq0G+P3W+V+r4ylZAfW3R08W1U+esdWyxUokVJjxMbCzBTkI3Ww212
 jkBFxbYADu223CnjGJXPreJNsFnpoHerkt7Lb0vU56Edu8GQgeAZIaxrY9NJHObIOmOC
 pK1jKugZeyUh/nFB80ssNZS7HwoMhrM80YHSLkgjN7U5b4s9u1GuORY5ujfaJGapymFC
 PW0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741851710; x=1742456510;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=q+GuHgctQUjPu8SmpY2/kJHnsOJEHrIhv+etu/GaNm0=;
 b=m7Ri/lgYj14fhKXP6qdKZZXO+Y3ZlJpjJ8IEAIW1GqzlXC+289fdBeXOWIevgB8XDz
 01y3AEWebu50vX9f+ClkPkXSPVaq0xswIc9x4laB6UQnQdy8/JcZTnonTEJYNchKWYg7
 1UlqydwKgYozJGjFtNRJ5SBq8FAEH8Foh6G3dTjo2qblVGekmhR4Rp7Up7HFeBW7mzYg
 id3bgSJhQ+uxGxK6R3Eb3CpWT+2uNBqA4HJX4SFChrYUvJZkmB0tLDmd15N2oLwg4ZzS
 aphRLV5KMtis+kCjz9xF8NyBHVvAyHzPWIMJfYcIXjKBETyoAKrkj4VntB6cANgt//kl
 2h4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGjTUMzwkn5o/fHG/nyIkfMurMn/17TrHSBXMdtfIEdshfjIW8cualHheWgqDMA1zGvKSP0IMlqc4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxNuyNVyyRSpkwJa/lysNtI/JXyLQprhj2e/LT0eVGNL/w9olT6
 bSEKcO288lmsjyFt59icBH9NNs0EMov4Ct16/R/C5MiNO2jGwmdu
X-Gm-Gg: ASbGncuj/n7HMMvyXdjYSPcUm5hdRNFAGq7UYpaAnaU8/75wa0o0/b0EGvtB8C9Ptal
 gX1vo2AtqN+/S2Fs8XWed7xGTorD7Z88keVihCQGpn+KtGb8OaM5pnSOZygxwAWu3mwX5Fn5wAz
 U70srd8jaG4oK/cE6nAvxpuwfxarh7A8RoWxkL6DNcgFjW4GEtK3HHTgY1H99Ea6RQnuw0L8EpE
 QJqKD3gwvIec0BtT9bN7g53NIRxzWYAutXUiRTmjAxMAj/45n70fe2xIpE5jP4krV2ZV/D7PaF7
 8Px4BWzto8GoLqx4O9Xw1w8uLNAOVlXEz8xtQywLaB0E84Oew9ANTP2SmBfmDW8mVYn7aSw+
X-Google-Smtp-Source: AGHT+IEOnE1UaBfwg9ZU2VkCWkw1Gp3ScOp6qbkmR7UKjY7r7OwrFGhsef4Fbyqmd9ry/T9u8Qiz3A==
X-Received: by 2002:a17:902:e5d2:b0:21f:859a:9eab with SMTP id
 d9443c01a7336-22428ab8647mr372797915ad.37.1741851709556; 
 Thu, 13 Mar 2025 00:41:49 -0700 (PDT)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-225c6888d9bsm7284085ad.49.2025.03.13.00.41.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 00:41:48 -0700 (PDT)
Date: Thu, 13 Mar 2025 15:41:31 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Yury Norov <yury.norov@gmail.com>
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
Message-ID: <Z9KMKwnZXA2mkD2s@visitorckw-System-Product-Name>
References: <4732F6F6-1D41-4E3F-BE24-E54489BC699C@zytor.com>
 <efc2ee9d-5382-457f-b471-f3c44b81a190@citrix.com>
 <5A790652-1B22-4D13-AAC5-5D9931E90903@zytor.com>
 <20250307195310.58abff8c@pumpkin>
 <EB85C3C1-8A0D-4CB9-B501-BFEABDF3E977@zytor.com>
 <Z824SgB9Dt5zdWYc@visitorckw-System-Product-Name>
 <Z9CyuowYsZyez36c@thinkpad>
 <80771542-476C-493E-858A-D2AF6A355CC1@zytor.com>
 <Z9GtcNJie8TRKywZ@thinkpad>
 <Z9G2Tyypb3iLoBjn@visitorckw-System-Product-Name>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z9G2Tyypb3iLoBjn@visitorckw-System-Product-Name>
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

On Thu, Mar 13, 2025 at 12:29:13AM +0800, Kuan-Wei Chiu wrote:
> On Wed, Mar 12, 2025 at 11:51:12AM -0400, Yury Norov wrote:
> > On Tue, Mar 11, 2025 at 03:24:14PM -0700, H. Peter Anvin wrote:
> > > On March 11, 2025 3:01:30 PM PDT, Yury Norov <yury.norov@gmail.com> wrote:
> > > >On Sun, Mar 09, 2025 at 11:48:26PM +0800, Kuan-Wei Chiu wrote:
> > > >> On Fri, Mar 07, 2025 at 12:07:02PM -0800, H. Peter Anvin wrote:
> > > >> > On March 7, 2025 11:53:10 AM PST, David Laight <david.laight.linux@gmail.com> wrote:
> > > >> > >On Fri, 07 Mar 2025 11:30:35 -0800
> > > >> > >"H. Peter Anvin" <hpa@zytor.com> wrote:
> > > >> > >
> > > >> > >> On March 7, 2025 10:49:56 AM PST, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
> > > >> > >> >> (int)true most definitely is guaranteed to be 1.  
> > > >> > >> >
> > > >> > >> >That's not technically correct any more.
> > > >> > >> >
> > > >> > >> >GCC has introduced hardened bools that intentionally have bit patterns
> > > >> > >> >other than 0 and 1.
> > > >> > >> >
> > > >> > >> >https://gcc.gnu.org/gcc-14/changes.html
> > > >> > >> >
> > > >> > >> >~Andrew  
> > > >> > >> 
> > > >> > >> Bit patterns in memory maybe (not that I can see the Linux kernel using them) but
> > > >> > >> for compiler-generated conversations that's still a given, or the manager isn't C
> > > >> > >> or anything even remotely like it.
> > > >> > >> 
> > > >> > >
> > > >> > >The whole idea of 'bool' is pretty much broken by design.
> > > >> > >The underlying problem is that values other than 'true' and 'false' can
> > > >> > >always get into 'bool' variables.
> > > >> > >
> > > >> > >Once that has happened it is all fubar.
> > > >> > >
> > > >> > >Trying to sanitise a value with (say):
> > > >> > >int f(bool v)
> > > >> > >{
> > > >> > >	return (int)v & 1;
> > > >> > >}    
> > > >> > >just doesn't work (see https://www.godbolt.org/z/MEndP3q9j)
> > > >> > >
> > > >> > >I really don't see how using (say) 0xaa and 0x55 helps.
> > > >> > >What happens if the value is wrong? a trap or exception?, good luck recovering
> > > >> > >from that.
> > > >> > >
> > > >> > >	David
> > > >> > 
> > > >> > Did you just discover GIGO?
> > > >> 
> > > >> Thanks for all the suggestions.
> > > >> 
> > > >> I don't have a strong opinion on the naming or return type. I'm still a
> > > >> bit confused about whether I can assume that casting bool to int always
> > > >> results in 0 or 1.
> > > >> 
> > > >> If that's the case, since most people prefer bool over int as the
> > > >> return type and some are against introducing u1, my current plan is to
> > > >> use the following in the next version:
> > > >> 
> > > >> bool parity_odd(u64 val);
> > > >> 
> > > >> This keeps the bool return type, renames the function for better
> > > >> clarity, and avoids extra maintenance burden by having just one
> > > >> function.
> > > >> 
> > > >> If I can't assume that casting bool to int always results in 0 or 1,
> > > >> would it be acceptable to keep the return type as int?
> > > >> 
> > > >> Would this work for everyone?
> > > >
> > > >Alright, it's clearly a split opinion. So what I would do myself in
> > > >such case is to look at existing code and see what people who really
> > > >need parity invent in their drivers:
> > > >
> > > >                                     bool      parity_odd
> > > >static inline int parity8(u8 val)       -               -
> > > >static u8 calc_parity(u8 val)           -               -
> > > >static int odd_parity(u8 c)             -               +
> > > >static int saa711x_odd_parity           -               +
> > > >static int max3100_do_parity            -               -
> > > >static inline int parity(unsigned x)    -               -
> > > >static int bit_parity(u32 pkt)          -               -
> > > >static int oa_tc6_get_parity(u32 p)     -               -
> > > >static u32 parity32(__le32 data)        -               -
> > > >static u32 parity(u32 sample)           -               -
> > > >static int get_parity(int number,       -               -
> > > >                      int size)
> > > >static bool i2cr_check_parity32(u32 v,  +               -
> > > >                        bool parity)
> > > >static bool i2cr_check_parity64(u64 v)  +               -
> > > >static int sw_parity(__u64 t)           -               -
> > > >static bool parity(u64 value)           +               -
> > > >
> > > >Now you can refer to that table say that int parity(uXX) is what
> > > >people want to see in their drivers.
> > > >
> > > >Whichever interface you choose, please discuss it's pros and cons.
> > > >What bloat-o-meter says for each option? What's maintenance burden?
> > > >Perf test? Look at generated code?
> > > >
> > > >I personally for a macro returning boolean, something like I
> > > >proposed at the very beginning.
> > > >
> > > >Thanks,
> > > >Yury
> > > 
> > > Also, please at least provide a way for an arch to opt in to using the builtins, which seem to produce as good results or better at least on some architectures like x86 and probably with CPU options that imply fast popcnt is available.
> > 
> > Yeah. And because linux/bitops.h already includes asm/bitops.h
> > the simplest way would be wrapping generic implementation with
> > the #ifndef parity, similarly to how we handle find_next_bit case.
> > 
> > So:
> > 1. Kuan-Wei, please don't invent something like ARCH_HAS_PARITY;
> > 2. This may, and probably should, be a separate follow-up series,
> >    likely created by corresponding arch experts.
> > 
> I saw discussions in the previous email thread about both
> __builtin_parity and x86-specific implementations. However, from the
> discussion, I learned that before considering any optimization, we
> should first ask: which driver or subsystem actually cares about parity
> efficiency? If someone does, I can help with a micro-benchmark to
> provide performance numbers, but I don't have enough domain knowledge
> to identify hot paths where parity efficiency matters.
> 
IMHO,

If parity is never used in any hot path and we don't care about parity:

Then benchmarking its performance seems meaningless. In this case, a
function with a u64 argument would suffice, and we might not even need
a macro to optimize for different types—especially since the macro
requires special hacks to avoid compiler warnings. Also, I don't think
code size matters here. If it does, we should first consider making
parity a non-inline function in a .c file rather than an inline
function/macro in a header.

If parity is used in a hot path:

We need different handling for different type sizes. As previously
discussed, x86 assembly might use different instructions for u8 and
u16. This may sound stubborn, but I want to ask again: should we
consider using parity8/16/32/64 interfaces? Like in the i3c driver
example, if we only have a single parity macro that selects an
implementation based on type size, users must explicitly cast types.
If future users also need parity in a hot path, they might not be aware
of this requirement and end up generating suboptimal code. Since we
care about efficiency and generated code, why not follow hweight() and
provide separate implementations for different sizes?

Regards,
Kuan-Wei
