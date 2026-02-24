Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CkxDqRsnWkkQAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 10:17:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4CB1846A7
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 10:17:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B5A710E07F;
	Tue, 24 Feb 2026 09:17:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=igel-co-jp.20230601.gappssmtp.com header.i=@igel-co-jp.20230601.gappssmtp.com header.b="CYOgk2zd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com
 [74.125.82.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF17210E07F
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 09:17:17 +0000 (UTC)
Received: by mail-dy1-f178.google.com with SMTP id
 5a478bee46e88-2bdb17511aaso821714eec.0
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 01:17:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771924637; cv=none;
 d=google.com; s=arc-20240605;
 b=fJ2bI07jFPr/gogruY2gZtngK5z+d02uBGhw+KSlCXlPczeJj3pedSdeNuIV6HwBGD
 dwYXFAOI6mWZFuDD7i1Ne6+IROgW7ZVzRQRmS0EFuNDdJhmcdxhi74rGTZTzpO4+sXGG
 ihIIh/bXTDh78mEo+mSbisoQatDn9BI4IhodHhnEQqlThAntUhjaDOGJ2DP+z+40C/KK
 wRdRQJrL0WEefn1ghLGfFdgrvPo4eDzdWl/BstQ8hIXXuLLCPPuIoW/7Y8LDMfVZU70d
 j7sY8M7tz4aJQyNo2oPgvlnFJ2LLj1i0BRr0gq4KnsbYPyHTlo1o68YUQ+OwX9IEidHz
 NHtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=XR8aP+Chm5pZWVMcnfKqtDnaBKcWCGFiu874zEqwlNc=;
 fh=4jlQ/pmG7QNr3RfjrDHY1DZAkv09WMVkgjd2hdlCbyk=;
 b=Me9WQmz9Y+mZdKCx5IGLElH2LiUKF9CqYDhFSIZolShJwYOqUvARtSlF6YqbWBsPkt
 LyWoHPhpxYGLWd2OUVDYDcDYFqjGFE4MHJs5l6QrqWXMuLRegT3j1p2olVyuCpegbCj7
 RT6LWuJAKci294m56/1EUNEWfyttuDlGJePnz+yZP4CFlTBqlMRARs8Q7iCAt/akEUWR
 WRWPf6Yje5P3rYzmbx7BKDz6iWGIH3huPldS/ari1PJBBAbDLchQJryUYEGjAXciP/4p
 KL07Oor5+hp/WCxt3h90GQW1JH+bQ1/Cb1kEgBteiEuarOoBmssyQxdrOoazPHgweheF
 LK6A==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20230601.gappssmtp.com; s=20230601; t=1771924637; x=1772529437;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XR8aP+Chm5pZWVMcnfKqtDnaBKcWCGFiu874zEqwlNc=;
 b=CYOgk2zd5FC5b+PzHnwK533bq9E1jftvc5DAqoEJJs+ZvKd6r+2DhiKSaCHqX8q2bQ
 A1IhTGet6iEhkJBsLFoh0RukHCXOPV71q3t1xjqpDFxCx7E9TnN1zRLzEHcOUOR7HXUG
 /hFS3FaAT+x51OozLAUQgGn1GEDML92x/CGLOdipfv1oJhSypkVWIgPaEwAf3ov1PHAX
 2VQ1qWymrgXGQy5Ir56xckeA4aooyVqn0tlG392cRncWqjpHmckspdiA4GhY8akatARJ
 NBQ6rxFSmyNDVkfEfYsY/Z7JMFmtjz9hFo13i5ywULYH+xXNWzlnXRk/jfm3V0kMzg1H
 MAYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771924637; x=1772529437;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XR8aP+Chm5pZWVMcnfKqtDnaBKcWCGFiu874zEqwlNc=;
 b=ph/K9tffgmpQn2wf8phCzDNSxpOuLn3wLpABNtHRc7nXmBwXfmr9FPSJFJa8VgFs8l
 VMuXKVPzcC3+wHBkCp4HYkvexi6c1zPGUcEaKNf9alvunpnLCl5tMzbC+0+3RhMjOAPe
 e4hHaI7LK1vlUuW4reOAI+OmRp/jA2CvhiuypS4w5FduQl9Z8in4X6/yYSbb9jz9DyZq
 iWQy+zO6vaoV/rDandKg6zgrHtKNc8GkZ3jvtu9lzWdJl/I48l98tOXFav0RnIbikM7o
 zlXrdYFEAIhA77OGSqTsjjRYhK/umg7XM3OSW3kkKrjOnRER7XqMtCtDVaGL937MFdxS
 6Aaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV81BqvhkuK6yZMxVdmMtRrlnj8SaR8rR1A4o0OtQxs6z+WbPmfq2KwlgBSPoxryBUyeNRYZIUAq/4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzFHQ73haXuEPz6cbuTli+vR7fPLDHr66m+ZJjXcRLeJeciA0oq
 HqJ/EOfoJSFP73pX4mr9MVbBbq7t1Mx6gEutQlYPhnwazozRBL0mAiQRACNsavcSVuN3UDx3E1L
 VHeu8rLLXwiUDJQGp+o3g5rLJPNBP3eP1siSv3Cu6nQ==
X-Gm-Gg: ATEYQzwctDQCyv+qCIYo/6ThYxyi3qy9ExLZ0zieAY+mp3oQP6sSub5+d0x7WtkA6ni
 Jlpt0EMxaKw0UvGaKKeJwAs4UiLpVh6w5IKmDQeHaegpNkgJf4kDs29RdnHdqbz3pfVijVQzrdC
 wjsIpdDDICBRc/zKCP7gwWx8XqGr/X/b7nnhoOxZo/YtleaNVkuG8BmMrPJNZunOkc7zEN1cJag
 2a9BntkV8SQL20gJJas+m/Q3xmYi3ndPlncVgqSN+8gUlXBwNuugskQ3TI4jltn8oYgD/Vp6EkD
 xzVdLaCYIL/sazjN51L4KrSLdXDYR8OtR47txA7eSw==
X-Received: by 2002:a05:693c:25c7:b0:2ba:a1a5:b5b1 with SMTP id
 5a478bee46e88-2bd7b9efc61mr4352585eec.7.1771924636731; Tue, 24 Feb 2026
 01:17:16 -0800 (PST)
MIME-Version: 1.0
References: <20211122110817.33319-1-mie@igel.co.jp>
 <7b4d9e08-122b-4c4b-868e-d48ec0f59dce@linux.dev>
In-Reply-To: <7b4d9e08-122b-4c4b-868e-d48ec0f59dce@linux.dev>
From: Shunsuke Mie <mie@igel.co.jp>
Date: Tue, 24 Feb 2026 18:17:05 +0900
X-Gm-Features: AaiRm523ClyiyQXmdL-uksKH5W2fREzPeFn7QWjc8uEMQoCs4N1_XrtZBqD33kU
Message-ID: <CANXvt5pcCsTegAkHkgvUnOkQ+eya0zHZh_KE=eUpXEubpyymRw@mail.gmail.com>
Subject: Re: [RFC PATCH v4 0/2] RDMA/rxe: Add dma-buf support
To: Zhu Yanjun <yanjun.zhu@linux.dev>
Cc: Zhu Yanjun <zyjzyj2000@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, 
 Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
 Jianxin Xiong <jianxin.xiong@intel.com>, Leon Romanovsky <leon@kernel.org>, 
 Maor Gottlieb <maorg@nvidia.com>, Sean Hefty <sean.hefty@intel.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org, dhobsong@igel.co.jp, 
 taki@igel.co.jp, etom@igel.co.jp
Content-Type: multipart/alternative; boundary="0000000000008a94ce064b8e5a78"
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.81 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[igel-co-jp.20230601.gappssmtp.com:s=20230601];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	DMARC_NA(0.00)[igel.co.jp];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mie@igel.co.jp,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:yanjun.zhu@linux.dev,m:zyjzyj2000@gmail.com,m:christian.koenig@amd.com,m:alexander.deucher@amd.com,m:daniel.vetter@ffwll.ch,m:dledford@redhat.com,m:jgg@ziepe.ca,m:jianxin.xiong@intel.com,m:leon@kernel.org,m:maorg@nvidia.com,m:sean.hefty@intel.com,m:sumit.semwal@linaro.org,m:linaro-mm-sig@lists.linaro.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-rdma@vger.kernel.org,m:dhobsong@igel.co.jp,m:taki@igel.co.jp,m:etom@igel.co.jp,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[igel-co-jp.20230601.gappssmtp.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.466];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mie@igel.co.jp,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,amd.com,ffwll.ch,redhat.com,ziepe.ca,intel.com,kernel.org,nvidia.com,linaro.org,lists.freedesktop.org,lists.linaro.org,vger.kernel.org,igel.co.jp];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 2F4CB1846A7
X-Rspamd-Action: no action

