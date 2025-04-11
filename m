Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF33A86354
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 18:34:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0D7210EC24;
	Fri, 11 Apr 2025 16:34:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="J7nqeepi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D77ED10EC22
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 16:34:36 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-736ee709c11so1853613b3a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 09:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744389275; x=1744994075; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=i2OP7V+QE6E9gg3GbdLcYE8UHgSFfj9Jnjg73a7+53s=;
 b=J7nqeepiSDwettDEvucl1VdJUQhyhVm7TY5UIYoM/3/eNVPbkwgDqTToWN42/eNfTR
 TgnDHOByejkSo1QuDmBD0ebqcizrjeRG1lZNM6ITQGNinoxyJoEQv8qUyowpQVaKMkK8
 tancHfRYV6EQioC/6W5VJJqWC5T8RFsFpUKf1JVy5GJz27Axjnf95DaLN2AL/T6I7+qf
 Hbnaq0cjnk3IBIvjpiL3DppsEjCgdVK/OpiEBhcTbAX0EMin1qYxk06kMUmYA8zcuJAA
 9+DHCOMALNRdOrPs3QHHt98Hj0FPAe3rpNifzz5PGjC4pLuSmPHx7ZzWXz/++KVj92Hc
 nG4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744389275; x=1744994075;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i2OP7V+QE6E9gg3GbdLcYE8UHgSFfj9Jnjg73a7+53s=;
 b=XmyLjQt4Y6b6Foc/fI14mdppJ3tdBxSrAWNqwe8yP7sR5EVhw0LlupCUyOGH+NAV87
 x9JITLedOLPgPyX06pnDR6E5koRLx2FX2PoX4lsdaC9a1gucbUGpB6pNUYSKsnKkHBoU
 RJ5lKI1x3r0AnarDZNs4OlFeexC6fXdhShA5SWAgC83MkrY0fau3U7P/S1H4jcj0egZO
 E/Cq9kg64dk2fPjO6OiBz4M1iymPmf9QQ8gs0bzo2l3yLbk9HrCbXNFTuTCW3klCmSO8
 6z0x9m1QvLaPgb1AGGqoktPK4bdM59eHEvoRStNbp3akIvPEulxlaTuaJqAGSTIpqWCt
 9C2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfbAr3/xGR9tO9+OO46+tJSpF/mM91bnbKa5v2Z/cGoRKBtHOTEXtMWp1u3SOIhoF0+xNQvgotGn4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywh0L/xgu0AN4qs/WFKEGyri6JmVRJEf6naaYaAYrd7TbOMscIn
 NwkVJKUXncO2pjmRFsf75Ns+gYA++j+e9T98VMngta2IMOUyN74Q
X-Gm-Gg: ASbGncv+K0jS3Ds3XDZ8UvzGOXEYiqnqHV5+MJWBA5wfbehHmUvi/UXGHapFE3IBZxP
 TsAgqYF2LWKUpoKJ+evMysQo4iOc/5HXeSFV7if6xKCZ9n4XOSvZxWNlCPMAghz0KXYB0IeBhU+
 ybAXXSwDp6Rf+qhAv/q5kGu53vju2O5eGDmOzEwewYXyuc3fk0QIwbwpqSEceUx+1/dqsW+wnXH
 IVfLoeaDG0aWscn8LDIPrlh52U4L/cG4OG6vly4iDtv3sFMY0GQ3RZHDh7BFcJpc5X9E6bvLCRc
 ks5NE4S5LmO5aHquji8+CAxLERBJhzLk5LLmOhXJGZTnoK6rsZIDBGdy6Bkes2O7lWANg1NkCCB
 q478=
X-Google-Smtp-Source: AGHT+IEYqWSvO9nmRhuvu9Nod5I62ZHK0q1nd8Adc2Nrxqu798p8njg5jLN2TKIb2S4uFWzFr2oiJA==
X-Received: by 2002:a05:6a20:d503:b0:1f5:902e:1e97 with SMTP id
 adf61e73a8af0-2017998c2d3mr6583017637.41.1744389275369; 
 Fri, 11 Apr 2025 09:34:35 -0700 (PDT)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b06161333a8sm258713a12.7.2025.04.11.09.34.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Apr 2025 09:34:34 -0700 (PDT)
