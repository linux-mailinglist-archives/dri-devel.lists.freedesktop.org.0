Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD2B85F138
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 07:00:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94B0210E871;
	Thu, 22 Feb 2024 06:00:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="UR9B70Iq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3DD510E873
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 06:00:11 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2d1080cba75so4965311fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 22:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1708581610; x=1709186410;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CrfADjbK9wBe+Anypf28Boz5+FV1y2DabiZpnaLd2+Y=;
 b=UR9B70Iqa6JWaB+98aC3SXrWVyRe6F8LqVOYgJVidhZDoWz7XZuQUEgrrlZEvVTegr
 bvzcII9Vhw4XpK2iPiQdG0U0l5EOktGH4A6j17J8DPdDJfAabOoUn414vim2dym8DVgc
 tkrDO6L2rPIe3Esbm1mEforhqCwGbjJJGXxUA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708581610; x=1709186410;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CrfADjbK9wBe+Anypf28Boz5+FV1y2DabiZpnaLd2+Y=;
 b=JcZ1aICmMzFUpuDz8WycD/GLH75zlxt3LRUrQjX96k6blVhRKKG6qFZmAx/N9qPUFQ
 lU4kPmU7vqM6Lu9ZDLWN30al/M7ldkOAMpKxrp5Fa15oL3Edv6gsLFqtjhSq0UkAZ26j
 KMq/0JSfz6oVZp+FWe1ZH3S7BAyE89thaGgMClNsLSK7OkuFLrSAHNtamYNdEvnAsYfP
 NI9CcmHSn0EZBFfAPDV2XzKgWEeFjHtN4v2QbbSdbryxzzhWxUnO5a8Y+KBD/d2CwDHe
 gUu0P3trGqW6sYDUEEb/0Hr6oUxweIkdzfHMG4lDcs13cXTxOxiX3MVNbCMhbb5Os5eS
 meag==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZWxbOUonx3R71SsTlCfWFbaoG0lFIZQv9jS8DxaOdwsy7nwoMNP8q8DJhgbtVMSZnT8+tZ9iqWBIDVbSt0hb1zNAFNvznp8ub4Tv9j8uL
X-Gm-Message-State: AOJu0Yw+O4TSrk2i6Amk81tNENadyN8Y9I48CH/K9CzxBIHmBgysurHO
 bc8jMCDCNrsb0bVa72rmmhZ1rRLLHAnKKe0X2D+jj/9ybk1uwWdxwL4FfSOwNrG1jqR5YFKNxfq
 UGsI=
X-Google-Smtp-Source: AGHT+IF/QZFYgwbKjYDTdEXJfycXW4RatwQgSQiLF7CRe6AulSRtI2eHZQUpySixpC3I4CMezEW7wg==
X-Received: by 2002:a2e:904d:0:b0:2d2:31a8:cb1a with SMTP id
 n13-20020a2e904d000000b002d231a8cb1amr568914ljg.13.1708581608266; 
 Wed, 21 Feb 2024 22:00:08 -0800 (PST)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com.
 [209.85.208.177]) by smtp.gmail.com with ESMTPSA id
 7-20020a2eb2c7000000b002d0ac930578sm2139801ljz.34.2024.02.21.22.00.07
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Feb 2024 22:00:07 -0800 (PST)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2d2628e81b8so1377321fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 22:00:07 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUrNpZ4lmjmYXq0oLPFt4+wHAuImOYWUt8uuZoyJun3HHfbTAsra4py2WpKk4ofqAP2BBlJCUCdSwS1TxbKCMqZcSsh4tUlfoOXaYNm0h8I
X-Received: by 2002:a17:906:f0c4:b0:a3e:719b:c049 with SMTP id
 dk4-20020a170906f0c400b00a3e719bc049mr1321213ejb.28.1708581587292; Wed, 21
 Feb 2024 21:59:47 -0800 (PST)
MIME-Version: 1.0
References: <20240221092728.1281499-1-davidgow@google.com>
 <20240221092728.1281499-9-davidgow@google.com>
 <anz6qjyb2oqkz6wdy4ehnlpoujy4rz2itohpglgfqzadtonxtj@ljakgnqmfxxh>
In-Reply-To: <anz6qjyb2oqkz6wdy4ehnlpoujy4rz2itohpglgfqzadtonxtj@ljakgnqmfxxh>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 21 Feb 2024 21:59:30 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgafXXX17eKx9wH_uHg=UgvXkngxGhPcZwhpj7Uz=_0Pw@mail.gmail.com>
Message-ID: <CAHk-=wgafXXX17eKx9wH_uHg=UgvXkngxGhPcZwhpj7Uz=_0Pw@mail.gmail.com>
Subject: Re: [PATCH 8/9] drm/xe/tests: Fix printf format specifiers in
 xe_migrate test
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: David Gow <davidgow@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rae Moar <rmoar@google.com>, 
 Matthew Auld <matthew.auld@intel.com>, 
 Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Kees Cook <keescook@chromium.org>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Willem de Bruijn <willemb@google.com>, Florian Westphal <fw@strlen.de>,
 Cassio Neri <cassio.neri@gmail.com>, 
 Javier Martinez Canillas <javierm@redhat.com>,
 Arthur Grillo <arthur.grillo@usp.br>, 
 Brendan Higgins <brendan.higgins@linux.dev>,
 Daniel Latypov <dlatypov@google.com>, 
 Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, 
 "David S . Miller" <davem@davemloft.net>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 linux-rtc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, linux-hardening@vger.kernel.org, 
 netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 21 Feb 2024 at 21:05, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>
> this has a potential to cause conflicts with upcoming work, so I think
> it's better to apply this through drm-xe-next. Let me know if you agree.

I disagree. Violently.

For this to be fixed, we need to have the printf format checking enabled.

And we can't enable it until all the problems have been fixed.

Which means that we should *not* have to wait for [N] different trees
to fix their issues separately.

This should get fixed in the Kunit tree, so that the Kunit tree can
just send a pull request to me to enable format checking for the KUnit
tests, together with all the fixes.  Trying to spread those fixes out
to different git branches will only result in pain and pointless
dependencies between different trees.

Honestly, the reason I noticed the problem in the first place was that
the drm tree had a separate bug, that had been apparently noted in
linux-next, and *despite* that it made it into a pull request to me
and caused new build failures in rc5.

So as things are, I am not IN THE LEAST interested in some kind of
"let us fix this in the drm tree separately" garbage.  We're not
making things worse by trying to fix this in different trees.

We're fixing this in the Kunit tree, and I do not want to get *more*
problems from the drm side. I've had enough.

               Linus
