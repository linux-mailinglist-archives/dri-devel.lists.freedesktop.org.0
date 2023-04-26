Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D129C6EFDA5
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 00:49:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B65FA10E8A1;
	Wed, 26 Apr 2023 22:49:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A413210E8A1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 22:49:23 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Q6DZQ106hz4x5c;
 Thu, 27 Apr 2023 08:49:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1682549359;
 bh=9hSAAAKNZdoaKCo/vqVSwb9UYrU/fz0nvs4rfK4bbMs=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=K+NoNO4JJ70Ezbh3yN9FVpVO2zylLPQ++7YyOumIvLCa6LOGt9SHrbwhE4kKduC+l
 LkVuDoZLPJ99pUzfN+8PhhRasUbMxhGcCzByls1V1HIGCQijlG0w1zoed1iVHYLtHH
 mmC4U4i3ZiQsM1GAfaGcS1lEkZohWk5wcFA6Fzqhp0XzoZuVmPqO4WVe7xXVDKjlDK
 OD62pJ1AUEOHDniD21RNDWYihq2qLext6tmSnUWif7TlNOdXOf9bplHwsciRdwSEvy
 h8oVqqk1XD4xETjvQ5KZOanNC6qnxjEpZb3uQ1MdVGeb9OY9d4hWnqZaxUpDzb+cKO
 lh5cNNgP+H2ww==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>, "Sudip Mukherjee
 (Codethink)" <sudipm.mukherjee@gmail.com>
Subject: Re: mainline build failure due to 322458c2bb1a ("drm/ttm: Reduce
 the number of used allocation orders for TTM pages")
In-Reply-To: <CAHk-=winmePW-RJdPEE031U=7z92aAv5TAnTU0bR74uEZOMb3Q@mail.gmail.com>
References: <ZEljCgVFnDl/C+l3@debian>
 <CAHk-=winmePW-RJdPEE031U=7z92aAv5TAnTU0bR74uEZOMb3Q@mail.gmail.com>
Date: Thu, 27 Apr 2023 08:49:11 +1000
Message-ID: <871qk6z2c8.fsf@mail.concordia>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Huang Rui <ray.huang@amd.com>, Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Linus Torvalds <torvalds@linux-foundation.org> writes:
> On Wed, Apr 26, 2023 at 10:44=E2=80=AFAM Sudip Mukherjee (Codethink)
> <sudipm.mukherjee@gmail.com> wrote:
>>
>> drivers/gpu/drm/ttm/ttm_pool.c:73:29: error: variably modified 'global_w=
rite_combined' at file scope
>>    73 | static struct ttm_pool_type global_write_combined[TTM_DIM_ORDER];
>>       |                             ^~~~~~~~~~~~~~~~~~~~~
>
> Ugh.
>
> This is because we have
>
>   #define TTM_DIM_ORDER (__TTM_DIM_ORDER <=3D MAX_ORDER ?
> __TTM_DIM_ORDER : MAX_ORDER)
>
> which looks perfectly fine as a constant ("pick the smaller of
> MAX_ORDER and __TTM_DIM_ORDER").
>
> But:
>
>   #define __TTM_DIM_ORDER (TTM_MAX_ORDER + 1)
>   #define TTM_MAX_ORDER (PMD_SHIFT - PAGE_SHIFT)
>
> which still _looks_ fine, but  on 64-bit powerpc, we then have
>
>    #define PTE_INDEX_SIZE  __pte_index_size
>
> so that __TTM_DIM_ORDER constant isn't actually a constant at all.
..
>
> It's a bit sad how that macro that _looks_ like a constant (and is one
> pretty much everywhere else) isn't actually constant on powerpc, but
> looking around it looks fairly unavoidable.

Yeah, it allows us to build a single kernel that can choose at runtime
whether it uses the HPT or Radix MMU. The page table geometry is
different between the MMUs because they support a different sized huge
page for THP.

cheers
