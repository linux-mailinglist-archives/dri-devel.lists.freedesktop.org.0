Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0795A7A555
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 16:39:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A097A10E0DC;
	Thu,  3 Apr 2025 14:39:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="h+rqEFBr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9ABB10E0DC
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Apr 2025 14:39:15 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-739be717eddso797429b3a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Apr 2025 07:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743691155; x=1744295955; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Rvr0XxDHh05/lDdFnQkqZ5aBAiK03CfkHR41QzNZGHs=;
 b=h+rqEFBrc4cCbPNvsB9LoUmD+EL7Hu/OdpY0p3KL+m1HIFPKHsrYvRWH5DZqus1Gt9
 WwmqeSNtwtisTTog6+T/l2Rfq2nbHPXeDIpXDNGu5h5+mLu4vRePa0CRidKrJyknsiuK
 IzGbT7t0CTCXm15z/qzR7pT0t+gMYAAQkd3/r4ksnyAIumQTc8gREx1VHzwyCh/7ATvg
 aURHDvD0b0imB5Z6hlbRWtVaJXVjEOVsyXRUIpO1gI+nmVYyKfVXNymuxxQf7picCLI7
 6axOAJNQqLUQ4Dze9h3fjGklch2P7Iq7vzCBIZ6XoFx0UhThRYgPawp+0ABHxtKcgaZR
 +gSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743691155; x=1744295955;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Rvr0XxDHh05/lDdFnQkqZ5aBAiK03CfkHR41QzNZGHs=;
 b=KSlhLZJWeEQKHjdHPHHDcw/L+DxUjY2dUG5yC4g7Xutzz4o1n30WNzg++NDdUNM7H8
 abUVvHj94tExwvy9mR4aNKWrouzIMlL4ySPYGZIkz3SGQifPTp+qDXygx7MQP58cTSV8
 lh/9MOocGr9ebASj+SDjm22h35ZQApaSGPhsJXMflAmIZIHBCUNjqrgS1nkgTbwK71dm
 dXBBEaga2LmghzAoAaeMAEn5W5BkDszHxO4lMXPOKbp6R4Chj5/mBFwurYhDpj5g+R61
 pGMHcD0G1u81OoCTNvbtxB8WAGy1lM4JbVDM0h2VGdBejjrtPSVqXt5bBY2sm2GOqbB/
 tkmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXc4vHNOX07/TqZSwRY7QSjqm4qX95qOydhzI9uJiClWISq9apn6hhLYsQZXh5Uj9imXjj2SSVWAfI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzD7NMyL4ajn2JH8CN0WpVw5DQmOxjwz5TVyknstCIajcycI61G
 DfEIKcuOCuE2IVhwke2hFed/xJKsHtu8f8JgemWs12PLaxrzXfu/
X-Gm-Gg: ASbGnct/jE4o8b/UBUw/7PI1ylVQpIPcnlG5EIQU+V8TZTcUWGwhJ1WgY/qOVxXkUz1
 aK1Xj0J7dbfrhh7SQITDEPbAO3kg2yYMZ5uFhmi6KQjcGeiyG2k9EsIDaWs9AgHuGctxxy8xWQJ
 iDU1U+GzxGwSS+NZAkaMOsxvj5SqivdWyQvRgkz/hYsG6CSlBvjH2nsCfT7NMgf0V3aws2SXH8s
 KuxsiyF0m58E2+FUGWB9p8EycHKImAyRz1OSY3VFJkV4BcJMhGWSmkCwBUi1Ppq5d2ETNyqnNr0
 n5dSt9FsDGhEurGgrlWCrbyiLZ5MiX3oPTFR+G8lOt345VBB+9CAWFWXR6n/99L8feTClNtP
