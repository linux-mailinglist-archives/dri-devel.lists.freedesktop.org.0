Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C767E6EFA14
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 20:31:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A13B10E0FD;
	Wed, 26 Apr 2023 18:31:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DF7010E0FD
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 18:31:19 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-505934ccc35so12949811a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 11:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1682533877; x=1685125877;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9uTv2Sl9PDUU54eNd3QncqSfjAzwjfz21lg3kZ1obAs=;
 b=en2KQ6jA3+qMSieJhDnfovGfYROoA8+yYoy81+MjkpL259xbRA3XKAEpm97Ov/VspE
 N04WDGKWmt8aNRY4rr76U5iYXJhadKvdTUN61NLFBWUfR/lsl7t+nH8G5GIBXLcpWxTD
 JoifHNadRH0wQioTUsr3VPb6kBllZ8thmIQQY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682533877; x=1685125877;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9uTv2Sl9PDUU54eNd3QncqSfjAzwjfz21lg3kZ1obAs=;
 b=QufC03rB1o43unojQJ7/LXaYdNx7ANBWc0igmh/od9WIbN9ve5Jy6QEemDYuoKvkMG
 lKqW571myCuirn50FmL6SQIOGUXGLtsH+H4T77rIVi8y9eU3VeFb4Ff7wSA73Z10tTzA
 J8MvBgHi+i0FLtrBLJXb4UoRuuSEbm6C+adPkbNGRrYVMwpOK4i2O7tCfBcEVIfwJOhm
 pM+8fVA2dlp5SgyfBhPK/YyDK9RunW0UmQWOpJJusvGkmJOLVwCQ9Jhcw6AmuATMFfMp
 gMPVqZyr9UO3v+u1IeHysVGA2GMtRys8tjfwZL9w/Hb7By56i3ytNzQaH1XpQSDRfQzT
 zoiA==
X-Gm-Message-State: AAQBX9chEgn626AtQy1h7HHveJgBa4A4irMIMsbYrjC7L5fbWjJZh6BJ
 ybSyojioeW1++hyedZ8ah4XuHh4MvXBujr6EwTMnpg==
X-Google-Smtp-Source: AKy350bX9YeNgedF93/ZM81Bf+zaAQ1ey7DcctzL9bK4Dd651f7HXBoKpfciqVATAUfrTGGg95XruQ==
X-Received: by 2002:a17:906:ecac:b0:94f:6218:191d with SMTP id
 qh12-20020a170906ecac00b0094f6218191dmr17827786ejb.32.1682533877022; 
 Wed, 26 Apr 2023 11:31:17 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com.
 [209.85.208.48]) by smtp.gmail.com with ESMTPSA id
 h13-20020a170906718d00b0095386574c81sm8590368ejk.51.2023.04.26.11.31.16
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Apr 2023 11:31:16 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-506c04dd879so12942323a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 11:31:16 -0700 (PDT)
X-Received: by 2002:a05:6402:1a4e:b0:506:b228:7b03 with SMTP id
 bf14-20020a0564021a4e00b00506b2287b03mr19505052edb.13.1682533875997; Wed, 26
 Apr 2023 11:31:15 -0700 (PDT)
MIME-Version: 1.0
References: <ZEljCgVFnDl/C+l3@debian>
In-Reply-To: <ZEljCgVFnDl/C+l3@debian>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 26 Apr 2023 11:30:59 -0700
X-Gmail-Original-Message-ID: <CAHk-=winmePW-RJdPEE031U=7z92aAv5TAnTU0bR74uEZOMb3Q@mail.gmail.com>
Message-ID: <CAHk-=winmePW-RJdPEE031U=7z92aAv5TAnTU0bR74uEZOMb3Q@mail.gmail.com>
Subject: Re: mainline build failure due to 322458c2bb1a ("drm/ttm: Reduce the
 number of used allocation orders for TTM pages")
To: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>
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
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Huang Rui <ray.huang@amd.com>, Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 26, 2023 at 10:44=E2=80=AFAM Sudip Mukherjee (Codethink)
<sudipm.mukherjee@gmail.com> wrote:
>
> drivers/gpu/drm/ttm/ttm_pool.c:73:29: error: variably modified 'global_wr=
ite_combined' at file scope
>    73 | static struct ttm_pool_type global_write_combined[TTM_DIM_ORDER];
>       |                             ^~~~~~~~~~~~~~~~~~~~~

Ugh.

This is because we have

  #define TTM_DIM_ORDER (__TTM_DIM_ORDER <=3D MAX_ORDER ?
__TTM_DIM_ORDER : MAX_ORDER)

which looks perfectly fine as a constant ("pick the smaller of
MAX_ORDER and __TTM_DIM_ORDER").

But:

  #define __TTM_DIM_ORDER (TTM_MAX_ORDER + 1)
  #define TTM_MAX_ORDER (PMD_SHIFT - PAGE_SHIFT)

which still _looks_ fine, but  on 64-bit powerpc, we then have

   #define PTE_INDEX_SIZE  __pte_index_size

so that __TTM_DIM_ORDER constant isn't actually a constant at all.

I would suggest that the DRM code just make those fixed-size arrays
use "MAX_ORDER", because even though it might be a bit bigger than
necessary, that's still not a very big constant (ie typically it's
"11", but it could be up to 64).

It's a bit sad how that macro that _looks_ like a constant (and is one
pretty much everywhere else) isn't actually constant on powerpc, but
looking around it looks fairly unavoidable.

Maybe the DRM code could try to avoid using things like PMD_SHIFT entirely?

                Linus
