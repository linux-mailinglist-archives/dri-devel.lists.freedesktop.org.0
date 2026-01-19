Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 274BCD3AEE4
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 16:23:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EA6C10E172;
	Mon, 19 Jan 2026 15:22:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XgaeVOHg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBCF910E172
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 15:22:55 +0000 (UTC)
Received: by mail-dl1-f44.google.com with SMTP id
 a92af1059eb24-12339e20a87so169283c88.3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 07:22:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768836175; cv=none;
 d=google.com; s=arc-20240605;
 b=NpRgPAKj7FkLFG6ea+Ma0uPfSfBHuzPD/4dWuHAdXlvVHgBv756ZiKQkFbE0SthU1d
 ZZr+H+KFMjj6ige/EKHtC7Dr57F8ofokqfMAaAqeIuQB4v/9drita7yt6enjQr8KsY0Z
 PY3sNPlkv/4nAsS5M7AAmSwbbgc0mJomo4fClpeumTmdM/HvvLZSIAzTXnFajgMKshIr
 zrULt36KRSnrRzOuVWwiS40OOcSpuyR0EvRINt2lfhUDUcX6VyOnu0h3gjdFaCryjBkV
 6uudfSqB6pPpb0ZHujjqOZiM3u5lCiQ3n89+JvJ1XLi+LtrnRAO7IeHS2CZrkUR9UImJ
 XvbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=tR0gCtypqd1iX1iRkqWIYioksTf/njgA2aZ4h6BcDxM=;
 fh=xEg4NsTIsD2EMukl06xF/5sA5F6TiLGilvi5hxF0bQ8=;
 b=Y9sy8LOWlmqNDD0r0/hy3Lp4vdjlHvoYFTlf259Bm/o6H3WcPK/fB5uQ4GnEhDkrtV
 GK9YF77v8x2dGDNCTxMmus/3U5stYH90UGKf1g+CBTej6I76mSwkUO69libfvRxLV04L
 YJpQ468JEgDkgCSErY9kuONu3qAXxJGclTdbuqaXjVr3wax7uzA7XglOc0fuP5D4ILR/
 iZkwGzkgXZHzDfaaAJgsW1erv4G28HXVzDfAg52gzNq9DaJclnv5y1uHPH+LZhop1aND
 LtOu6ZQb4acD1YX1imReR9TYx41xWgMFh+CfEow7+hQUoYoIGHpTOHkFf5EYh0Ok6KAx
 TIjw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768836175; x=1769440975; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tR0gCtypqd1iX1iRkqWIYioksTf/njgA2aZ4h6BcDxM=;
 b=XgaeVOHg0RhisziUHb6a4yuU2i5SKMx1AoGR9el6kCRgPsTvaBdvxzLUfXbj/o/ftB
 ezrx5MX+nrnSBt6YFAsMeo86idH8FgM6Jr5PUdhXM5sqSlUMDqtkS1Q9fqRESDM9n336
 QpoGPvpAuhPPr4k8DuadJ/5Sp/64KOaNes1w6eECE3dqKUr0vIqwoXtPo+Vmv/1Yk5yq
 /krMEqTRj4Cf4mlmuyAP4M/EQFH7e1LDOABSdxwFzc8BBYIBF12KRyrnFsqV38Su2TQJ
 x253+BRMkAsRI0MsXr8RfUFv20we0FqlucMnPQrsomVZOMLj+IXPn7ohYgXCeDxPmfRR
 e6Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768836175; x=1769440975;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=tR0gCtypqd1iX1iRkqWIYioksTf/njgA2aZ4h6BcDxM=;
 b=NxOQpxOkemdNhPLD0KCP7261pGEC+MKk19Y8rPyUdJvCEcZ1/0rSDXxl+GxkZGIqcC
 5/BJHyRJc7rBE2bA879kzGa3cAaPa8eYM2ZcYJgJMc0cNP6W+Abk5ok2KE0hoF439gta
 1b+6ycY96zlmbnoy7xltQAp/qcXPtNcvQ01kTlqYsYkwQMs8/2oSYzptlGZDPE8UAogQ
 dQ/O6or27Oy9K1bSkPx95UxpMsSQ7sFOGhoaxKOwoiL7ObGeWh6vUSUB6140T0119CbQ
 87pYTgugWOcfK13bgEdP9EuSPRdaedO7K3tlyeA+GPCK5K/O9lMdEdTqIe+/7iIJ4s/n
 xHng==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOF3CCcndLJFf+5fVF5zLgT2ovdEcnu2wiTSD+jplODkemMkq32TB9NQUNSMEr58fweI6FkZ2VQUE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzhvvDvfPZTGrLzwzLb0CoJ2/SBKL7jqT95Lc9vUfiSBplf/eVj
 7mr3ych5eNQZ2PTUvyvC+nnt9Kk70nh4oky6s9Megcz7fDuGky72ce8A6swTuLn0y1AxXyh42kp
 0xGn5vWKAsQDR9hd2sjPAjDudyAAwOvk=
