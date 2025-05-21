Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA1FABE975
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 04:01:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1778010E667;
	Wed, 21 May 2025 02:01:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="FVc94OLP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69E0610E706
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 02:01:02 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-43d5f10e1aaso213645e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 19:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1747792861; x=1748397661;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ljM9MFjV46ZMOOlPbOCsrBTlpQns4bVhtSel8RxQlJw=;
 b=FVc94OLPJvVAzmkxl/Sr+bGiXkFlvO3qCx/EelLU0/3ccGlx3VReWrB3XVV2pN6A/5
 5OR5Jol8ibzTcfsKtDvcn61tRnBL6G1QXdUljPNnJyWesDcfGRXAQdNhcfA4BwXsuDzd
 kGmayx78oxCuVExXDtzEl6O0LzUmyVf2RDwQHSvLpUSmNSfF7S4Me3KpVDU+gDVi4S8V
 npJ6958BDfLQ2ajF8yMgww2WiUSgUHfzeRM8qszQJVuDzoXXi08uGcc/13la7BI5uWCo
 RP+C6lczOtx+KQh2bZts43m4I6bwvb8VVyCxucGykl+x3Dp8YhEcVRh4krN4P7Wuv88S
 BpGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747792861; x=1748397661;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ljM9MFjV46ZMOOlPbOCsrBTlpQns4bVhtSel8RxQlJw=;
 b=mx4HdWgDs/cjF8KRAyQP6T5F2044o7UjWy4BR7Eu/ShVDTDY+PQW5NXP818108sP+6
 I2ap6VMs66kKazkv6/5ce/EzdlLVFkRtjzw5tb1XU6DKgbEU77u6yq5jmTqPeAEb3Fnn
 in1p+45oRD5dP4Ng3iTRl4lw8kepUze4W9dGoNJ07QKg9wKO7yTp9PxoHwmjl27IqOfv
 3swsNY+/u9O+HFw2edkdmT6gRfs/qqc6jZsi8EjoFJTwiaLit7qwlQpkhyvqdJ6MtJdP
 ldHnBOU8CYZj5GQTsiUcfkMTDesaAI7w4KVuZGsS8RC8Owku7egc8u4LktfgsrdL9rCD
 MzBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYGpPjl5yKgmcGQOv9YHU135jvbtSvhAD1/QhSGpi5EkYLcoqAKbBOqrLKrAekI3BaxR/pa7t69MI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywv22NKTnQNuqCVey1GBR/FQI3iZoKnzzbdQPCt109MapSskyVp
 Jq6PQJncMIwX8pWAEb3XSfgLBB+FBqmSuUABHHn9s6kSx9e8EMoNBFMM+pRiSuffqFTgvIiG5He
 uQ6MFvcuVo634DjHwUkMfck3+TAcSjNDhxDJom6Up
X-Gm-Gg: ASbGnctskJ+JEonZal90arIcQehhAhBZsXQFqbJkGjmQpia2aJ+ee/3+xDPst8MYNuQ
 +1hy1JQW/uFtGTMH3Vf0MCegAStxOK9E4eg4meujUWJsYRsXXfhDvqrt10gOlcCQWE5xK3mz9om
 1Z87Ocpc9iG6zkAQb8ShrYPPI6z5q0Hw5FOfvjhkokhLHF+vBe9TEF
X-Google-Smtp-Source: AGHT+IEOHcOov2/pSfQJlxmzfo/j5bxNT/KSdVuGZ+JO7ohIG2u0emG4Wmu+Pqb7f9nl4M3gSpf5HPUdsVJMnqqY0MU=
X-Received: by 2002:a05:600c:8289:b0:43b:bfe9:8b43 with SMTP id
 5b1f17b1804b1-443ae0e958amr6941745e9.4.1747792860664; Tue, 20 May 2025
 19:01:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250513092803.2096-1-tao.wangtao@honor.com>
 <fdc8f0a2-5b2f-4898-8090-0d7b888c15d8@amd.com>
 <5b68b2a50d48444b93d97f5d342f37c8@honor.com>
 <ef978301-6a63-451d-9ae6-171968b26a55@amd.com>
 <9f732ac8b90e4e819e0a6a5511ac3f6d@honor.com>
 <50092362-4644-4e47-9c63-fc82ba24e516@amd.com>
 <2755aae2f1674b239569bf1acad765dc@honor.com>
 <2487bad4-81d6-4ea2-96a7-a6ac741c9d9c@amd.com>
 <a3f57102bc6e4588bc7659485feadbc1@honor.com>
 <5c11b50c-2e36-4fd5-943c-086f55adffa8@amd.com>
 <CABdmKX30c_5N34FYMre6Qx5LLLWicsi_XdUdu0QtsOmQ=RcYxQ@mail.gmail.com>
 <375f6aac8c2f4b84814251c5025ae6eb@honor.com>
 <38aa6cf19ce245578264aaa9062aa6dd@honor.com>
