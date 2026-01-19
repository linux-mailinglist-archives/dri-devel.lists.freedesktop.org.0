Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9245D3AF6E
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 16:46:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD6D510E49A;
	Mon, 19 Jan 2026 15:46:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YIX2OQhe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F77710E49A
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 15:46:16 +0000 (UTC)
Received: by mail-dl1-f49.google.com with SMTP id
 a92af1059eb24-1244bce2c17so324536c88.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 07:46:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768837576; cv=none;
 d=google.com; s=arc-20240605;
 b=VbPKZIN4yJEhXfKCJnRieB3Zafn/PqfzeyDRUpOljcr0PCgyC9wRdKVernZ2BToNJ4
 vW88LgLeMOt4Jd3nroZIQGle1vcEGcigQcRTqeECJfOUZE+I8pt6h0Cp67l8TDc5vIJd
 M7cz3n4OAsZcHmMjwAK1B21dJzMumtnPaHnbJNY9ABmlIlMDjlcxEoEiBdsK/viLw54u
 yzXUp24xv17PvrjjN8ZiBVfS3ldCuJzNMsZuj9yNch/AOPVTuCsukpwlqW7BG1XVDtz5
 +SlNQryQuPuQi6SQjmMQzqZEcSvu8ivX75SqXjDd5t7wQVQplkx/XZJYPQnkswfORdoi
 429g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=46u/WokqzTLpaWP1GT0SroKxBKxCn8SDXm21fmrsTi0=;
 fh=oqSBGnnV2EYsJk54e/CvbFNbVjopc+zFWApPaat8R/4=;
 b=gVkmT+96zhOdR4aELnYftnwlriXRqwp36XOxVK7Flpb0gdJO+i16ihABCZ1ouRu+1S
 ue4Kqe5CMVk8KgrXMkz6OR508nXbhBcB0Rq/Ox2MMbKgku5UuyQn6TZiIV2v96tgL3r3
 mj5q5nQYIIKF2/2gVHESsI0gGr+GMkBCEWf73dfaYmj/LoyHuLGETKd1vxIzIt8Fo6zQ
 7Lof4p9zgpVixdZeQjCpP9dmR6MRuoMf99HWDw8UMpUXKQYAJW9RgnIvClkTqioPkSdP
 O8QB0u3wolJ14IdBrjwf1TqOfCPORSozwGB0E8hr3X1ImA+bDBeM2K87RLehQ+h2DKOc
 ls7g==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768837576; x=1769442376; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=46u/WokqzTLpaWP1GT0SroKxBKxCn8SDXm21fmrsTi0=;
 b=YIX2OQhe8sDW/q0lDtAWMGCraAkdet+CIj7phZOfb7X7XXNlA1j1BPeIqfo7hs6SJw
 0aCwHPwNfXJQ4FiJRwEK79jVvredGpuKA4pv2yXQZeik/Y7YcK0+yt/D6W2K2D/lZnAi
 XMPs3txjA/s/5iNy8kyFodpsuGp/c1g8yICPFTHx0JuzC/YcIwSm3HWdi/1r70LPDPqp
 tAcUNCunl1pCYCT8NIctxOyK/fUJY+0Bt8FUFjvX3zhEqhyjsKD/5jYzyISJsZDU08yL
 SSPU3uDjKDE2cZqjiiJJsvLg0rDYq7nZrTdC2knjDKpXj2A2lm8lx6Lt3X/9tsd5FE6w
 v5xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768837576; x=1769442376;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=46u/WokqzTLpaWP1GT0SroKxBKxCn8SDXm21fmrsTi0=;
 b=ZC+M6QBaP0Aajs580IMWvlt/WVnnLH98cl1CcRstQcNg4C2+5bTDacshUJLp86jpwj
 3nrU3639WVi1Avwd1hsFqOx88TAOJrGp8J5aZlNJPfvCQ237OaUZMD0/anwdji4iRorY
 sJz9ERBNEH3CMU0e8807CFu0pWTPZFyAjrlWCU+Q/9Sn6UejUD4TTyxmm6X2lQPrNZtJ
 Ev72qDzes7SSmU4ZwCcgNUQ0/idJ/tq273EtFvKEzS+8XdoWkubplViwtgphIL3kZ2xX
 QbMNx2wf5q8fVj6lknX9wiA44MDjoJHWRkYQIvW24RT5w0V9PDjp5xlxDGACDWF4kqn1
 /3yQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrhplD7uxHg6k9uscWGc04jEr7w0CAiEbncPsXsvVLkMUttty8nbfX+46aBZGo6iVwLvuUwEJz7UA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxgDJN+hh1sjMNjOwCVIvp5YGv1/Mdgu5+KWjt1ua3l5tykfidR
 UuR93GsN9ZOdTITfFsJhyqm24RU4NgyqSCP7H5xa+d3uJOl6oC6/2JuNaUp8GRT9fBkEziwooTD
 6aVJ29FuS9sjJVI0sgixj2ocRgJ9iPKM=
