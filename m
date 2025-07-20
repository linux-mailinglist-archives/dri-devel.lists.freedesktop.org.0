Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB99B0B424
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jul 2025 09:50:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9521510E04E;
	Sun, 20 Jul 2025 07:50:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="PlYGJWpA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5B9B10E04E
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 07:50:46 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-235f9e87f78so29519995ad.2
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 00:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brighamcampbell.com; s=google; t=1752997846; x=1753602646;
 darn=lists.freedesktop.org; 
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1EIzLiEKFNKNhapurV5TiPfyoyMNTU5jV2wejXKsOv0=;
 b=PlYGJWpArNn7GylQMkN69vYU1Tuv9A7wJAPsSkenwJvZvh5xvki4tRIgvj7RE98/UW
 JJ+FmCIn+K9dlznh8iX5CzUBTyVKpUIDoF29sXF1Ah+P83SpD2NgNfEFRAU9XNHyrc9c
 fIb2VvUzyUIQ9mTEv04y2rUMQY9rJ7teTO515fQDwI6/JwWT4LNc0saCcmk5n8lMhxBD
 IdKsDEFnuex1Udu1ZB2uXv9tzYUgA/lyHXCTVkpyUc1liBEA8Svyb47SSkyXWcqIt09L
 t1eY1rwDxdfSaFjqeoJsyMuNfk/9JjSgBHw4m1Yd4Y5wiJmaw79p1vlROEzjLhBEwAPu
 0GcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752997846; x=1753602646;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=1EIzLiEKFNKNhapurV5TiPfyoyMNTU5jV2wejXKsOv0=;
 b=IwGp25oDncQQbwz3P0+ROIuEWIZqp2niievqt9yj+zWiubDrw3jG9OxnmNsuNtoUhk
 Ip1mHV1aNWFnUKT5BxaL33KKO3ReqUd+n4YhTuhCzogl0CWoNAwJhwR2FA5l7a0v8ygv
 EIahKspk+T9qJhAtg7WGVFEKglAVMmIreovdpcR+iQt/1RjyIN/fREwyj00XepyAQYgt
 dRVs1XAXB7krhuMQiF92ijABfHInvcTgy6FVRNGifYCTsHi6xlkwbWIAVK3284AbQ0pz
 fU37t41BFcwvAtbZ4CiuV0qFGjRrt4OoIIfWHPhZ+vOCq5LTpR966SHqSj+gGzVHMLtZ
 3OAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoRl4rkGCN1BxK8hfF01hPVrL/MPzyBYY8dEoIFU6fp/lKq1lA8f948MQS2L8sVhGZdCvCaBSddHI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwBknvQ3a8L3D2ZbxR7ejgIGK7nLEy/dlEoCU2glnECOIsHB9K9
 1aXIEnLsu6Jj4Hi7kQGtKIZR1wfAOmPJ6QBJtASSDLmZaf4m165XfHMTZWEwjLS9ye4=
X-Gm-Gg: ASbGncvSg6b68SEUSJaXy/Mik0jXqIR2V9vXNZSEydqL/+MrZnpgVD4Un/pk3eOeej9
 zxYescY5Pmv27KpvcEDrun+8YzjrWinCIDcrgZoY/GAF/ooV1UzxWv60d2/k5G6WCgeQNyRjkEs
 slo0uYXxOHJSOj8xtlgRUG944ifo7ImMHGmqCTYwHd0/oYpMA/mrQeB/qbAYVvEE/59PwqMxy75
 kJkWTswonMvhHfBGRfRXKsD6wf0QCnFO3k8lehR9oeboQDQAnyUkZWBwWquHcAnu2ik5eO59PmY
 eu4hYqpUnv8ryAy8DTte7Rxq6qaQZPj7OG0GY2Sjwqt/WPaeLYCJZnvbkjIj9tKbueYbK+fd8yv
 ihAfRb/QUnFXPskEDLT0=
X-Google-Smtp-Source: AGHT+IHLtegd1iyRVDLN/vP8oO8twGnp2iC58ZPKXolFVDdIfrLW6ekD318QbzbDW8XkVDBKOe/oyA==
X-Received: by 2002:a17:902:ef44:b0:234:a139:120b with SMTP id
 d9443c01a7336-23e2566ae6fmr224043965ad.11.1752997846197; 
 Sun, 20 Jul 2025 00:50:46 -0700 (PDT)
Received: from localhost ([64.71.154.6]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b60ec88sm38530095ad.65.2025.07.20.00.50.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Jul 2025 00:50:45 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 20 Jul 2025 01:50:43 -0600
Message-Id: <DBGPVFN5DTGU.5UTP35ALYS2Q@brighamcampbell.com>
Cc: <tejasvipin76@gmail.com>, <skhan@linuxfoundation.org>,
 <linux-kernel-mentees@lists.linux.dev>, <dri-devel@lists.freedesktop.org>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Jessica Zhang"
 <jessica.zhang@oss.qualcomm.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
Subject: Re: [PATCH v4 2/4] drm/panel: jdi-lpm102a188a: Fix bug and clean up
 driver
From: "Brigham Campbell" <me@brighamcampbell.com>
To: "Diogo Ivo" <diogo.ivo@tecnico.ulisboa.pt>, "Doug Anderson"
 <dianders@chromium.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250717164053.284969-1-me@brighamcampbell.com>
 <20250717164053.284969-3-me@brighamcampbell.com>
 <CAD=FV=Vrp9MM_5de10sV-TC_mp-D7en9gjU8DBoD6mBrRvF2eg@mail.gmail.com>
 <f0d300fc-0141-4eab-a888-d1d32778f5de@tecnico.ulisboa.pt>
In-Reply-To: <f0d300fc-0141-4eab-a888-d1d32778f5de@tecnico.ulisboa.pt>
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

On Sat Jul 19, 2025 at 11:10 AM MDT, Diogo Ivo wrote:
>> nit: can just be this:
>>=20
>> struct mipi_dsi_multi_context dsi_ctx =3D {};
>
> I am not an expert here but I was under the impression that this is only
> valid with C23 while the kernel is written in C11. Is there something I
> am missing?
>
> Diogo

You're right, C23 was the first standard to bless the usage of the empty
initializer, ` =3D {};`, but if I'm right, it's been a GNU extension long
before C11. At risk of being pedantic, I'll draw attention to line 580
of the kernel's root Makefile:

KBUILD_CFLAGS +=3D -std=3Dgnu11

The kernel is technically written in the GNU variant of C11, extensions
and all. In fact, the first patch of this series uses optional variadic
macro arguments, which aren't a part of any official C standard as far
as I'm aware.

In any case, a simple grep for some forms of the empty initializer shows
usages all over the drm subsystem.

That said, I don't know if GNU extensions are formally documented or
where one would look for that information. Importantly, I am by far the
junior as far as kernel coding is concerned. I yield to your experience
and I'm happy to change this initialization in v6 if that's best.

Cheers,
Brigham
