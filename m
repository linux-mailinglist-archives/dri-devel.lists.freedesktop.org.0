Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFDDC3169A
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 15:07:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCBF810E60D;
	Tue,  4 Nov 2025 14:07:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HYpO5of7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 542C610E60A
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 14:07:28 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id
 41be03b00d2f7-b997ae045b7so255261a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Nov 2025 06:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762265248; x=1762870048; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PEGyLJUT+zzSFJ95q6Pkl8/xdguEfP2nRB1yIszhyZY=;
 b=HYpO5of7+ChUFiFxcq0BpEVvNZh0YfW8ct8uyHSU+j3MchH8r7fx2gXBZLYrPzo4+y
 Cl++etFLgDL6PpZFLaa5FSzeTzluMEQzi2NZ5LuNNxBzdeNh6j644NUtNbM5QlhkIASh
 FXZYRDoQXnwmHd+wNIuMKDL6L7RDeEGSKhGjlM8C0p3gyV4Vm6AyxFUnoQhMw88O5olh
 fDngacDftzcON7kk1TGLLnW8SWm6Yd0+esPEpFyv3OKjTXQ2nDVhG+tX+jmvBJYsHhj7
 +96P97Thao9Wk2C/11JzFqMZYEzEP66fR9pQqRxsJD09oelvsX+vULocAFgirIsxCvnu
 2e1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762265248; x=1762870048;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PEGyLJUT+zzSFJ95q6Pkl8/xdguEfP2nRB1yIszhyZY=;
 b=urJ9bvHHw97fRRCIM2Eh93+bMA6a1kcG5ooi0hlNmVeQ+gSpbwBqR6CevZcipWRHRW
 Mp9FpdmGQ5jIDCuWKfMW/XM2NqQBDcRjGgQR2KbmEK+MddXIUx6obCnPca7VUig67IYZ
 Fvosn3/2wAW3F87B17MNgDvGPiZ02DTQgu/zAEMpQ8+k9tTVqwFDM1UNRTVWy0AHmMwE
 wDK3BA/CM3AfCrbIR8iJoHewaLQIksBFfm90zdUVocoT1s0R1d8WocHManmRsC2MF7AG
 MPNN/eSKYgWt69DcmlfTMt7V/PKN5pl2u/iniQqjIrDkndEYwWHtOQWeSuPxi+IhYiGd
 +3OQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrobnNljfuDqmixkoob/+dtJlfpREOtwBcX/i31iaOwXbpcKoQW6ehVuWs713auf4Z7QfGrie0beg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwLswGPokJClfRS5uUkuN+YA/RBAyMZw97QwdcGNNnaklyeBUp+
 LZCBg/6XqVEGM9dpYJ2dFfU4feC8TCvfEHKIWzgr9sdngoIH7eaDDef68jXuaFaBquGkz9y2VWJ
 UJSm3qCvMckgjWOkC+8Tv3bcgL83yEi8=
X-Gm-Gg: ASbGncvmkaS6Wc2KM0SEXJKIgh/8MwfQ8NLZuP6H4tDqohnUJYUKkpQo1M1/G6Q/TGY
 TQRxLFoCaqUX04kWcASizf/rUBsU7K0VDJ45ZQbkUV1QO1tVNDlDNQ4xOfcZB4lcvlyXiyCJspK
 MTjPkm5QcCY1N98ah5MLCloLgSgwydF/E604Deju1/dME7sZO1LH/MX/RqxAg5yyDRC1dLKrGQE
 nLn6Sewfh9lrqduJywOaEOYkH5P8SoVcqclrraJqDwH7bMIKmtly2o+/t8i9q9iBOlURAEJWAhg
 s03OlJqATlc/iKcIjvmsqpzVxx/bIXQouJqqVJ49DOBHGywJm4UQYPjgb0xT7XwlIi+WQAsDf53
 YheMS3jSVTWrkjQ==
X-Google-Smtp-Source: AGHT+IEoQt7wc4QhveCREcNLj59n0mc2+WwtyT6a1zVCHIjoX1thJlflh/bTa19DZhwmYOUd1dkkOIBrsDu+HwIpQfs=
X-Received: by 2002:a05:6a21:a44:b0:2df:b68d:f7e with SMTP id
 adf61e73a8af0-348cd411b8cmr11613230637.5.1762265245767; Tue, 04 Nov 2025
 06:07:25 -0800 (PST)
MIME-Version: 1.0
References: <20251030190613.1224287-1-joelagnelf@nvidia.com>
 <20251030190613.1224287-2-joelagnelf@nvidia.com>
 <DDX1WYWQNTAB.BBEICMO8NM30@nvidia.com>
 <20251104005812.GA2101511@joelbox2> <DDZYCRCPYMOL.RMTIF0R404Q4@nvidia.com>
In-Reply-To: <DDZYCRCPYMOL.RMTIF0R404Q4@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 4 Nov 2025 15:07:12 +0100
X-Gm-Features: AWmQ_bnRfHv_8j6zHrslJDNBWq9rDs6IM9lMFZ907aXIc2-_3edh4KvJlGf8RU8
Message-ID: <CANiq72=Cj_gJ27+EAiytxYGYk1dMwu7M3xQpLGByD4QstgDsHw@mail.gmail.com>
Subject: Re: [PATCH RFC 1/4] rust: clist: Add abstraction for iterating over C
 linked lists
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 dakr@kernel.org, David Airlie <airlied@gmail.com>,
 Alistair Popple <apopple@nvidia.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 bjorn3_gh@protonmail.com, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Andrea Righi <arighi@nvidia.com>, Philipp Stanner <phasta@kernel.org>,
 nouveau@lists.freedesktop.org, 
 Nouveau <nouveau-bounces@lists.freedesktop.org>, 
 Guillaume Gomez <guillaume1.gomez@gmail.com>
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

On Tue, Nov 4, 2025 at 2:42=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.c=
om> wrote:
>
> What I'm more worried about is that it might be a PITA to write. :/ But
> maybe the core folks have an example for how this could be done cleanly
> and in a reusable way (i.e. we don't want to duplicate the dummy list
> creation code for every example).

Using a shared module/file may be good enough, as long as the `#[path
=3D ...] mod ...;` or `include!(...)` is hidden with `#`, i.e. as long
as the user does not need to see that to understand the example.

But, yeah, we have already a few places in the tree with fake `mod
bindings` for doctests and things like that.

Cc'ing Guillaume in case there is a better way to do this. The "have
something applied to several parts of docs" has come up before for
references too (the "external references map" I proposed).

In any case, even if the example does not run, it is still way better
to have it at least build instead of completely ignored, because that
means it will not become stale.

Cheers,
Miguel