X-Gm-Gg: AZuq6aKAzcxIvxPEqFrPkfhL4Xf6DRv2qyAjAyJ1iThd1rgW5E949/RDSj8d/pOA2NP
 0T7VbMp/JkXAgl2n4hwxoV/p3qkpYB0CpntfJskVLCd4y/mFGOfFYPxuJf95e9jhK3eRJKsCsOa
 eEf/8pg+DDNBglvUvn6Cb+r48EO1OPdcR4K+1HqWATYtU7ELQ3r7FUuCV1CF4NNa7Fh970fYUUE
 GVoo1Ezca8hBTIxMvBxe+L/DIgOjvMNYvhcYbi/YpGv7+7I9+OLIO/2MM2zYhY56P+Hd1dNK0Lu
 fxe7KDO+jZCAQ2omfVShYN4NVzJOn2qN7WS6ikjKw97ZVerb1180Tjko9zPMzEPoKDyuqczRRNy
 dMT/rbLGu25jm2aRVrtbFCNk=
X-Received: by 2002:a05:7301:3f13:b0:2ab:ca55:8940 with SMTP id
 5a478bee46e88-2b6b40fc353mr4845380eec.7.1768837574267; Mon, 19 Jan 2026
 07:46:14 -0800 (PST)
MIME-Version: 1.0
References: <20260107-clk-type-state-v3-0-77d3e3ee59c2@collabora.com>
 <20260107-clk-type-state-v3-1-77d3e3ee59c2@collabora.com>
 <DFSMRQFIYQPO.1A38Y84XZ1GZO@garyguo.net>
 <CANiq72kcRQShDgMJKZ+ekUEdP1T6Jr=4PDiMJCqnQjgCQEK_eA@mail.gmail.com>
 <DFSODY3NWRBQ.2VGQWXERVW1R1@garyguo.net>
In-Reply-To: <DFSODY3NWRBQ.2VGQWXERVW1R1@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 19 Jan 2026 16:46:01 +0100
X-Gm-Features: AZwV_QjEkXpU0cn_dPvCmG7mx9ccCkl54ToiMM9A8sew4Jw7jWCplASiAflPTPs
Message-ID: <CANiq72kCi8=mK8V282O-tsbWvLC6M2vdc50mnLW3M3pWTACyOA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
To: Gary Guo <gary@garyguo.net>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Danilo Krummrich <dakr@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, 
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
 linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org, 
 rust-for-linux@vger.kernel.org
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

On Mon, Jan 19, 2026 at 4:36=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> Which crate are you talking about? I can't find a linked crate in the iss=
ue.

The commit message (i.e. not the issue) has an (unused) link with the
`sealed` crate:

Link: https://crates.io/crates/sealed [1]

Cheers,
Miguel
