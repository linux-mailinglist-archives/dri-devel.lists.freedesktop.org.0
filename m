Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCA9B48109
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 00:30:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 442F110E05D;
	Sun,  7 Sep 2025 22:30:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YYPmAtqv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CA4910E05D
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Sep 2025 22:30:07 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-24c95f20117so10477985ad.3
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Sep 2025 15:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757284207; x=1757889007; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YiYQFvOAi/L3rfcO0B8Dn3oJyiTeX8xkf4kbnG9dX4Q=;
 b=YYPmAtqve36O8CuqmusvLjKbHxA8P3O0iZffIBiSAW8qyIvtvX9mI93AltITXl7q2H
 kJ4G1uj5E/oVixYYPT49/WOO6Y7HeJfE8DxwmJ8gTI8HtptEq1NV71+8lmNrrEHObht0
 j+1g6RDDqXsMYTLfRCW7GmJPCfab8g1Q0py2DcqJIHwWAh1d9vTd2FpUD6gzz0Ch+Crx
 V65XOTycQUiFZgcFbmiFBWBlwu6ZLOfSwKlLwE/NB6LS7qKswrO0x+jqhwaBhe9i7aTK
 iQFcDS5qZPcH8wDaMeEndL2lc+VWreDc4wK9mohCgQdQ0qN0OWszvruKJc9xHjMf287K
 7RbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757284207; x=1757889007;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YiYQFvOAi/L3rfcO0B8Dn3oJyiTeX8xkf4kbnG9dX4Q=;
 b=iT1ToLkQXkp3X0YRKlar4aijgM7T0oD2DnB5pbITTBuE35+p//y12PYHTIqVRkJXfP
 WzqTwD/9iEqfgDoCpyxwKAEZb5gO8xyxMPPHHMNmDNEfQiPVsklRFt6UYLOZkzXtNY5U
 mGRm6DdNCxM8fG2BPmLZfScTNRuOuoyZmicGl1xRnwC5c9UpEWq23lapMC4YQhK+/QTS
 W+BA5hzX6eNkBwRsHZcWGLGU0x2TvaOlnSI6+DYpl/HsZCxShUFlpMTbsMCIQAF5Q0XN
 JHFEBo61SUMl3Q9238v2Uj4SrPqMlNwqRapI/QDs+RG2yKOyAPW4pqao3ODdaGbvnpxB
 iRiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVdl5IuYaeSBtKK8Df0Gr9KpmuB74qcYCTQMWqfOS+36izBY/XItcxK+aguuKUGSRCM5GmTpMBCa4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzdf9ZyCshyM5tzLzthOAK24f14soFRtpBC0KQjgNXbmO+4opUn
 8roqgsiIcgvr+sc7y7yab84mg9hw7+n+p4ss5s9HTP1bFHgpHyPFyRxHY20l9EweUbCRCZBLCfE
 7IlRNnsprS5wjn+f/xTubCvl3rfMD4KQ=
X-Gm-Gg: ASbGncs92tNTQ3oZWE3ZO1gFcrfMVeAG5fAy2Fxgp3VY9XRTROJvmQOmgy86EsHFYfc
 TcE6NxrzjSEQfBVm4JRERhAoymnSdnSr8p/FG0mauxM6mh3sysoEB7hHXyZC3q4OnUi4EBNLjGX
 R5GbFv/xodSndeRsvirVjVQL9Y08EKSIP/PU+eIsGtMu8jOA7oz1wRrXZptzrKCSIKwgX3OtR3d
 zkm+XFrOWIq7GGLdaukoip/wnwPvPOW21lnirK2LIKQKhrPBs7Fa9RvzjQMo35fgZStmDbswEZF
 i8aS4+9SIXwRnGsDYk0+ODRlEg==
X-Google-Smtp-Source: AGHT+IEJXHXVeEXiUuxDDtDL+F2z+Li35l5mEMwus84iNqmeDyb9GLSYacR9e0Qf9AaGo8FSywEfNdNTn/METasbJfo=
X-Received: by 2002:a17:902:ce83:b0:24c:b881:201 with SMTP id
 d9443c01a7336-251757ba959mr44510665ad.9.1757284206873; Sun, 07 Sep 2025
 15:30:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250730130716.3278285-1-ojeda@kernel.org>
In-Reply-To: <20250730130716.3278285-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 8 Sep 2025 00:29:54 +0200
X-Gm-Features: AS18NWDiFBEztBvhh545-DHfsVGSBiVzynGVpEdm2_GOyJiuoW_17RumQHpRyQ4
Message-ID: <CANiq72=gYXqcXyVK1vq36Y6ofv4QQiLLgnAY=zhFVV8CGYuziw@mail.gmail.com>
Subject: Re: [PATCH 0/3] Fix broken `srctree/` links and warn about them
To: Miguel Ojeda <ojeda@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 rust-for-linux@vger.kernel.org, 
 linux-block@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, patches@lists.linux.dev
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

On Wed, Jul 30, 2025 at 3:07=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> This fixes a handful of broken links and introduces a warning to
> prevent them from happening in the future.

Applied to `rust-next` -- thanks everyone!

I added Cc: stable@vger.kernel.org on the fixes.

Andreas/Boqun: if you don't want the block fix, please shout!

Cheers,
Miguel