In-Reply-To: <38aa6cf19ce245578264aaa9062aa6dd@honor.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 20 May 2025 19:00:48 -0700
X-Gm-Features: AX0GCFvF9TZhpylv_JsP4r1YP9UqnDVjU8qQ_qNh30hYmp66TjxqNc3-mHZgPD0
Message-ID: <CABdmKX0nAYDdgq-PHv0HxucfYQzvvTAJjVCo7nQ0UtjwcF02aQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] dmabuf/heaps: implement DMA_BUF_IOCTL_RW_FILE for
 system_heap
To: wangtao <tao.wangtao@honor.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>, 
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>, 
 "Brian.Starkey@arm.com" <Brian.Starkey@arm.com>,
 "jstultz@google.com" <jstultz@google.com>, 
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "wangbintian(BintianWang)" <bintian.wang@honor.com>,
 yipengxiang <yipengxiang@honor.com>, 
 liulu 00013167 <liulu.liu@honor.com>, hanfeng 00012985 <feng.han@honor.com>
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

On Mon, May 19, 2025 at 9:06=E2=80=AFPM wangtao <tao.wangtao@honor.com> wro=
te:
>
>
>
> > -----Original Message-----
> > From: wangtao
> > Sent: Monday, May 19, 2025 8:04 PM
> > To: 'T.J. Mercier' <tjmercier@google.com>; Christian K=C3=B6nig
> > <christian.koenig@amd.com>
> > Cc: sumit.semwal@linaro.org; benjamin.gaignard@collabora.com;
> > Brian.Starkey@arm.com; jstultz@google.com; linux-media@vger.kernel.org;
> > dri-devel@lists.freedesktop.org; linaro-mm-sig@lists.linaro.org; linux-
> > kernel@vger.kernel.org; wangbintian(BintianWang)
> > <bintian.wang@honor.com>; yipengxiang <yipengxiang@honor.com>; liulu
> > 00013167 <liulu.liu@honor.com>; hanfeng 00012985 <feng.han@honor.com>
> > Subject: RE: [PATCH 2/2] dmabuf/heaps: implement
> > DMA_BUF_IOCTL_RW_FILE for system_heap
> >
> >
> >
> > > -----Original Message-----
> > > From: T.J. Mercier <tjmercier@google.com>
> > > Sent: Saturday, May 17, 2025 2:37 AM
> > > To: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > Cc: wangtao <tao.wangtao@honor.com>; sumit.semwal@linaro.org;
> > > benjamin.gaignard@collabora.com; Brian.Starkey@arm.com;
> > > jstultz@google.com; linux-media@vger.kernel.org; dri-
> > > devel@lists.freedesktop.org; linaro-mm-sig@lists.linaro.org; linux-
> > > kernel@vger.kernel.org; wangbintian(BintianWang)
> > > <bintian.wang@honor.com>; yipengxiang <yipengxiang@honor.com>; liulu
> > > 00013167 <liulu.liu@honor.com>; hanfeng 00012985
> > <feng.han@honor.com>
> > > Subject: Re: [PATCH 2/2] dmabuf/heaps: implement
> > DMA_BUF_IOCTL_RW_FILE
> > > for system_heap
> > >
> > > On Fri, May 16, 2025 at 1:36=E2=80=AFAM Christian K=C3=B6nig
> > > <christian.koenig@amd.com>
> > > wrote:
> > > >
> > > > On 5/16/25 09:40, wangtao wrote:
> > > > >
> > > > >
> > > > >> -----Original Message-----
> > > > >> From: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > > >> Sent: Thursday, May 15, 2025 10:26 PM
> > > > >> To: wangtao <tao.wangtao@honor.com>; sumit.semwal@linaro.org;
> > > > >> benjamin.gaignard@collabora.com; Brian.Starkey@arm.com;
> > > > >> jstultz@google.com; tjmercier@google.com
> > > > >> Cc: linux-media@vger.kernel.org; dri-devel@lists.freedesktop.org=
;
> > > > >> linaro- mm-sig@lists.linaro.org; linux-kernel@vger.kernel.org;
> > > > >> wangbintian(BintianWang) <bintian.wang@honor.com>; yipengxiang
> > > > >> <yipengxiang@honor.com>; liulu 00013167 <liulu.liu@honor.com>;
> > > > >> hanfeng
> > > > >> 00012985 <feng.han@honor.com>
> > > > >> Subject: Re: [PATCH 2/2] dmabuf/heaps: implement
> > > > >> DMA_BUF_IOCTL_RW_FILE for system_heap
> > > > >>
> > > > >> On 5/15/25 16:03, wangtao wrote:
> > > > >>> [wangtao] My Test Configuration (CPU 1GHz, 5-test average):
> > > > >>> Allocation: 32x32MB buffer creation
> > > > >>> - dmabuf 53ms vs. udmabuf 694ms (10X slower)
> > > > >>> - Note: shmem shows excessive allocation time
> > > > >>
> > > > >> Yeah, that is something already noted by others as well. But tha=
t
> > > > >> is orthogonal.
> > > > >>
> > > > >>>
> > > > >>> Read 1024MB File:
> > > > >>> - dmabuf direct 326ms vs. udmabuf direct 461ms (40% slower)
> > > > >>> - Note: pin_user_pages_fast consumes majority CPU cycles
> > > > >>>
> > > > >>> Key function call timing: See details below.
> > > > >>
> > > > >> Those aren't valid, you are comparing different functionalities =
here.
> > > > >>
> > > > >> Please try using udmabuf with sendfile() as confirmed to be
> > > > >> working by
> > > T.J.
> > > > > [wangtao] Using buffer IO with dmabuf file read/write requires on=
e
> > > memory copy.
> > > > > Direct IO removes this copy to enable zero-copy. The sendfile
> > > > > system call reduces memory copies from two (read/write) to one.
> > > > > However, with udmabuf, sendfile still keeps at least one copy, fa=
iling
> > zero-copy.
> > > >
> > > >
> > > > Then please work on fixing this.
> > > >
> > > > Regards,
> > > > Christian.
> > > >
> > > >
> > > > >
> > > > > If udmabuf sendfile uses buffer IO (file page cache), read latenc=
y
> > > > > matches dmabuf buffer read, but allocation time is much longer.
> > > > > With Direct IO, the default 16-page pipe size makes it slower tha=
n
> > > > > buffer
> > > IO.
> > > > >
> > > > > Test data shows:
> > > > > udmabuf direct read is much faster than udmabuf sendfile.
> > > > > dmabuf direct read outperforms udmabuf direct read by a large mar=
gin.
> > > > >
> > > > > Issue: After udmabuf is mapped via map_dma_buf, apps using memfd
> > > > > or udmabuf for Direct IO might cause errors, but there are no
> > > > > safeguards to prevent this.
> > > > >
> > > > > Allocate 32x32MB buffer and read 1024 MB file Test:
> > > > > Metric                 | alloc (ms) | read (ms) | total (ms)
> > > > > -----------------------|------------|-----------|-----------
> > > > > udmabuf buffer read    | 539        | 2017      | 2555
> > > > > udmabuf direct read    | 522        | 658       | 1179
> > >
> > > I can't reproduce the part where udmabuf direct reads are faster than
> > > buffered reads. That's the opposite of what I'd expect. Something
> > > seems wrong with those buffered reads.
> > >
> > > > > udmabuf buffer sendfile| 505        | 1040      | 1546
> > > > > udmabuf direct sendfile| 510        | 2269      | 2780
> > >
> > > I can reproduce the 3.5x slower udambuf direct sendfile compared to
> > > udmabuf direct read. It's a pretty disappointing result, so it seems
> > > like something could be improved there.
> > >
> > > 1G from ext4 on 6.12.17 | read/sendfile (ms)
> > > ------------------------|-------------------
> > > udmabuf buffer read     | 351
> > > udmabuf direct read     | 540
> > > udmabuf buffer sendfile | 255
> > > udmabuf direct sendfile | 1990
> > >
> > [wangtao] By the way, did you clear the file cache during testing?
> > Looking at your data again, read and sendfile buffers are faster than D=
irect
> > I/O, which suggests the file cache wasn=E2=80=99t cleared. If you didn=
=E2=80=99t clear the file
> > cache, the test results are unfair and unreliable for reference. On emb=
edded
> > devices, it=E2=80=99s nearly impossible to maintain stable caching for =
multi-GB files. If
> > such files could be cached, we might as well cache dmabufs directly to =
save
> > time on creating dmabufs and reading file data.
> > You can call posix_fadvise(file_fd, 0, len, POSIX_FADV_DONTNEED) after
> > opening the file or before closing it to clear the file cache, ensuring=
 actual file
