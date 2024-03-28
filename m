Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3685588FAF4
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 10:18:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D0B410EFC4;
	Thu, 28 Mar 2024 09:18:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WAeZo+K+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA4F910EFC4
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 09:18:28 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-dbed0710c74so633585276.1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 02:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711617508; x=1712222308; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JdlPi/D8q9gRz0rC7iT/EQjBcreVsogwectsXFf1ljg=;
 b=WAeZo+K+N8KfcjLyEh3pll4rZ3hIKYYWcIGtQMkyhgROb0Lqb+F1h6ziKZn0uBZF5o
 S3Tj8bLdD63twDdI/40U9iloyS7fAgexercjwPwSM2XPp79us3vXHQp1Gc0cowp7hsEf
 wngKnEkTo0o7imJ9DhgkyiJ/7ZvY3h/p+Qr8AuZEEoMql6CXXwWkIEjPZ0pTswnoY8lq
 CT+OvNRCKd/keVd/cbf9F7VKI8vcEC0iRRrngLKMsIvCWQNBmHe5PB5yqsDbExaWbWWv
 6IydeJU+KhZK3ADmDgNHp5lLcl+mNTRRySfU1z9oh11+OaCcPHm9glkdogXG5szdGZH7
 AE4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711617508; x=1712222308;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JdlPi/D8q9gRz0rC7iT/EQjBcreVsogwectsXFf1ljg=;
 b=euKbxcjUa2tSzyeZmv6t79sqpt62EylYO4acIA1sA8EYfZGlH9um2eaNVo08I7s/C2
 5KsjIBhhjZxkDxHQFZ4yUSbyHlEeyHOLKmUe+LLipZxKBB9/atpKKjbQL47j3ns628+K
 GnbrEJmxck++StK5y2TVbL0kBDWAyN9UsGsYZx1VeR1D58QVCn7QrM+8hiDlUCZQdv6L
 iQQPc1cevgpPH7sfUXPPKZSmmMSgLZ1ekqA/dxUyqWjaAmAtqNS7VM1Ig/p4p4IXmhme
 771zJJOpszpp1mfnv9ktzNDIbAC/1gCRyW4biboE6l1C99z8YEnZCIrIaoJvJMY+4gs4
 4Gxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyStbEtAz4dMahsmSiM9j9urWC9CDZyJZMwJyTesZig8UhgMMpUPhH8mKG1SUDL9UhNFltq2O/ovaRjgwSYuBI53idM/BNR5ayqQ0My2VG
X-Gm-Message-State: AOJu0YyjwH9/AP3YCMPjaZ3bV8geeV+b3MD6hFzafU+aed5r8czacGDj
 5CfTQgUEfusfQm7l6ZvCQ7NW/1TKn0jrevRfkVxJH7cHHZYXehrNQUUV1lDGFncLsUIEp7KXcm8
 4mejqYp5L2bSRpC45ipb/jYhmUDFdH3UestvRnw==
X-Google-Smtp-Source: AGHT+IHUYiXsFEyaSrFSbE/Sr9EQQEbq6LIDEHkAK2tUEMiEJLOv+Yp1LaCp4ieBZ7Wds5RI7onQUIkumjvsdiSFxmI=
X-Received: by 2002:a25:9091:0:b0:dca:e4fd:b6d6 with SMTP id
 t17-20020a259091000000b00dcae4fdb6d6mr2028363ybl.61.1711617507999; Thu, 28
 Mar 2024 02:18:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240326144741.3094687-1-arnd@kernel.org>
 <20240326144741.3094687-2-arnd@kernel.org>
In-Reply-To: <20240326144741.3094687-2-arnd@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Mar 2024 10:18:17 +0100
Message-ID: <CACRpkdbSsgzzwkTLTBvyc6JRVrAuVF=iFVQX7RZFJw5UyGuwyQ@mail.gmail.com>
Subject: Re: [PATCH 01/12] kbuild: make -Woverride-init warnings more
 consistent
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, 
 Harry Wentland <harry.wentland@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 Oded Gabbay <ogabbay@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Andrew Morton <akpm@linux-foundation.org>,
 Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas@fjasle.eu>, Arnd Bergmann <arnd@arndb.de>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, linux-mm@kvack.org, 
 llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Mar 26, 2024 at 3:49=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The -Woverride-init warn about code that may be intentional or not,
> but the inintentional ones tend to be real bugs, so there is a bit of
> disagreement on whether this warning option should be enabled by default
> and we have multiple settings in scripts/Makefile.extrawarn as well as
> individual subsystems.
>
> Older versions of clang only supported -Wno-initializer-overrides with
> the same meaning as gcc's -Woverride-init, though all supported versions
> now work with both. Because of this difference, an earlier cleanup of
> mine accidentally turned the clang warning off for W=3D1 builds and only
> left it on for W=3D2, while it's still enabled for gcc with W=3D1.
>
> There is also one driver that only turns the warning off for newer
> versions of gcc but not other compilers, and some but not all the
> Makefiles still use a cc-disable-warning conditional that is no
> longer needed with supported compilers here.
>
> Address all of the above by removing the special cases for clang
> and always turning the warning off unconditionally where it got
> in the way, using the syntax that is supported by both compilers.
>
> Fixes: 2cd3271b7a31 ("kbuild: avoid duplicate warning options")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Neat!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
