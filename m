Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D73AEDF98
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 15:52:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 480A110E455;
	Mon, 30 Jun 2025 13:52:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="E9YIoM1x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4CE010E456
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 13:52:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7091643DF0
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 13:52:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F671C4CEF3
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 13:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751291534;
 bh=ZVhB3F1syAlanzOC6BWsCKPObUTNq+Hyhjr2MG6+qSQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=E9YIoM1xJuly1I/dqa51OQkNl4Pi4NI1j6j69EQT4QFCPW8W6CoTn7w5Qv0dOYAiD
 7ocdY9La4RXt7q9Lopk8tf++CWlPngmICp1xPKQyi5hgj6YbkrU/9DEVNb1FtMqOXU
 lW76+RyOxkPsDkMiCwjQgcINbxodWthxxsbKFr0dn1AAeUTxkTUP5EBI58AoS1JL49
 KWYs+yOHScN7Ea4TDnaux9YUJItzab8iycc2c/KU0jBCuOqsFmSeu6pm7yRDqXKtC2
 uP/xBnHHv4QjFyPWC7x/NFXr+aoB/3BX0VwnHyl31/DwM0gw0BeUo+LKyUzhVl/TMA
 anaBh/ll7LD5g==
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-60768f080d8so4599927a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 06:52:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWYizOajxh57E8t+1fieioT+XDgxn3thy7jhucniBofPY+W5BMRQlWBddvJ+1dWjPShMJv1frYKbG4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxxMhuerV4+wIFef+azlfTQWSNUZspeXfaLJ5AOp62rnt70EJuq
 jXVM1FtfO+uVu7ZSkDF2QJ7iOjZCUDcawAwKP/vNlr3Zm4EziwzxDRYHDpXEIanLTSzKkhdVk0h
 tfQBKF1P55nwdwB+igR8zYzjKLHIWdw==
X-Google-Smtp-Source: AGHT+IE+9b7yISVeOJPhqJjR1jJvgc4yFdOFlIaPB6jTLtq6nW6I8YOwe3YIoEFXDQ2vXwDapLz3Dh1QuhBBSeBl2pY=
X-Received: by 2002:a17:907:9d17:b0:ae0:b7ef:1c11 with SMTP id
 a640c23a62f3a-ae34fd33723mr1146744766b.5.1751291532815; Mon, 30 Jun 2025
 06:52:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250627-tyr-v1-1-cb5f4c6ced46@collabora.com>
 <aF8lYpK_l2I-ts1k@pollux>
 <9D9AFE08-2CBB-4A89-866D-512D9080754C@collabora.com>
 <CANiq72mgt4ZD43Tm2bFr-gpicXMhFbC2DLqA6F0rN_J4rAe_CQ@mail.gmail.com>
In-Reply-To: <CANiq72mgt4ZD43Tm2bFr-gpicXMhFbC2DLqA6F0rN_J4rAe_CQ@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 30 Jun 2025 08:52:01 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJktA2F4y8YFfZ5FzrwrJbtxkbiqts1LWT2KvXLSSDLjg@mail.gmail.com>
X-Gm-Features: Ac12FXxJ9AdtyAFgl_713aw6S2x8PYt3_96u_vQFqbnBdmLeQkUoEpEUgENKmhY
Message-ID: <CAL_JsqJktA2F4y8YFfZ5FzrwrJbtxkbiqts1LWT2KvXLSSDLjg@mail.gmail.com>
Subject: Re: [PATCH] Introduce Tyr
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 Danilo Krummrich <dakr@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Daniel Stone <daniels@collabora.com>, Alice Ryhl <alice.ryhl@google.com>, 
 Beata Michalska <beata.michalska@arm.com>,
 Carsten Haitzler <carsten.haitzler@foss.arm.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>,
 Ashley Smith <ashley.smith@collabora.com>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, kernel@collabora.com
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

On Sat, Jun 28, 2025 at 4:31=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Sat, Jun 28, 2025 at 2:13=E2=80=AFAM Daniel Almeida
> <daniel.almeida@collabora.com> wrote:
> >
> > Also, for some reason the Clippy lint did not save me this time.
>
> Hmm... it should -- I tried to build it and Clippy reports it. There
> is also another warning too [1].
>
> I see the compiler reporting [2] too.
>
> By the way, do you need to depend on `CONFIG_REGULATOR`?

No. Drivers rely on empty stubs for all the providers they need. It
would be pretty unmaintainable to depend on all of them. You want
enabling drivers for compile testing as easy as possible.

Rob
