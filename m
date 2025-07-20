Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDE4B0B923
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 01:17:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E67210E391;
	Sun, 20 Jul 2025 23:17:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="P0iKlxJs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2AD710E391;
 Sun, 20 Jul 2025 23:17:54 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-313290ea247so662147a91.3; 
 Sun, 20 Jul 2025 16:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753053474; x=1753658274; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pGT0xhBqBHbFWdDdZyKQSNOHcvRWrnAJlLeBlypIO4U=;
 b=P0iKlxJs/vN4ltZk+mH2SVrEv+/mvYg4X+WaOD9HFyHBrXJ1XH43QXCUdDlemVVIs6
 xxtpxhDwk+A8WphONmEHGhRx7s0paumWb6YHAzExkOupDVrsaKVDCdgOnAgyS7Crf4ZK
 +p1umrqAA4koPykAtiUGblijwrP3ku5hEomYhE2Yps62TqKpqh+EI6SC2ITdOH2RZvB3
 yMhueedHd52KnA7CMNrJcEQ8lkaZPIgkpee0MGqZQFT37o2hFQrl5JG7twKRvMwu1WsR
 lKLBB3FxIP7ApSoJBgf2Pf8yb24SKRLGYbGYJpY1DwXWLKBRwk7cVTurrqI1Mq06t73Y
 a7Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753053474; x=1753658274;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pGT0xhBqBHbFWdDdZyKQSNOHcvRWrnAJlLeBlypIO4U=;
 b=o1WMh7TTVt7wTUx/ThFrFGZfyKVrZD3yWEc6L5pXA87D+i3pzZ2ybs5tXbJ1j1+XcT
 JcD1Fa7Jco0yiH3MQfm853pUZXAbJnCUjCXV0/WlTr9UNkpkVC1Ek4fYTCPvDcuTV28S
 tw9342U2CSJ8ZfQRJRfAOkQKHYF2v01UZcTmr03FBTiOKH2HYC9Nuo8c8ln9ndbB2UhL
 gTLxlozBlEjslvO3m/v91L+lVD2A1RUpF3kVaof8zXpYOa0jaQelUgcHQNbf74A4Zy1J
 zjfqka+9PS9TC1+S9XwMJip3fEzsl4RstvXR1bFa9t/BJGy2KbS5EGmis9SCQBzYTcbW
 PYGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQm78FHpf+lWzogtgt2zIhC0VnprJ+j5yHEdM9eR2MUZ0Myd6jmhWZAR+ZQ4ggmvin4T1+jr/rUg==@lists.freedesktop.org,
 AJvYcCXObZzWUAuOLKa57A7YQ6sKyow1sb43h4WaVjg06Ebo8e/y+hyF0DOJiSfNN6dPgjr7S7J8qo9frEw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywfc8SvFMBoDsdpX56Twmeq0DdIgkTTXCm81pQyfDjXzGRUjkoo
 V9pnM6EODOdTakGpHj/2GTkabvt4wp7YLwSW7ZGZNhzMOF6q5A1cE3SWr7qhkfUJF/iurUs4xTW
 iLBs/mYs7p2H5wg6vdd1gRDW+Lkm/QWo=
X-Gm-Gg: ASbGnctUkNcSLh0UjlDTPrU9DKaG7lmTlSkTtWZiQ5n6FjgJG5us1iVwhEojDNHOZKl
 IQlsFMxf8onARP7+NZoIFtfEBjxfsMf4X99ilOq65PlGxeiWFCiFdw+3kIdQ1zUkJ/MOMDKQBU1
 bahiAtiDGvYJEO2gz1ANlMzGWm7n/sFAw5xHqkDCvOZCCL9RWswfDk4d4KS3hMrvjMWs+2YjxtB
 FBAWjn8
X-Google-Smtp-Source: AGHT+IEbrcR8MgMgRAo5KnPtJx24JMikPAIly+rpRUggWdS/YqBt5ySVGDI/rtXvTVmG4G/B9031gk3IdnUlb0cu6aI=
X-Received: by 2002:a17:90b:5285:b0:313:2bfc:94c with SMTP id
 98e67ed59e1d1-31c9e7afd78mr10304315a91.8.1753053474405; Sun, 20 Jul 2025
 16:17:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250704-core-cstr-prepare-v1-0-a91524037783@gmail.com>
 <20250704-core-cstr-prepare-v1-1-a91524037783@gmail.com>
 <CAJ-ks9nBrT4C5xYk4eWUFX_nX5XXBYHEGo+fLtLWJE-D9Y5hKQ@mail.gmail.com>
In-Reply-To: <CAJ-ks9nBrT4C5xYk4eWUFX_nX5XXBYHEGo+fLtLWJE-D9Y5hKQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 21 Jul 2025 01:17:40 +0200
X-Gm-Features: Ac12FXzxtp1UNQgsWc3xcIVA0zM-1eUXS6ehJ4njC6usGr6NPOzcDPlluaIG_s4
Message-ID: <CANiq72=pS1iPePhi2Vs2AkLs3+tV=TASStPuSCnRNnHNHaawsw@mail.gmail.com>
Subject: Re: [PATCH 1/6] rust: kernel: remove `fmt!`,
 fix clippy::uninlined-format-args
To: Tamir Duberstein <tamird@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
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

On Mon, Jul 21, 2025 at 1:04=E2=80=AFAM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> Just noticed a tiny typo here: it should say "can *be* taken".
>
> Miguel, if you can fix that on apply, please do - but if not, no worries.

Done! (We could also have removed that sentence too, since it sounds a
bit like something one would write after the `---` line).

Cheers,
Miguel
