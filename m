Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D18CB8B9A2
	for <lists+dri-devel@lfdr.de>; Sat, 20 Sep 2025 01:06:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B93910EAA2;
	Fri, 19 Sep 2025 23:06:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hyJSa5Yk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9402910EAA1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 23:06:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A36F26013A
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 23:06:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58DC1C4CEF5
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 23:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758323178;
 bh=SXKQM429Gul4wuugVn+b5LOXdKXoIRDss44wvRTpTno=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=hyJSa5Ykk/esl79UdkOV+hUdnov1Nd8kxete2wH+Vcb7BiyPNHH7OjmxxldTNyXff
 dmddiZKahwOnfZwe2USbAGA94+qNbv1oJafzYWEOLtI5I0h9g6jMAoOQH3aP1imR1s
 aDhPCzVBz7CZCtYpfOyu3HkwqwY5r3Co3+8rvNXUERNmtoQlS7Y1ivoiLZ7Bg/EZkk
 KEZuh1ab9MTv446zzdNFtI/8PAmxikA88+tGSQ3UqIja2LtYWA6YRrD9ZKq1tobMid
 8QYqDn/Pfh0+91/N1DLsfNoJ0aLQ5EC8U3vnvzHz7efFxr14EEK6Cne3afRRZxuQwE
 4IXAYDIH/UlHw==
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-b2350899a40so339569966b.3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 16:06:18 -0700 (PDT)
X-Gm-Message-State: AOJu0Yyrjyg9ubDzb7mBvFQNNrhDK5NBbu939RVJ61lPFzrJFEjW1KjE
 rvnhvlRn5+VSxkRGxLhEG/e7ZMsbZN/nIIQ66B8Pf27UxQl+XM2WpmD7Jeq5oHTBGpgHP+SJNaQ
 XhJcEBzT++4WlcbxDL1f+rcaDo2gCVQA=
X-Google-Smtp-Source: AGHT+IEPyqD8Z/uIMR4y+FnBrXjdCn1SCouJbFidF3JwRW1s2eKnHCGY/aZJCC2e/Tj8N5brMU8zVowHw3mTY8x0rSk=
X-Received: by 2002:a17:907:c0a:b0:b04:20c0:b1f9 with SMTP id
 a640c23a62f3a-b24f547fdc3mr488417266b.52.1758323176877; Fri, 19 Sep 2025
 16:06:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250827082015.959430-1-apopple@nvidia.com>
 <20250827082015.959430-9-apopple@nvidia.com>
In-Reply-To: <20250827082015.959430-9-apopple@nvidia.com>
From: Timur Tabi <timur@kernel.org>
Date: Fri, 19 Sep 2025 18:05:39 -0500
X-Gmail-Original-Message-ID: <CAOZdJXU1oxxPxz4kUTtPseYmfE9Sa1U9nmFoqaoK1ekEv_EwFA@mail.gmail.com>
X-Gm-Features: AS18NWCcdeo5PWwM8QfmwAkG8tyE42lft8TtEs06JJT0OA22EkpZij9s3VQ3tXA
Message-ID: <CAOZdJXU1oxxPxz4kUTtPseYmfE9Sa1U9nmFoqaoK1ekEv_EwFA@mail.gmail.com>
Subject: Re: [PATCH 08/10] gpu: nova-core: falcon: Add support to check if
 RISC-V is active
To: Alistair Popple <apopple@nvidia.com>
Cc: dri-devel@lists.freedesktop.org, dakr@kernel.org, acourbot@nvidia.com, 
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

On Wed, Aug 27, 2025 at 3:28=E2=80=AFAM Alistair Popple <apopple@nvidia.com=
> wrote:
>
> +register!(NV_PRISCV_RISCV_CPUCTL @ PFalconBase[0x00001388] {
> +    7:7     active_stat as bool;
> +    0:0     halted as bool;
> +});

Two more things I've noticed:

1) I think the convention is to list the bits in increase position.
That is, 'active_stat' should be on the line below 'halted''

2) I think that this should actually be PFalcon2Base[0x00000388]
