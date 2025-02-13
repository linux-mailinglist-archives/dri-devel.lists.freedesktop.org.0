Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F058AA33C81
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 11:21:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0700C10EA47;
	Thu, 13 Feb 2025 10:21:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="fB+i+mjl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D65110EA47
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 10:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739442072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eIZl42f0T/s4rPyC/mDHixtV5a5Psa4ti9oIJ2wM97U=;
 b=fB+i+mjlDcke8uM+JJr9l12WnRs5x5C56tYbuaDsaOLcj9MbdupqaKATo4ebCx7K/kCAtL
 wbLHEBVhnYbYRZS3uhOrs2/Cja7bqWTJIDK6b/WXzk4E8cWZ1lRIGf+5jgNyX05nNEpfxq
 VM23dXTdC6dhE48HFab/9axceRFlhIU=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-343-PKthFKWUNdmPxvRSSSlM8g-1; Thu, 13 Feb 2025 05:21:05 -0500
X-MC-Unique: PKthFKWUNdmPxvRSSSlM8g-1
X-Mimecast-MFC-AGG-ID: PKthFKWUNdmPxvRSSSlM8g_1739442064
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-2fc0bc05c00so2585275a91.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 02:21:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739442064; x=1740046864;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eIZl42f0T/s4rPyC/mDHixtV5a5Psa4ti9oIJ2wM97U=;
 b=sneFiR+X/GljA+eOu6Pps69QvFWCYMQlmGpHAT9fwafGY5DD6ImT6G1lOrIard6AY2
 aGHJlfISFy8fGVX/bKpXza6+SoF1EWnsCiY5zSdF/Mo+aAxRfM8zO329qyAlEFMgb1Jw
 5ey4CcSRcF66DceifKx5QFnFkyj2ZaNCgFS+z5KAVujUGoELn81eB/a2LpvtgG4we+V8
 +HmDXfFojHCzBhNPEVb51ptZjBTFz6XAygcebAraBtOokloxWrnFODbRQchMrTxAcIuF
 jDrgBGrMKnBMQD9K4J63KuU4xXlielvFtz3VjuQNrevXh6yYlDQ9Rn0g8xeXJ2K/MVtZ
 n6fA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6ZuHYIzq2qQxpXLljAcoYeNWZkVzxl/IJOeyoLFTGE16tGvwc8bePfxMS1DQBGTeub+KELx524f0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxzs1lvB2AKvikX+/gm/n3s3gO9SoqUDlibo6mR8ebU0TyHyKi0
 XoytV+Xgxx8D319nnXB+Co7VUMWYfvxF7Fw7/qJUUmbzW6qzQ99MkK/FMgBOJDsjlvujRyO/yJT
 RURuwNarDGrlxn6yDFbKC2BSPytUjdnLJd9i9fgn/l50NghCN1hzMMg+rQ11GQ8tUJYeQ42fYTM
 rHmHj6W4VFPOklNQ3U50gIPJvCBRbciMqoPd9SZpsh
X-Gm-Gg: ASbGnctR3CmHn1KU+sbN/3PmVGqB+oTOjjOOg48gCwhJJ+6BSq1zmrMQ5iOQFwxjPVV
 FMOgr/ctnm3x5rLf9AydxpU9KAI2gy4F5vCzNXpxElJgxssT+IpnX+zTxR49X
X-Received: by 2002:a17:90b:4d0c:b0:2ee:b2e6:4276 with SMTP id
 98e67ed59e1d1-2fc0f09e2a0mr3817000a91.27.1739442064110; 
 Thu, 13 Feb 2025 02:21:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGu4vn2LrjqAnhWuWOvrN2AtW5Lwg4CZNxqKUWaaXHxg53iYVtWZ4u3ana8B5JaufUoT62DXG+exzieHJ4zSN8=
