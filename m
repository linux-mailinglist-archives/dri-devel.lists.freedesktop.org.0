Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E13A7571E
	for <lists+dri-devel@lfdr.de>; Sat, 29 Mar 2025 17:00:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D1D410E248;
	Sat, 29 Mar 2025 16:00:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NBGHXehn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8CFF10E248
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Mar 2025 16:00:37 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-225df540edcso81646445ad.0
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Mar 2025 09:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743264037; x=1743868837; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=e09bq1QFCx15sz91iQYUA5891umVrz4UnXamEXGTNkM=;
 b=NBGHXehnASsV7PHGQpix1y8wuWI4JFeIJUkF+L8NsYhvlaNSaB0ydC+rkGYjbEX3Go
 uLwvezMI0XTjpiNNJsF0zBER7IsA0DqBgE8Y9y2Sa72eS9s3vQ6ISaeOFoQUet7M6vBf
 r3J18353wKGFTNfZnDSMEJNIRlTVqY/xa+WljVNfOLORBz1y9Qod6NUFUsU9V+IF8vIN
 7PKbE7FWy7d+pOlCsSAFtotRsaFGk7y4EID8R0zTzpdVwftYXlVnxYWUq30zKUHOhEVM
 b6dUDPfWQl8JOb+pxGTRu3P3t0Qpml1vB7MYRWPWn1ClPI6RyVuKwiD70rZFFs14MCH9
 IlUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743264037; x=1743868837;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e09bq1QFCx15sz91iQYUA5891umVrz4UnXamEXGTNkM=;
 b=X1dmyOaTTZKASy33dRkDGjjFl2RMRjlDx73zifhCirn7oCLAa7W3pmfjcia90E2E8P
 PqqujwqAK3PAnwthvh4+8NfwvZKX88AHqwe/ttmXSpCvLgiZp284eZouPUrfAH2OC6Ug
 mM6RUtSJC2qW61uC6l4W1x66ziN9+/iMfEmMknYkd+aa7eJYyzcfvNGSBo+ZkLfCIyoA
 ylFFz/I9yqq9WMxMkWtpoRBPBH0GLtb2aRliqJoE92EG9ZtM+sy3DocSKwsczuMehwGi
 JKnjKUrkU+WR0SdZXTmbBH1bKPxvnK/slLQ+XyHOWjnlQ6YbuMfHHCTpYv9iU59Uxtxk
 6pAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwG17JOLfbG2zwECLb1KN06q83t1nVz2XGPiky42tlKdl8VAWE6lE9MO5oSs1LvDaRshKSky7nEwg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyYI88p5MbZ5gkZUTGJZXLaFfC38Mnw8wAKnjEMDCW/mjg505Sy
 zbvZJ97ykJ+svyprFNyBjwOC+5WipsU68MlUV840JlP9Mu2Z9p4u
X-Gm-Gg: ASbGnctSKgZjahV/5wc2PsED3CxeOSsU8fCbcDPdMlnmWExecK7Hzt+22AAx0yq9cys
 E8gWZMMYt51CWy+BTwxV4dwCoQIYS8KSbobu3GX5wGWeUiVDeFAMmwaJYBfEkBkGyoncZQZzE04
 SlTVdzjjqhYrBjyRIwzlxctNU1yPSxwdGkXuiqDlJq7IHLAxRBqCeTwF7yBrKjzbYBafC18x0WF
 ULEvvrKBPvR5G1XI+ywB09EiHa+xx1mYaaC8NaqjPXzwfxprGbwGCglXQqyyL+Skt7vaXkbY+uE
 DpYN1ZshOZQ36Ka0OUV1LoCzwOMjI454PLHLfhBYUOguKCrxmS2+Y4BfOHxPx5uA/sghE19r
