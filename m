Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F537C314E7
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 14:52:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCC7910E5DB;
	Tue,  4 Nov 2025 13:52:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="L1ztI35s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B383310E5DB
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 13:52:16 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-33e3018f113so890789a91.0
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Nov 2025 05:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762264336; x=1762869136; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WgxSC2aKqxilandHAezVm5gKzGGQcz0P4+qV+dri/oU=;
 b=L1ztI35sVSOx+hFlHTBdwSkV6fYmyA7jTo0io5W3EV7SiLVDrnmq1D8+6wPs4fCy5F
 SAwdZdAvob8l3j6y3du0l8WAguilj5RW+emiE6zSsLY9lul+uVIFdKBXWUclP8028Y4A
 dlC4P0fd9X2TmqEfBf5/FzVtUN4F4HpiZ99aKSNYsXEgXLD9Ixv3hj7vOaYuYSIIqCUG
 ff7HtYRWT+NruF0S2dJF9seajxGaSrse7yhKbdCCVxbJ+JVFKmAYZVU1CdqdegXErQxm
 NYUPWeM+Zv+G2sHBstyuPjwPD1k9XW/nZJPKtmKBtU5YRzYzFnqaBVzGv58nOTZZqfaX
 V/ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762264336; x=1762869136;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WgxSC2aKqxilandHAezVm5gKzGGQcz0P4+qV+dri/oU=;
 b=pdbJ9EAsvjTN3bSJQ3NKbVIEIKXRg62tejc8JAzGY/zmpiBBpCzm2lGYhUWolBg3+2
 Y6Ob/qkhtuggFn0dTs6aLn6VJrwoRTRr96sRyzAkq051dw1eHDLdUJ6aLiO9cvTZzIMc
 LqSYoWLDd9g4SGYvOEnZuL2Lpn6u1ST1o4tEAjlNICYW/dOkWuIWWYxhRzECw/HO+xpx
 9yBxUgL8bJKid0dOIhP1TOrizwGo5qDHij1IV6sbwDZKSELWi9b/k5bzgApKnzeLf7g/
 t++DC46YuUkxrei7SMdKhDfJLXz46yWgOsGZIsTF7g0q/0k9yOTPVcCI76Tdy3Fjc+ew
 nS4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX86rlXNnWn83g5KJToxYW29T4t8s4xHCnl5gKm240C3VclmeW2UoLOITxDOj+SAfiA69pTHQhrI4Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxmu0GlmzdkAdOuDJpyrmaXlO3lPeh/iMx5FZB9MgXLGg6rTx+5
 7GCKK6T0TaACQ4m1fMIqo3tEw/G0C6qXg5/UMq4JVxcv31tpILBBHT65x8gYtsKMkf7FlKG/9xA
 vxmfX4zHBksQjazP8RvH0R9BqXOqMCnM=
X-Gm-Gg: ASbGncsSb75NBbRU3EY7BlAIykDesUKv1dKxSG49wr/SRx3wW/fUsnCSwqQS1+LQl+j
 OBHDSxZ3GxgpoE1BFdplsjsfTMHdbv9rVpqzqyD2jX94uxAE8ttxRB5sA4cr7OLPnkO9ryK8nA9
 jp2DcrrntEYaSdSus4p+dxcXvlGWsqnkC93aH9hzuy4CVFzVIzn23idstiTOQfYMtHAFtCPOE9g
 OGuXEB04mHE96sC43/o+kb4SCr4K7X4ieO3PZ7PHkSfFsCaieXMmnfPoB/docIQSMO3LgXJTe8M
 hF3BzVrskdv9gLqEht17PP29b8rjdLaNbOZjc3BLTN1DBjhYtmevEZ036hM02n2PV0hX9+tUkN2
 uzSw=
X-Google-Smtp-Source: AGHT+IEHIHWibqjAZGWyvY0H8m2w47BvrG2lZbXh2UQMD9AI1DeCBy/GvhFpcB4QhflEwGDTQ3v2/JNfuI82Byb03zs=
X-Received: by 2002:a17:90b:3b87:b0:340:b8f2:250c with SMTP id
 98e67ed59e1d1-340b8f22df9mr9464706a91.1.1762264336293; Tue, 04 Nov 2025
 05:52:16 -0800 (PST)
MIME-Version: 1.0
References: <20251030190613.1224287-1-joelagnelf@nvidia.com>
 <20251030190613.1224287-2-joelagnelf@nvidia.com>
 <DDX1WYWQNTAB.BBEICMO8NM30@nvidia.com>
 <20251104005812.GA2101511@joelbox2>
In-Reply-To: <20251104005812.GA2101511@joelbox2>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 4 Nov 2025 14:52:03 +0100
X-Gm-Features: AWmQ_blJ7jEt0nl7CKtiOJzaUdItBJ90fhDQUgIcURkC12jl_69-w8beSolcQvU
Message-ID: <CANiq72m692bb+W32QN1G+LJa7sHs=gU8k6dri3mu95Smj7GiRw@mail.gmail.com>
Subject: Re: [PATCH RFC 1/4] rust: clist: Add abstraction for iterating over C
 linked lists
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, linux-kernel@vger.kernel.org, 
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
 Nouveau <nouveau-bounces@lists.freedesktop.org>
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

On Tue, Nov 4, 2025 at 1:58=E2=80=AFAM Joel Fernandes <joelagnelf@nvidia.co=
m> wrote:
>
> Perhaps wrapping it is #cfg is sufficient.

`cfg` attributes and the `cfg!` macro should work in doctests -- we
have already a few instances, e.g. this hidden one:

    /// ```
    /// # #![cfg(CONFIG_OF)]
    /// use kernel::clk::Hertz;

Cheers,
Miguel
