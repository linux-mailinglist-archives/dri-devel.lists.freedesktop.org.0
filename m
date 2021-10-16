Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE238430257
	for <lists+dri-devel@lfdr.de>; Sat, 16 Oct 2021 13:16:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C4B889F97;
	Sat, 16 Oct 2021 11:16:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B8E789F55;
 Sat, 16 Oct 2021 11:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1634382974;
 bh=Mhw02uk6pyAcd09twynYEmpbbHs67NvOvVZTeh65TQ4=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=gZKhnmBON9Gg/8BxGCv+oJ0/ws3frGh32IR7U1a57EisAnv8FCzFeeJTFTx3MWZM/
 2sH7hqesKMUlxkAcOudVEHnoPMis1JirRIEzbJV3Q8mBb7FYtKKz4ffG7UdhZ7MAza
 +hbJES3Y107oPh93XQzE9fpAcLZMaVIjaWJAPt/w=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from titan ([79.150.72.99]) by mail.gmx.net (mrgmx004
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1M59C2-1mcnbF3JzA-001B53; Sat, 16
 Oct 2021 13:16:14 +0200
Date: Sat, 16 Oct 2021 13:16:02 +0200
From: Len Baker <len.baker@gmx.com>
To: Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>
Cc: Len Baker <len.baker@gmx.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>, Kees Cook <keescook@chromium.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/i915: Prefer struct_size over open coded arithmetic
Message-ID: <20211016111602.GA1996@titan>
References: <20211003104258.18550-1-len.baker@gmx.com>
 <20211011092304.GA5790@titan> <87k0ihxj56.fsf@intel.com>
 <YWbIQmD1TGikpRm2@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YWbIQmD1TGikpRm2@phenom.ffwll.local>
X-Provags-ID: V03:K1:1BclTLkTU4amNua8fYN+IZPFm5F/GQXpWS5ysQ60YisVJ8xWdDC
 /wVNME45XYCO+L/RtZkhQg+PaCqrNbdrnQk4MkAVhNTVKSgB5ks64M+aOQgyg6YJn8xsTzx
 JPiLFzk4L4VDgWJj5ALAUEwzp9ZEFhM7SuKklT5w+M0uQztnaqPmNSb/sOJdVJGGvGv3JJg
 m0Vmj7TgIZV0yRFK77RsQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:LRQAcnKjBVU=:CUIE1tkUtt8DmHc2DvoXn6
 CfLCNr20xEgnmwtw/fouwwD9ZLjaaJ4wI5EmfE09iOZ/JrfiNmIOw4uHDWU4vQ9Dxj0ypcI32
 f2hdSYmXl+i7l824ntWiRLjoFDXR5dot5yqquTPykvH/vJcpSZAmrh0MDsaRHqD6YPd52qJVN
 izixixj4LjseACXWnd63uhDkIH0sqEqwr4/YII0+J9iBy6RehHRuEwLNTBSh1k7uyCpWKFrBP
 aZ+pVc3/biTOFiabHA4a80KFCFFPukHPRN6n4KdJXhhVpuASYVDQ1UYKX7pAjJcwR2I7t7THu
 GLyqdKYrX+q6MZMfQFPwHxqxQBRXkMOhIa9gVxThhWD8A8jY56q5mIjidg45soCI69P1hverj
 RzQSRVlrCbJpcEvgtDTh4c5B0/ihZp66scW2EkFWcGU+IV7q/MuoQNfrA1GDazKcP7tJ4+ket
 ZVDM74wwlBNIvyX+xr2sYlV8b08X7dmV64J7fPCm19qk37ak2k5AOA1/fX2wOOWZIcAk5CqrV
 UGWwFLH2G8vHYFY83YD8goXQJQy6uGM5jCJncxaVSDNEwfd7my6QWLPxM092RSsKZWH+n97Zs
 aThhPzumI/2XtV5zMqkUER3AU4W9NoQc5YlZ5LAfENHyUXDQGwUPFdKFDT63plQHQUe0xghd2
 gKYivo+p1wzDtKggurJbRN79ZfzfKH0f2QS/aY2KOn8DJ3u60ONFt8pMg0Xp++Bsfz8qQ35j5
 x+A3DBhXI9l979SF46JtLVczOih6ojMF+RRzNc3txb/bihWfy8Kk4UPJIeN0aEt7TowXfVckL
 jW0AxF7EJXTtd5v/rFCVq9f3SOpTS6G10G0c49WiEqVmEn6ELYR78ohT+DYriDQ++SI99dBNM
 0Q067/K0q0FFLPwtfiBUPk8tfcgjkNHSjnQ66K2BcAX9QMboYyEyKCJJHehdu6qGHecghJuJG
 xYVrSymPAVB+xZ5tfS7y6pOBB2U9zQNPp5IYmSvbj5IX+r+u/tfzNpOen9LOqf10avjZDZesv
 1JHQneqHXsgZbBLIoAdkpRzuEYOncjmzTxdTl22TnAUBBkzhJXcH5JS0Z0lzA+aZ4m/4ZESkK
 1+MBTEdSQVCW1k=
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

Hi Daniel and Jani,

On Wed, Oct 13, 2021 at 01:51:30PM +0200, Daniel Vetter wrote:
> On Wed, Oct 13, 2021 at 02:24:05PM +0300, Jani Nikula wrote:
> > On Mon, 11 Oct 2021, Len Baker <len.baker@gmx.com> wrote:
> > > Hi,
> > >
> > > On Sun, Oct 03, 2021 at 12:42:58PM +0200, Len Baker wrote:
> > >> As noted in the "Deprecated Interfaces, Language Features, Attribut=
es,
> > >> and Conventions" documentation [1], size calculations (especially
> > >> multiplication) should not be performed in memory allocator (or sim=
ilar)
> > >> function arguments due to the risk of them overflowing. This could =
lead
> > >> to values wrapping around and a smaller allocation being made than =
the
> > >> caller was expecting. Using those allocations could lead to linear
> > >> overflows of heap memory and other misbehaviors.
> > >>
> > >> In this case these are not actually dynamic sizes: all the operands
> > >> involved in the calculation are constant values. However it is bett=
er to
> > >> refactor them anyway, just to keep the open-coded math idiom out of
> > >> code.
> > >>
> > >> So, add at the end of the struct i915_syncmap a union with two flex=
ible
> > >> array members (these arrays share the same memory layout). This is
> > >> possible using the new DECLARE_FLEX_ARRAY macro. And then, use the
> > >> struct_size() helper to do the arithmetic instead of the argument
> > >> "size + count * size" in the kmalloc and kzalloc() functions.
> > >>
> > >> Also, take the opportunity to refactor the __sync_seqno and __sync_=
child
> > >> making them more readable.
> > >>
> > >> This code was detected with the help of Coccinelle and audited and =
fixed
> > >> manually.
> > >>
> > >> [1] https://www.kernel.org/doc/html/latest/process/deprecated.html#=
open-coded-arithmetic-in-allocator-arguments
> > >>
> > >> Signed-off-by: Len Baker <len.baker@gmx.com>
> > >> ---
> > >>  drivers/gpu/drm/i915/i915_syncmap.c | 12 ++++++++----
> > >>  1 file changed, 8 insertions(+), 4 deletions(-)
> > >
> > > I received a mail telling that this patch doesn't build:
> > >
> > > =3D=3D Series Details =3D=3D
> > >
> > > Series: drm/i915: Prefer struct_size over open coded arithmetic
> > > URL   : https://patchwork.freedesktop.org/series/95408/
> > > State : failure
> > >
> > > But it builds without error against linux-next (tag next-20211001). =
Against
> > > which tree and branch do I need to build?
> >
> > drm-tip [1]. It's a sort of linux-next for graphics. I think there are
> > still some branches that don't feed to linux-next.
>
> Yeah we need to get gt-next in linux-next asap. Joonas promised to send
> out his patch to make that happen in dim.
> -Daniel

Is there a possibility that you give an "Acked-by" tag? And then this patc=
h
goes to the mainline through the Kees' tree or Gustavo's tree?

Or is it better to wait for drm-tip to update?

Regards,
Len

>
> >
> > BR,
> > Jani.
> >
> >
> > [1] https://cgit.freedesktop.org/drm/drm-tip
> >
> >
> > >
> > > Regards,
> > > Len
> >
> > --
> > Jani Nikula, Intel Open Source Graphics Center
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
