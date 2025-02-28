Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9635AA4A727
	for <lists+dri-devel@lfdr.de>; Sat,  1 Mar 2025 01:40:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1179710ED68;
	Sat,  1 Mar 2025 00:40:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GSpzq7aK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1788F10ECE0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 15:51:39 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-309311e7b39so22829711fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 07:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740757897; x=1741362697; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GDE5lRNIEVnG9s48rh5Ph8gdJNwsLWWybgZuFpuFoqM=;
 b=GSpzq7aKAjCe9wgZ9tR6k3rQf3bjkIrLbn+W1U0hFh7opwiFoBXp/ZsNvToaW2/Tb2
 lseDOUQhnzRlIuH0lWr+sFqPhbIPGBP+YkAHfO/OgyHrNctSNB3iYDqLtvBroLUlxy1v
 2qzx/31t2Me6YiKLqIv7bVrKES1YYN0BTP00pkHwIaHetjQ6ZAO6MYritu3ERDvN/vA/
 3FrWOoGKWj2ts5cqjZb1hQnCy9ZgFjrf0kwho+Icb1pLE7hB6WQFkrpxgLgAUSwKIG4t
 OlWkG0Z7zmNdXrRbCEtd7qtQmwut5oiEwWWV3M7uboEuFre/gfDOtrNHHWSw6C8ZFWYF
 GUaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740757897; x=1741362697;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GDE5lRNIEVnG9s48rh5Ph8gdJNwsLWWybgZuFpuFoqM=;
 b=Rn8r1k6zYZMFQBb5BBIXDsKcWWolxDGZe9kXHAv0+zZOQ+oREYrRRXMKkrEelWe9+4
 BWRncGsDldTCzq0mqjNSLkPHhrl49W6t+DCpvr2n/HjiREkxdiJbiYqPmEUHXTvVxj08
 JoXbt11LmQxZG7WCn8LipLrnKSxKFpL1RrfDzhsELDwe1H6MWHzesrlUfv76fLBSYfV9
 jgfJV74wUwPw3DK6YwMrWnF7ElDQo/9YGjfAmiqvVdf5u7ejlRLEOt/bWKXB7d84OhzO
 b5ytuIZxb4KqQ+PmsxKR06ha8GZJjU3Zy4tvQSUF8kUwrYFDuS2Fvwzq/c6AzQrx0c8t
 jaeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8IUxsKXQ6g3M+EMoopYCy6ogpSf1A12/XmWSeV+3ExmmjMwBJqs13puAsLYBny8cK0kbuiEVStk0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz6LnplUcq8xlhL7OA2x1dvMeCkL3k6nADyfNfYk1WiHvk8k2Zm
 FATK992jz6aFl02X4Gpv5dLqwQTcjwgRpv+FOgz+TAvK4H7Y4R3zYkkwz4YYTqePzT0WD41aWKt
 Dtq6ucfKPV9e/rg7OBudN5g7yJ6s=
X-Gm-Gg: ASbGncvYLrWk0sVKC85c/mpNB+EjCKDsy5gWHiCU5B6mKo4clb8TWx4lB7XVdoOzs0m
 uoR5UaNe/sZypVy48QAZId6l34YnT143LXGnPZz2HyuHjeGj583jAPtdlxFY+x0aDZM3UZ/MQ02
 CRwzwYgwmUN2OYHpjA8PTmuo1W0G95iRcCIe6aiCZ9
X-Google-Smtp-Source: AGHT+IE4MbrzRN3Jjm3xDjdLOZWYo8YGI7MexJ7wty7pA3puikvTmSwpKcPsIWgFD3PmvLZKz/wRIf12W7J7nWZ7J0E=
X-Received: by 2002:a05:651c:198a:b0:30b:a185:47d8 with SMTP id
 38308e7fff4ca-30ba18547femr1762441fa.4.1740757897170; Fri, 28 Feb 2025
 07:51:37 -0800 (PST)
MIME-Version: 1.0
References: <20250228-export-macro-v2-0-569cc7e8926c@google.com>
 <20250228-export-macro-v2-3-569cc7e8926c@google.com>
 <CAJ-ks9ng6AqmDynFebR+2_ZEpmvxkUNWdTed2vr0kede0dxcxw@mail.gmail.com>
 <CANiq72=UrPX4orjgFKo8LZj0PVsmXkLvQRxrgSwJrY_AfuTfEA@mail.gmail.com>
In-Reply-To: <CANiq72=UrPX4orjgFKo8LZj0PVsmXkLvQRxrgSwJrY_AfuTfEA@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 28 Feb 2025 10:51:00 -0500
X-Gm-Features: AQ5f1JqCHNM2Ls7DXNSXpvAuhyRMc_ktjj0-Cd7tV3SQcTtiaAvIhWYES9_RhAo
Message-ID: <CAJ-ks9mmDeqaj+G__OkvCcerNvh3WkVDTWfJepNSdrwU7dyRsw@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] rust: add #[export] macro
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Petr Mladek <pmladek@suse.com>, 
 Steven Rostedt <rostedt@goodmis.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 01 Mar 2025 00:40:26 +0000
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

On Fri, Feb 28, 2025 at 10:49=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Fri, Feb 28, 2025 at 4:41=E2=80=AFPM Tamir Duberstein <tamird@gmail.co=
m> wrote:
> >
> > This needs an update given Miguel's comments on the cover letter. I
> > wonder if the code should also justify the choice (over cbindgen).
>
> `cbindgen` is a longer term thing and more complex, assuming we use it
> in the end, so I think it is fine going with this for the time being
> -- it is straightforward and a net improvement.
>
> Later on, if needed, we can just make `export` a no-op, right?
>
> It may also be useful to have the exports "explicitly tagged" this way.

Sounds reasonable. I was suggesting that we document the rationale -
not that we change the decision.
