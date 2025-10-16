Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB42BE516E
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 20:45:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E66C10E332;
	Thu, 16 Oct 2025 18:45:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IcreTD8f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8C2B10E332
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 18:45:04 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-7810214dda9so148355b3a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 11:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760640304; x=1761245104; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FPl4GNeEvYNsD07xkIxR49GzR8yYXDLG1l9YclgP27g=;
 b=IcreTD8fhAwhPFhFs+E1RlFiYax20q0EeD2hDE6UhlrQn1H941wVOizStTpgO3voL4
 ej7YI6C21E+iHk4ia/Bs9DjluRYDr0k0hbVdJRlKzcUnNk3NCmu9CFkc3Eao4Nzqn7IR
 gIqtA+VXYaRGr/IAupGbt9xKZGtSI1kS8J38Cawu1OxM4LZOxkvXDjjQddiqRdVywDJ8
 sqORgliSwgpTziZr10KOfOFy4do5nRmzH4sjnfVrUoI5q3Fmhro8Olkb7b2IltsSF7DB
 Ka5SMnQ2LQE3Msa9Hosk+tlDelRZ8ITSoxwqKeSZUyDDXfbtmOlDBHnuOQ0NhH0SdlaS
 jyvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760640304; x=1761245104;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FPl4GNeEvYNsD07xkIxR49GzR8yYXDLG1l9YclgP27g=;
 b=PfqazkiGuGkYhKt8gPw2tr9Z1cImZud0pHze8TGP68GLLxQmlR9f4+Q+rPHsy6AU4g
 aDXOqUdIwt0staJlUe1ysE6ilg2/jd/0vKqOuy/NBzpljwFkOIz+0i8sG29eDWCAYLNP
 Eh1B6JRag58lp0NaMkheIaDBbxTRdYYGt5cEAF0GHoJ5h7u1bfizBc4vjvf8CBq1oosc
 g3UZRogHe2AeRFCmXRVm/sg+Ny6q6VpOYbB5J4Ddvtu/Ofv2GXfh6TCBEv/snvqkIDu0
 y1Z1bSypK0rLzpSaLtfTyxoIx0hqjArEleQ5m5RdvG/+VVcjN1YtFPGphwGGw4AaUUci
 Inng==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlOSvAkfdwTBnUH6hlY8jwjVMzvcLmzU1m/sSArzIDb53b9it0UGGz6di44ymtEjrj4shHjCehJc0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzwycbA9o7dBq7iBtUSAzEwsGrM5+r1GP2ZDQhKXkqa0KBn6C6Z
 uRQtK+ClPh67u0NhxrFsuUXWdhztkWi1CB0ZXfQnvTq+pL97j5HLItf7rMwSr4RP8vS6CkwDd/C
 VGy/x6NCYAW3iQDgkn8Bj9CmIXnMo9pQ=
X-Gm-Gg: ASbGncug2CmsG4tO9QKLC3BvLvAJ4vtHwPmoQUAC7TEKyj8j16cOKnV16MOJkbnk1y3
 rFmVBz70jsBPAxdzNZh/lfc0M08BR5+oIFkwMIBIkNKDMJjutZbIxzhfK8m2GcSIxbdjlxVOGba
 8CF5fd0v7Ym47kyZ+6zE/K15L5BKTk2eOOX7SJwBqYLZFNz3ipIz+9gZRew3Z2crVyQq1WWCVlj
 xZoJjipamIZSB+rjcGO3mLiiwX2wFniGPgIXKVr+I+SxRjGXU0vvo9kvWsUUpVYEy/wXSbOjFHH
 Hod9chi+S9/BSxp16ASNbBjwZoveQBUYkWk1Oom816HMAae9tPDLOVv6gXF6PYE7/0mAvizcd1z
 7Ytw=
X-Google-Smtp-Source: AGHT+IF9I6SSPaZXt6fObKsCwr8z4pX/yL7H2Swh89Pd5qRMIU65WohMKqiraRMDzUotqhTJ9xFy0vEvU+nF48HX4/Y=
X-Received: by 2002:a17:903:2f87:b0:290:af0d:9381 with SMTP id
 d9443c01a7336-290cba4effcmr5451435ad.7.1760640303984; Thu, 16 Oct 2025
 11:45:03 -0700 (PDT)
MIME-Version: 1.0
References: <20251013062041.1639529-1-apopple@nvidia.com>
 <20251013062041.1639529-8-apopple@nvidia.com>
In-Reply-To: <20251013062041.1639529-8-apopple@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 16 Oct 2025 20:44:50 +0200
X-Gm-Features: AS18NWCjsMPV451tdiawVF8gJgOdhZslUWuxkRt4tznLBhQSO2tbezIdx1gta_0
Message-ID: <CANiq72kK4pG=O35NwxPNoTO17oRcg1yfGcvr3==Fi4edr+sfmw@mail.gmail.com>
Subject: Re: [PATCH v5 07/14] gpu: nova-core: gsp: Add GSP command queue
 handling
To: Alistair Popple <apopple@nvidia.com>
Cc: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 dakr@kernel.org, acourbot@nvidia.com, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
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

On Mon, Oct 13, 2025 at 8:21=E2=80=AFAM Alistair Popple <apopple@nvidia.com=
> wrote:
>
> -rust_allowed_features :=3D asm_const,asm_goto,arbitrary_self_types,lint_=
reasons,offset_of_nested,raw_ref_op,used_with_arg
> +rust_allowed_features :=3D asm_const,asm_goto,arbitrary_self_types,lint_=
reasons,offset_of_nested,raw_ref_op,used_with_arg,slice_flatten

This is not sorted, and it is not mentioned in the comment right above
it -- in general, please try to clearly mention this sort of addition
in the commit message too.

As Alexandre mentions, it will not work to use it as-is. However, what
happened in 1.80 was just a rename, but the feature was available
since 1.67 as `flatten`.

If you want to still use it through an indirection or similar, then
please move it to a new commit that explains the addition of the
feature and the indirection to use it.

See e.g. the `file()` function I added in e.g. rust/macros/helpers.rs
in commit 36174d16f3ec ("rust: kunit: support KUnit-mapped `assert!`
macros in `#[test]`s") to see how to set it up.

Essentially it is:

    config RUSTC_HAS_SPAN_FILE
           def_bool RUSTC_VERSION >=3D 108800

And then:

    pub(crate) fn file() -> String {
        #[cfg(not(CONFIG_RUSTC_HAS_SPAN_FILE))]
        {
            ...
        }

        #[cfg(CONFIG_RUSTC_HAS_SPAN_FILE)]
        #[allow(clippy::incompatible_msrv)]
        {
            ...
        }
    }

I hope that helps.

Thanks!

Cheers,
Miguel