--0000000000008a94ce064b8e5a78
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Zhu Yanjun,

Thank you for reaching out and revisiting my 2021 proposal.

Regarding the current status, I haven't been able to make much progress
recently as other tasks have taken higher priority. However, I still
believe this integration is important.

From a technical perspective, as pointed out during the previous reviews,
there were indeed issues with how dma_buf_map was being used. To address
this in today's context, I believe we should transition to using iosys_map.

I am still interested in this direction. While my current bandwidth is
limited, I would welcome any collaboration=E2=80=94especially regarding the
implementation of iosys_map support within rxe or the RDMA core.

I'd be happy to discuss the technical details of this transition if you'd
like to dive deeper.

Best,
Shunsuke Mie


2026=E5=B9=B42=E6=9C=8819=E6=97=A5(=E6=9C=A8) 13:43 Zhu Yanjun <yanjun.zhu@=
linux.dev>:

> =E5=9C=A8 2021/11/22 3:08, Shunsuke Mie =E5=86=99=E9=81=93:
> > This patch series add a dma-buf support for rxe driver.
> >
> > A dma-buf based memory registering has beed introduced to use the memor=
y
> > region that lack of associated page structures (e.g. device memory and
> CMA
> > managed memory) [1]. However, to use the dma-buf based memory, each rdm=
a
> > device drivers require add some implementation. The rxe driver has not
> > support yet.
> >
> > [1] https://www.spinics.net/lists/linux-rdma/msg98592.html
> >
> > To enable to use the dma-buf memory in rxe rdma device, add some change=
s
> > and implementation in this patch series.
> >
> > This series consists of two patches. The first patch changes the IB cor=
e
> > to support for rdma drivers that has not dma device. The secound patch
> adds
> > the dma-buf support to rxe driver.
> >
> Hi, Shunsuke Mie
>
> I was revisiting your 2021 proposal around dma-buf integration with RDMA
> and the related discussions at the time.
>
> As you know, dma-buf usage in RDMA-related workflows has gained more
> traction recently, and we are seeing increasing interest in
> heterogeneous memory and cross-device buffer sharing. Given the changes
> in the ecosystem since then, I=E2=80=99m wondering whether you think the
> original direction might be worth reconsidering.
>
> Do you have any interest in continuing that line of work, or updating
> the design based on today=E2=80=99s context? If not, I=E2=80=99d still ap=
preciate your
> perspective on what you see as the main blockers from the previous
> discussions, and whether you think the landscape has changed enough to
> justify another attempt.
>
> Depending on the direction, we may consider exploring dma-buf support in
> rxe or at the core level, but I=E2=80=99d prefer to first understand your=
 view
