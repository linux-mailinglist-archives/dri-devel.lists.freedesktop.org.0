Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE37BACBE1
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 13:58:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E410A10E2AF;
	Tue, 30 Sep 2025 11:58:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lEL/kamK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C755B10E2AF
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 11:58:17 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-2698d47e6e7so11885455ad.2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 04:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759233497; x=1759838297; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VcwjoiI7Z+OQfUBE/J+XJHgAGKhZ1AOP0RhfLRLtwcY=;
 b=lEL/kamK4kg5Fii76eDT7d+VTcU30muMbirBzFF5j3at5lZqoAbPrafSbP/w3t2Ds0
 icPZLJEH3zdFZam5LrMndDyLC5z1qVBljGLt0kvz+mzld61Vf3t0OqFvPjudfrDdFAq6
 jiJg6jkxluq0CsNFnJVOkApZLa9YK0VQKeFR+CE/jmeuIMwq+jIkmiR3Gb7rSsMpnyWP
 +epxMiLMUz2/kR7NJSd5IWXPPTkkZ+mH9OoA9zjKT3bJg9XGLcKsDWUlcjddOlSgdyxH
 MnoJuJ0nP3dFgNLlqTXHrN+y2Ru0MN62fqqwONLTbWLOdPI98rWGMrGcK7XaslY8MCao
 XKUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759233497; x=1759838297;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VcwjoiI7Z+OQfUBE/J+XJHgAGKhZ1AOP0RhfLRLtwcY=;
 b=hihHJQlU/854zd3Py90aQtfvLIsRaP6AfKHzFhX0kasrhicKZxIFCtUSWTf7f4HFOt
 dgTByOgcLfNg0gpIVfLGRydXckIAJn3OInugxxF23BEPN3fj2NWZw2QcyVwDYK24tDUC
 eP9jbwi4H/Rn62pKRhDLF21xTD9BN9mpKpqmKP7rC4Xy3sMo8RktVtD+HE4OQ0Ed86l1
 lDq4Qg7Ycwb6CDcxwQDosRFgFOI+6OBuC2cnFGERlUxnHdV+X/fNOOidCTpXsrfZLVTU
 SRRGdTSrqk9rdnnk7487tJtnjsPVdYPodGbCHGbz7MzBjYHqSAiSQdR8AzzDf2PvxOOg
 svQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrVFDTWEPUE/RoAMgzDa5yonIQoEjI55MEn8uhUbfhUqjNTMa+2scsus2qeUR1TVdEUUjKIpg5rdM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxy5F5mLFtsmHFEjizDsLDp9vsqbvbV7vUaoXoAzVIdfmpjUD1S
 wq6REhLVnzA6tJbxsXPWtuADbs345nMpMLuiR91mOjgNkGLKSa+XBSYQjcXQ62lXSfyFplgGZR4
 4FcXls3Pb1vPA0NIG8VS1ZwvtoITzEyQ=
X-Gm-Gg: ASbGncs3yyISYuLQEzyK+rldl0uE/HnfUUnRwz+hIsHDfXEIGbEfpdFKm0jU59gTpNI
 pwzG2G7UMWjOadhR4tI3cnLFGYNz15CAn5nL/67UB+GI8Vcju+vI5XdTU3jVl+yqd7OWfCH9qfR
 IPMQzxk9o2Wp0BpLfEHNiEIZaEwSNhRTHk1m4TiDesY7DyxghSGMDDd8XbyalEWhN8Gnr2sEd86
 f9NP5InoCiF9mCO0h1IT3F8yFMbVcdY1qaD+4GAGHV1tCU7Xwj/BtBQVC2X8xYV9F7Gk823L7zf
 FkL1XaprUs/hgyY7cognZlKfeMelxlOm/CXgckGwZ00JuZAMuw==
X-Google-Smtp-Source: AGHT+IHJ4gNihkr+mad+gS8QEVDP5CM9acJAgm5Gq0rNyMMXGiM3fVx5RNRww0KuhYTEhtNZfq1z3GOBVp8XDPlUzw0=
X-Received: by 2002:a17:903:1105:b0:269:85aa:3776 with SMTP id
 d9443c01a7336-27ed4b5dcf1mr121341885ad.11.1759233497228; Tue, 30 Sep 2025
 04:58:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250922113026.3083103-1-apopple@nvidia.com>
 <20250922113026.3083103-6-apopple@nvidia.com>
 <DD2GCDGQ7Q4W.1CSFYSETFSN5H@nvidia.com>
 <7brvf66smc3ltqrw7tm7smth6wnefeqykdm2n4qahi5xnr6d5o@4l5xfdbznlp3>
 <DD5CXDR294YD.2RL474PWBDWTV@nvidia.com>
 <CANiq72k3qkj1HxjnCoknAdWhdM7O1ZBkZDqBsVS7vxYH-tRCWg@mail.gmail.com>
 <DD5D5SRBMW4P.3JJPQVDF5BZLU@nvidia.com>
 <had7hms7ex4w4bvy2mfwtltyyt2xhsn572brrxvibvufxt6fuf@lppudpzwct4a>
In-Reply-To: <had7hms7ex4w4bvy2mfwtltyyt2xhsn572brrxvibvufxt6fuf@lppudpzwct4a>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 30 Sep 2025 13:58:04 +0200
X-Gm-Features: AS18NWCdBljfozdePu6TUcKqSpCpdgxpMnivW-rYDv0CmHf3eUP5HKxAK6E3ccI
Message-ID: <CANiq72=hmkF=FNiWknrKXeLz4EK_eqLQa2647ejJSfukb9B+-Q@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] gpu: nova-core: gsp: Add GSP command queue
 handling
To: Alistair Popple <apopple@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, dakr@kernel.org, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, John Hubbard <jhubbard@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org
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

On Tue, Sep 30, 2025 at 1:42=E2=80=AFPM Alistair Popple <apopple@nvidia.com=
> wrote:
>
> Thanks. Is it still expected that `#[allow(clippy::incompatible_msrv)]` i=
s
> required? Just adding it to `rust_allowed_features` doesn't make the warn=
ing go
> away without the allow, but maybe I'm just doing something wrong...

The warning is independent of the allowed features, and yeah, it is
expected that the Clippy may trigger (at this moment when we dance
with these features), so you can just allow it locally.

If it is too cumbersome, I may disable it globally.

I hope that helps!

Cheers,
Miguel
