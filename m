Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 536A0C9978C
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 23:58:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA1DF10E4BB;
	Mon,  1 Dec 2025 22:58:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Jw+epErl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DFA810E4BB
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Dec 2025 22:58:40 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-7b8ba3c8ca1so657459b3a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Dec 2025 14:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764629919; x=1765234719; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a1pdL8EYMo2eswZyriHACheqxubZbCfaF1iStJizjuE=;
 b=Jw+epErlz8ry4sbCtk1ZY2qq5YBeUKrB0R9UTr4sOHm70rSXU9UbRJKCT6aP7riT/j
 7k5yGJoWdNcIxDZh1eGJ3XghmoAv0IPeSQ7JYNhXgek/TaUm/jp5Y0f2YVGRlOwnbp3y
 CVyDcb+5+iMxdNK59gXoJiEBn83kZqk/OYCCYNTcyv10nuNSFfH458qj12LkVTJIInKl
 I7v5iy0Pl4BLBRnV+OQ2K1H/IfuoRGzRHPp1GA3tF5M6qZno6rgdlcNhI/jsuKS0OOIx
 jPcmOnsfnn/mQPhm7GHNPomNvDJ5n2IIyq72ttUyxDwQxU1z5to4OGcM9wrExuEQmLyK
 Bfkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764629919; x=1765234719;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=a1pdL8EYMo2eswZyriHACheqxubZbCfaF1iStJizjuE=;
 b=Tkh4RmoQcCwHfkXF0Mdu1TB1S/ui49LSrQv/oJ4d0dtPPicQp66y1qJmnAVNRB4iic
 8rS4J7Ph/Bu9rsVoFCSip5mAxtPQDm0GIKChAJjyv9OEcPsosogVudsirQW5y9XHiJF2
 bX8hhGP70fEmdW2g3Ae08LXo0T/DIF77+c1C1scQ8BZQOqMHrEgVUKQWtkKv27eDo9H0
 hD1riCQjnJ9GlKOTffcmHprZcayUKDWdGr1IHGr4SsjXUNyCiDn6PaCfi6FbE258BFv9
 /7prmqWMYxiRujjex82lU9sTG6JzwBKsmCw5ULHajYZi5aEG7S/e2lTGYiChNgtYRZcq
 W24Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrrKHvoduDWCR2IxfcREWYPIRz11MSokObxlZz8nOcOtOA3ESpASmiDn14C5n7pk866BdG9fMt8/0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwTc6Qvo+zoALhLqVeHnC08Ic2ywJzX++hklCiCm+qW3WW79lgn
 wf+puJTA0YGPHqy9a+zgMWMui7JWqYsw6ZrHHhUCFFlhCepDxdkUR8uTuwbXGiduEgN3WYhoFij
 cRcMbvIa/R+tX8ggzwtKHuZbjG1GoBYU=
X-Gm-Gg: ASbGncu6/CVoh4ECzLBwAizWEupOOKOgjh2E2lfb5P/vg855y/LwZFBv83Y7QPz2gR9
 0QA49y7a46VrCEcPrMOHYdYQzROdQO92pFis9BHTBNNNr8TwUUofKCG/YWoM+u+nSaI1kpE8pkP
 b4qHjwIuBAKKhvyOOROoVY9R3XXmw1ouFsyZCB2ykqrNlpdBrncGoF2UehiHLogVfuCbuHn0CI9
 Ww1NUGQz9E8dkDLbOl+eC2+qjzPecKdfx1csTMYXoQFBrUY46UmnMT0rhMbyJDQkB2LxNeqxTCQ
 znsIWs8ZT07ORmTM5zjnWW1fQ33HjrpdKe0sHeeDPkwG3GO16wcN0NnEeJkR+SL6wzvWk3aQIl6
 BC3xHUoy9jaXSmLO/FJhXjFKP
X-Google-Smtp-Source: AGHT+IFfuN9zEIrSqZ4UfzyHrOAWhLG/2/sm864P3ydB1iuIelR7Cpw9LcULJ3uSXFJitdhtK2p/ltt0ZFQOQNh8uwg=
X-Received: by 2002:a05:7300:ac82:b0:2a4:3593:2c0a with SMTP id
 5a478bee46e88-2a724c02369mr27204611eec.3.1764629919416; Mon, 01 Dec 2025
 14:58:39 -0800 (PST)
MIME-Version: 1.0
References: <20251129213056.4021375-1-joelagnelf@nvidia.com>
 <2653abf6-5cd4-4385-b7c2-f377a9503160@nvidia.com>
 <7a88da9f-c67b-4a68-b8d6-a66f9096bab4@nvidia.com>
 <497c91a2-ca6c-4e05-bc5e-7c3818302c7e@nvidia.com>
 <2700c827-d3af-403c-857a-30324e0d8502@nvidia.com>
In-Reply-To: <2700c827-d3af-403c-857a-30324e0d8502@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 1 Dec 2025 23:58:26 +0100
X-Gm-Features: AWmQ_bkl2DTKJWfF5AG_9aZv1tTBUZWM-ImMGF4ZqdhUPDiYIUQE-GRQbnKTx8c
Message-ID: <CANiq72=wGCRrZGvsoqs5jZQ-n23H9chxpH+dwo=jomhEjCsrZA@mail.gmail.com>
Subject: Re: [PATCH v3] rust: clist: Add support to interface with C linked
 lists
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, Danilo Krummrich <dakr@kernel.org>, 
 Dave Airlie <airlied@gmail.com>, Alexandre Courbot <acourbot@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Timur Tabi <ttabi@nvidia.com>, 
 Joel Fernandes <joel@joelfernandes.org>, Lyude Paul <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, Andrea Righi <arighi@nvidia.com>,
 Philipp Stanner <phasta@kernel.org>
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

On Mon, Dec 1, 2025 at 11:43=E2=80=AFPM Joel Fernandes <joelagnelf@nvidia.c=
om> wrote:
>
> The documentation clearly says "doctests get
> compiled as Rust kernel objects, allowing them to run against a built ker=
nel.".

Yeah, there is also a Python script that KUnit provides that some
people like to use too, and quite convenient to pass certain configs etc.

Cheers,
Miguel