X-Google-Smtp-Source: AGHT+IHc+mRbF7fELQ1shHtkA3D+WC9LomOMe2nEVwqrLw8CNFkqEgEqVTTBwRhp2NkmxJQxCOcZqA==
X-Received: by 2002:a17:902:f545:b0:215:ba2b:cd55 with SMTP id
 d9443c01a7336-2292ec073d0mr53750285ad.2.1743264036831; 
 Sat, 29 Mar 2025 09:00:36 -0700 (PDT)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2291eee0068sm37958825ad.94.2025.03.29.09.00.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Mar 2025 09:00:36 -0700 (PDT)
Date: Sun, 30 Mar 2025 00:00:26 +0800
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
Message-ID: <Z+gZGvgOwYBU/99o@visitorckw-System-Product-Name>
References: <EB85C3C1-8A0D-4CB9-B501-BFEABDF3E977@zytor.com>
 <Z824SgB9Dt5zdWYc@visitorckw-System-Product-Name>
 <Z9CyuowYsZyez36c@thinkpad>
 <80771542-476C-493E-858A-D2AF6A355CC1@zytor.com>
 <Z9GtcNJie8TRKywZ@thinkpad>
 <Z9G2Tyypb3iLoBjn@visitorckw-System-Product-Name>
 <Z9KMKwnZXA2mkD2s@visitorckw-System-Product-Name>
 <Z+AlyB461xwMxMtG@visitorckw-System-Product-Name>
 <05F7AC70-E8E7-4D14-A4EB-880D92A96534@zytor.com>
 <Z-F_96AECHpsCXsL@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z-F_96AECHpsCXsL@thinkpad>
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

