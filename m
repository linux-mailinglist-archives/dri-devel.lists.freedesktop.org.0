Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MFAOF7ldj2mZQgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 18:22:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A6713897B
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 18:22:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9032710E2C6;
	Fri, 13 Feb 2026 17:21:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QkwHIigN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D81B810E2C6;
 Fri, 13 Feb 2026 17:21:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7AAA36001A;
 Fri, 13 Feb 2026 17:12:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E526DC116C6;
 Fri, 13 Feb 2026 17:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771002778;
 bh=GYGlNH6ZtsYX+o3QMvwEg6+pg9JnYhrAAMOAOmTrVFE=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=QkwHIigNW/q1zQQTcR6ZM1LW4H6/cAgQd+wi9Y/fodGx9uCK0t5675f2Vby90NuZL
 SBq0Kf+bcQgQPmzwCWCOBt1+PR0dX1n0JX+W5vZFXwl1PTC7k/VIklE8cJFvMaLllx
 47ENJD+dl9692Kqp7JSOT1r3MKFrrDLVkEU7aLaBSuz+X/LNK1fOuaUrRXTV3iH6t/
 8hfMK5CIvfuWWB/ktOH/3EdFvnvhTgQCTq8SrzLHNSCe8es6geNGi9ShzCAbi2gA2F
 HrtgEDJok+B6ZX/e9dfK2th1VYqb3mGXU7XqRp1QNNOA9Em9Ftcnwico0rbqYCYHL0
 FGtWAQDCKkL/g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Feb 2026 18:12:54 +0100
Message-Id: <DGE036OEW8ZK.1PX0DRV8R9EVB@kernel.org>
Subject: Re: [PATCH v2 1/2] drm/nouveau: Fetch zcull info from device
Cc: "Lyude Paul" <lyude@redhat.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Mary Guillemard"
 <mary@mary.zone>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
To: "Mel Henning" <mhenning@darkrefraction.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260205-zcull3-v2-0-ac572f38cc7b@darkrefraction.com>
 <20260205-zcull3-v2-1-ac572f38cc7b@darkrefraction.com>
In-Reply-To: <20260205-zcull3-v2-1-ac572f38cc7b@darkrefraction.com>
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[redhat.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,mary.zone,lists.freedesktop.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,darkrefraction.com:email]
X-Rspamd-Queue-Id: 74A6713897B
X-Rspamd-Action: no action

On Thu Feb 5, 2026 at 7:56 PM CET, Mel Henning wrote:
> This information will be exposed to userspace in the following commit.
>
> Signed-off-by: Mel Henning <mhenning@darkrefraction.com>

For someone looking at this commit, this commit message is not very useful.

Please add at least a brief explanation of what the patch does and - even m=
ore
important - why it does it. See also [1].

[1] https://docs.kernel.org/process/submitting-patches.html#describe-your-c=
hanges

> ---
>  drivers/gpu/drm/nouveau/include/nvkm/engine/gr.h   | 19 +++++++++++++
>  .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c   |  9 ++++--
>  .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gr.c   | 32 ++++++++++++++++=
++++--
>  .../drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/gr.h  | 19 +++++++++++++
>  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h    |  2 +-
>  5 files changed, 75 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/include/nvkm/engine/gr.h b/drivers/g=
pu/drm/nouveau/include/nvkm/engine/gr.h
> index a2333cfe6955..490ce410f6cb 100644
> --- a/drivers/gpu/drm/nouveau/include/nvkm/engine/gr.h
> +++ b/drivers/gpu/drm/nouveau/include/nvkm/engine/gr.h
> @@ -3,9 +3,28 @@
>  #define __NVKM_GR_H__
>  #include <core/engine.h>
> =20
> +struct nvkm_gr_zcull_info {
> +	__u32 width_align_pixels;
> +	__u32 height_align_pixels;
> +	__u32 pixel_squares_by_aliquots;
> +	__u32 aliquot_total;
> +	__u32 zcull_region_byte_multiplier;
> +	__u32 zcull_region_header_size;
> +	__u32 zcull_subregion_header_size;
> +	__u32 subregion_count;
> +	__u32 subregion_width_align_pixels;
> +	__u32 subregion_height_align_pixels;
> +
> +	__u32 ctxsw_size;
> +	__u32 ctxsw_align;
> +};
> +
>  struct nvkm_gr {
>  	const struct nvkm_gr_func *func;
>  	struct nvkm_engine engine;
> +
> +	struct nvkm_gr_zcull_info zcull_info;
> +	bool has_zcull_info;
>  };
> =20
>  u64 nvkm_gr_units(struct nvkm_gr *);
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c b/drive=
rs/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c
> index ddb57d5e73d6..73844e1e7294 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c
> @@ -249,7 +249,7 @@ r535_gr_get_ctxbuf_info(struct r535_gr *gr, int i,
>  }
> =20
>  static int
> -r535_gr_get_ctxbufs_info(struct r535_gr *gr)
> +r535_gr_get_ctxbufs_and_zcull_info(struct r535_gr *gr)

Why did you combine those two callbacks? Why not extend struct nvkm_rm_api_=
gr
with another callback?