Date: Sat, 12 Apr 2025 00:34:24 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Yury Norov <yury.norov@gmail.com>, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
 jk@ozlabs.org, joel@jms.id.au, eajames@linux.ibm.com,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, dmitry.torokhov@gmail.com, mchehab@kernel.org,
 awalls@md.metrocast.net, hverkuil@xs4all.nl,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 louis.peens@corigine.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
 johannes@sipsolutions.net, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, akpm@linux-foundation.org, jdelvare@suse.com,
 linux@roeck-us.net, alexandre.belloni@bootlin.com, pgaj@cadence.com,
 alistair@popple.id.au, linux@rasmusvillemoes.dk,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, kuba@kernel.org,
 linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 oss-drivers@corigine.com, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
 bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw, Frank.Li@nxp.com,
 linux-hwmon@vger.kernel.org, linux-i3c@lists.infradead.org,
 david.laight.linux@gmail.com, andrew.cooper3@citrix.com,
 Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH v4 00/13] Introduce parity_odd() and refactor redundant
 parity code
Message-ID: <Z/lEkDwefWvw4ZA3@visitorckw-System-Product-Name>
References: <20250409154356.423512-1-visitorckw@gmail.com>
 <Z_amQp3gK5Dm8Qz3@yury>
 <Z/a5Qh/OeLT8JBS4@visitorckw-System-Product-Name>
 <Z_a9YpE46Xf8581l@yury>
 <e97a83a2-dabd-4dc3-b69a-840ca17d70b5@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e97a83a2-dabd-4dc3-b69a-840ca17d70b5@zytor.com>
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

