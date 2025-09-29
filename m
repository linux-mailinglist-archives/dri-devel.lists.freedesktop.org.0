Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E406BA99C5
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 16:38:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5511E10E42D;
	Mon, 29 Sep 2025 14:38:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="W43ofVqS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0C0A10E42D
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 14:38:26 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-26e81c17d60so9276355ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 07:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759156706; x=1759761506; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6wxzuRD2+UgfGobNcQjA07eqzttSMbasZ+Ip7tu3YNU=;
 b=W43ofVqSnrumy6nxQgZIIE94r9l6wH588+eChhCM/M6oWcSKt6AYViJAqj3bDRQ+FD
 xTmTReii+ly8VKsJnbMbDQJIcCdEbCIUgOdIHv5uTzKX7QttXym0bSC30juttAKUL3Cq
 0NkgZpd4kK+X+shRyZaAwK6jAC1un49GKC6i/6r1fCvtJvYwN+aBf+CYpJ+XnloG4OFf
 KSIXDvjXcDxqGkfI4RDmj6ugSu7GSlbhURwP2+DbUbpL8r5NYFMXa96bDke2JiUUY25R
 1zE3N/mRSlj8zvxbsgDvoJhnxVQUDPuFhNKWqurU86pENK9k/Tr2GWhTgdq1DxvH6ub1
 TY3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759156706; x=1759761506;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6wxzuRD2+UgfGobNcQjA07eqzttSMbasZ+Ip7tu3YNU=;
 b=HvZtqGaX22uuaE72GEJku6VUqXJ4TDSkaAwHgwINpob6ubdIoCNP+jm7SFDL0UjVgd
 OVzTmK0FgU54W8MC9foi55I++1hFa6pWAv3wmgLpRXo/Zc9YYw5OXfPVh8KOY05uHk5x
 QgZcpU3nQJoQ8lY6Z5A5e01jssLkN7YvjETBcaxtdW8cq97wgMDuK3hh9B1XbWhOxp/6
 LLx2CD7WdYVX7JKsvVeZF8zOa4yvSz9pzmvg2JyfUXygrTfJH2GYWxRI5fU03/gULoah
 2AAmR0TGBU+5PnIA7sm8ShS5o4CwLHpCHtjHJjSAhMmhMHktYJhoy7Vq9G8hKRQn0joB
 nm5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2iHr1nJFjx321IbCL91K+vy25WG8r/xkInrnh09p486KGrFF45hIv1CCCNRpKGJrovYXMdWl5k4c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNCbhSEXK6ifN8KMdrUq6uIwGGM+JP00whZkE4c3H5GovxPKU8
 /s6OEcI1nDE0ENSjE365KObBYN08NC7SJTZ5CXDZS+8nPmTeGTpD6Ed6XvCjHqfRdFBD0yOQnge
 kI2Rpqj4ShcfpGZDIPGAKjQgPzZ4Qq/nVD6ORNns=
X-Gm-Gg: ASbGncuEdpjxaENft1YFtC56tXMLEwIpUIieXzZxQWSHNBAYPPkLhlBi9DVLxVfT5Jw
 WV5lpDNHV8y4k3wFAAOsrRNQY+FIajYloDW6lKYvREv6u7nPCU7WGg2Tf5BVArFjMRiSONCDDCE
 RA/Azuf5m0zl1y6V0HfteR7h88HZHqn2gGps/7RGPWQ9J9UjjhKLWt5D/EDbQGjKepJcu9pSj9i
 iiv2b+dZs2hattsyiluGSbLLruwtKqqru6C/Q9b28DCkbLUxDe7qBeLBBSxLKP/XYCV2IdG4toc
 ps3QoLoh+8j/haq76PPQo5sTaY9uHoERsCOiZBR7hV4cjII=
X-Google-Smtp-Source: AGHT+IEuajVdRt/zkJ/UX7z6Wnp/1y6NOw3KWFiaL0wSJ/2A6J51idlMClGnkDk/Tn16oxOvOKsoW449qVwpqNver/w=
X-Received: by 2002:a17:903:1a68:b0:275:c066:33dd with SMTP id
 d9443c01a7336-27ed4ab64a4mr106185325ad.10.1759156706206; Mon, 29 Sep 2025
 07:38:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250922113026.3083103-1-apopple@nvidia.com>
 <20250922113026.3083103-6-apopple@nvidia.com>
 <DD2GCDGQ7Q4W.1CSFYSETFSN5H@nvidia.com>
 <7brvf66smc3ltqrw7tm7smth6wnefeqykdm2n4qahi5xnr6d5o@4l5xfdbznlp3>
 <DD5CXDR294YD.2RL474PWBDWTV@nvidia.com>
In-Reply-To: <DD5CXDR294YD.2RL474PWBDWTV@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 29 Sep 2025 16:38:12 +0200
X-Gm-Features: AS18NWBU5ftnpGhJqKd4k_6D7IlxaPNAUhkxayMY9q8yLGmTLeUS7TVSiAU2z4g
Message-ID: <CANiq72k3qkj1HxjnCoknAdWhdM7O1ZBkZDqBsVS7vxYH-tRCWg@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] gpu: nova-core: gsp: Add GSP command queue
 handling
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Alistair Popple <apopple@nvidia.com>, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, dakr@kernel.org, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, John Hubbard <jhubbard@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org
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

On Mon, Sep 29, 2025 at 4:34=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> I think you will also need to explicitly enable the feature somewhere -
> for the kernel crate it is in `rust/kernel/lib.rs`, but Nova being a
> different crate I am not sure where we are supposed to do it...

`rust_allowed_features` in `scripts/Makefile.build`.

I hope that helps!

Cheers,
Miguel