>  {
>  	NV2080_CTRL_INTERNAL_STATIC_GR_GET_CONTEXT_BUFFERS_INFO_PARAMS *info;
>  	struct nvkm_subdev *subdev =3D &gr->base.engine.subdev;
> @@ -265,6 +265,9 @@ r535_gr_get_ctxbufs_info(struct r535_gr *gr)
>  		r535_gr_get_ctxbuf_info(gr, i, &info->engineContextBuffersInfo[0].engi=
ne[i]);
> =20
>  	nvkm_gsp_rm_ctrl_done(&gsp->internal.device.subdevice, info);
> +
> +	gr->base.has_zcull_info =3D false;
> +
>  	return 0;
>  }
> =20
> @@ -312,7 +315,7 @@ r535_gr_oneinit(struct nvkm_gr *base)
>  	 *
>  	 * Also build the information that'll be used to create channel context=
s.
>  	 */
> -	ret =3D rm->api->gr->get_ctxbufs_info(gr);
> +	ret =3D rm->api->gr->get_ctxbufs_and_zcull_info(gr);
>  	if (ret)
>  		goto done;
> =20
> @@ -352,5 +355,5 @@ r535_gr_dtor(struct nvkm_gr *base)
> =20
>  const struct nvkm_rm_api_gr
>  r535_gr =3D {
> -	.get_ctxbufs_info =3D r535_gr_get_ctxbufs_info,
> +	.get_ctxbufs_and_zcull_info =3D r535_gr_get_ctxbufs_and_zcull_info,
>  };
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gr.c b/drive=
rs/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gr.c
> index b6cced9b8aa1..3e7af2ffece9 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gr.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gr.c
> @@ -164,9 +164,10 @@ r570_gr_scrubber_init(struct r535_gr *gr)
>  }
> =20
>  static int
> -r570_gr_get_ctxbufs_info(struct r535_gr *gr)
> +r570_gr_get_ctxbufs_and_zcull_info(struct r535_gr *gr)
>  {
>  	NV2080_CTRL_INTERNAL_STATIC_GR_GET_CONTEXT_BUFFERS_INFO_PARAMS *info;
> +	NV2080_CTRL_GR_GET_ZCULL_INFO_PARAMS *zcull_info;
>  	struct nvkm_subdev *subdev =3D &gr->base.engine.subdev;
>  	struct nvkm_gsp *gsp =3D subdev->device->gsp;
> =20
> @@ -179,13 +180,40 @@ r570_gr_get_ctxbufs_info(struct r535_gr *gr)
>  	for (int i =3D 0; i < ARRAY_SIZE(info->engineContextBuffersInfo[0].engi=
ne); i++)
>  		r535_gr_get_ctxbuf_info(gr, i, &info->engineContextBuffersInfo[0].engi=
ne[i]);
> =20
> +	NV2080_CTRL_INTERNAL_ENGINE_CONTEXT_BUFFER_INFO zcull =3D info->engineC=
ontextBuffersInfo[0]
> +		.engine[NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_GRAPH=
ICS_ZCULL];
> +	gr->base.zcull_info.ctxsw_size =3D zcull.size;
> +	gr->base.zcull_info.ctxsw_align =3D zcull.alignment;
> +
>  	nvkm_gsp_rm_ctrl_done(&gsp->internal.device.subdevice, info);
> +
> +	zcull_info =3D nvkm_gsp_rm_ctrl_rd(&gsp->internal.device.subdevice,
> +					 NV2080_CTRL_CMD_GR_GET_ZCULL_INFO,
> +					 sizeof(*zcull_info));
> +	if (WARN_ON(IS_ERR(zcull_info)))

What justifies this WARN_ON()? To me this seems like normal error handling,=
 i.e.
it is not a violation of some API invariant, etc. Also, this is in the driv=
er's
probe() path.

> +		return PTR_ERR(zcull_info);
> +
> +	gr->base.zcull_info.width_align_pixels =3D zcull_info->widthAlignPixels=
;
> +	gr->base.zcull_info.height_align_pixels =3D zcull_info->heightAlignPixe=
ls;
> +	gr->base.zcull_info.pixel_squares_by_aliquots =3D zcull_info->pixelSqua=
resByAliquots;
> +	gr->base.zcull_info.aliquot_total =3D zcull_info->aliquotTotal;
> +	gr->base.zcull_info.zcull_region_byte_multiplier =3D zcull_info->zcullR=
egionByteMultiplier;
> +	gr->base.zcull_info.zcull_region_header_size =3D zcull_info->zcullRegio=
nHeaderSize;
> +	gr->base.zcull_info.zcull_subregion_header_size =3D zcull_info->zcullSu=
bregionHeaderSize;
> +	gr->base.zcull_info.subregion_count =3D zcull_info->subregionCount;
> +	gr->base.zcull_info.subregion_width_align_pixels =3D zcull_info->subreg=
ionWidthAlignPixels;
> +	gr->base.zcull_info.subregion_height_align_pixels =3D zcull_info->subre=
gionHeightAlignPixels;
> +
> +	nvkm_gsp_rm_ctrl_done(&gsp->internal.device.subdevice, zcull_info);
> +
> +	gr->base.has_zcull_info =3D true;
> +
>  	return 0;
>  }
