Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AED799711DF
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 10:26:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2986010E31C;
	Mon,  9 Sep 2024 08:26:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kode54.net header.i=@kode54.net header.b="I+4Hf1d0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com
 [91.218.175.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D77F10E31E
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2024 08:26:41 +0000 (UTC)
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kode54.net; s=key1;
 t=1725870399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K+IaTZWyNvLfaA2Yx5fCNnoQgcC03AEhnkKUre/aJms=;
 b=I+4Hf1d0d3CNvp7ElH51pfEZxXnYCoVn67V4JfPay8WtDcTFRdkBquERTs120VnN09CLwO
 bpWSQjSI41klmpM8uO1qRCvtP2DaImZciba0nWoXVSOZe7SZ3gpmrWKdmREDvB+0qh9fc6
 e0/W9c3oO3Ney4gfXdf2SGHK/1cbQwTf13UE7O4dEzyELjNyf1dOFKD2/dKYlOr+t26ACJ
 Yqlqqg9eGTSz0VqA+Pz/JgWnH6krmru3nNuvYg5JHJgNVW9giprna/ERNaUyxunWgKtjVY
 t/hzkIXAtv74ncXRyEdIslJLGtdEmNzlWihoNJgUc7XONvaGhZ37d7C29zngXQ==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Sep 2024 01:26:34 -0700
Message-Id: <D41LZTT7K2N5.10I6PS6B05IDG@kode54.net>
Subject: Re: [PATCH 0/2] drm/amd: fix VRR race condition during IRQ handling
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: "Christopher Snowhill" <chris@kode54.net>
To: "Tobias Jakobi" <tjakobi@math.uni-bielefeld.de>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
References: <cover.1725269643.git.tjakobi@math.uni-bielefeld.de>
 <D40Q9ZLDQIZF.3OERFS0AYREN0@kode54.net>
 <deb6d962-f24e-4769-b313-be3b0efb873b@math.uni-bielefeld.de>
In-Reply-To: <deb6d962-f24e-4769-b313-be3b0efb873b@math.uni-bielefeld.de>
X-Migadu-Flow: FLOW_OUT
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

On Sun Sep 8, 2024 at 4:23 AM PDT, Tobias Jakobi wrote:
> On 9/8/24 09:35, Christopher Snowhill wrote:
>
> > On Mon Sep 2, 2024 at 2:40 AM PDT, tjakobi wrote:
> >> From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> >>
> >> Hello,
> >>
> >> this fixes a nasty race condition in the set_drr() callbacks for DCN10
> >> and DCN35 that has existed now since quite some time, see this GitLab
> >> issue for reference.
> >>
> >> https://gitlab.freedesktop.org/drm/amd/-/issues/3142
> >>
> >> The report just focuses von DCN10, but the same problem also exists in
> >> the DCN35 code.
> > Does the problem not exist in the following references to funcs->set_dr=
r?
> >
> > drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c:      if (pip=
e_ctx->stream_res.tg->funcs->set_drr)
> > drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c:             =
 pipe_ctx->stream_res.tg->funcs->set_drr(
> > drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c:             =
 pipe_ctx[i]->stream_res.tg->funcs->set_drr(
> > drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c:        if (pip=
e_ctx->stream_res.tg->funcs->set_drr)
> > drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c:               =
 pipe_ctx->stream_res.tg->funcs->set_drr(
> > drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c:               =
 if (pipe_ctx->stream_res.tg->funcs->set_drr)
> > drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c:               =
         pipe_ctx->stream_res.tg->funcs->set_drr(
> > drivers/gpu/drm/amd/display/dc/hwss/dcn31/dcn31_hwseq.c:        if (pip=
e_ctx->stream_res.tg->funcs->set_drr)
> > drivers/gpu/drm/amd/display/dc/hwss/dcn31/dcn31_hwseq.c:               =
 pipe_ctx->stream_res.tg->funcs->set_drr(
> > drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c:      if (pip=
e_ctx->stream_res.tg->funcs->set_drr)
> > drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c:             =
 pipe_ctx->stream_res.tg->funcs->set_drr(
>
> Maybe. But the big difference I see here, is that in this code there=20
> isn't even any kind of NULL check applied to tg. Or most of the members=
=20
> of *pipe_ctx. If there really is the same kind of problem here, then one=
=20
> would need to rewrite a bit more code to fix stuff.
>
> E.g. in the case of=C2=A0 dcn31_hwseq.c, the questionable code is in=20
> dcn31_reset_back_end_for_pipe(), which is static and only called from=20
> dcn31_reset_hw_ctx_wrap(). Which is assigned to the .reset_hw_ctx_wrap=20
> callback. And this specific callback, from what I can see, is only=20
> called from dce110_reset_hw_ctx_wrap(). Which is then assigned to the=20
> .apply_ctx_to_hw callback. The callback is only called from=20
> dc_commit_state_no_check(). That one is static again, and called from=20
> dc_commit_streams().
>
> I could trace this even further. My point is: I don't think this is=20
> called from any IRQ handler code. And given the depth and complexity of=
=20
> the callgraph, I have to admit, that, at least at this point, this is a=
=20
> bit over my head.
>
> Sure, I could now sprinkle a bunch of x !=3D NULL in the code, but that=
=20
> would be merely voodoo. And I usually try to have a theoretical basis=20
> when I apply changes to code.
>
> Maybe if someone from the AMD display team could give some insight if=20
> there still is potentially vulnerable code in some of the instances that=
=20
> Christopher has posted, then I would gladly take a look.

Sorry, I was taking a note from someone else who mentioned set_drr function=
s, and wasn't aware that none of the other implementations happen to be cal=
led from IRQ handlers. Thanks for looking into this.

-Christopher

> With best wishes,
> Tobias
>
> >
> >> With best wishes,
> >> Tobias
> >>
> >> Tobias Jakobi (2):
> >>    drm/amd/display: Avoid race between dcn10_set_drr() and
> >>      dc_state_destruct()
> >>    drm/amd/display: Avoid race between dcn35_set_drr() and
> >>      dc_state_destruct()
> >>
> >>   .../amd/display/dc/hwss/dcn10/dcn10_hwseq.c   | 20 +++++++++++------=
--
> >>   .../amd/display/dc/hwss/dcn35/dcn35_hwseq.c   | 20 +++++++++++------=
--
> >>   2 files changed, 24 insertions(+), 16 deletions(-)

