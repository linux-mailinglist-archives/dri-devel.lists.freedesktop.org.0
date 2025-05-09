Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 098ECAB0711
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 02:29:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB7C510E227;
	Fri,  9 May 2025 00:28:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="B/hZksUx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0884110E227
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 00:28:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A81BE614BB
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 00:28:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C4D8C4CEE7
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 00:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746750530;
 bh=KihOfUg/9XwuGh7JrvWssx/WPXQw1u4V1nnzLZ17ROI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=B/hZksUx85KQAzQgyJhcLud896d9a0FViZp+yrXcyNtZYKKoJTFoWFVtkFFei4nsG
 xHgG1MtzZ2YUL555H2MMWXMhyGuzxxquOFXx7YRCG2BGsPXLoK7TAorEpMX63sADY1
 n1g06vqVgx3UsLudWNEzoMuLUjel0A8Ab9GvipbQNbrYFpN/6UzprB+jyQFzAyH1+l
 4Vmcuj9/h8uMBxCr7aRBf/tDv92n1DICPin9/rVr8u0xUosuVGmx+HXa1at3KaZGwD
 xaORDd9OGsff+yrtvgVCNW4LDy9UAmpod1NXKo3Manf7hPp0Ppo4mpscfy2qtZpw2Y
 DfSTxT9IQjOgQ==
Received: by mail-qv1-f53.google.com with SMTP id
 6a1803df08f44-6f53d271b7cso14464006d6.2
 for <dri-devel@lists.freedesktop.org>; Thu, 08 May 2025 17:28:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUAmgFN6V0raTCmkFZ+AicVIhEHIAfOPKPYWD9QrPPloXJLlBqvN1SGDOskKdH2DXkF/qF4hi1Pleg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzInmkimRvtzg+8cFtzNK0pYRavuspHzqQZH3akjGgBVAKQgGFY
 zaDxRWFnfl8g2ANS4uIDI1m4Q2nDbawIuO9DzrKoCRsITVYtcColQmNDWFUroszsIi+5M3qmiic
 bw5qpfJVNEPMSm/FXVv2ytTrV2Us=
X-Google-Smtp-Source: AGHT+IEZjmUuPnl3walRWvq2j8HrpCkOTj0Aad+6bRr9r/jSlB1hm5+VFIy5a/r9RnYh6bQmLPVS3BOr516ElNPcGNk=
X-Received: by 2002:a05:6214:62c:b0:6e8:97f6:3229 with SMTP id
 6a1803df08f44-6f6e47e74a5mr24782636d6.16.1746750529582; Thu, 08 May 2025
 17:28:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250508182025.2961555-1-tjmercier@google.com>
 <20250508182025.2961555-4-tjmercier@google.com>
In-Reply-To: <20250508182025.2961555-4-tjmercier@google.com>
From: Song Liu <song@kernel.org>
Date: Thu, 8 May 2025 17:28:38 -0700
X-Gmail-Original-Message-ID: <CAPhsuW613T4biUPER9zR9DdQA_wscN4-i3vV4efoOKUZ7pkTeA@mail.gmail.com>
X-Gm-Features: ATxdqUEx--2NHG96PqiywIn23M7lRslvlpezfrP_cxwU4xbMt6X3lm7qXfvmTG8
Message-ID: <CAPhsuW613T4biUPER9zR9DdQA_wscN4-i3vV4efoOKUZ7pkTeA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v4 3/5] bpf: Add open coded dmabuf iterator
To: "T.J. Mercier" <tjmercier@google.com>
Cc: sumit.semwal@linaro.org, christian.koenig@amd.com, ast@kernel.org, 
 daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
 skhan@linuxfoundation.org, alexei.starovoitov@gmail.com, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, android-mm@google.com, 
 simona@ffwll.ch, eddyz87@gmail.com, yonghong.song@linux.dev, 
 john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me, 
 jolsa@kernel.org, mykolal@fb.com, shuah@kernel.org
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

On Thu, May 8, 2025 at 11:20=E2=80=AFAM T.J. Mercier <tjmercier@google.com>=
 wrote:
>
> This open coded iterator allows for more flexibility when creating BPF
> programs. It can support output in formats other than text. With an open
> coded iterator, a single BPF program can traverse multiple kernel data
> structures (now including dmabufs), allowing for more efficient analysis
> of kernel data compared to multiple reads from procfs, sysfs, or
> multiple traditional BPF iterator invocations.
>
> Signed-off-by: T.J. Mercier <tjmercier@google.com>

Acked-by: Song Liu <song@kernel.org>

With one nitpick below:

> ---
>  kernel/bpf/dmabuf_iter.c | 47 ++++++++++++++++++++++++++++++++++++++++
>  kernel/bpf/helpers.c     |  5 +++++
>  2 files changed, 52 insertions(+)
>
> diff --git a/kernel/bpf/dmabuf_iter.c b/kernel/bpf/dmabuf_iter.c
> index 96b4ba7f0b2c..8049bdbc9efc 100644
> --- a/kernel/bpf/dmabuf_iter.c
> +++ b/kernel/bpf/dmabuf_iter.c
> @@ -100,3 +100,50 @@ static int __init dmabuf_iter_init(void)
>  }
>
>  late_initcall(dmabuf_iter_init);
> +
> +struct bpf_iter_dmabuf {
> +       /* opaque iterator state; having __u64 here allows to preserve co=
rrect
> +        * alignment requirements in vmlinux.h, generated from BTF
> +        */

nit: comment style.

> +       __u64 __opaque[1];
> +} __aligned(8);
> +
> +/* Non-opaque version of bpf_iter_dmabuf */
> +struct bpf_iter_dmabuf_kern {
> +       struct dma_buf *dmabuf;
> +} __aligned(8);
> +
[...]