On Mon, Mar 24, 2025 at 11:53:35AM -0400, Yury Norov wrote:
> On Sun, Mar 23, 2025 at 03:40:20PM -0700, H. Peter Anvin wrote:
> > On March 23, 2025 8:16:24 AM PDT, Kuan-Wei Chiu <visitorckw@gmail.com> wrote:
> > >On Thu, Mar 13, 2025 at 03:41:49PM +0800, Kuan-Wei Chiu wrote:
> > >> On Thu, Mar 13, 2025 at 12:29:13AM +0800, Kuan-Wei Chiu wrote:
> > >> > On Wed, Mar 12, 2025 at 11:51:12AM -0400, Yury Norov wrote:
> > >> > > On Tue, Mar 11, 2025 at 03:24:14PM -0700, H. Peter Anvin wrote:
> > >> > > > On March 11, 2025 3:01:30 PM PDT, Yury Norov <yury.norov@gmail.com> wrote:
> > >> > > > >On Sun, Mar 09, 2025 at 11:48:26PM +0800, Kuan-Wei Chiu wrote:
> > >> > > > >> On Fri, Mar 07, 2025 at 12:07:02PM -0800, H. Peter Anvin wrote:
> > >> > > > >> > On March 7, 2025 11:53:10 AM PST, David Laight <david.laight.linux@gmail.com> wrote:
> > >> > > > >> > >On Fri, 07 Mar 2025 11:30:35 -0800
> > >> > > > >> > >"H. Peter Anvin" <hpa@zytor.com> wrote:
> > >> > > > >> > >
> > >> > > > >> > >> On March 7, 2025 10:49:56 AM PST, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
> > >> > > > >> > >> >> (int)true most definitely is guaranteed to be 1.  
> > >> > > > >> > >> >
> > >> > > > >> > >> >That's not technically correct any more.
> > >> > > > >> > >> >
> > >> > > > >> > >> >GCC has introduced hardened bools that intentionally have bit patterns
> > >> > > > >> > >> >other than 0 and 1.
> > >> > > > >> > >> >
> > >> > > > >> > >> >https://gcc.gnu.org/gcc-14/changes.html
> > >> > > > >> > >> >
> > >> > > > >> > >> >~Andrew  
> > >> > > > >> > >> 
> > >> > > > >> > >> Bit patterns in memory maybe (not that I can see the Linux kernel using them) but
> > >> > > > >> > >> for compiler-generated conversations that's still a given, or the manager isn't C
> > >> > > > >> > >> or anything even remotely like it.
> > >> > > > >> > >> 
> > >> > > > >> > >
> > >> > > > >> > >The whole idea of 'bool' is pretty much broken by design.
> > >> > > > >> > >The underlying problem is that values other than 'true' and 'false' can
> > >> > > > >> > >always get into 'bool' variables.
> > >> > > > >> > >
> > >> > > > >> > >Once that has happened it is all fubar.
> > >> > > > >> > >
> > >> > > > >> > >Trying to sanitise a value with (say):
> > >> > > > >> > >int f(bool v)
> > >> > > > >> > >{
> > >> > > > >> > >	return (int)v & 1;
> > >> > > > >> > >}    
> > >> > > > >> > >just doesn't work (see https://www.godbolt.org/z/MEndP3q9j)
> > >> > > > >> > >
> > >> > > > >> > >I really don't see how using (say) 0xaa and 0x55 helps.
> > >> > > > >> > >What happens if the value is wrong? a trap or exception?, good luck recovering
> > >> > > > >> > >from that.
> > >> > > > >> > >
> > >> > > > >> > >	David
> > >> > > > >> > 
> > >> > > > >> > Did you just discover GIGO?
> > >> > > > >> 
> > >> > > > >> Thanks for all the suggestions.
> > >> > > > >> 
> > >> > > > >> I don't have a strong opinion on the naming or return type. I'm still a
> > >> > > > >> bit confused about whether I can assume that casting bool to int always
> > >> > > > >> results in 0 or 1.
> > >> > > > >> 
> > >> > > > >> If that's the case, since most people prefer bool over int as the
> > >> > > > >> return type and some are against introducing u1, my current plan is to
> > >> > > > >> use the following in the next version:
> > >> > > > >> 
> > >> > > > >> bool parity_odd(u64 val);
> > >> > > > >> 
> > >> > > > >> This keeps the bool return type, renames the function for better
> > >> > > > >> clarity, and avoids extra maintenance burden by having just one
> > >> > > > >> function.
> > >> > > > >> 
> > >> > > > >> If I can't assume that casting bool to int always results in 0 or 1,
> > >> > > > >> would it be acceptable to keep the return type as int?
> > >> > > > >> 
> > >> > > > >> Would this work for everyone?
> > >> > > > >
> > >> > > > >Alright, it's clearly a split opinion. So what I would do myself in
> > >> > > > >such case is to look at existing code and see what people who really
> > >> > > > >need parity invent in their drivers:
> > >> > > > >
> > >> > > > >                                     bool      parity_odd
> > >> > > > >static inline int parity8(u8 val)       -               -
> > >> > > > >static u8 calc_parity(u8 val)           -               -
> > >> > > > >static int odd_parity(u8 c)             -               +
> > >> > > > >static int saa711x_odd_parity           -               +
> > >> > > > >static int max3100_do_parity            -               -
> > >> > > > >static inline int parity(unsigned x)    -               -
> > >> > > > >static int bit_parity(u32 pkt)          -               -
> > >> > > > >static int oa_tc6_get_parity(u32 p)     -               -
> > >> > > > >static u32 parity32(__le32 data)        -               -
> > >> > > > >static u32 parity(u32 sample)           -               -
> > >> > > > >static int get_parity(int number,       -               -
> > >> > > > >                      int size)
> > >> > > > >static bool i2cr_check_parity32(u32 v,  +               -
> > >> > > > >                        bool parity)
> > >> > > > >static bool i2cr_check_parity64(u64 v)  +               -
> > >> > > > >static int sw_parity(__u64 t)           -               -
> > >> > > > >static bool parity(u64 value)           +               -
> > >> > > > >
> > >> > > > >Now you can refer to that table say that int parity(uXX) is what
> > >> > > > >people want to see in their drivers.
> > >> > > > >
> > >> > > > >Whichever interface you choose, please discuss it's pros and cons.
> > >> > > > >What bloat-o-meter says for each option? What's maintenance burden?
> > >> > > > >Perf test? Look at generated code?
> > >> > > > >
> > >> > > > >I personally for a macro returning boolean, something like I
> > >> > > > >proposed at the very beginning.
> > >> > > > >
> > >> > > > >Thanks,
> > >> > > > >Yury
> > >> > > > 
> > >> > > > Also, please at least provide a way for an arch to opt in to using the builtins, which seem to produce as good results or better at least on some architectures like x86 and probably with CPU options that imply fast popcnt is available.
> > >> > > 
> > >> > > Yeah. And because linux/bitops.h already includes asm/bitops.h
> > >> > > the simplest way would be wrapping generic implementation with
> > >> > > the #ifndef parity, similarly to how we handle find_next_bit case.
> > >> > > 
> > >> > > So:
> > >> > > 1. Kuan-Wei, please don't invent something like ARCH_HAS_PARITY;
> > >> > > 2. This may, and probably should, be a separate follow-up series,
> > >> > >    likely created by corresponding arch experts.
> > >> > > 
> > >> > I saw discussions in the previous email thread about both
> > >> > __builtin_parity and x86-specific implementations. However, from the
> > >> > discussion, I learned that before considering any optimization, we
> > >> > should first ask: which driver or subsystem actually cares about parity
> > >> > efficiency? If someone does, I can help with a micro-benchmark to
> > >> > provide performance numbers, but I don't have enough domain knowledge
> > >> > to identify hot paths where parity efficiency matters.
> > >> > 
> > >> IMHO,
> > >> 
> > >> If parity is never used in any hot path and we don't care about parity:
> > >> 
> > >> Then benchmarking its performance seems meaningless. In this case, a
> > >> function with a u64 argument would suffice, and we might not even need
> > >> a macro to optimize for different types—especially since the macro
> > >> requires special hacks to avoid compiler warnings. Also, I don't think
> > >> code size matters here. If it does, we should first consider making
> > >> parity a non-inline function in a .c file rather than an inline
> > >> function/macro in a header.
> > >> 
> > >> If parity is used in a hot path:
> > >> 
> > >> We need different handling for different type sizes. As previously
> > >> discussed, x86 assembly might use different instructions for u8 and
> > >> u16. This may sound stubborn, but I want to ask again: should we
> > >> consider using parity8/16/32/64 interfaces? Like in the i3c driver
> > >> example, if we only have a single parity macro that selects an
> > >> implementation based on type size, users must explicitly cast types.
> > >> If future users also need parity in a hot path, they might not be aware
> > >> of this requirement and end up generating suboptimal code. Since we
> > >> care about efficiency and generated code, why not follow hweight() and
> > >> provide separate implementations for different sizes?
> > >> 
> > >It seems no one will reply to my two emails. So, I have summarized
> > >different interface approaches. If there is a next version, I will send
> > >it after the merge window closes.
> > >
> > >Interface 1: Single Function
> > >Description: bool parity_odd(u64)
> > >Pros: Minimal maintenance cost
> > >Cons: Difficult to integrate with architecture-specific implementations
> > >      due to the inability to optimize for different argument sizes
> 
> How difficult? It's just as simple as find_next_bit(). I already
> pointed that.
> 

