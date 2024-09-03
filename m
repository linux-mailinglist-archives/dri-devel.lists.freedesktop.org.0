Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1333896932F
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 07:20:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7888310E277;
	Tue,  3 Sep 2024 05:20:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kode54.net header.i=@kode54.net header.b="Zw7NZtUs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 399 seconds by postgrey-1.36 at gabe;
 Tue, 03 Sep 2024 05:20:31 UTC
Received: from out-187.mta0.migadu.com (out-187.mta0.migadu.com
 [91.218.175.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4820210E277
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 05:20:31 +0000 (UTC)
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kode54.net; s=key1;
 t=1725340430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iliSav6dNVEYXLM7O3mkTRt+jnvb6sFDnm4YjoTgLHY=;
 b=Zw7NZtUsZkfmlefxeuXz6WzKkI1OtfmSxdpPTXae4+Yi8LptdoYXzeeV8j2OqzZjSBTvEZ
 98cFj7eSAkoO1wo4IIxMgWDlTRNl0gJSt8RNF08uFHkgQMbgL1dfyRX3x5YtwMWzjcSoXt
 zPiPYsTRd3lSykDUqDOKJhC66DhmCPNmfObbkdgRiNkvZsySHrh3uMJLdX/JXbx71zex0q
 DLsfj9CPGwF6A5xLw6CmX0SVeH1AnpVztAO4NF+Z6pKx29N7bfj5q6UqiEJGR7udzauAwe
 5E8kpcIYbB4/qzeWWRNqghYC1b2SnihBrBxGaEC+0CxO107+8q/wI1snRPCxtg==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Sep 2024 22:13:43 -0700
Message-Id: <D3WE4WL0ZP0W.2S2CCR4UJ3Q5Z@kode54.net>
Cc: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] drm/amd/display: Avoid race between dcn10_set_drr()
 and dc_state_destruct()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: "Christopher Snowhill" <chris@kode54.net>
To: <tjakobi@math.uni-bielefeld.de>, "Harry Wentland"
 <harry.wentland@amd.com>, "Leo Li" <sunpeng.li@amd.com>, "Rodrigo Siqueira"
 <Rodrigo.Siqueira@amd.com>, "Alex Deucher" <alexander.deucher@amd.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, "Pan, Xinhui"
 <Xinhui.Pan@amd.com>, "David Airlie" <airlied@gmail.com>, "Daniel Vetter"
 <daniel@ffwll.ch>, "Mario Limonciello" <mario.limonciello@amd.com>
References: <cover.1725269643.git.tjakobi@math.uni-bielefeld.de>
 <7b9dbbbb1e6a3aa6d7a4d9367d44d18ddd947158.1725269643.git.tjakobi@math.uni-bielefeld.de>
In-Reply-To: <7b9dbbbb1e6a3aa6d7a4d9367d44d18ddd947158.1725269643.git.tjakobi@math.uni-bielefeld.de>
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
> dc_state_destruct() nulls the resource context of the DC state. The pipe
> context passed to dcn10_set_drr() is a member of this resource context.
>
> If dc_state_destruct() is called parallel to the IRQ processing (which
> calls dcn10_set_drr() at some point), we can end up using already nulled
> function callback fields of struct stream_resource.
>
> The logic in dcn10_set_drr() already tries to avoid this, by checking tg
> against NULL. But if the nulling happens exactly after the NULL check and
> before the next access, then we get a race.
>
> Avoid this by copying tg first to a local variable, and then use this
> variable for all the operations. This should work, as long as nobody
> frees the resource pool where the timing generators live.
>
> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3142
> Fixes: 06ad7e164256 ("drm/amd/display: Destroy DC context while keeping D=
ML and DML2")
> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> ---
>  .../amd/display/dc/hwss/dcn10/dcn10_hwseq.c   | 20 +++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c b/dr=
ivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c
> index 3306684e805a..da8f2cb3c5db 100644
> --- a/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c
> +++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c
> @@ -3223,15 +3223,19 @@ void dcn10_set_drr(struct pipe_ctx **pipe_ctx,
>  	 * as well.
>  	 */
>  	for (i =3D 0; i < num_pipes; i++) {
> -		if ((pipe_ctx[i]->stream_res.tg !=3D NULL) && pipe_ctx[i]->stream_res.=
tg->funcs) {
> -			if (pipe_ctx[i]->stream_res.tg->funcs->set_drr)
> -				pipe_ctx[i]->stream_res.tg->funcs->set_drr(
> -					pipe_ctx[i]->stream_res.tg, &params);
> +		/* dc_state_destruct() might null the stream resources, so fetch tg
> +		 * here first to avoid a race condition. The lifetime of the pointee
> +		 * itself (the timing_generator object) is not a problem here.
> +		 */
> +		struct timing_generator *tg =3D pipe_ctx[i]->stream_res.tg;
> +
> +		if ((tg !=3D NULL) && tg->funcs) {
> +			if (tg->funcs->set_drr)
> +				tg->funcs->set_drr(tg, &params);
>  			if (adjust.v_total_max !=3D 0 && adjust.v_total_min !=3D 0)
> -				if (pipe_ctx[i]->stream_res.tg->funcs->set_static_screen_control)
> -					pipe_ctx[i]->stream_res.tg->funcs->set_static_screen_control(
> -						pipe_ctx[i]->stream_res.tg,
> -						event_triggers, num_frames);
> +				if (tg->funcs->set_static_screen_control)
> +					tg->funcs->set_static_screen_control(
> +						tg, event_triggers, num_frames);
>  		}
>  	}
>  }

This fixes hard to trace panics with labwc VRR and Wayfire on RX 6700 XT. I=
 had to use netconsole to arrive at the original bug report.

Tested-by: Christopher Snowhill <chris@kode54.net>