On Wed, Apr 09, 2025 at 07:09:28PM -0700, H. Peter Anvin wrote:
> On 4/9/25 11:33, Yury Norov wrote:
> > > > 
> > > I don't have a strong preference for the name, but if I had to guess
> > > the return value from the function prototype, I would intuitively
> > > expect an int to return "0 for even and 1 for odd," and a bool to
> > > return "true for even, false for odd." I recall Jiri and Jacob shared
> > > similar thoughts, which is why I felt adding _odd could provide better
> > > clarity.
> > 
> > I think they said they are convinced that parity should return 1 for
> > odd because of folding and __builtin_parity() arguments.
> > 
> 
> And for bool, 0 == false, and 1 == true. In fact, the *definitions* for
> false and true in C (but not C++) is:
> 
> <stdbool.h>:
> typedef _Bool bool;
> #define false	0
> #define true	1
> 
> If someone wants to make more clear, it would be better to put "typedef bool
> bit_t" in a common header, but that personally seems ridiculous to me.
>   >>>> type from u8 to u64 for broader applicability, and updates its return
> > > > > type from int to bool to make its usage and return semantics more
> > > > > intuitive-returning true for odd parity and false for even parity. It
> > > > > also adds __attribute_const__ to enable compiler optimizations.
> > > > 
> > > > That's correct and nice, but can you support it with a bloat-o-meter's
> > > > before/after and/or asm snippets? I also think it worth to be a separate
> > > > patch, preferably the last patch in the series.
> > > > 
> > > I quickly tested it with the x86 defconfig, and it appears that the
> > > generated code doesn't change. I forgot who requested the addition
> > > during the review process, but I initially thought it would either
> > > improve the generated code or leave it unchanged without significantly
> > > increasing the source code size.
> > 
> > That's what I actually expected, but was shy to guess openly. :). It's
> > hard to imagine how compiler may improve code generation in this case...
> > 
> > This attribute is used when there's an asm block, or some non-trivial
> > function call. In this case, the function is self-consistent and makes
> > no calls. And you see, const annotation raises more questions than
> > solves problems. Let's drop it.
> 
> Ah yes; one of the quirks about gcc asm is that an asm is implicitly assumed
> "const" (with no memory operands) or "pure" (with memory operands) unless
> declared volatile or given an explicit "memory" clobber.
> 
> So yes, the compiler can most definitely derive the constness from the form
> of the function even in the variable case.
> 
> I would still like to see __builtin_parity() being used as an architecture
> opt-in; it can, of course, also be unconditionally used in the constant
> case.
> 
> So in the end one of these two become my preferred implementation, and I
> really don't think it is very complicated:
> 
> #ifndef use_builtin_parity
> #define use_builtin_parity(x) __builtin_constant_p(x)
> #endif
> 
> static inline bool parity8(u8 val)
> {
> 	if (use_builtin_parity(val))
> 		return __builtin_parity(val);
> 	val ^= val >> 4;
> 	return (0x6996 >> (val & 0xf)) & 1;
> }
> 
> static inline bool parity16(u16 val)
> {
> 	if (use_builtin_parity(val))
> 		return __builtin_parity(val);
> 	return parity8(val ^ (val >> 8));
> }
> 
> static inline bool parity32(u32 val)
> {
> 	if (use_builtin_parity(val))
> 		return __builtin_parity(val);
> 	return parity16(val ^ (val >> 16));
> }
> 
> static inline bool parity64(u64 val)
> {
> 	if (use_builtin_parity(val))
> 		return __builtin_parityll(val);
> 	return parity32(val ^ (val >> 32));
> }
> 
> This means that an architecture -- in particular, x86 -- can still ask to
> use __builtin_parity*() directly. It means that architectures on which
> __builtin_parity*() produces bad code should either complain to the
> gcc/clang team and have it fixed, or we can add additional mechanism for
> them to override the implementation at that time.
> 
> The alternative is to stop worrying about overengineering, and just do it
> once and for all:
> 
> #ifndef parity8
> static inline bool parity8(u8 val)
> {
> 	val ^= val >> 4;
> 	return (0x6996 >> (val & 0xf)) & 1;
> }
> #endif
> 
> #ifndef parity16
> static inline bool parity16(u16 val)
> {
> 	return parity8(val ^ (val >> 8));
> }
> #endif
> 
> #ifndef parity32
> static inline bool parity32(u32 val)
> {
> 	return parity16(val ^ (val >> 16));
> }
> #endif
> 
> #ifndef parity64
> static inline bool parity64(u64 val)
> {
> 	return parity32(val ^ (val >> 32));
> }
> #endif
> 
> In either case, instead of packing the cascade into one function, make good
> use of it.
> 
> In the latter case, __builtin_constant_p() isn't necessary as it puts the
> onus on the architecture to separate out const and non-const cases, if it
> matters -- which it doesn't if the architecture simply wants to use
> __builtin_parity:
> 
> #define parity8(x)  ((bool) __builtin_parity((u8)(x)))
> #define parity16(x) ((bool) __builtin_parity((u16)(x)))
> #define parity32(x) ((bool) __builtin_parity((u32)(x)))
> #define parity64(x) ((bool) __builtin_parityll((u64)(x)))
> 
> As stated before, I don't really see that the parity function itself would
> be very suitable for a generic helper, but if it were to, then using the
> "standard" macro construct for it would seem to be the better option.
> 
> (And I would be very much in favor of not open-coding the helper everywhere
> but to macroize it; effectively creating a C++ template equivalent. It is
> out of scope for this project, though.)
> 
IIUC, you prefer using the parity8/16/32/64() interface with
__builtin_parity(), regardless of whether there are users on the hot
path?

If the maintainer has no concerns about maintenance burden, I also lean
toward this interface. While I don't think the implementation is
particularly complex, I'm not the maintainer, so I'd rather not argue
about the maintenance aspect. Also, to be clear, I don't think I'm the
right person to provide evidence that performance or code generation
matters to any user.

OTOH, If we do end up going with one of the two approaches, since
bitops.h is included (directly or indirectly) by many files while
parity is only used in fewer than 20, perhaps we should move the
parity-related code to a separate parity.h. It doesn't necessarily have
to be maintained by Yury - it could be someone else, or me.

Regards,
Kuan-Wei
