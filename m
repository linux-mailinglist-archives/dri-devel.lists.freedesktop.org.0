Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A481BBF1233
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 14:23:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF08110E28A;
	Mon, 20 Oct 2025 12:23:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="aP0IiadW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54A9210E28A
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 12:23:51 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4711825a02bso26801175e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 05:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1760963030; x=1761567830;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xsVrddNgKdsa59i88tOUom/s0Tf6ykU6bezL99BIn20=;
 b=aP0IiadWsd0Qz/oo5wuF+k/sTCuf6bQTYpjZNCtUcnhScW9C5KrmR0CKz0Zv6CnvV/
 fC6Dx568Q3NMcMCeSxvjoayVbbxt9X+jxodGuuwOBtHXb8f2UtXxs66yFiNk2iHVYVZH
 FL7UM0LeE+ZRBayMZm5t28xojVOpw9QH+zzqhdEIVQ2RVsqKTg0nmLUi7csJw6i9s7ap
 S0QKmqG7ttUQGWb3Ajk6UkucM/Va59Mr+3z1vfQIWPFg+oe9Ju2YRpA9XShDrLcbbOCV
 Ljry196ZvZk9eJvyiZNRCpzxPA7MYRrCDGbNnEnoj/P1n44PE0TuQqIcg+mTbnzyL4sC
 W0dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760963030; x=1761567830;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xsVrddNgKdsa59i88tOUom/s0Tf6ykU6bezL99BIn20=;
 b=sXqva1KbB4fVg6zs472NViH4ZZd53xuh1Qg81tfGoEP6EcJLcIf+KyspVewE27R+sa
 pJB4YSa4FKFRb49FDF15oE9QLtW9WVAXopDfdBkI31PutMBP4uDEKN4WzxQCETwnOf1w
 69F/Q6r0q+I3QKrwa6+Yh48FmX2Chi0aQs6o/V+O1AyJ6FFVergl1N5V1ztnAGZnu0TA
 IB+hpmTjyABoP0AROz35vgaHENYgKptuYvRjiJRvxrv244WbJVlnimQNZHT34UppzMwh
 AZJiGtWJX8JZkeFhU7K31PXs7vkfhbvIONkQ7DTg8ICm73l3qfPQKycXc5CmblKXApag
 9myQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlU3srNPO/MZkGHoFotTjs/LBn23NLRtCRAHYpZKffdkLF+dJEqX18llr9P+7HDoFi8uZs6T87weg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzdxUfvKWIKv9o4A/8plqmROAY6pCW/zS/f/TNgJ3ljzH0Daem9
 DzZz8z0c09xBQxfUNjmwZ/da3M5gb5OfrJ68PQuyl86roRxJ7OOt0S1UhXrvJaCQ51N17jpT8UV
 TMTyCLv3lIgp2GUM04CdtFaH5GJu3tl/k3JDxTS3y
X-Gm-Gg: ASbGncu592J0uCu5MnCuDuCxAePNBKBRu4npDa/wxke5kiJSjHevTrNZqh/L0lpRe4N
 mn1XEGr9it7ohQaargLlTvJJRiiGzxsAS/qoKrwb1zfY6D9oLZCTJS66Djy1khOjIRA/JFljCOi
 wb7qEf9Qb9H4q5uTcW+SRKEAqDy5RG4aEnxhhmSaR8WVtCO/+YKnWFzZlO43jbgLHlKrQbwxtIK
 VLiWQ+7KzUQsXwgD8IGZtpmTE8tXr7t1YgEtImRtrnZUXc8d1jaPXTgHcH89HOwX/KUzcjg37GL
 k9Z4R4Fq9+2LlFk=
X-Google-Smtp-Source: AGHT+IEzDxQ99eTVFb1p72eG4BzDy4n/ljYK7KwPaNsss7sxyo0CST4hlFo6R49mTS4MCJM90qjBH4sAGn3rQV8UuQ0=
X-Received: by 2002:a05:600c:1d9c:b0:45d:d1a3:ba6a with SMTP id
 5b1f17b1804b1-471179174dcmr105272825e9.33.1760963029708; Mon, 20 Oct 2025
 05:23:49 -0700 (PDT)
MIME-Version: 1.0
References: <20251014064120.263455-1-lukas.bulwahn@redhat.com>
In-Reply-To: <20251014064120.263455-1-lukas.bulwahn@redhat.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 20 Oct 2025 14:23:37 +0200
X-Gm-Features: AS18NWA5B7IaPN02pGfQccVfxUVjCyEnsxCY8l0rw-xGHW4tso6TZRmVCMfMeXA
Message-ID: <CAH5fLghsp6UXy9ghYe0bS7ASty-VrDLVwRkmOt44Pr1sU6vvag@mail.gmail.com>
Subject: Re: [PATCH] rust: drm: remove unneeded handling for config DRM_LEGACY
To: Lukas Bulwahn <lbulwahn@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, kernel-janitors@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@redhat.com>
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

On Tue, Oct 14, 2025 at 8:41=E2=80=AFAM Lukas Bulwahn <lbulwahn@redhat.com>=
 wrote:
>
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
>
> Since commit 94f8f319cbcb ("drm: Remove Kconfig option for legacy support
> (CONFIG_DRM_LEGACY)"), the special handling in the rust drm code for the
> config DRM_LEGACY is not needed.
>
> Remove the drm_legacy_fields macro and simply use bindings::drm_driver
> unconditionally.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
