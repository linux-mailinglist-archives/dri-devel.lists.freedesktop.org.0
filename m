Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D426B50844
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 23:36:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC39710E80F;
	Tue,  9 Sep 2025 21:36:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mmC6RLSz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DF6D10E806
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 21:36:44 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-32be3e6a0fbso393150a91.3
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 14:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757453804; x=1758058604; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tri659oiLVCd6VfYpPQXtF9OQ4WThWRJ/JELvDiFurY=;
 b=mmC6RLSzckm/+5ENJL9kV+iiQL70368o32nVmpyKYGdqObFmLtUlEYu9hSNPJLk3g5
 0oMMLrfMPFspvHbvYGwlnqsTFKN4YX0yIh206+hVxarrRf5+MXDzKI6QqVMypPrUId55
 TMNT5cu6f/QuwzISiO7g7T9F+hlA9sfiRI2hfLC2MFXIiLraJZqnwOmp934GvJSgxUiF
 YtsWF26OMabu0Z7OEa7Cf+SZy5c775A48rK6cGzhOqiAmx0UjtJkSEsh62493kDhw8vS
 bfkHiBuwFpTe3UUACp9HVjVH0CrxkseModIaZEI6iV+dyLzpiB2kAAVIOXeyReMqaWPu
 Xhlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757453804; x=1758058604;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Tri659oiLVCd6VfYpPQXtF9OQ4WThWRJ/JELvDiFurY=;
 b=dqWMndEi+SyH2ehmBeKtmEOiQMgfPY36h7IRK/rl+zuEKibO34eJCbXIWMLVJba3kC
 JeRHjONpqgLyS0xr/y0OvZUxGJ9aFRNAn6SDr6bIAWe2h5FQv3CYJ4msrzdE6irqeACe
 UAIcLBoMJRn+gvZXD97IOOzpBV/xqYmpmuidJVBK1jA9BXuvsFFDDlZFry81Cik/Ozm6
 fyyrUBl6RPkzhSS1u1f/j8i2bAIs+Gp91c6yM903fs2z8uov3n2QsEUvXXH4KJG4BynP
 5HuEufXakkUtPpDh8FXLDCWPUAebeXaRcUOCXQSu1RCLWu2j5Bcf6dz4ZQxBGqb1EocS
 4bDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhdf8iUs9YMUbz/ODKfs1fRkEpxDtQifrOn5UE44KeT2maff/AldhuG5uN8bben+vGQbBZ4eK8aDg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzaYzTg9RPWr+30ARqNz+mY+v8p9A8fBnCfNMMnhoB/u9pb7TpC
 8iN2x4l2EoLyx9SY7QsghDSoOXp5JBZZQwUp5LUN/97F+zapa+gOpSuPFYD4DzY+TGLVqhkwcaP
 nZfRgBLFcfRtDGcwyoctacTi0cP0a/SM=
X-Gm-Gg: ASbGncv2f+8+MlHWxJDY/TuTfHIR9dfKIwnXE1N6hzgsSgwdEzA4SGaXzskMiANED2D
 Acvtei+S59zgMacrgM0XMR32YxgbGHTqZ+xVTFCg/3YuoDu4urMwGHBpYPAgCW1Zr+tDVzWI4/3
 OnZz15KMQrUc9ICxR9Lis+RzpLJm9c+zbQn+DsVxF4/rCzPXKoHOL8yNKgFiNCqSm74AQH8oDP/
 HSnZCBoNF6zR2V+w26I/CawIj7TP+yPPcCI2PlUlV/Rjwzas+DKYU4Hnd/vtXW5A72HbD7DnXN8
 ZROm4JlKmwX9cHAiU1gcRFXTwbhngk8+/1Logc8TdXs9yJs=
X-Google-Smtp-Source: AGHT+IGfWuRbBLApbA1biIsSRGuFYUHQhWq6XH4sIOFxuFSe8wgAAY/n3W+S5dtyGYo44L8oScz+D23Y+e9Y2jG9A1c=
X-Received: by 2002:a17:90a:c10d:b0:32d:a2c5:902a with SMTP id
 98e67ed59e1d1-32da2c5994bmr2271358a91.5.1757453798983; Tue, 09 Sep 2025
 14:36:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250909212039.227221-1-joelagnelf@nvidia.com>
 <20250909212039.227221-5-joelagnelf@nvidia.com>
In-Reply-To: <20250909212039.227221-5-joelagnelf@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 9 Sep 2025 23:36:25 +0200
X-Gm-Features: AS18NWBWIRvK8uXY04bEb1NxF81YxjlANyREK55xtT2E0vJdhqdmuYSI_9VSyBo
Message-ID: <CANiq72nPQps8ow00AmUe3shArHyhCUSSJX4=6QPHfHQZ_QeqcA@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] rust: Move register and bitfield macros out of Nova
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 dakr@kernel.org, acourbot@nvidia.com, Alistair Popple <apopple@nvidia.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 bjorn3_gh@protonmail.com, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, John Hubbard <jhubbard@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, 
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>, 
 Yury Norov <yury.norov@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, 
 nouveau@lists.freedesktop.org, 
 rust-for-linux <rust-for-linux@vger.kernel.org>
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

On Tue, Sep 9, 2025 at 11:21=E2=80=AFPM Joel Fernandes <joelagnelf@nvidia.c=
om> wrote:
>
> Out of broad need for these macros in Rust, move them out. Several folks
> have shown interest (Nova, Tyr GPU drivers).

Please Cc the rust-for-Linux mailing list, especially so for patches
that add things to the core infrastructure.

I notice easily because I tag the ones that are in my client :)

> [Added F: record to MAINTAINERS file entry as suggested by Yury.]

Please don't use [ ... ] nor the past tense -- for normal changes,
please use the imperative instead.

(I guess you picked this up from other [ ... ] notation, but that is
normally only done for modifications of a patch by someone else, e.g.
by maintainers.)

Thanks!

Cheers,
Miguel
