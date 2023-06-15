Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 394377312FF
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 11:04:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0761E10E4A6;
	Thu, 15 Jun 2023 09:04:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94EEE10E4AB
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 09:04:48 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1q9iuJ-0001Ds-AU; Thu, 15 Jun 2023 11:04:43 +0200
Message-ID: <d17de4ebfd08faa23238ece2ad0b737bf271498b.camel@pengutronix.de>
Subject: Re: drm/etnaviv: slow down FE idle polling
From: Lucas Stach <l.stach@pengutronix.de>
To: Sui Jingfeng <suijingfeng@loongson.cn>, etnaviv@lists.freedesktop.org
Date: Thu, 15 Jun 2023 11:04:40 +0200
In-Reply-To: <8c36b8bc-5a0d-75f7-265c-b0191979165a@loongson.cn>
References: <20230607125932.3518547-1-l.stach@pengutronix.de>
 <8c36b8bc-5a0d-75f7-265c-b0191979165a@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
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
Cc: Russell King <linux+etnaviv@armlinux.org.uk>,
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
 patchwork-lst@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Donnerstag, dem 15.06.2023 um 12:09 +0800 schrieb Sui Jingfeng:
> Hi,
>=20
> On 2023/6/7 20:59, Lucas Stach wrote:
> > Currently the FE is spinning way too fast when polling for new work in
> 'way' -> 'away'
> > the FE idleloop.
> 'idleloop' -> 'idle loop'
> >   As each poll fetches 16 bytes from memory, a GPU running
> > at 1GHz with the current setting of 200 wait cycle between fetches caus=
es
> > 80 MB/s of memory traffic just to check for new work when the GPU is
> > otherwise idle, which is more FE traffic than in some GPU loaded cases.
> >=20
> > Significantly increase the number of wait cycles to slow down the poll
> > interval to ~30=C2=B5s, limiting the FE idle memory traffic to 512 KB/s=
, while
> > providing a max latency which should not hurt most use-cases. The FE WA=
IT
> > command seems to have some unknown discrete steps in the wait cycles
> add a comma here.
> >   so
> > we may over/undershoot the target a bit, but that should be harmless.
> overshoot or undershoot
> > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> > Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com>
> > ---
> >   drivers/gpu/drm/etnaviv/etnaviv_buffer.c | 11 ++++++-----
> >   drivers/gpu/drm/etnaviv/etnaviv_gpu.c    |  7 +++++++
> >   drivers/gpu/drm/etnaviv/etnaviv_gpu.h    |  1 +
> >   3 files changed, 14 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_buffer.c b/drivers/gpu/drm=
/etnaviv/etnaviv_buffer.c
> > index cf741c5c82d2..384df1659be6 100644
> > --- a/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
> > +++ b/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
> > @@ -53,11 +53,12 @@ static inline void CMD_END(struct etnaviv_cmdbuf *b=
uffer)
> >   	OUT(buffer, VIV_FE_END_HEADER_OP_END);
> >   }
> >  =20
> > -static inline void CMD_WAIT(struct etnaviv_cmdbuf *buffer)
> > +static inline void CMD_WAIT(struct etnaviv_cmdbuf *buffer,
> > +			    unsigned int waitcycles)
> >   {
> >   	buffer->user_size =3D ALIGN(buffer->user_size, 8);
> >  =20
> > -	OUT(buffer, VIV_FE_WAIT_HEADER_OP_WAIT | 200);
> > +	OUT(buffer, VIV_FE_WAIT_HEADER_OP_WAIT | waitcycles);
> >   }
> >  =20
> >   static inline void CMD_LINK(struct etnaviv_cmdbuf *buffer,
> > @@ -168,7 +169,7 @@ u16 etnaviv_buffer_init(struct etnaviv_gpu *gpu)
> >   	/* initialize buffer */
> >   	buffer->user_size =3D 0;
> >  =20
> > -	CMD_WAIT(buffer);
> > +	CMD_WAIT(buffer, gpu->fe_waitcycles);
> >   	CMD_LINK(buffer, 2,
> >   		 etnaviv_cmdbuf_get_va(buffer, &gpu->mmu_context->cmdbuf_mapping)
> >   		 + buffer->user_size - 4);
> > @@ -320,7 +321,7 @@ void etnaviv_sync_point_queue(struct etnaviv_gpu *g=
pu, unsigned int event)
> >   	CMD_END(buffer);
> >  =20
> >   	/* Append waitlink */
> > -	CMD_WAIT(buffer);
> > +	CMD_WAIT(buffer, gpu->fe_waitcycles);
> >   	CMD_LINK(buffer, 2,
> >   		 etnaviv_cmdbuf_get_va(buffer, &gpu->mmu_context->cmdbuf_mapping)
> >   		 + buffer->user_size - 4);
> > @@ -503,7 +504,7 @@ void etnaviv_buffer_queue(struct etnaviv_gpu *gpu, =
u32 exec_state,
> >  =20
> >   	CMD_LOAD_STATE(buffer, VIVS_GL_EVENT, VIVS_GL_EVENT_EVENT_ID(event) =
|
> >   		       VIVS_GL_EVENT_FROM_PE);
> > -	CMD_WAIT(buffer);
> > +	CMD_WAIT(buffer, gpu->fe_waitcycles);
> >   	CMD_LINK(buffer, 2,
> >   		 etnaviv_cmdbuf_get_va(buffer, &gpu->mmu_context->cmdbuf_mapping)
> >   		 + buffer->user_size - 4);
> > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/et=
naviv/etnaviv_gpu.c
> > index 41aab1aa330b..8c20dff32240 100644
> > --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> > +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> > @@ -493,6 +493,13 @@ static void etnaviv_gpu_update_clock(struct etnavi=
v_gpu *gpu)
> >   		clock |=3D VIVS_HI_CLOCK_CONTROL_FSCALE_VAL(fscale);
> >   		etnaviv_gpu_load_clock(gpu, clock);
> >   	}
> > +
> > +	/*
> > +	 * Choose number of wait cycles to target a ~30us (1/32768) max laten=
cy
> > +	 * until new work is picked up by the FE when it polls in the idle lo=
op.
> > +	 */
> > +	gpu->fe_waitcycles =3D min(gpu->base_rate_core >> (15 - gpu->freq_sca=
le),
> > +				 0xffffUL);
>=20
> This patch is NOT effective on our hardware GC1000 v5037 (ls7a1000 +=20
> ls3a5000).
>=20
> As the gpu->base_rate_core is 0,=C2=A0 so, in the end gpu->fe_waitcycles =
is=20
> also zero.
>=20
Uh, that's a problem, as the patch will then have the opposite effect
on your platform by speeding up the idle loop. Thanks for catching
this! I'll improve the patch to keep a reasonable amount of wait cycles
in this case.

Regards,
Lucas

> But after apply this path, the glmark2 still run happily, no influence. S=
o
>=20
>=20
> Tested-by: Sui Jingfeng <suijingfeng@loongson.cn>
>=20
> >   }
> >  =20
> >   static int etnaviv_hw_reset(struct etnaviv_gpu *gpu)
> > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h b/drivers/gpu/drm/et=
naviv/etnaviv_gpu.h
> > index 98c6f9c320fc..e1e1de59c38d 100644
> > --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
> > +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
> > @@ -150,6 +150,7 @@ struct etnaviv_gpu {
> >   	struct clk *clk_shader;
> >  =20
> >   	unsigned int freq_scale;
> > +	unsigned int fe_waitcycles;
> >   	unsigned long base_rate_core;
> >   	unsigned long base_rate_shader;
> >   };
>=20

