Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E11A55676
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 20:23:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ABFC10EA7E;
	Thu,  6 Mar 2025 19:23:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ici5lyFc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 426CD10E741;
 Thu,  6 Mar 2025 19:23:35 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-43bbb440520so12691415e9.2; 
 Thu, 06 Mar 2025 11:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741289013; x=1741893813; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2gAQrvIr+bYNNhdqGRLhQ0xcRRUcFE+Gf6NthGuhegU=;
 b=ici5lyFcgOTZ4KIsKMrgK4vrISqbTAYkvJzlOYNVFWLkZV9ITPEKbAdgDCAuxb6ibs
 BmdEYVq1Mtd0jO/FFfAyTs931Jo5ayiJ9De6RsiRjmDGekOjF2GoVDa3OWCo8FGELo6g
 8TPkmraGoflQQcNwrfJrD5MRpFp7IZZSHZzyGrkUSXLqQZv51RxuICkQUvwfY7Y+axwQ
 Wrn+P3B83bmcuhloL/Dvne5DzMAolrLRQPmQ7feAJhE6znBBl9IkWm0jkXtvV5TdiPzl
 m0ViGaCVmrFA9eJDgO/0bxfhKZDK+r+pGfHEd5c6Hd105+xyW+pDVjLd1mdPdw+7R8fI
 vj3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741289013; x=1741893813;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2gAQrvIr+bYNNhdqGRLhQ0xcRRUcFE+Gf6NthGuhegU=;
 b=QORtp76/obuobzSv1DNb1LJGaaytuxM0VQt1kJ/WdOGKY+w4i/U5C+JMb/j5PTfxNM
 A/Joe1r+5kJyTVw5SWfJScu44JerxVinfH9CXUxZFnadCj/tMUNNFvaxYxGDqP3gBM6n
 IA8wEJ6g8ZgDhhiT071r57/eK1RY4oA5+6xxjKCaEeFJEk/oAqddwc+LeiNfT0HnYYdA
 lOSPWeIZeoeg9yi9LsWgI1nkHj2vtFaduGYC72QZzmxSVK2WsjJ6E1JXTj0lLEMuFdR9
 or3p+IsM0qCL2/pOswVAbO/9PQTXtXHalFW3Imy3m6RB02kMi4y3fdfz5elAlnVy/QCm
 Yd8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8/jI+7Uz1yVajBg+JbVea9E4f1A/ZKqOYfGaw2oZdrml6X5Bex3QCu8YDzQINJNlQh5M5Ulqdvr6Q@lists.freedesktop.org,
 AJvYcCX3cqTFoZq+Yn+EzUAeN1NTvBFeIXlaq0B3EguI5H6MJDnUftCtUxrMbgL+/aIvHEqDWVIV7KAwYbQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxxTBVzTQGi5RSSrVBkaoMeh5jEKXVLltJQ4JQLdmmryiTHv0tN
 Ky/Qnck2abNsYU2DhVhZ3/3sv4cXpJVNE5HdHFhAUe51BU0yoAdP
X-Gm-Gg: ASbGncsg2Wxal5dGHW6iFiGYPPrczo/L8qCo7DwJEKEBDnFrsXauCePgDp3YXcpot0C
 eFGflovHlGoITeHmluh57W+v4Rcbebgnzx2ksTxp/mBNzbebGijNb3iSBupNwWUZC0t7vdxkJqu
 5pSFAECtMBw+27OZZEyQEhvVygpvB2o6HJvZ1YBZv+KDD5tKU5fFgr0+ODaw+J43+QamdNgUgdq
 DjJ6KncGwaV4nNcnxcT8p2vCkyIZAiGYX4brwfk6/+Z4GSl10HEWFDdhR+Jhl5T9NyTw/HmYOGs
 S/prDKosKk/V5jDPRTdmKlY3a6zWRn96plGifBJORyf1+0o4Y0A3oSJovsXtIOABTwwhH2dbM7S
 0qGPjNQs=
X-Google-Smtp-Source: AGHT+IEjP2oFiUTRz96RC4nx2g0wy0+9rXiWkANqHn6bl8Asnp3/eQk8qG4py/lYov8jfs94jM5f1g==
X-Received: by 2002:a05:600c:1910:b0:43b:c97f:2679 with SMTP id
 5b1f17b1804b1-43c601d07ffmr7269805e9.17.1741289013121; 
 Thu, 06 Mar 2025 11:23:33 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bd41c7cc7sm62259775e9.0.2025.03.06.11.23.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 11:23:32 -0800 (PST)
Date: Thu, 6 Mar 2025 19:23:31 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Vincent Mailhol via B4 Relay
 <devnull+mailhol.vincent.wanadoo.fr@kernel.org>
Cc: mailhol.vincent@wanadoo.fr, Yury Norov <yury.norov@gmail.com>, Lucas De
 Marchi <lucas.demarchi@intel.com>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Andrew Morton
 <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Andi
 Shyti <andi.shyti@linux.intel.com>, David Laight <David.Laight@ACULAB.COM>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v5 1/7] bits: split the definition of the asm and
 non-asm GENMASK()
Message-ID: <20250306192331.2701a029@pumpkin>
In-Reply-To: <20250306-fixed-type-genmasks-v5-1-b443e9dcba63@wanadoo.fr>
References: <20250306-fixed-type-genmasks-v5-0-b443e9dcba63@wanadoo.fr>
 <20250306-fixed-type-genmasks-v5-1-b443e9dcba63@wanadoo.fr>
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

On Thu, 06 Mar 2025 20:29:52 +0900
Vincent Mailhol via B4 Relay <devnull+mailhol.vincent.wanadoo.fr@kernel.org> wrote:

> From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
> 
> In an upcoming change, GENMASK() and its friends will indirectly
> depend on sizeof() which is not available in asm.
> 
> Instead of adding further complexity to __GENMASK() to make it work
> for both asm and non asm, just split the definition of the two
> variants.
...
> +#else /* defined(__ASSEMBLY__) */
> +
> +#define GENMASK(h, l)		__GENMASK(h, l)
> +#define GENMASK_ULL(h, l)	__GENMASK_ULL(h, l)

What do those actually expand to now?
As I've said a few times both UL(0) and ULL(0) are just (0) for __ASSEMBLY__
so the expansions of __GENMASK() and __GENMASK_ULL() contained the
same numeric constants.
This means they should be generating the same values.
I don't know the correct 'sizeof (int_type)' for the shift right of ~0.
My suspicion is that a 32bit assembler used 32bit signed integers and a
64bit one 64bit signed integers (but a 32bit asm on a 64bit host might
be 64bit).
So the asm versions need to avoid the right shift and only do left shifts.

Which probably means they need to be enirely separate from the C versions.
And then the C ones can have all the ULL() removed.

	David

> +
> +#endif /* !defined(__ASSEMBLY__) */
>  
>  #endif	/* __LINUX_BITS_H */
> 

