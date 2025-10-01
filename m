Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C04DBAFDA9
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 11:29:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DD6310E30F;
	Wed,  1 Oct 2025 09:29:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="peLpBaP3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C623710E30B
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 09:29:22 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-3ee15b5435bso3902727f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Oct 2025 02:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1759310961; x=1759915761;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eWhaWIh1Ch5W+HrhvE/7nWxIJ4BqD2s5kUI/3gBmyEA=;
 b=peLpBaP3mucvkMjB9bsXLkHYoFmnmFf3Hb0Ueyl20tPydwVrsZYhw5crmAIkky4MEa
 DWVcqQrS9IlGt2UkPncpITbnNAeLctVQcpEuAX6qKvpI6uTMN8EkOHINQSZs8XKgDRF6
 ZhrVVun9PfPFrPAA43GLatI8KAmO+BY34FF8y5t+XNijrzSMosXIAGtcqIB2AtK/XLx+
 ueLe2ZyLDFt0tDH+PGHhBVZwl/m7vd4RskKgMSWkvaFC8pt7Dy/vExsCh2D0n9icCyQN
 KZklf5L/0+7fa1PUJzDBnGUToCJOxZzuig+FnwpZwdhpmTOL2z9Ykr2wjRUJH05uTc7P
 UFOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759310961; x=1759915761;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eWhaWIh1Ch5W+HrhvE/7nWxIJ4BqD2s5kUI/3gBmyEA=;
 b=cj1GHZTMUZhwUupd63JNzXNdupeeM3nB+R6XmSETEAMkpaftDAAtx+xvX14oI/CBqB
 OqO89nq2YK901s4tHpQnuGgLDY+Qxgybpk+TIkMkQM6imgOZHE0GKOstYhRiA9DBX+ej
 8/BhyRi11krG6Rfyp/k1K65ucq9gywatbW/Vho7+lpPqb73mcKDq7pC8WoW6INGX4ACS
 knvSo0xhesYmkOx90kJSz6/0cFJ1ty8ZFOSrG414jamGgBbjZiG89nuJ1S6H7qQNN23p
 MIAw84NH1KoeEm2pTuu/6f2Z305l5ymUMMPlmXi9IKAyNbqS6y9bvl9DUdqAGj3C2Bkm
 GvDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXl85JTpqLgDF44tsnoXitdaJMCImw57yfp1TBLiflvTYbfyWz84/gMsrP1vxbvsmmBuWIcZjU0Ovg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNpT0UZxNyw9NVhf4NxKT5xgRpTKT2H09FRWaKQuhwd/vtEaBl
 eZFbny18ab2Hgm0Htp7As6+1eQkxA66gEu6Gt66aPVO2BiuDQ+VjMrwPGIoJBON+QqIU5A4f+kE
 XNinZ8FjzGCxa0WLEcwbxKQsiBv2leJCV9A4QZVcH
X-Gm-Gg: ASbGncvh0LIgx2n1ofwtxvgcirSa/EvLSpYzCDueVeMERppYy5vhy4YVJxLDHj0BHAm
 XqkPCTbKbP4enP8O//A19Nm2f0ja+m0NbVRDRJhNuZD5iDUXSYahLR7Mmi+UKfDUSQ+9xMNq/Tu
 U3VRD1iKPQf3HI/q9OS8Pqrp+GFGPZHKuN/8MRaoHM0X8EwedMVDziQKuL0HIGlw+18a6l2JO6f
 Tybd7f+gbw6X4XiYDZG5LXqiBSIEl2fqbkeSScfuG8ZA+gq4avFY4c4rog1xgbzax3Z
X-Google-Smtp-Source: AGHT+IEGTvzQBJ51h7EDzxRa/Kisf+BfY+7cpvTrlEhl/iMUN4+q2HPEwsb4ysW4cM34kR4mPUadGwVDBMTe2U90ivY=
X-Received: by 2002:a05:6000:610:b0:408:9c48:e27b with SMTP id
 ffacd0b85a97d-42557820c81mr2042096f8f.62.1759310960773; Wed, 01 Oct 2025
 02:29:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250925-core-cstr-cstrings-v2-0-78e0aaace1cd@gmail.com>
 <20250925-core-cstr-cstrings-v2-19-78e0aaace1cd@gmail.com>
In-Reply-To: <20250925-core-cstr-cstrings-v2-19-78e0aaace1cd@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 1 Oct 2025 11:29:08 +0200
X-Gm-Features: AS18NWCOfBcX2Vbfhr-fnk5GPcApSeOL4C5SAm45sMYmzlcHM8gTiQQ5VZSiyfk
Message-ID: <CAH5fLggd09hodiDAdNRy6aXK9ANCP==YSJwy-GMbhNAAMm731A@mail.gmail.com>
Subject: Re: [PATCH v2 19/19] rust: regulator: replace `kernel::c_str!` with
 C-Strings
To: Tamir Duberstein <tamird@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Breno Leitao <leitao@debian.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Leon Romanovsky <leon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>,
 Jens Axboe <axboe@kernel.dk>, Alexandre Courbot <acourbot@nvidia.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org
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

On Thu, Sep 25, 2025 at 3:56=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> C-String literals were added in Rust 1.77. Replace instances of
> `kernel::c_str!` with C-String literals where possible.
>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
