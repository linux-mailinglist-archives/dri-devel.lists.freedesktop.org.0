Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D49E5970557
	for <lists+dri-devel@lfdr.de>; Sun,  8 Sep 2024 09:35:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27CBD10E238;
	Sun,  8 Sep 2024 07:35:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kode54.net header.i=@kode54.net header.b="vs9QuaaM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com
 [91.218.175.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 978E710E238
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Sep 2024 07:35:22 +0000 (UTC)
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kode54.net; s=key1;
 t=1725780919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D0T3JnuFovJcPSZrr0kiMqAwcD+Baav4OSrwaNtip90=;
 b=vs9QuaaMH8C5P7D10dtuh1AepPnZZdG3yid2Oz9KNSEq4mtwRL5Cu2t3HTCYdYCt2KjVG3
 0QKlwtk54rU+jcrnkIwJMRMgO0DqZSDAdgvdmpodIuOFnGaDtpmWCmSEq339Epm+C9KET6
 Vo8FlerLFeurqQyPR3+vyZevwOAdpCvE2Yc7NTqQcjcfjqb+4IKTycLtKG1bVBhGa27nXr
 5oeyvleig15Ll6b74NLwRUuSqj43jjc3pCu1Z3VtDcySI51KDYEyYfMkyFXlWjsbskE3Up
 5+1ex8AkPPMu6S9VZY1u3VitgM2madHFyWsbGMpKm9MNZaHhdadCsWz7KXCD0g==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 08 Sep 2024 00:35:15 -0700
Message-Id: <D40Q9ZLDQIZF.3OERFS0AYREN0@kode54.net>
Subject: Re: [PATCH 0/2] drm/amd: fix VRR race condition during IRQ handling
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: "Christopher Snowhill" <chris@kode54.net>
To: <tjakobi@math.uni-bielefeld.de>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <cover.1725269643.git.tjakobi@math.uni-bielefeld.de>
In-Reply-To: <cover.1725269643.git.tjakobi@math.uni-bielefeld.de>
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

On Mon Sep 2, 2024 at 2:40 AM PDT, tjakobi wrote:
> From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
>
> Hello,
>
> this fixes a nasty race condition in the set_drr() callbacks for DCN10
> and DCN35 that has existed now since quite some time, see this GitLab
> issue for reference.
>
> https://gitlab.freedesktop.org/drm/amd/-/issues/3142
>
> The report just focuses von DCN10, but the same problem also exists in
> the DCN35 code.

Does the problem not exist in the following references to funcs->set_drr?

drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c:      if (pipe_ct=
x->stream_res.tg->funcs->set_drr)
drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c:              pip=
e_ctx->stream_res.tg->funcs->set_drr(
drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c:              pip=
e_ctx[i]->stream_res.tg->funcs->set_drr(
drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c:        if (pipe_ct=
x->stream_res.tg->funcs->set_drr)
drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c:                pip=
e_ctx->stream_res.tg->funcs->set_drr(
drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c:                if =
(pipe_ctx->stream_res.tg->funcs->set_drr)
drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c:                   =
     pipe_ctx->stream_res.tg->funcs->set_drr(
drivers/gpu/drm/amd/display/dc/hwss/dcn31/dcn31_hwseq.c:        if (pipe_ct=
x->stream_res.tg->funcs->set_drr)
drivers/gpu/drm/amd/display/dc/hwss/dcn31/dcn31_hwseq.c:                pip=
e_ctx->stream_res.tg->funcs->set_drr(
drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c:      if (pipe_ct=
x->stream_res.tg->funcs->set_drr)
drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c:              pip=
e_ctx->stream_res.tg->funcs->set_drr(

>
> With best wishes,
> Tobias
>
> Tobias Jakobi (2):
>   drm/amd/display: Avoid race between dcn10_set_drr() and
>     dc_state_destruct()
>   drm/amd/display: Avoid race between dcn35_set_drr() and
>     dc_state_destruct()
>
>  .../amd/display/dc/hwss/dcn10/dcn10_hwseq.c   | 20 +++++++++++--------
>  .../amd/display/dc/hwss/dcn35/dcn35_hwseq.c   | 20 +++++++++++--------
>  2 files changed, 24 insertions(+), 16 deletions(-)

