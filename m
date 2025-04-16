Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3F1A90F2B
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 01:09:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDF6C10E182;
	Wed, 16 Apr 2025 23:09:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kw8p+6vc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C6C010E182
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 23:08:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0EFBBA4A860
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 23:03:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1291EC4CEEA
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 23:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744844938;
 bh=wd1IBgg6IH1wIFugFyWcIertHrlNLO32GnVoMQLkSk8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=kw8p+6vclJXjKXxiCYPIes9gZX3alA8uhiel69rMMv+GIP+qz+uJTt5h1SgUpzzDE
 o7An4BOKQClkv1yIYhAi7sVmo2XMblJ4q6wu7uE3ivEWi+CX6SIdvHdxB65DlPXQDk
 VpqeY2ynSVg78TUJoOFWnTjb/xHq1MSbqpys2KKa5BU9NFBkPDDO2+zgdWkBHrmSaR
 YlAMGVTKOx/QlJFLoqu18jznc1DGcxaMpbWo7UH4ubjKBKNeT7xBACZ3qnlTLskbq2
 Q9GObPOGy0i2B+1WWaF02e8ZBLVsJUgZ+8nT7CU6jVtEClGJXJtkxQsH8ZdxBZ2EMW
 xjo2xWeHH3SdA==
Received: by mail-qk1-f180.google.com with SMTP id
 af79cd13be357-7c5e1b40f68so14203085a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 16:08:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXYpKko1+eKBum0oF2aE3IkOLhsOQhfB173fpLN3xH3veB2vql0iFbnCYXoUQQ6qtYu8CoVJ++ND7w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzrKsxaCb6N6YJyFCW0xCXg7HWb15n9l/eOGbJuxbgEWcF724Vl
 qIVABoNd/r+0vHVtvZ88WXMO8g5spqFKMqQFsiy/rDLBfB/KpRuOXCoz5xBPLQhQjjmEV/YCIlO
 koEd9dtJfqvY3kwFpOoOdEUFFYc4=
X-Google-Smtp-Source: AGHT+IHWgsmg0r3kgSF5MEKuJ5L71ycj0wBS7HloLVITIcp/00ImA6inZqQ+8pwrlQqjny2Dy1k8gWo3S+omu6vD/NU=
X-Received: by 2002:a05:620a:2585:b0:7c7:a606:5983 with SMTP id
 af79cd13be357-7c918fce4bdmr546964585a.1.1744844937231; Wed, 16 Apr 2025
 16:08:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250414225227.3642618-1-tjmercier@google.com>
 <20250414225227.3642618-3-tjmercier@google.com>
 <CAPhsuW6sgGvjeAcciskmGO7r6+eeDo_KVS3y7C8fCDPptzCebw@mail.gmail.com>
 <CABdmKX0bgxZFYuvQvQPK0AnAHEE3FebY_eA1+Vo=ScH1MbfzMg@mail.gmail.com>
In-Reply-To: <CABdmKX0bgxZFYuvQvQPK0AnAHEE3FebY_eA1+Vo=ScH1MbfzMg@mail.gmail.com>
From: Song Liu <song@kernel.org>
Date: Wed, 16 Apr 2025 16:08:45 -0700
X-Gmail-Original-Message-ID: <CAPhsuW72Q2--E9tQQY8xADghTV6bYy9vHpFQoCWNh0V_QBWafA@mail.gmail.com>
X-Gm-Features: ATxdqUGXvprakmHZkoWk7DGzVzqbToydQxzYVEiON_q8fHz2r4Qn3y9LJI3zuo8
Message-ID: <CAPhsuW72Q2--E9tQQY8xADghTV6bYy9vHpFQoCWNh0V_QBWafA@mail.gmail.com>
Subject: Re: [PATCH 2/4] bpf: Add dmabuf iterator
To: "T.J. Mercier" <tjmercier@google.com>
Cc: sumit.semwal@linaro.org, christian.koenig@amd.com, ast@kernel.org, 
 daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
 skhan@linuxfoundation.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org, 
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, android-mm@google.com, 
 simona@ffwll.ch, corbet@lwn.net, eddyz87@gmail.com, yonghong.song@linux.dev, 
 john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me, 
 jolsa@kernel.org, mykolal@fb.com
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

On Wed, Apr 16, 2025 at 3:51=E2=80=AFPM T.J. Mercier <tjmercier@google.com>=
 wrote:
[...]
> >
> > IIUC, the iterator simply traverses elements in a linked list. I feel i=
t is
> > an overkill to implement a new BPF iterator for it.
>
> Like other BPF iterators such as kmem_cache_iter or task_iter.
> Cgroup_iter iterates trees instead of lists. This is iterating over
> kernel objects just like the docs say, "A BPF iterator is a type of
> BPF program that allows users to iterate over specific types of kernel
> objects". More complicated iteration should not be a requirement here.
>
> > Maybe we simply
> > use debugging tools like crash or drgn for this? The access with
> > these tools will not be protected by the mutex. But from my personal
> > experience, this is not a big issue for user space debugging tools.
>
> drgn is *way* too slow, and even if it weren't the dependencies for
> running it aren't available. crash needs debug symbols which also
> aren't available on user builds. This is not just for manual
> debugging, it's for reporting memory use in production. Or anything
> else someone might care to extract like attachment info or refcounts.

Could you please share more information about the use cases and
the time constraint here, and why drgn is too slow. Is most of the delay
comes from parsing DWARF? This is mostly for my curiosity, because
I have been thinking about using drgn to do some monitoring in
production.

Thanks,
Song
