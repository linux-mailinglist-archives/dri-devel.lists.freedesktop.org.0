Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1035ACCD851
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 21:26:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0B5E10EB47;
	Thu, 18 Dec 2025 20:26:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WNqQGXyA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B45C10EB47
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 20:26:48 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4777771ed1aso8279015e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 12:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766089607; x=1766694407; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vgQxtQzmfa6dtQc2HKAnCJeJmQcolaeO4Fk6tR2yJow=;
 b=WNqQGXyAenvv6U7g3MCFiqDQbnxXmZyBLBLBSgcI9ML3Yscpui21sFHTi4W6T9/SLU
 USKjVbQnxhHgv10uBQPYS0kBTcx2tFUbR2/HaHg7vZW7GJ17iJlUekMVzGXP8hTBqxHT
 60Ha7BJ9lckNeBjrBiobLtUGrlFQerS7yGFnYSHpN66jKcG0Mvnt3MNDRT4eBBOoCYPM
 Br90MQ80+CihC7GZGw2vB9iWNeE+nlY1PucDIvnVGISdUhCWtxkovratKjdOtIMiBxpr
 zcBjBb9Ley1PQxDA+Z66Lq30KG+IZa3DCdcQ7pomb5DOb2bGp5VLSt9PNn4gGmuzHT0N
 OlRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766089607; x=1766694407;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vgQxtQzmfa6dtQc2HKAnCJeJmQcolaeO4Fk6tR2yJow=;
 b=gXNCU6t0WNxnGhoCQZTyqz/SpekoAXGFRDm5c0/Ik4Acis6cSvwapCxr4/Oxd3xSou
 0+o6nmDscChtqW851d29VEaxy5BFoj7rU8LLHV7bm3yBv+vd24Tb+w7StMLyrs2VgI6V
 yJHRFhvjFVVKeO88qD+ETW497+LgvPhnEAsf6AiX+jWHeOgjg88e9JQwZY3qcAeq3sRj
 CllsF+MiHKPSkTkLUnef5IbWEt9tDq9PTdYEFF/Z/v8IKq9nY5/TyahmV0YLgdhjsu1L
 x94mj5wHfFZsI5jEacipo66B+eAqXN21qwdWaJvVUmoD2XVWVdfP6SdbfRdBNrxJANXR
 ZAUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFdXQDsnysboHKssLYetWBPCZsj76eJ2HwiWLGH0TBhF0eX8pTKCdKhDMv9dme0hwKgOd1Zrj2qtw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwmCXko3Nve3pMXuowng1pwNctVmWDIhtB8FyUSavUcNlRkfi4K
 9CwT+i5efWPHx2Uhn7B/gctSHbHKk8Z0SIroDTNFEnKPJ3uhlUxDKIFW
X-Gm-Gg: AY/fxX5lMf1Fv2+4xr/9FFMzjY1hnKtTdqAMIRnAm6S/cigMvVSQY5QbOBS0CBDXpft
 kRZIc+f0x2D/alOF1NFV3hyEtPw5OnaA0SRpQnO2+14WggkAit1i+S4MxLhjnL5zAbKYzPxabeX
 HuqRh0IKqJI4hmI3ayFVHOSEyIUngB0c04k62LCXzj1CPXRnClL9z31Asp8g2D9eyUniq6RLCRr
 tGwsHGiF/XyAI7qsNMD/VDvZD9McCEMfWekZn+ie4cTuVGuqYRRlJE0YBXoosonAH6LjFKzZBbs
 AajloWXzSa+xmMGZY9EOoO3Fxvld+0sG6cnpsHVmn8TvlJ4XXwwUxJ8WHxX8o70QGtpgY5lFo+B
 dLTkxSK4yXcpg95g97OzFQA7JTLz3IwZoUeAN8ORL5Eo8tcfKdgnXj4pxPqN9jOSvGG85lWDy4U
 LBnsG8K9CEtZX6fWuUz0RSdVQK2h66t57f4dDgmw+aWFBafM5yWvQg
X-Google-Smtp-Source: AGHT+IFDrnuciBUHAt5nZOA+oA3L3vvumVlk/WEBkRVYYRodfFUMiH6N2Ng/k7jEFXB9WnpS2Kxx5w==
X-Received: by 2002:a05:600c:46cb:b0:477:7f4a:44b4 with SMTP id
 5b1f17b1804b1-47d1953b78cmr4635005e9.1.1766089606918; 
 Thu, 18 Dec 2025 12:26:46 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324eaa08d9sm872464f8f.30.2025.12.18.12.26.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Dec 2025 12:26:46 -0800 (PST)
Date: Thu, 18 Dec 2025 20:26:44 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Vincent Mailhol <mailhol@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Chris Mason
 <clm@fb.com>, David Sterba <dsterba@suse.com>, Linus Torvalds
 <torvalds@linux-foundation.org>, linux-kbuild@vger.kernel.org,
 linux-sparse@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-btrfs@vger.kernel.org
Subject: Re: [PATCH 0/2] kbuild: remove gcc's -Wtype-limits
Message-ID: <20251218202644.0bd24aa8@pumpkin>
In-Reply-To: <20251218-remove_wtype-limits-v1-0-735417536787@kernel.org>
References: <20251218-remove_wtype-limits-v1-0-735417536787@kernel.org>
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

On Thu, 18 Dec 2025 19:50:00 +0100
Vincent Mailhol <mailhol@kernel.org> wrote:

> I often read on the mailing list people saying "who cares about W=2
> builds anyway?". At least I do. Not that I want to fix all of them,
> but on some occasions, such as new driver submissions, I have often
> found a couple valid diagnostics in the W=2 output.
> 
> That said, the annoying thing is that W=2 is heavily polluted by one
> warning: -Wtype-limits. Try a gcc W=2 build on any file and see the
> results for yourself. I suspect this to be the reason why so few
> people are using W=2.

One possibility is to conditionally add _Pragma() inside #defines to
turn off the warning for the main false positives (I guess all the
BUILD_BUG_xxxx and statically_true are the main ones).
But don't 'bloat' the #define expansions for normal builds.

	David