X-Gm-Gg: AZuq6aJ8aXnVWvuFXmgunIwINStrbQCPZPuvVnYUyvENwJzYI8eIYBVKkewnJcsKXy5
 rzdy+dC5ZDRsTP4oTXWOxAcl8DG0SfOEpQs+emOnvVW7Ik7ga+kgHwW3I7+G6nXVodSMSgHEc9t
 qxqCyV5QXqOgDNwBI+uWaYzvtKhRMjM2/xgj5mGO69fMk/BUxIeZw9LYhFDZeUi2JAtY66HZaFe
 G2+NvHzW157kaS/rw7aKV8bZ6+jAHQSUoSIHwcmIQYz7eLUceKMyixMP6hSyKyGN0ImjqLi5KdB
 QW6MGle9Yjg3885J41V+MBxY+Ix1bB/FDo24c61hqDf4Dv9HGaByhHOe4/gUjcZoV/tNXKyABNT
 Vjn4rmouZdrnJ
X-Received: by 2002:a05:7301:228e:b0:2b6:f613:74e6 with SMTP id
 5a478bee46e88-2b6f613797fmr27366eec.4.1768836173425; Mon, 19 Jan 2026
 07:22:53 -0800 (PST)
MIME-Version: 1.0
References: <20260107-clk-type-state-v3-0-77d3e3ee59c2@collabora.com>
 <20260107-clk-type-state-v3-1-77d3e3ee59c2@collabora.com>
 <DFSMRQFIYQPO.1A38Y84XZ1GZO@garyguo.net>
In-Reply-To: <DFSMRQFIYQPO.1A38Y84XZ1GZO@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 19 Jan 2026 16:22:40 +0100
X-Gm-Features: AZwV_QgNN_SRIlYoHUy-qlXXeVjMEAqzZugkTtOGHbXvqJ3qT7hNtgfXtF3Q8KU
Message-ID: <CANiq72kcRQShDgMJKZ+ekUEdP1T6Jr=4PDiMJCqnQjgCQEK_eA@mail.gmail.com>
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

On Mon, Jan 19, 2026 at 3:20=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> I guess it's time for me to work on a `#[sealed]` macro...

...and perhaps pinging upstream for the language feature... :) I added
https://github.com/rust-lang/rust/issues/105077 to our usual list of
wishes at https://github.com/Rust-for-Linux/linux/issues/354.

Do you think using the linked crate in the commit message would make
sense? It seems to be a couple pages of code, using `syn` 2.0, which
should be fine now.

Another option is a "good first issue" of medium difficulty if you wish.

> I wonder if it makes sense to add a general `ErrorWith` type for errors t=
hat
> carries error code + data.

Sounds reasonable...

Cheers,
Miguel