The architecture-specific implementation may use different approaches
for different bit widths. As previously discussed by Peter and David,
the x86 implementation of parity uses different instructions for u8 and
u16 arguments. Having an interface that only takes u64 makes it
difficult to accommodate these differences.

Are you referring to the #ifndef parity approach when mentioning
find_next_bit()? If so, I'm not sure how that would solve the issue
while keeping different implementations for different bit widths under
an interface that only takes u64.

> > >Opinions: Jiri supports this approach
> > >
> > >Interface 2: Single Macro
> > >Description: parity_odd() macro
> > >Pros: Allows type-specific implementation
> > >Cons: Requires hacks to avoid warnings; users may need explicit
> 
> So if the hack is documented, it's OK. I don't know the other way to
> motivate compilers to get better other than pointing them to their
> bugs.
> 

Perhaps this comes down to taste. IMHO, a solution relying on #if gcc
#else with extensive comments to explain workarounds has a higher
maintenance cost and is uglier compared to simply having three
additional one-liner functions.

That said, you are the maintainer, and you likely have a better
perspective on the maintenance burden than I do.

> > >      casting; potential sub-optimal code on 32-bit x86
> 
> Any asm listings? Any real impact?
> 
I was just referring to the comment previously mentioned by David.
Below is a simple assembly comparison between #2 and #3:

