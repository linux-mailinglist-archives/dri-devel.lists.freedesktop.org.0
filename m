Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CF2C99795
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 23:59:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62D7210E4BC;
	Mon,  1 Dec 2025 22:58:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IxotbmSJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FF3C10E4BC
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Dec 2025 22:58:58 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-7b90db89b09so473686b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Dec 2025 14:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764629938; x=1765234738; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zyWPxm7BxHU2DwXC/shC6IQcOtTNXj2MQcP74sbsrkE=;
 b=IxotbmSJsd/X44ee+0EfVdjUaaIZZLVVUs+Qgur7prs27YSaKoK2pUYyaeq+vu4iKI
 zvk3NJIMPQmuckhSt95R1tylWvgYHBCMK8+uwbi6/D7Dp+lH8wCulUr0qhJpIzbAAqVA
 UHqMVIbLWekkBDrMeMD59+SHMMFdk7MGoiANUBU7oE4Rs1wOiAKlIHeDusLnlIe3wk/z
 U+VBfTV0sk6xB+3sjvWe1jKP7pEVkkJC9FFU6AecCRsUS45kLneHIRcRYXf7XAJ8BXL5
 DEcDsPHoavwAGrsNpSs3Vo6NzJUEn+QsGLUoYs+LtbOjpwtH9PGkvf0eyOjA6hSQBX6W
 SdVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764629938; x=1765234738;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zyWPxm7BxHU2DwXC/shC6IQcOtTNXj2MQcP74sbsrkE=;
 b=u3TVeq/viKqM5wWy4USgtMEI3DM6uRXXaYqhtd3+jnfR8CYpbjFIqstFsy8K17Zfnm
 M55xDZ20s2Q5xqzBzHOYF3KlKujuEqUaFwlonSqxHaS6tG3ACOW8uAo2tdCB/U9nwGwz
 ReVTyPlz03JRYL+jwKERwHd6uzdmoz+OmsDzErJa3/0zvLUqgQXXTguGwap0NhalFTdI
 SHVdngcbtzIBGneIPOTcovXtrzE1Ya8UIELUCtRWbZfOpOR2AQ/l4Un6RPHACC/n622f
 k5LnTdMCppz24IZW901crSv54lNA4EGUx8lW32tkBtSMnPthmClv5vVFw0o6aZOy4DcM
 LJiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUW+rPHI0q9HY2imdPxpzXVSKpdqTco88CN0z6fVdUWjQ3Fy9Lbe5qSXhxYyd27t1Vd0o6zUv/44nY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwJA9GV/SbalQkH2PeIccAxDeIg5JCL9pbrDW4O2wDEfqUlyw/A
 vOmLzC/5U/mWYec3791j5jqWw2kzOdajkOvgXG6JtSYEYTJqwt5Hz+2p4cQdUYeozDTQmEw+6BV
 BtQtapw+jkUFv/k6LehUhhpkEKfKUYPE=
X-Gm-Gg: ASbGncuqVYBuWTxTZ1fy9Zzq9VkBEaGOboqhMc2nsEADzX7bNDDl9oZ05KxGBNO6FKj
 nZ2QEXgF9vjs+lrUV2+JRUC1HN5Lfttt6DXhLjk50YQeIlzrI9EHtgWyeejmSooFpPXM23RM9vv
 lEsLOrC3rG3L44tZ6KyaGLrZGlNyDSCfGJUlTZbJ4BI6mQONlpGVXUXUwQSD52sDtdI74roqpLs
 c5Ef+0uCwAYoWz8x4uYaqNSv4uAoTTB7rqtWAG7TVqfPL50rRVNn5RYpMSm2yUbyddLKQRwEgWO
 R4d0FjNmIWsu3CMNdqCncCQrq3zSJcH7tLiNNfEZitkHoy5/lVWIGBhtVT8nQwV4zOAf13Vi5nb
 /fnGiQK2douU31A==
X-Google-Smtp-Source: AGHT+IHY+FeAItpAcrc5Fq3fIXt5nt1KC5tdgt+lz+Ap3b7wKK+vwNPbBlkNS7wWrophFDdlzmuDF0mqMk5k9ykfKLw=
X-Received: by 2002:a05:7301:e24:b0:2a4:3593:2c07 with SMTP id
 5a478bee46e88-2a7243ec7b9mr22701116eec.0.1764629937707; Mon, 01 Dec 2025
 14:58:57 -0800 (PST)
MIME-Version: 1.0
References: <20251129213056.4021375-1-joelagnelf@nvidia.com>
 <5B89D953-BB52-4E8F-AC40-1FA33C016780@collabora.com>
 <87d2c2d5-12d2-4655-b070-872c909f7e0a@nvidia.com>
 <48EFFE1F-4D20-4A2D-B3E0-13E9CB796624@collabora.com>
In-Reply-To: <48EFFE1F-4D20-4A2D-B3E0-13E9CB796624@collabora.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 1 Dec 2025 23:58:45 +0100
X-Gm-Features: AWmQ_bk8XBPXNwQ-7Pod4UntjM0rZKNAiZHIZMwXF3_mA-n9qMS1f4f_JysZoCo
Message-ID: <CANiq72=V9TvPPvx=nAOciSZKVQJy+YBgLmPTt2EGo9bGrthdog@mail.gmail.com>
Subject: Re: [PATCH v3] rust: clist: Add support to interface with C linked
 lists
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@gmail.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 bjorn3_gh@protonmail.com, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Timur Tabi <ttabi@nvidia.com>, 
 Joel Fernandes <joel@joelfernandes.org>, Lyude Paul <elle@weathered-steel.dev>,
 Andrea Righi <arighi@nvidia.com>, Philipp Stanner <phasta@kernel.org>
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

On Mon, Dec 1, 2025 at 11:55=E2=80=AFPM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> Yes, this is what I meant.

Sounds good to me too, but if enough people like otherwise, it is not
a big deal either way.

Cheers,
Miguel
