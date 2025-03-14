Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2261A60B03
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 09:16:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3992F10E996;
	Fri, 14 Mar 2025 08:16:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.b="CAqfbod0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45B9810E2D3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 05:40:28 +0000 (UTC)
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 46D253F091
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 05:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1741930823;
 bh=KHVvEo4a2v+cW7rLYC5E5IP2TKLmXgAPS/TIAmIpZA0=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=CAqfbod0caPEckgS9cNer6BoSFf/KO1mGs/BYj49aXoHqLwxLkPzuH2eFJZuPrFIP
 k/i7Yma5kpGdFm2XaY+yMTtOhPSmDaErnapN/zgGAxVVjrW8k1oqoQLA9E7fXnna5R
 pSmDrOt5VO3fJcu8Gha8jMBWb9h/xx3x0w5FZeJNojnOs1LZUCpOu8JqBsiJUM5+/M
 NyleL9xzJfli2yftCCuiZNHKvknXcQyHWbPT0fj4jlnFGhT8me9vNNQdYNtihb5BNF
 8BtMSFtEJvDr5o8q8qUfDI0E3izwgObi3piN2yjOBs8ydNOSmHH50Yf7ymRtjnzgqt
 s5qF4c7ydIaGA==
Received: by mail-vk1-f200.google.com with SMTP id
 71dfb90a1353d-523eb742ffbso558239e0c.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 22:40:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741930822; x=1742535622;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KHVvEo4a2v+cW7rLYC5E5IP2TKLmXgAPS/TIAmIpZA0=;
 b=dAFoMBSFFeIYHvXSGVbE0iz7wmvHSrKHYxjyoS91zowetNr2iRsu2QTvDxHruQVbcK
 vpQ/2xoY+9G3TJ9E60uQB7vGgOdo5hmasb68wNmJ92TQ61+gDXSvQlP1+WvvVge4qLNB
 tnkhf5lcqZjoNh2Uq0rjkuR0stKTfPmrK4IExvFgV81B1SOc6yMlGd/jFF2XGue9Rvmf
 nz3bbKqxHHMlHZNZDz63GKHwQ9d6seKZz4GiltA4sSF2+Ajmo5y4aS/18olBdQwrPp7M
 osqm3H7vMxsPAptHB5LxmaZL/Bafzr16NXSM6r9MhfKJWdFBJLTE2o3DXk8x7qiGOYUF
 jd3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNUPxSn9i4zUwrFjLzwCqrqP33UgOtAvsiyDbXyMwOi4RZt9reFQmvIG1/8enCLe531wjoo1lOyaM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyP3kdWdS5km2QE4XlRtq+VxfV+j8pinynBEOaY3rZBiuTFtKSL
 WwRQAoDrN870HVTpzaPoOg3hIxSYOTaVxJGlqBy5t3xm8BOWjHDFi5+PFN+27OjHctinY0uft29
 kUjvnXLDruVGj/wgf9JoUXfwKeXST8J4TDES8FAvVfYVs65ASGkrDaEMRKC6kxNkDGdG69rgeZV
 /t693uDsJdRT3yPErHKGTKwvWfkX6FxM/M7N1P+SUQrrYQg2PY+J+r4/Eg
X-Gm-Gg: ASbGncuzoURkOZdSLIJnFAXTJeGTUG8YhmBrEpoijkBMk286GkQqCeJh3+bDKLqCBgM
 nJbxSRZCUmBadIBqsIu2mOlF6qnVAs8Zc5CSaXnXHlm7bKZ9jj+/uVqVDCpH9zIBevJWgoQc5OA
 ==
X-Received: by 2002:a05:6102:3ed5:b0:4c3:52f:175c with SMTP id
 ada2fe7eead31-4c382f9c38cmr701336137.0.1741930822260; 
 Thu, 13 Mar 2025 22:40:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFkuI4xwxwmD4W5vZwFXVV+zKk/vRrjtyFmpUBFLwhuuzFgHWzblfl66y37xJJgM90/2dkfIVuz1WX3xnyepHM=
X-Received: by 2002:a05:6102:3ed5:b0:4c3:52f:175c with SMTP id
 ada2fe7eead31-4c382f9c38cmr701328137.0.1741930821970; Thu, 13 Mar 2025
 22:40:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250313041711.872378-1-leo.lin@canonical.com>
 <878qp9dx54.fsf@intel.com>
In-Reply-To: <878qp9dx54.fsf@intel.com>
From: "Yo-Jung (Leo) Lin" <leo.lin@canonical.com>
Date: Fri, 14 Mar 2025 13:40:10 +0800
X-Gm-Features: AQ5f1Jqt4zZ3VwSHms6FObxGsQo-FxR5l0nzNgI0L4koCsAaEmsRm1MKhPg3l5o
Message-ID: <CABscksPic1NdfVs+_g9s_HtyDtAACKNshbMXObWApmiMMhyf_A@mail.gmail.com>
Subject: Re: [PATCH] drm: add .hdrtest to .gitignore under drm directories
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 14 Mar 2025 08:16:01 +0000
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

Hi Jani,

On Thu, Mar 13, 2025 at 6:48=E2=80=AFPM Jani Nikula <jani.nikula@linux.inte=
l.com> wrote:
>
> On Thu, 13 Mar 2025, "Yo-Jung (Leo) Lin" <leo.lin@canonical.com> wrote:
> > The header self-contained tests in drm may leave .hdrtest files in
> > include/drm/ and drivers/gpu/drm/. Omit them by adding .gitignore
>
> This has already been the case with usr/include for
> CONFIG_UAPI_HEADER_TEST=3Dy but I guess nobody noticed before.
>
> Maybe fix that too?

I think for usr/include there's already a .gitignore for that. For
example see commit  5134e94ac4f5 (usr/include: refactor .gitignore).

>
> BR,
> Jani.
>
>
> >
> > Signed-off-by: Yo-Jung (Leo) Lin <leo.lin@canonical.com>
> > ---
> >  drivers/gpu/drm/.gitignore | 1 +
> >  include/drm/.gitignore     | 1 +
> >  2 files changed, 2 insertions(+)
> >  create mode 100644 drivers/gpu/drm/.gitignore
> >  create mode 100644 include/drm/.gitignore
> >
> > diff --git a/drivers/gpu/drm/.gitignore b/drivers/gpu/drm/.gitignore
> > new file mode 100644
> > index 000000000000..d9a77f3b59b2
> > --- /dev/null
> > +++ b/drivers/gpu/drm/.gitignore
> > @@ -0,0 +1 @@
> > +*.hdrtest
> > diff --git a/include/drm/.gitignore b/include/drm/.gitignore
> > new file mode 100644
> > index 000000000000..d9a77f3b59b2
> > --- /dev/null
> > +++ b/include/drm/.gitignore
> > @@ -0,0 +1 @@
> > +*.hdrtest
>
> --
> Jani Nikula, Intel

Best,
Leo
