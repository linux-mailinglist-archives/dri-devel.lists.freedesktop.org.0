Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7ECDCA8CA3
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 19:28:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 116A110EB95;
	Fri,  5 Dec 2025 18:28:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JfCDfgt8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0868010EB95
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 18:28:20 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-42e2ce8681eso1744550f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Dec 2025 10:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764959298; x=1765564098; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K2spLu6N0DSR4ou+F0P8PP9863f25wbk/kJaa4ODHOI=;
 b=JfCDfgt8GRETsaFE59BvYpuBCRjOWjy4YQEInG/Jgkcb7QxsxfcHos6BdsTdGPv7FO
 lVIjkznSJlV5TwjyaS3cU4QcJMN4fW57J8WhJJ2oTSVpS+nkqiOidPxn3Hh+J7118unM
 sBTukFGmUDiRcUKXPjmPafopYnOU2n85pFfZy4Zr4YFt/+9lW2Cq3nugfoHFIoF9D+Yc
 wPXyv2LOpxyWnaxlPWQXPL4oGUBr1RKfLGINm22+lnGjlgEz/r5pawTGuscQtvoTNOX1
 rCuvf0s2Z6FUU7ZIh7i2edwfrtimi/6S9+jazv4DjCfUP1ABCOkRrMO7nL30SGAa6JOJ
 89Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764959298; x=1765564098;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=K2spLu6N0DSR4ou+F0P8PP9863f25wbk/kJaa4ODHOI=;
 b=bSgPZqGlTMVUp/ouIYQk+fFlcSQAf5mI5G/Wvi/fVM6+FczpaU5lxUQikPbNwVDNmO
 62zP2jFgwJW4XPVWxuvxVHgI9ns3JWo8JNwXi7GPfZNd5V3h1iZpyW0oe/3vBVWAyuMf
 AyVq/ckfDt+EECP4ui8/N9orLcVhHiSLAENHZ8thEuIrRatsINJap9l22l3GkKSxZz54
 EI+tjVSV5ttQVoK85TwEVniRCxdMIPyOFKhr/omW9I0bbpQMtWiSHr125yUWwc33l+Hx
 ei7GsDsFO75ngLSs+IRF1nsMEIiJMmf/NcA4bv7OIZfTMnRA1FmhNs/loB5g2Yyodjev
 J3CA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvmHRDliDQhn5BHXswXpVYuzOKQBmq3pU/b/2PPH+pN7AEHjhhZ5yZrWHyl3qzXQTCzFrL6N2S7mk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwVAZMVl+O4cfqYf33qreCTtSTxhmXPMH4OOV3Z8S1iqZqaNNWn
 X3z9FkI3aDU4oyE4rNrgDEhohRs9pkKsXTvU7Tbst1ypWY+tM7+eAXb6
X-Gm-Gg: ASbGncsm8dWUfYwKOck949XSqY8/lgbiN6n5dIKZSz0rpusR1yEWcAZxXOTuGaAqQXG
 LSRQW/gkzHNSRmRc/iUoJK4W7WU/RDHzSFvnqV0O7wMFjnm/xnno15WMYyQn8zTBfL97GghXbcu
 lEDLZYQ8HKq8zPITNR7YvbRF2BCQBTt0FMucELW2EV5QibaksvbzJDh7bMw7hkj6pst+W5+ZfTa
 ocOuWScXk1rO5K21DgbDtOaCBzG1UIYJq8Oz+UUFI8Aofpr6GCfO08Wam2Qj9V0dpeKoeoQZDkn
 5oTzFBNzID8bvMXnHOiJ3XcCdG24JLfIcsBmCesWYbYUjIpTIV3NBaOvQJKPef0jbPjRp6SFyjb
 rwfB2mu+b5H3YWB3zOPy9phdMa/eshR7s+G2P12p8ITK0ZfX2oWy+vET1bNk/OelfzP/BsoQ+4U
 VCn1JHMmCA3HLuJMvPdIubv4gXnFjciukYl/9PzyZQULLMV5CMHxU2
X-Google-Smtp-Source: AGHT+IEL7gGVq4z+x8DouC8qMVxh2BY+TMn22RIJ4pOpH3WFP25hMyFaF5VCRhYnBlYrXPo03rrM4g==
X-Received: by 2002:a05:6000:2211:b0:42f:8817:7ef with SMTP id
 ffacd0b85a97d-42f89f647f5mr122804f8f.60.1764959298355; 
 Fri, 05 Dec 2025 10:28:18 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7d331aeasm9768523f8f.37.2025.12.05.10.28.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Dec 2025 10:28:18 -0800 (PST)
Date: Fri, 5 Dec 2025 18:28:13 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>, Ard Biesheuvel
 <ardb+git@google.com>, linux-kernel@vger.kernel.org, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/i195: Fix format string truncation warning
Message-ID: <20251205182813.09231c45@pumpkin>
In-Reply-To: <CAMj1kXFLaOZMXsUsvrshkwhvJSWm3V_iZB3n1rga=Q6zwrVY_g@mail.gmail.com>
References: <20251107164240.2023366-2-ardb+git@google.com>
 <14ca1b28-df1d-4065-ad7a-97a3ff81a5a4@ursulin.net>
 <CAMj1kXEgfykaf9oB4_tuAQqwXDN+NLy_Hb_+RnQmeicVgKt0bA@mail.gmail.com>
 <CAMj1kXFLaOZMXsUsvrshkwhvJSWm3V_iZB3n1rga=Q6zwrVY_g@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Fri, 5 Dec 2025 11:48:08 +0100
Ard Biesheuvel <ardb@kernel.org> wrote:

> On Sun, 9 Nov 2025 at 19:00, Ard Biesheuvel <ardb@kernel.org> wrote:
...
> > > But I guess much prettier fix would be to simply grow the buffer.
> > >  
> >  
> 
> OK, so something like
> 
> --- a/drivers/gpu/drm/i915/intel_memory_region.h
> +++ b/drivers/gpu/drm/i915/intel_memory_region.h
> @@ -72,7 +72,7 @@ struct intel_memory_region {
>         u16 instance;
>         enum intel_region_id id;
>         char name[16];
> -       char uabi_name[16];
> +       char uabi_name[20];

The observant will notice the 7 bytes of padding following 'private',
and another 7 a little later on.
(I' pretty sure 'bool' is u8).

So extending the buffer doesn't even grow the structure.
The string is only used when printing some stats.
I got lost in a list of #defines and function pointers trying to find
the actual function that did the 'printf'.

	David

>         bool private; /* not for userspace */
> 
>         struct {
> 
> 
> 
> > > Also, hm, how come gcc does not find the mem->name vsnprintf from
> > > intel_memory_region_set_name?
> > >  
> >  
> 
> AFAICT, intel_memory_region_set_name() is never called with a format
> string that could produce more than 15/16 bytes of output.
> 

