Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6EEA7B933
	for <lists+dri-devel@lfdr.de>; Fri,  4 Apr 2025 10:48:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71B0210EB8C;
	Fri,  4 Apr 2025 08:48:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FT5/wYST";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51F4110EB8C
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Apr 2025 08:48:09 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-af51596da56so1611297a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Apr 2025 01:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743756489; x=1744361289; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=GKYFZl2hMBVvq/tGTvaEyWP0BJSuPsnZGbFqpvTq3m8=;
 b=FT5/wYSTRH9AhpSLQ2WhUwg5JFofQL9CrnuotUG++HLvMw4gA/qt9roap6RF6jN6Ve
 k9oPpueJmkow2Tws56I4UaeaGVR/3n2PZ8w0Cl1vZ0XbTQEYRPN/ZT55vjvFgW525twY
 mHV3WwtW4dubEvRBOrtSfJX7K7d1zbQwoJ/DFLiRNDD8nGVFyImERUSKCIseINQdCN3v
 jdFYxd09oze7JeQvzqR6Z0GuwtlrqlHaBuKyaIFZ7DbNmHpjmHHvs254YFmD5cQIOEoL
 uGoKisr1j2ZS2x3oRPmnVSVTKsSUoFqkWTW/leDCQitZ+VaKHnnNcfrTrjTBGby8tpCG
 dwNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743756489; x=1744361289;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GKYFZl2hMBVvq/tGTvaEyWP0BJSuPsnZGbFqpvTq3m8=;
 b=DKJT5f5tD7oqfRdn8ylrUkRVF4q1x0vkAo+Hg2VyvG0TCIBeAull1TSbGeLzXFuSnJ
 nvUhX07NE0/N0wgOFmUBYZeHyGjtyghfFY11oO4G5hc0wJUDw/n8tr/mgbcvrCSGgzGR
 eVKcgJDw11/gCLTFTQJaK77XEryBctCu9nv0FSurbBnSNpmHXaA07QKznTimctA6x5qQ
 glgbHfXWPAIBUhAu/2OcOtPotRcUnssJaSoANddo5H8omQUpbLIbpRg7YWouyHTNYXkU
 ffhJaAlCI8raOSShI5Rz1+zLmtMDYT/TDdRb/9DeuBBYRklfseZ64KDZpQ+FAfRbACd1
 lxzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWd17QKrDoAiYuN53vR5yeP3eeMtF2/M3biyEX2NL9qZirnCrOgzoJTGZWImouEcLVn24oV9x9Bn1M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywf40nX2wTuUctIHKLxXeYjj9v9LM7jgYMGCoWZZjmYq/CY+x9V
 8o30DMNRLMzVYFV1SmHEd8BawMJ6g2B7cNSrnaVjZwKpSPJG8L0r
X-Gm-Gg: ASbGncu3lL8oTFMoPPThkwFI55JiHS1AH7qidHGb1gsJeZ74a79O9XbdA2/yYwKdWEf
 a0jFU6O3+rOZ3zIn3UlWUfHGoaBbW394qLewjqj0lAOqw26OaPF7ksJ2T/68VJSOowV7G+w5prW
 41CFC2Ub7xEYg5HGSBXbBUMANC8KpMFs4rEiSmj3Vz1D0HQEZLEOEoiPFsDyTuuqLUUJRl8l1Ql
 gS1KcTSaFV1PGvLPSiKXSdBFEmJyk+VSTPPcKdgBH74KFssRy7TzaLN2p/vVZ7a9/VYQEzmIJ23
 2Ha0YF+QbHhkEH/s+AjuWTW+Z1S+D+ONXagMB/KirWiLGlgkngdcckWGg/8TKePpF5jbvxQB
X-Google-Smtp-Source: AGHT+IHQy54LZ/NyiSvEoks7UryUue+uQARWbnhEUMyhIJqZeMH+xfpWnZ/jGnglOqtjlSonVKNhIw==
X-Received: by 2002:a05:6a21:999d:b0:1f5:8748:76cc with SMTP id
 adf61e73a8af0-20108188cdemr3659983637.31.1743756488698; 
 Fri, 04 Apr 2025 01:48:08 -0700 (PDT)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af9bc32c999sm2377463a12.19.2025.04.04.01.47.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Apr 2025 01:48:07 -0700 (PDT)
Date: Fri, 4 Apr 2025 16:47:58 +0800
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
Message-ID: <Z++cvrLOz2VAaUkO@visitorckw-System-Product-Name>
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
It seems the concern is that I didn't provide assembly results and
performance numbers. While I believe that listing these numbers alone
cannot prove which users really care about parity efficiency, I have
included the assembly results and my initial observations below. Some
differences, like mov vs movzh, are likely difficult to measure.

Compilation on x86-64 using GCC 14.2 with O2 Optimization:

Link to Godbolt: https://godbolt.org/z/EsqPMz8cq

For u8 Input:
- #2 and #3 generate exactly the same assembly code, while #1 replaces
  one `mov` instruction with `movzh`, which may slightly slow down the
  performance due to zero extension.
- Efficiency: #2 = #3 > #1

For u16 Input:
- As with u8 input, #1 performs an unnecessary zero extension, while #3
  replaces one of the `shr` instructions in #2 with a `mov`, making it
  slightly faster.
- Efficiency: #3 > #2 > #1

For u32 Input:
- #1 has an additional `mov` instruction compared to #2, and #2 has an
  extra `shr` instruction compared to #3.
- Efficiency: #3 > #2 > #1

For u64 Input:
- #1 and #2 generate the same code, but #3 has one less `shr`
  instruction compared to the others.
- Efficiency: #3 > #1 = #2

---

Adding -m32 Flag to View Assembly for 32-bit Machine:

Link to Godbolt: https://godbolt.org/z/GrPa86Eq5

For u8 Input:
- #2 and #3 generate identical assembly code, whereas #1 has additional
  `mov`, `shr`, and `push/pop` instructions.
- Efficiency: #2 = #3 > #1

For u16 Input:
- #1 uses a lot of `xmm` register operations, making it slower than #2
  and #3. Additionally, #2 has an extra `shr` instruction compared to #3.
- Efficiency: #3 > #2 > #1

For u32 Input:
- #1 again uses a lot of `xmm` register operations, so it is slower
  than #2 and #3, and #2 has an additional `shr` instruction compared to #3.
- Efficiency: #3 > #2 > #1

For u64 Input:
- Both #1 and #2 use `xmm` register operations, but #1 has a few extra
  `movdqa` instructions. #3 is more concise, using a few `shr`, `xor`,
  and `mov` instructions to complete the operation.
- Efficiency: #3 > #2 > #1

Regards,
Kuan-Wei
