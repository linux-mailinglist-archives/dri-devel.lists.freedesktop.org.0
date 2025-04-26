Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A1BA9D9A3
	for <lists+dri-devel@lfdr.de>; Sat, 26 Apr 2025 11:14:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31A9410E34B;
	Sat, 26 Apr 2025 09:14:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ClEuZHTc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4116E10E34B
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Apr 2025 09:14:44 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-7376e311086so4234337b3a.3
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Apr 2025 02:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745658881; x=1746263681; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Dpw6EJump0TSOrBYBam8lLy7cnOl6Tzi7s2IdyQv1Eo=;
 b=ClEuZHTc3AHt/LWh28GMPc2D9duYGpZvpEnn8KPUtUn2nbqm31NUQj2OH36PDc27Ey
 MsNzbncmtuai05n+6N5VW1ZjwPJ6YQcQj7chGY66kMSLjPTs6+L4XNSpuFsEq1j7Vb/V
 9TgzRfaRwy+MeHL2NHsP8Qwr8xV4QKFEtEMBmlk24WHSJYJSro8CK11Sv3/ltXvHDuoM
 c4P4IoAxq8th3V7VF76r9uEFpoxbJm3x+EWmPETCg1ABJT97Edq+62qF3jgRn7eL1YKv
 pxJNH1kMa9YsUUIGDEWp/rY35zmRkUJIAntko6SazuImfjw1Z7MOjpDfvjEveoFdWkiU
 /9DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745658881; x=1746263681;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dpw6EJump0TSOrBYBam8lLy7cnOl6Tzi7s2IdyQv1Eo=;
 b=r6+6hauDm0ks2A9oRpBZRds2MYJNWrkTnYSNticWNCPmO34fioDEDFZsvBjpiT9NMS
 7yEzG8u2sxD5MKXQJ61m6xxK5y6qLerdVvZ4AB9vM+IP8OlmZQgotSTXuFWNYyqhG2Y6
 wT5TR1OyO3cyQth7i0yWEzVQF8TdYSF2F/g5r1+gbuv7MOt3zKOPgxpVTd0ZSYL+pwFC
 y+yyWL+jPxyPrYmQlzx+qG9hF81+TbvPs7jpnYw3cBWgw+K+YOHI/UF7Ktz7KdsaGqpi
 mnqP/NP+za+qF1NOR/qXXjHCvCV3m68zQXHJylUOSAmDCgvJuylDS2nDOpmfwDhx+QlV
 cfKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvTXOkbMbd+3pm3hXoi6IyvDIXZKvXeI1LRujVu281b5Ax4VzxoOIOkXGbBpE0gnLHD3VL4ZCeusw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzZom+Q81TaN+2cJlBeRMM1GaEG7VNyYlftTfieUo7lOg6MuCqe
 Z8UzfkY5x+gqQ5Hxfl8dlTiOkyQO2Hpiq/uPjBeckBTLCHG6JHxH
X-Gm-Gg: ASbGnctIn0Jc0ORIHiXISBWCPgrnO2KXcGDEXNJzovv7U6TZT2htXBnEtwBu6NbRVbo
 mhWx/I4zsAx9HI5mWCq1sG0yh10NyIAR+SCaXFiyjgSUk0ODo7oKaQSkvp0hb9Yh3BHOt10pym6
 ausktUtrKq9OghhLq/hKi2Kh25KB3LK00M5o2aHwuKrCiTYPCyQJ53Od6nGO57xwTig+hlFoSP/
 fnC1T5cbAKGMEndi+mMTpdU3Fu5nElvcCVm9HOkSl2CEDZyYkJ024nOWaCbrbPlrYO3dg1R4+Bk
 VO7ZqatiH6XZRTiwp4YKDuN1oP65VfH+Rwf1bB5UqqJh8dgFYTaEwl26YNVQyb7YPbke
X-Google-Smtp-Source: AGHT+IFgnshRXYAm4vLgOrmgYGZWM8t1SObZHkSRdPxsGHvAJ5uKKQ60xC74a/vGxL92untQtleJTA==
X-Received: by 2002:a05:6a00:1306:b0:736:73ad:365b with SMTP id
 d2e1a72fcca58-73fd74c23c4mr7475320b3a.14.1745658881199; 
 Sat, 26 Apr 2025 02:14:41 -0700 (PDT)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73e259412b2sm4594535b3a.66.2025.04.26.02.14.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Apr 2025 02:14:40 -0700 (PDT)
Date: Sat, 26 Apr 2025 17:14:29 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: "H. Peter Anvin" <hpa@zytor.com>, Yury Norov <yury.norov@gmail.com>
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
Message-ID: <aAyj9SMvYrN9tXZC@visitorckw-System-Product-Name>
References: <20250409154356.423512-1-visitorckw@gmail.com>
 <Z_amQp3gK5Dm8Qz3@yury>
 <Z/a5Qh/OeLT8JBS4@visitorckw-System-Product-Name>
 <Z_a9YpE46Xf8581l@yury>
 <e97a83a2-dabd-4dc3-b69a-840ca17d70b5@zytor.com>
 <Z/lEkDwefWvw4ZA3@visitorckw-System-Product-Name>
 <8571fd6f-4e71-4a6d-b2e8-16d9d72fa56e@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8571fd6f-4e71-4a6d-b2e8-16d9d72fa56e@zytor.com>
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

On Fri, Apr 25, 2025 at 12:33:21PM -0700, H. Peter Anvin wrote:
> On 4/11/25 09:34, Kuan-Wei Chiu wrote:
> > > 
> > > In either case, instead of packing the cascade into one function, make good
> > > use of it.
> > > 
> > > In the latter case, __builtin_constant_p() isn't necessary as it puts the
> > > onus on the architecture to separate out const and non-const cases, if it
> > > matters -- which it doesn't if the architecture simply wants to use
> > > __builtin_parity:
> > > 
> > > #define parity8(x)  ((bool) __builtin_parity((u8)(x)))
> > > #define parity16(x) ((bool) __builtin_parity((u16)(x)))
> > > #define parity32(x) ((bool) __builtin_parity((u32)(x)))
> > > #define parity64(x) ((bool) __builtin_parityll((u64)(x)))
> > > 
> > > As stated before, I don't really see that the parity function itself would
> > > be very suitable for a generic helper, but if it were to, then using the
> > > "standard" macro construct for it would seem to be the better option.
> > > 
> > > (And I would be very much in favor of not open-coding the helper everywhere
> > > but to macroize it; effectively creating a C++ template equivalent. It is
> > > out of scope for this project, though.)
> > > 
> > IIUC, you prefer using the parity8/16/32/64() interface with
> > __builtin_parity(), regardless of whether there are users on the hot
> > path?
> 
> As a per-architecture opt-in, yes.
> 
I'd prefer to see Yury agree first, otherwise there's a high risk of a
maintainer NAK after the next submission.

Regards,
Kuan-Wei