> before moving forward.
>
> Zhu Yanjun
>
> > Related user space RDMA library changes are provided as a separate patc=
h.
> >
> > v4:
> > * Fix warnings, unused variable and casting
> > v3: https://www.spinics.net/lists/linux-rdma/msg106776.html
> > * Rebase to the latest linux-rdma 'for-next' branch (5.15.0-rc6+)
> > * Fix to use dma-buf-map helpers
> > v2: https://www.spinics.net/lists/linux-rdma/msg105928.html
> > * Rebase to the latest linux-rdma 'for-next' branch (5.15.0-rc1+)
> > * Instead of using a dummy dma_device to attach dma-buf, just store
> >    dma-buf to use software RDMA driver
> > * Use dma-buf vmap() interface
> > * Check to pass tests of rdma-core
> > v1: https://www.spinics.net/lists/linux-rdma/msg105376.html
> > * The initial patch set
> > * Use ib_device as dma_device.
> > * Use dma-buf dynamic attach interface
> > * Add dma-buf support to rxe device
> >
> > Shunsuke Mie (2):
> >    RDMA/umem: Change for rdma devices has not dma device
> >    RDMA/rxe: Add dma-buf support
> >
> >   drivers/infiniband/core/umem_dmabuf.c |  20 ++++-
> >   drivers/infiniband/sw/rxe/rxe_loc.h   |   2 +
> >   drivers/infiniband/sw/rxe/rxe_mr.c    | 113 +++++++++++++++++++++++++=
+
> >   drivers/infiniband/sw/rxe/rxe_verbs.c |  34 ++++++++
> >   include/rdma/ib_umem.h                |   1 +
> >   5 files changed, 166 insertions(+), 4 deletions(-)
> >
>
>