generic_macro:
        movq    xmm0, QWORD PTR [esp+4]
        mov     edx, 27030
        movdqa  xmm2, xmm0
        psrlq   xmm2, 32
        movdqa  xmm1, xmm2
        pxor    xmm1, xmm0
        movdqa  xmm3, xmm1
        psrlq   xmm3, 16
        movdqa  xmm0, xmm3
        pxor    xmm0, xmm1
        movdqa  xmm4, xmm0
        psrlq   xmm4, 8
        movdqa  xmm1, xmm4
        pxor    xmm1, xmm0
        movdqa  xmm5, xmm1
        psrlq   xmm5, 4
        movdqa  xmm0, xmm5
        pxor    xmm0, xmm1
        movd    eax, xmm0
        and     eax, 15
        bt      edx, eax
        setc    al
        ret
fixed_type_parity_function:
        mov     edx, DWORD PTR [esp+8]
        xor     edx, DWORD PTR [esp+4]
        mov     eax, edx
        shr     eax, 16
        xor     eax, edx
        mov     edx, eax
        xor     dl, ah
        mov     eax, edx
        shr     al, 4
        xor     eax, edx
        mov     edx, 27030
        and     eax, 15
        bt      edx, eax
        setc    al
        ret

https://godbolt.org/z/cPjbEYKPP

As I mentioned earlier, I can't point to any specific driver or
subsystem where parity efficiency is critical. However, if performance
is not a concern, then perhaps #1 is the simplest option, and we might
not even need architecture-specific implementations.

> > >Opinions: Yury supports this approach
> > >
> > >Interface 3: Multiple Functions
> > >Description: bool parity_odd8/16/32/64()
> > >Pros: No need for explicit casting; easy to integrate
> 
> Explicit castings are sometimes better than implicit ones.
> 
In #2, users might easily overlook the need for explicit casting. As
Peter pointed out, integer promotion could unintentionally lead to the
32-bit version being used when it wasn't intended.

By making the function names and parameter types explicitly indicate
8/16/32/64 bits, such issues become less likely to occur.

> > >      architecture-specific optimizations; except for parity8(), all
> > >      functions are one-liners with no significant code duplication
> > >Cons: More functions may increase maintenance burden
> 
> s/may/will/
> 
> > >Opinions: Only I support this approach
> > >
> > >Regards,
> > >Kuan-Wei
> > 
> > You can add me to the final option. I think it makes most sense
> 
> This is not a democracy, and we are not voting here. We are engineers.
> We share our expert opinions and choose the best one. I'll be happy to
> go with any solution, if we all make sure it's the best.
> 
I wasn't trying to initiate a vote. I was simply summarizing the
possible approaches discussed so far and the feedback I've received.

> I'm for #2 because it 
>  - generates better code than #1;

Which driver or subsystem would particularly care about parity
efficiency?

>  - easier to use than #3; and

I agree that #2 is easier to use than #3 if users don't need to perform
explicit casting. However, if they do need to cast explicitly to get
correct code generation, then I think #3 is clearer and simpler for
users.

>  - has less maintenance burden than #3.
> 
> Why exactly #3 makes the most sense to you? Most variables are ints
> and longs. How are you going to handle those with fixed-types parity()s?
> 
If explicit casting is required for correct code generation, then both
#2 and #3 face the same issue.

To address this, my first thought was to add a parity_long() function,
similar to hweight_long(). However, I can imagine that you'd find this
even harder to accept due to increased maintenance burden.

This also brings me to another question that isn't directly related to
parity but has me curious. Since you maintain hweight as well, what
makes hweight and parity different enough that hweight follows the
hweight8/16/32/64 and hweight_long() interface, while parity is leaning
toward a macro-based approach? Their functionality seems quite similar
to me.

Regards,
Kuan-Wei

