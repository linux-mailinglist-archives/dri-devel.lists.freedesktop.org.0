Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67551A704E8
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 16:23:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E83810E3A6;
	Tue, 25 Mar 2025 15:23:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KSi6Farj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8F3810E093;
 Tue, 25 Mar 2025 15:23:25 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-22622ddcc35so3822425ad.2; 
 Tue, 25 Mar 2025 08:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742916205; x=1743521005; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=NDEUa/8k11B8sf0KeIB05SHGhO3FNf6wOS/GzrTKGyA=;
 b=KSi6FarjDpRxnL1MsxKbEQnkAp8OM2GDaJibVYigmjWSeQo3BJHLKxQ+YAZeWyTLsb
 MS4CXDPjFquD/vqh6mkMirIaqC32/7c8PkYdfio8LJUdyrnn9VxyGXRcvQugixOwTSYR
 VINO9A7IsIalQZpWcjNlI9c3LK17hoMNiFx/lENr5C5tColCpKyUUAIoh4m3emc14G0g
 XMqumMPaNb+sFnkde59rzh52hlyLm+Csb+hDGNhcm+te1/0kmZRmdkLHypyFKYBjYBgp
 OyuW12JWOJuhh/7LzBeBqgtirLVgvJlqfmTMg/FsPDgDpwnYdh97ppnyFJm0OWppTGUx
 sjOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742916205; x=1743521005;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NDEUa/8k11B8sf0KeIB05SHGhO3FNf6wOS/GzrTKGyA=;
 b=FZMa1MPjsY3uNUhqPpnhZw8RNtaxg948JomQYNS0QtjRwegj6+wuhOtEvunJspqaWn
 JiEF0THZTBHv6l6Ka0DWC+W7JLufQk3exrAlNv5sdY42wzS7120A+Ph8rDsfgZroxESa
 9bNA2gtde2XntvMCwc6q1m1PN5KUqQWLPXxMv+mZQfMyw9qAgFuW5fbfAUFPxHEG34EM
 5Brz4Ss1H+rwEIfZP4fctPWtfUofpF5xJTg/1nrZLnB2HNi56YPwgu/ll9rdocGFnLeM
 L3GD5R8etlfpfefcCHCMxpPtszF1WGGAuQfiuSATw+rkPVeo17p9sjpHWqKlkS8xbSt2
 8Ldg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWddP9StEIjt+7s5hl+fPaw/E5NvA8xul6kiH4X3x/UrwIQo5d9WZzzkNVxQNutxVWQcubOdetB5jQ=@lists.freedesktop.org,
 AJvYcCX1CsgDGJ9h6AUUZBcXZhfCTp16PMkpOJcw0n0iwpOjwN26MwIUVRjsTUCzr+ABBMxt+bcrRhp3/C77@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzcVeShGv7WGFomqYsS1vxREUndlCcaEPJquQxi7XG6LFh+wk+Q
 SSAicLxW1r78dUB/GPZO6jxbjlJ4ZOg4QyRpS1I4vxyKm3wZcvpg2n3Vf7Df
X-Gm-Gg: ASbGncumEus1Fwd0mTGDB3XdAIHaF+BbTdmEXAEWgiyAX9b9HiyTAu3mDUWzniGixj4
 JIwnZoyxThqk/VuoKXoluMxhGs8yu03+zlpDRfOwJTsccYMnrDaIOslsZkQGoINqYfhJOhqt1aA
 C/74ID5NB7hH0ZX9pCHqXqOzQRSk/29AxyIwc+4avYD5m48e53zfM2uuOz52UndZmBl57Gzw9SE
 lmb6Nodf1W63PSgyewuyKYSiuwLx5/sKB8ym/mzpyXTpxWHXuw6Kftft3ZwbhuKUyG6kD+PV7WA
 eKYVzjJUHIdigIgIu9scEbnQPTuf+8MK6FGapQMhjfPfF+4kUGnZD9c=
X-Google-Smtp-Source: AGHT+IERqjQ8v4TPmvjqLe2ZRM0h9caz3DbZCtwwWbViglyqvjOgOKurUBCP/tbe3Wa31BZwvLBCcg==
X-Received: by 2002:a17:903:183:b0:227:e74a:a057 with SMTP id
 d9443c01a7336-227e74aa5demr23766335ad.44.1742916205178; 
 Tue, 25 Mar 2025 08:23:25 -0700 (PDT)
Received: from localhost ([216.228.125.131]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22780f396fasm91417135ad.27.2025.03.25.08.23.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Mar 2025 08:23:24 -0700 (PDT)
Date: Tue, 25 Mar 2025 11:23:22 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 David Laight <David.Laight@aculab.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v7 0/5] bits: Fixed-type GENMASK_U*() and BIT_U*()
Message-ID: <Z-LKapMBpMfJwcL7@thinkpad>
References: <20250322-fixed-type-genmasks-v7-0-da380ff1c5b9@wanadoo.fr>
 <Z-FsJPA1aq7KyTlm@thinkpad>
 <7e114fdb-0340-4a3c-956f-b26c9373041d@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7e114fdb-0340-4a3c-956f-b26c9373041d@wanadoo.fr>
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

On Tue, Mar 25, 2025 at 01:23:22AM +0900, Vincent Mailhol wrote:
> On 24/03/2025 at 23:28, Yury Norov wrote:
> > On Sat, Mar 22, 2025 at 06:23:11PM +0900, Vincent Mailhol via B4 Relay wrote:
> >> Introduce some fixed width variant of the GENMASK() and the BIT()
> >> macros in bits.h. Note that the main goal is not to get the correct
> >> type, but rather to enforce more checks at compile time. For example:
> > 
> > You say this, and then typecast both BIT and GENMASK. This may confuse
> > readers. Maybe add few words about promotion rules in C standard, or
> > just drop this note entirely? Doesn't require new submission, of
> > course.
> 
> I do not want to into this level of details in the cover letter, so I
> will remove. Instead, I can add below paragraph to the "bits: introduce
> fixed-type GENMASK_U*()" patch:
> 
>   The result is casted to the corresponding fixed width type. For
>   example, GENMASK_U8() returns an u8. Note that because of the C
>   promotion rules, GENMASK_U8() and GENMASK_U16() will immediately be
>   promoted to int if used in an expression. Regardless, the main goal is
>   not to get the correct type, but rather to enforce more checks at
>   compile time.
> 
> I staged this change in the v8 together with the other nitpicks from
> Andy. If you want that v8, let me know, it is ready. If you are happy
> enough with the v7 (and if it doesn't receive more comments), then go
> with it!

This series doesn't apply on 6.15-rc1 because test_bits.c has moved to
lib/tests. Can you please rebase your v8 and submit? I see no other
issues to merge it in bitmap-for-next.

Thanks,
Yury