X-Google-Smtp-Source: AGHT+IEBLhxF2I4CcVDE0Ip1aaBG/9qxfajK2d8loqdQY51JgxIHQayN0kr/iRs9O5E0K4MztoDo5g==
X-Received: by 2002:a05:6a20:6f04:b0:1fd:e9c8:cf3b with SMTP id
 adf61e73a8af0-200e4cc69c1mr11499641637.30.1743691154910; 
 Thu, 03 Apr 2025 07:39:14 -0700 (PDT)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af9bc2d331csm1285435a12.12.2025.04.03.07.39.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Apr 2025 07:39:13 -0700 (PDT)
Date: Thu, 3 Apr 2025 22:39:03 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: "H. Peter Anvin" <hpa@zytor.com>, Yury Norov <yury.norov@gmail.com>
Cc: Yury Norov <yury.norov@gmail.com>,
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
Message-ID: <Z+6dh1ZVIKWWOKaP@visitorckw-System-Product-Name>
References: <20250307195310.58abff8c@pumpkin>
 <EB85C3C1-8A0D-4CB9-B501-BFEABDF3E977@zytor.com>
 <Z824SgB9Dt5zdWYc@visitorckw-System-Product-Name>
 <Z9CyuowYsZyez36c@thinkpad>
 <80771542-476C-493E-858A-D2AF6A355CC1@zytor.com>
 <Z9GtcNJie8TRKywZ@thinkpad>
 <Z9G2Tyypb3iLoBjn@visitorckw-System-Product-Name>
 <Z9KMKwnZXA2mkD2s@visitorckw-System-Product-Name>
 <Z+AlyB461xwMxMtG@visitorckw-System-Product-Name>
 <eec0dfd7-5e4f-4a08-928c-b7714dbc4a17@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eec0dfd7-5e4f-4a08-928c-b7714dbc4a17@zytor.com>
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

On Tue, Mar 25, 2025 at 12:43:25PM -0700, H. Peter Anvin wrote:
> On 3/23/25 08:16, Kuan-Wei Chiu wrote:
> > 
> > Interface 3: Multiple Functions
> > Description: bool parity_odd8/16/32/64()
> > Pros: No need for explicit casting; easy to integrate
> >        architecture-specific optimizations; except for parity8(), all
> >        functions are one-liners with no significant code duplication
> > Cons: More functions may increase maintenance burden
> > Opinions: Only I support this approach
> > 
> 
> OK, so I responded to this but I can't find my reply or any of the
> followups, so let me go again:
> 
> I prefer this option, because:
> 
> a. Virtually all uses of parity is done in contexts where the sizes of the
> items for which parity is to be taken are well-defined, but it is *really*
> easy for integer promotion to cause a value to be extended to 32 bits
> unnecessarily (sign or zero extend, although for parity it doesn't make any
> difference -- if the compiler realizes it.)
> 
> b. It makes it easier to add arch-specific implementations, notably using
> __builtin_parity on architectures where that is known to generate good code.
> 
> c. For architectures where only *some* parity implementations are
> fast/practical, the generic fallbacks will either naturally synthesize them
> from components via shift-xor, or they can be defined to use a larger
> version; the function prototype acts like a cast.
> 
> d. If there is a reason in the future to add a generic version, it is really
> easy to do using the size-specific functions as components; this is
> something we do literally all over the place, using a pattern so common that
> it, itself, probably should be macroized:
> 
> #define parity(x) 				\
> ({						\
> 	typeof(x) __x = (x);			\
> 	bool __y;				\
> 	switch (sizeof(__x)) {			\
> 		case 1:				\
> 			__y = parity8(__x);	\
> 			break;			\
> 		case 2:				\
> 			__y = parity16(__x);	\
> 			break;			\
> 		case 4:				\
> 			__y = parity32(__x);	\
> 			break;			\
> 		case 8:				\
> 			__y = parity64(__x);	\
> 			break;			\
> 		default:			\
> 			BUILD_BUG();		\
> 			break;			\
> 	}					\
> 	__y;					\
> })
>
Thank you for your detailed response and for explaining the rationale
behind your preference. The points you outlined in (a)–(d) all seem
quite reasonable to me.

Yury,
do you have any feedback on this?
Thank you.

Regards,
Kuan-Wei

