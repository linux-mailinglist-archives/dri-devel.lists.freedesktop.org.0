Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E87CEE417
	for <lists+dri-devel@lfdr.de>; Fri, 02 Jan 2026 12:04:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1866110E09B;
	Fri,  2 Jan 2026 11:04:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NcKv32vZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF94710E09B
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jan 2026 11:04:42 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-2a097cc08d5so31194085ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Jan 2026 03:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767351882; x=1767956682; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FIDs7EpZgwjKHQTJkjqicwJWn0vuoECrubEqmgA+6vU=;
 b=NcKv32vZ5gdV5b6WPUtIokwWfo23b+LpAAQV27AkinKBTwj5y+LU7unjsu8R2toro/
 uP80w54PxyUHNGMvZjr+wiypPWX3S5w3KRJP2zih6MHP99pJXTqlrS7rLLdqsStliHq8
 GxjfC5PuciI42rOcP+x25w5G0xUJ6cRGKUTNEUG11KcpiRRryu+LvpISu2YJP602Ymc8
 HKLDX4gXwenuTUP1lvLEP/OXJ0jANXJmoeMeI2F6JsBjsgIufcrUyrh0VjQmdTC7JWPf
 F+8KPYO5AaNSkwOnO0MONj/yNeQEABgw9xVKKLMS6xoKj+gpyGTQ1nrF03xURIQNv43E
 xoWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767351882; x=1767956682;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=FIDs7EpZgwjKHQTJkjqicwJWn0vuoECrubEqmgA+6vU=;
 b=S/OVL3YIoF9xtpoN/zLAZnFpjdeGi1TuDJO5LzFN7k7ORK/jlXVpnfjFNCi0v/bzZ2
 GvAOEwNPPZ5USIqUdTnHfVUe0+PWAZsCIqdzBpDZ6Wgi0pRAZfbYnxpPYLTIlO8NkNtP
 PyMSZiwIcNVR/gleACy2DeUyKekyZuoas9naFZ+LAqbCrSiUc0Z84XzREAeX/XiGJv4c
 v42wW36aXwlfxRw3JrXqRfof6eO1pML/7IcTc5rb809BXOWw/SJMMNY0pR4e0Ze7Suo3
 UJHX6LBD/FfQyULfR6XcoTYB1NHlK5t21+hefppA3RPXufoIh8XahqfhxbQZID0PJepm
 EajQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPuImB9fniZESj72QBY5Gwb5Sz7sXXiqVYr5n8JRqfnsfw6AOKcAxJ5R5EZhrZBjWXjMIGynzfrGQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyvFGtRqL3p5ruuFdQ0FYkkVTrHnVD+YYNGu+OrU06mB5z0oEGq
 DVkEI6hHX/LCd/ObRgk9mGDqkpky8rug5t7Siz02pIBZz15iTnqbvDfm5yWCD5lj/8HubyaIAs0
 cOa8r+MQvGHsmUuAr6QrZCrzkxlqmLVU=
X-Gm-Gg: AY/fxX7jCBggWO5hZsD08gQwlme7zUbs0HKdb01zjWhoyJG3OxQYXtmUn5Iw9gaNv0L
 srhFxiRSn57pSxbgDRW7/LS6cTlVHcSXLWwlleR8+L8rMaNDTk6RXej8eNz3t8fIU4NGPpkEYYV
 rWJxRMQRqBFt5ZSZwA34Oo83hhu9TBa30PI+PXA4+M36o6uYutZfzQEM6fE0qbdlbbUaNctXtPK
 M1JpC/p9n44uPTz8FDAZIsc2vucaaHYz+udTdaebBtrAJ0qvPnTHsy5sQA/iStE4Hu2CPRxPXVN
 dZLxvHD4eNrBx3s2HOcB9IwkkMbFZZVxYioa/3LI39sES+SWdKrfGx/GEa2tJsX4PNiqScWLQny
 Gedz2HB/+OO3S
X-Google-Smtp-Source: AGHT+IEZHP2Tt0L93hKtfLRSYNZV76m0YyhGtrMg6HK8YOKF7WDdzMO7LFlzqH2gnVcYBfD5MuH9A9W3GVedPNVkD/I=
X-Received: by 2002:a05:7301:1509:b0:2a4:3592:cf89 with SMTP id
 5a478bee46e88-2b05ea19892mr15172023eec.0.1767351882060; Fri, 02 Jan 2026
 03:04:42 -0800 (PST)
MIME-Version: 1.0
References: <20251220-remove_wtype-limits-v3-0-24b170af700e@kernel.org>
 <20251220-remove_wtype-limits-v3-3-24b170af700e@kernel.org>
 <acdd84b2-e893-419c-8a46-da55d695dda2@kernel.org>
 <20260101-futuristic-petrel-of-ecstasy-23db5f@lindesnes>
In-Reply-To: <20260101-futuristic-petrel-of-ecstasy-23db5f@lindesnes>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 2 Jan 2026 12:04:28 +0100
X-Gm-Features: AQt7F2rb7qQrF04KAinb0u8Ra4qw05S31gwaEul2jMZEj1pMA4QwOapz60W1DHs
Message-ID: <CANiq72=jRT+6+2PBgshsK-TpxPiRK70H-+3D6sYaN-fdfC83qw@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] overflow: Remove is_non_negative() and
 is_negative()
To: Nicolas Schier <nicolas@fjasle.eu>
Cc: Vincent Mailhol <mailhol@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>,
 Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, 
 linux-kbuild@vger.kernel.org, linux-sparse@vger.kernel.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, linux-btrfs@vger.kernel.org, 
 linux-hardening@vger.kernel.org, kernel test robot <lkp@intel.com>
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

On Thu, Jan 1, 2026 at 9:13=E2=80=AFPM Nicolas Schier <nicolas@fjasle.eu> w=
rote:
>
> thanks!  I think it's a bit sad to keep code only to make some checker
> tooling happy, but for now it seems to be the right thing to do.

Perhaps a patch to add a comment explaining Vincent's findings would
be a good outcome, i.e. explaining the reason it needs to remain in
place for the moment (even a link to lore.kernel.org to this thread
would help).

Cheers,
Miguel