--0000000000008a94ce064b8e5a78
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Zhu=C2=A0Yanjun,<div><br></div><div>Thank you for reach=
ing out and revisiting my 2021 proposal.<br><br>Regarding the current statu=
s, I haven&#39;t been able to make much progress recently as other tasks ha=
ve taken higher priority. However, I still believe this integration is impo=
rtant.<br><br>From a technical perspective, as pointed out during the previ=
ous reviews, there were indeed issues with how dma_buf_map was being used. =
To address this in today&#39;s context, I believe we should transition to u=
sing iosys_map.=C2=A0</div><div><br></div><div>I am still interested in thi=
s direction. While my current bandwidth is limited, I would welcome any col=
laboration=E2=80=94especially regarding the implementation of iosys_map sup=
port within rxe or the RDMA core.<br><br>I&#39;d be happy to discuss the te=
chnical details of this transition if you&#39;d like to dive deeper.<br><br=
>Best,</div><div>Shunsuke Mie<br><br></div></div><br><div class=3D"gmail_qu=
ote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">2026=E5=B9=
=B42=E6=9C=8819=E6=97=A5(=E6=9C=A8) 13:43 Zhu Yanjun &lt;<a href=3D"mailto:=
yanjun.zhu@linux.dev">yanjun.zhu@linux.dev</a>&gt;:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">=E5=9C=A8 2021/11/22 3:08, Shunsuke Mie=
 =E5=86=99=E9=81=93:<br>
&gt; This patch series add a dma-buf support for rxe driver.<br>
&gt; <br>
&gt; A dma-buf based memory registering has beed introduced to use the memo=
ry<br>
&gt; region that lack of associated page structures (e.g. device memory and=
 CMA<br>
&gt; managed memory) [1]. However, to use the dma-buf based memory, each rd=
ma<br>
&gt; device drivers require add some implementation. The rxe driver has not=
<br>
&gt; support yet.<br>
&gt; <br>
&gt; [1] <a href=3D"https://www.spinics.net/lists/linux-rdma/msg98592.html"=
 rel=3D"noreferrer" target=3D"_blank">https://www.spinics.net/lists/linux-r=
dma/msg98592.html</a><br>
&gt; <br>
&gt; To enable to use the dma-buf memory in rxe rdma device, add some chang=
es<br>
&gt; and implementation in this patch series.<br>
&gt; <br>
&gt; This series consists of two patches. The first patch changes the IB co=
re<br>
&gt; to support for rdma drivers that has not dma device. The secound patch=
 adds<br>
