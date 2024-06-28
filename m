Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F88391BD17
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 13:07:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7996010EC24;
	Fri, 28 Jun 2024 11:07:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B347510EC24
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 11:07:45 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1sN9SA-0007fw-Cu; Fri, 28 Jun 2024 13:07:42 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1sN9S9-005afV-Ro; Fri, 28 Jun 2024 13:07:41 +0200
Received: from pza by lupine with local (Exim 4.96)
 (envelope-from <p.zabel@pengutronix.de>) id 1sN9S9-0006Cs-2W;
 Fri, 28 Jun 2024 13:07:41 +0200
Message-ID: <e8e9d2ca2844e3ccbbe23b2c38b69ffe8d8307eb.camel@pengutronix.de>
Subject: Re: [PATCH 1/3] drm/etnaviv: move debug register en-/disable into
 own function
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Lucas Stach <l.stach@pengutronix.de>, etnaviv@lists.freedesktop.org
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>, Russell King
 <linux+etnaviv@armlinux.org.uk>, dri-devel@lists.freedesktop.org, 
 kernel@pengutronix.de, patchwork-lst@pengutronix.de
Date: Fri, 28 Jun 2024 13:07:41 +0200
In-Reply-To: <20240628104745.2602036-1-l.stach@pengutronix.de>
References: <20240628104745.2602036-1-l.stach@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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

On Fr, 2024-06-28 at 12:47 +0200, Lucas Stach wrote:
> The next changes will introduce another place where the debug registers
> need to be en-/disabled. Split into separate functions, so we don't need
> to replicate the code there. Also allow those calls to nest, keeping
> the debug registers enabled until all callers don't need them any longer.
>=20
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 33 ++++++++++++++++++++-------
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.h |  3 +++
>  2 files changed, 28 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etna=
viv/etnaviv_gpu.c
> index 7c7f97793ddd..ade6f7554706 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -471,6 +471,29 @@ static void etnaviv_hw_identify(struct etnaviv_gpu *=
gpu)
> =20
>  	etnaviv_hw_specs(gpu);
>  }
> +void etnaviv_gpu_enable_debug_regs(struct etnaviv_gpu *gpu)
> +{
> +	u32 val;
> +
> +	if (atomic_inc_return(&gpu->dbg_ref) > 1)
> +		return;

This is a reference count, any reason not to use refcount_t?

> +
> +	val =3D gpu_read(gpu, VIVS_HI_CLOCK_CONTROL);
> +	val &=3D ~VIVS_HI_CLOCK_CONTROL_DISABLE_DEBUG_REGISTERS;
> +	gpu_write(gpu, VIVS_HI_CLOCK_CONTROL, val);

Does this need locking after patch 3, to avoid racing of
sync_point_perfmon_sample_pre/post() with etnaviv_sched_timedout_job()?

regards
Philipp