> > I/O operations are tested.
> >
> [wangtao] Please confirm if cache clearing was performed during testing.
> I reduced the test scope from 3GB to 1GB. While results without
> cache clearing show general alignment, udmabuf buffer read remains
> slower than direct read. Comparative data:
>
> Your test reading 1GB(ext4 on 6.12.17:
> Method                | read/sendfile (ms) | read vs. (%)
> ----------------------------------------------------------
> udmabuf buffer read   | 351                | 138%
> udmabuf direct read   | 540                | 212%
> udmabuf buffer sendfile | 255              | 100%
> udmabuf direct sendfile | 1990             | 780%
>
> My 3.5GHz tests (f2fs):
> Without cache clearing:
> Method                | alloc | read  | vs. (%)
> -----------------------------------------------
> udmabuf buffer read   | 140   | 386   | 310%
> udmabuf direct read   | 151   | 326   | 262%
> udmabuf buffer sendfile | 136 | 124   | 100%
> udmabuf direct sendfile | 132 | 892   | 717%
> dmabuf buffer read    | 23    | 154   | 124%
> patch direct read     | 29    | 271   | 218%
>
> With cache clearing:
> Method                | alloc | read  | vs. (%)
> -----------------------------------------------
> udmabuf buffer read   | 135   | 546   | 180%
> udmabuf direct read   | 159   | 300   | 99%
> udmabuf buffer sendfile | 134 | 303   | 100%
> udmabuf direct sendfile | 141 | 912   | 301%
> dmabuf buffer read    | 22    | 362   | 119%
> patch direct read     | 29    | 265   | 87%
>
> Results without cache clearing aren't representative for embedded
> mobile devices. Notably, on low-power CPUs @1GHz, sendfile latency
> without cache clearing exceeds dmabuf direct I/O read time.
>
> Without cache clearing:
> Method                | alloc | read  | vs. (%)
> -----------------------------------------------
> udmabuf buffer read   | 546   | 1745  | 442%
> udmabuf direct read   | 511   | 704   | 178%
> udmabuf buffer sendfile | 496 | 395   | 100%
> udmabuf direct sendfile | 498 | 2332  | 591%
> dmabuf buffer read    | 43    | 453   | 115%
> my patch direct read  | 49    | 310   | 79%
>
> With cache clearing:
> Method                | alloc | read  | vs. (%)
> -----------------------------------------------
> udmabuf buffer read   | 552   | 2067  | 198%
> udmabuf direct read   | 540   | 627   | 60%
> udmabuf buffer sendfile | 497 | 1045  | 100%
> udmabuf direct sendfile | 527 | 2330  | 223%
> dmabuf buffer read    | 40    | 1111  | 106%
> my patch direct read  | 44    | 310   | 30%
>
> Reducing CPU overhead/power consumption is critical for mobile devices.
> We need simpler and more efficient dmabuf direct I/O support.
>
> As Christian evaluated sendfile performance based on your data, could
> you confirm whether the cache was cleared? If not, please share the
> post-cache-clearing test data. Thank you for your support.

Yes sorry, I was out yesterday riding motorcycles. I did not clear the
cache for the buffered reads, I didn't realize you had. The IO plus
the copy certainly explains the difference.

Your point about the unlikelihood of any of that data being in the
cache also makes sense.

I'm not sure it changes anything about the ioctl approach though.
Another way to do this would be to move the (optional) support for
direct IO into the exporter via dma_buf_fops and dma_buf_ops. Then
normal read() syscalls would just work for buffers that support them.
I know that's more complicated, but at least it doesn't require
inventing new uapi to do it.

1G from ext4 on 6.12.20 | read/sendfile (ms) w/ 3 > drop_caches
------------------------|-------------------
udmabuf buffer read     | 1210
udmabuf direct read     | 671
udmabuf buffer sendfile | 1096
udmabuf direct sendfile | 2340



>
> > >
> > > > > dmabuf buffer read     | 51         | 1068      | 1118
> > > > > dmabuf direct read     | 52         | 297       | 349
> > > > >
> > > > > udmabuf sendfile test steps:
> > > > > 1. Open data file(1024MB), get back_fd 2. Create memfd(32MB) #
> > > > > Loop steps 2-6 3. Allocate udmabuf with memfd 4. Call
> > > > > sendfile(memfd,
> > > > > back_fd) 5. Close memfd after sendfile 6. Close udmabuf 7. Close
> > > > > back_fd
> > > > >
> > > > >>
> > > > >> Regards,
> > > > >> Christian.
> > > > >
> > > >
>
