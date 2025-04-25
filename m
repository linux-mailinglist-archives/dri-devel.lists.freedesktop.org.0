Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4DFA9D1B0
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 21:35:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10C8C10E9AF;
	Fri, 25 Apr 2025 19:35:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=zytor.com header.i=@zytor.com header.b="C+Rdr/oo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 812DB10E9AD
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 19:35:09 +0000 (UTC)
Received: from [IPV6:2601:646:8081:1f93:3f9b:137e:d2cb:73f7]
 ([IPv6:2601:646:8081:1f93:3f9b:137e:d2cb:73f7])
 (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53PJXQqR3199422
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Fri, 25 Apr 2025 12:33:27 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53PJXQqR3199422
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
 s=2025042001; t=1745609615;
 bh=OLByDl2k8QS7+vMeXGAQllfp+4VYlTCCje7Ox6Pfa4g=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=C+Rdr/oohHcjiYl3k1s0a/jc7dixN5R0Mv5Px2j8kDdwJbPFLv4mJw8by+4Oto+F1
 tveW9WpgN8ttlpQLpdXcxTyaag9b/7TVjdH+TFVTrbHGQKwFJgak240662L863NwH8
 vgd5rhQsraf4buOHAZcbX5elWx80ZG9egeLnGj+ScCeWi6QGr1XXyAHAVnHwSmGqjn
 GkUO/NnNKAj8Q2mW/Ez/Vn8NVAPQB+fwhPjMvNjg1RQgr6hZA7HmxZl5MiRxUlxIY9
 uDj0XpVrhXq3zSB+OYJgYqNwOTX2giqyzWvO0pM/qCL4rFHYBzL4YJWj3wXsa2EaH3
 7hq16GNhLhdyg==
Message-ID: <8571fd6f-4e71-4a6d-b2e8-16d9d72fa56e@zytor.com>
Date: Fri, 25 Apr 2025 12:33:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/13] Introduce parity_odd() and refactor redundant
 parity code
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: Yury Norov <yury.norov@gmail.com>, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
 jk@ozlabs.org, joel@jms.id.au, eajames@linux.ibm.com,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dmitry.torokhov@gmail.com, mchehab@kernel.org, awalls@md.metrocast.net,
 hverkuil@xs4all.nl, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, louis.peens@corigine.com, andrew+netdev@lunn.ch,
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
References: <20250409154356.423512-1-visitorckw@gmail.com>
 <Z_amQp3gK5Dm8Qz3@yury> <Z/a5Qh/OeLT8JBS4@visitorckw-System-Product-Name>
 <Z_a9YpE46Xf8581l@yury> <e97a83a2-dabd-4dc3-b69a-840ca17d70b5@zytor.com>
 <Z/lEkDwefWvw4ZA3@visitorckw-System-Product-Name>
Content-Language: en-US
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <Z/lEkDwefWvw4ZA3@visitorckw-System-Product-Name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 4/11/25 09:34, Kuan-Wei Chiu wrote:
>>
>> In either case, instead of packing the cascade into one function, make good
>> use of it.
>>
>> In the latter case, __builtin_constant_p() isn't necessary as it puts the
>> onus on the architecture to separate out const and non-const cases, if it
>> matters -- which it doesn't if the architecture simply wants to use
>> __builtin_parity:
>>
>> #define parity8(x)  ((bool) __builtin_parity((u8)(x)))
>> #define parity16(x) ((bool) __builtin_parity((u16)(x)))
>> #define parity32(x) ((bool) __builtin_parity((u32)(x)))
>> #define parity64(x) ((bool) __builtin_parityll((u64)(x)))
>>
>> As stated before, I don't really see that the parity function itself would
>> be very suitable for a generic helper, but if it were to, then using the
>> "standard" macro construct for it would seem to be the better option.
>>
>> (And I would be very much in favor of not open-coding the helper everywhere
>> but to macroize it; effectively creating a C++ template equivalent. It is
>> out of scope for this project, though.)
>>
> IIUC, you prefer using the parity8/16/32/64() interface with
> __builtin_parity(), regardless of whether there are users on the hot
> path?

As a per-architecture opt-in, yes.

	-hpa