X-Received: by 2002:a17:90b:4d0c:b0:2ee:b2e6:4276 with SMTP id
 98e67ed59e1d1-2fc0f09e2a0mr3816956a91.27.1739442063706; Thu, 13 Feb 2025
 02:21:03 -0800 (PST)
MIME-Version: 1.0
References: <2025013030-gummy-cosmic-7927@gregkh>
 <20250130172437.GN5556@nvidia.com>
 <2025013148-reversal-pessimism-1515@gregkh> <20250131135421.GO5556@nvidia.com>
 <2b9b75d1-eb8e-494a-b05f-59f75c92e6ae@marcan.st>
 <Z6OzgBYZNJPr_ZD1@phenom.ffwll.local>
 <CAPM=9tzPR9wd=3Wbjnp-T0W8-dDfGah-H3Ny52G85B+2Ev9ksA@mail.gmail.com>
 <208e1fc3-cfc3-4a26-98c3-a48ab35bb9db@marcan.st>
 <CAHk-=wi=ZmP2=TmHsFSUGq8vUZAOWWSK1vrJarMaOhReDRQRYQ@mail.gmail.com>
 <20250207121638.GA7356@wind.enjellic.com> <20250208204416.GL1130956@mit.edu>
In-Reply-To: <20250208204416.GL1130956@mit.edu>
From: David Airlie <airlied@redhat.com>
Date: Thu, 13 Feb 2025 20:20:52 +1000
X-Gm-Features: AWEUYZl6JZiEhvOwTJa3Qd8Zms_i4LmB6cYZldPte7npIma4O8LaQa0cLqCkN-I
Message-ID: <CAMwc25pxz2+B329BArDQMpxOvpMtvhop1u_Uwc0axn2LqNP0vA@mail.gmail.com>
Subject: Re: On community influencing (was Re: [PATCH v8 2/2] rust: add dma
 coherent allocator abstraction.)
To: "Theodore Ts'o" <tytso@mit.edu>
Cc: "Dr. Greg" <greg@enjellic.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, 
 Hector Martin <marcan@marcan.st>, Dave Airlie <airlied@gmail.com>,
 Jason Gunthorpe <jgg@nvidia.com>, 
 Greg KH <gregkh@linuxfoundation.org>, phasta@kernel.org, 
 Christoph Hellwig <hch@lst.de>, Danilo Krummrich <dakr@kernel.org>, 
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, daniel.almeida@collabora.com, 
 aliceryhl@google.com, robin.murphy@arm.com, rust-for-linux@vger.kernel.org, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 "Bj??rn Roy Baron" <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Valentin Obst <kernel@valentinobst.de>,
 open list <linux-kernel@vger.kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 "open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>,
 DRI Development <dri-devel@lists.freedesktop.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FsQkCrzb_A6U0e1BPGp5asdMOuMoq2Fm35tsHtWMm8w_1739442064
X-Mimecast-Originator: redhat.com
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

On Sun, Feb 9, 2025 at 6:48=E2=80=AFAM Theodore Ts'o <tytso@mit.edu> wrote:
>
> On Fri, Feb 07, 2025 at 06:16:38AM -0600, Dr. Greg wrote:
> >
> > The all powerful sub-system maintainer model works well if the big
> > technology companies can employ omniscient individuals in these roles,
> > but those types are a bit hard to come by.
>
> I'll let you in a secret.  The maintainers are not "all-powerfui".  We
> are the "thin blue line" that is trying to keep the code to be
> maintainable and high quality.  Like most leaders of volunteer
> organization, whether it is the Internet Engineerint Task Force (the
> standards body for the Internet), we actually have very little power.
> We can not *command* people to work on retiring technical debt, or to
> improve testing infrastructure, or work on some particular feature
> that we'd very like for our users.

Just as a courtesy to others can we not use the "thin blue line"
analogy in this community, it has had some bad connotation thrown on
it in the US context over the past few years, and I'd rather not as a
maintainer be aligned with current connotation/interpretations of it,
despite having family involved in our local force.

I'm open to suggestions for any better analogies.

Dave.