&gt; the dma-buf support to rxe driver.<br>
&gt; <br>
Hi, Shunsuke Mie<br>
<br>
I was revisiting your 2021 proposal around dma-buf integration with RDMA <b=
r>
and the related discussions at the time.<br>
<br>
As you know, dma-buf usage in RDMA-related workflows has gained more <br>
traction recently, and we are seeing increasing interest in <br>
heterogeneous memory and cross-device buffer sharing. Given the changes <br=
>
in the ecosystem since then, I=E2=80=99m wondering whether you think the <b=
r>
original direction might be worth reconsidering.<br>
<br>
Do you have any interest in continuing that line of work, or updating <br>
the design based on today=E2=80=99s context? If not, I=E2=80=99d still appr=
eciate your <br>
perspective on what you see as the main blockers from the previous <br>
discussions, and whether you think the landscape has changed enough to <br>
justify another attempt.<br>
<br>
Depending on the direction, we may consider exploring dma-buf support in <b=
r>
rxe or at the core level, but I=E2=80=99d prefer to first understand your v=
iew <br>
before moving forward.<br>
<br>
Zhu Yanjun<br>
<br>
&gt; Related user space RDMA library changes are provided as a separate pat=
ch.<br>
&gt; <br>
&gt; v4:<br>
&gt; * Fix warnings, unused variable and casting<br>
&gt; v3: <a href=3D"https://www.spinics.net/lists/linux-rdma/msg106776.html=
" rel=3D"noreferrer" target=3D"_blank">https://www.spinics.net/lists/linux-=
rdma/msg106776.html</a><br>
&gt; * Rebase to the latest linux-rdma &#39;for-next&#39; branch (5.15.0-rc=
6+)<br>
&gt; * Fix to use dma-buf-map helpers<br>
&gt; v2: <a href=3D"https://www.spinics.net/lists/linux-rdma/msg105928.html=
" rel=3D"noreferrer" target=3D"_blank">https://www.spinics.net/lists/linux-=
rdma/msg105928.html</a><br>
&gt; * Rebase to the latest linux-rdma &#39;for-next&#39; branch (5.15.0-rc=
1+)<br>
&gt; * Instead of using a dummy dma_device to attach dma-buf, just store<br=
>
&gt;=C2=A0 =C2=A0 dma-buf to use software RDMA driver<br>
&gt; * Use dma-buf vmap() interface<br>
&gt; * Check to pass tests of rdma-core<br>
&gt; v1: <a href=3D"https://www.spinics.net/lists/linux-rdma/msg105376.html=
" rel=3D"noreferrer" target=3D"_blank">https://www.spinics.net/lists/linux-=
rdma/msg105376.html</a><br>
&gt; * The initial patch set<br>
&gt; * Use ib_device as dma_device.<br>
&gt; * Use dma-buf dynamic attach interface<br>
&gt; * Add dma-buf support to rxe device<br>
&gt; <br>
&gt; Shunsuke Mie (2):<br>
&gt;=C2=A0 =C2=A0 RDMA/umem: Change for rdma devices has not dma device<br>
&gt;=C2=A0 =C2=A0 RDMA/rxe: Add dma-buf support<br>
&gt; <br>
&gt;=C2=A0 =C2=A0drivers/infiniband/core/umem_dmabuf.c |=C2=A0 20 ++++-<br>
&gt;=C2=A0 =C2=A0drivers/infiniband/sw/rxe/rxe_loc.h=C2=A0 =C2=A0|=C2=A0 =
=C2=A02 +<br>
&gt;=C2=A0 =C2=A0drivers/infiniband/sw/rxe/rxe_mr.c=C2=A0 =C2=A0 | 113 ++++=
++++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0drivers/infiniband/sw/rxe/rxe_verbs.c |=C2=A0 34 ++++++++<=
br>
&gt;=C2=A0 =C2=A0include/rdma/ib_umem.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 =C2=A05 files changed, 166 insertions(+), 4 deletions(-)<br>
&gt; <br>
<br>
</blockquote></div>

--0000000000008a94ce064b8e5a78--
