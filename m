Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C7CBF3C32
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 23:34:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1734C10E529;
	Mon, 20 Oct 2025 21:34:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AyU4lpCm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D05CF10E529
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 21:34:07 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-29245cb814cso6126435ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 14:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760996047; x=1761600847; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TIA8kHBtPk6GgWmqAWWXnwTpPlJ3gJjCHeq/XdJy1Q8=;
 b=AyU4lpCmGrxKOD3IbKwZB+A2cHtg46X9gvFDDUAQeXS/UoO17xmNqzof2Tdr6hmDNe
 uO9AIDmDv4551YT4jZblphVkn4tNahlV85El7cI+7NB1u0oFJAdbwI3mIZNxB3/QJiEu
 ydsbYQRZNGOaMk/nna41tdeZ1OKWTU5M+XixQW7ty4xfQuLBHkrclWeHBKyhWa2Rs5R3
 3Pt1DPJ52lqZf0U3Vmxk+xpu2NiNm7lI6eg/4JbuLEJt0DbZyUr97vxMvnlmZs2jQXO7
 6ASqvDEfOAoFbHeeZWsOsRYM3QGj8GFucSZKPSvo9dEaoSOv6oWVKnAaF/VsqN5oYEfS
 E8qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760996047; x=1761600847;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TIA8kHBtPk6GgWmqAWWXnwTpPlJ3gJjCHeq/XdJy1Q8=;
 b=VKH7CzCfDsk6sMgSmWGeImNrl7gOKO1tOGPyD3zjj11E18DFDORweowpGXpG9vnrXd
 Yka5dtZWea8OJQv2FRCeqgi1Os6o9BuSsUw0eHP8EVLobhAWGZKHwxn2u+vf25WofA7w
 4QV7SCNSQnTqr1Ka4Vegvad0gpUHL77rW36BxOCUSba7Ry9JXjK4qGG/fSLyewFYD4Zs
 m/d/5x/+3eQHeadlzu8zh5T1c/wlrPjMF7V0vTkduQfyKG3jrp/1cG9pCo6qfOBOf61d
 UMGrKgOri7I3eJC/AcxuhLQ5fq+uZ+ORIGLaKAkMTVIwl2Wa5Wyp1fvHxSVZimQ5oMn6
 JK9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlk0B1jNzOalQ5ID979HCuCwgOWtF0C0rvn7JQAsNhTSOwLbmlX4iR9wrOJafzFaJUQDwlTOpklpQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx6mOsS+hvC+n+tJWztaxeYXOMArZm3jvwrJojCrvOD8NmeUQZ4
 6KXTrOopwBN+0YMXhefWPXDkXSPBY9n9czNCnGhhC1Lti0p0PK+n0VjLrrxLa1fj2DtY1bkIH48
 eWzh7WMFOyK/lyANjYkEgXuo69SSS0ok=
X-Gm-Gg: ASbGncvfkZ6O+Rboh0liSK2pgbIob16g3pjTeUN4qgWcJQk08ah/DqW7RFOIXUy2pY2
 2DK0gMJZrJ5Qcwy/hdFjohGBBGB97yl3ptw9Qmn+AbCOIdW3Gw/EUXsl8Gk/qeIzccmNOPoCBLp
 scb0BwbLsFKkYcrGHPZojkjh9IHTYwdJIwuw2v6JdA8jzh8hcJOh3BIQe5OvtiMjEZiXxJq53si
 Wtzq4+OU74t96oEAoVv6eXrMttw32CKK7bKzUHvDcQ59k6VdUMP00nR95p2JYTWtspaqyN1iFMZ
 kpDYL8kAaV87PN1TcuEdHHf5PWEcfbJGzC+fxf9rXRckqVOjGPTCzg+2/GY3PmL0miCBiYA+1yT
 zbd64qEFRlc/m9Q==
X-Google-Smtp-Source: AGHT+IENeHKMjyzGTYHHZV28uVbTm7W0v2W0HGYIwZ1YpX54wVhZRXd1wDtmMhBidXjOzxTnYzIEdPK9TNFHSokqIok=
X-Received: by 2002:a17:903:94e:b0:26a:3c75:5241 with SMTP id
 d9443c01a7336-292d3fcce91mr5493965ad.9.1760996047308; Mon, 20 Oct 2025
 14:34:07 -0700 (PDT)
MIME-Version: 1.0
References: <20251020185539.49986-1-joelagnelf@nvidia.com>
 <20251020185539.49986-2-joelagnelf@nvidia.com>
In-Reply-To: <20251020185539.49986-2-joelagnelf@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 20 Oct 2025 23:33:54 +0200
X-Gm-Features: AS18NWAADgBeA1nYLOcKyihsh6E3dmd5BWRM3ztrLw4uDz1-mBK39vAmoeM9Wwg
Message-ID: <CANiq72nGPeLvrjQB-62Ht8TR7oWPgF9HFO=yPX7TT3faqxnNFg@mail.gmail.com>
Subject: Re: [PATCH 1/7] docs: rust: Fix a few grammatical errors
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, dakr@kernel.org, acourbot@nvidia.com, 
 Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, John Hubbard <jhubbard@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, 
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>, 
 Daniel Almeida <daniel.almeida@collabora.com>, nouveau@lists.freedesktop.org
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

On Mon, Oct 20, 2025 at 8:55=E2=80=AFPM Joel Fernandes <joelagnelf@nvidia.c=
om> wrote:
>
> Fix two grammatical errors in the Rust coding guidelines document.
>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>

In general, please submit independent patches like this one
independently, e.g. this should go through the Rust tree.

Thanks!

Cheers,
Miguel
