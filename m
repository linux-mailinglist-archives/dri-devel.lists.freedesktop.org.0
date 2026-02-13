Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8LEBIGScj2mxRwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 22:49:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F54139AC1
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 22:49:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92F5810E323;
	Fri, 13 Feb 2026 21:49:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="bd/vYS/0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F16510E323
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 21:49:19 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-65a3fdeb7d9so2140933a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 13:49:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771019358; cv=none;
 d=google.com; s=arc-20240605;
 b=OFVr4dM8YyWwD0KTbHsQVOQ6HsI17uXzfAdpicmhyWb7AHbH1xutoJ8sIOCDowyE+u
 Pmult/uiYu8yVjkevr/08XjpuK1f9V/PfILHu+l00ro57bl4srcJrOjogf8UmAmcXtvk
 L1+PDSqKcNw6R6EJkQTxBTAHYBcLJd9YemMP30HywGuAJYpaC02ZzY9tYf/YFyVUIRbJ
 4ayYO7+OJexw9NY6WU+GCND5imIaIqOZvvXkTtlXfVXs7dBLqpVHoWcurimvLyKwZSc5
 ospHVqRtiP5xPAZRWlCaXxLwdSbmvI9/bZjdqwpqlYpolj4jZoEkqEBy6gumFY3RWZ04
 wJ1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=GyC9E7ts1e/n857OQHO3aAn+NxSA5AMAMHg/+1FV/ts=;
 fh=Y+K9FMBgH7LUpAvZSwB9MbbxRiIFM6JJ2hc+jnkqqn8=;
 b=fDXh/wBszAFPVY0ILV/ganjrBqu4ZuJyrtrLNf5NJSt49/smk8rTe6OayhmAN67SNg
 rwU3NwaX1DH6G/4GOJu4PZBLRF05tQIt7IBGqnQiQWYYCxBaRuutmev3tDQ0/i1AvjTf
 lqcaRKhYK9nAUIOSu3FJ598sgjTcOlDvWh5rNuGq5lzp3zbXHOiTIExMIz22rkUD8Wsr
 qJZr0e0Zzfbkuy8FhraPYEHfL3dMZujPfeG4ChwG9vFeu4K/731GWLTHFEjy6SNLKRR+
 iQmIpEC5VqSFBwHrmFuR6Oh4RGuYBJkGuPtMe+YeoiJXNYklknjjAzdlvQ4sybHBitov
 UQyw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1771019358;
 x=1771624158; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GyC9E7ts1e/n857OQHO3aAn+NxSA5AMAMHg/+1FV/ts=;
 b=bd/vYS/0AyVOIo2CcaF62Bq1jnDSQfKSTty5AHzQtN8ztNXCMs9bKKox8Uacq549lo
 xRqp9zoCcAQGshP/KIQ/WD4aJqzVdO0MqokgxCCqrpQtevTkIKIUHwpMD/Gz5izXHn88
 vqfSLMfBZtXyO2y5ri4TeeMaWPGCMq6/nRUAi3RLreBnIaxpYxRHgoq5qsfQZS0W4DSa
 0EijMsbZhZF3VxmbQEnU/8oxRvIGvWzBHG0/1yZoRFmAQnKTUZi52YEGPIzmCCHtHgi1
 yVRm3ADiw98df4vBzEEGF/jrUPkBzuDTIsSuNEiKBS6nieLhepLf3bf8xehk8LnPt4Cu
 s3pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771019358; x=1771624158;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GyC9E7ts1e/n857OQHO3aAn+NxSA5AMAMHg/+1FV/ts=;
 b=l4WIMGvkkN+v1aE4MghXI/Wnm/2iIcpBjr7EGj9Ou6PnBv16uR5lKEi5Pe5a5TVqBI
 0JFfe/l6sf/ozv43P2X9BGXA2YnDY/wWzeXCcAePO+8QvDebRoflAxAemzQovJ552UZf
 2IZRzNHAWG6heeZe4JEDSwdidbs5LI7idOJnBAAfaWd7K/RVaGzCxu2Wxti/aVHi9ay/
 Gy1LnjDM17WL9TD6/R0X3ptLaN2P7zkAd+XZ5QRGYBRLfi4Deeri2WQtV7fGLaSOTkp1
 rEyFKxUNS/kIF/Q4u65DMxQBduTbZ7SRGTvFtdDT/6DMJn1sd4tZd0dOrTVzMH/eumGy
 OPkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuIOQ7rhcDaoORgSYaCJVHZmcIdv0JhdsUb+Pdrrcum4yQriokZ0nLYdtg4rQxUP9V+ntfPHs2J2g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxTITXKQMDKWEJmjzn6pi/JCKVc0EKnVHm7TECHy1dpqZjhBdam
 bnXX767Tb/LG8XKt65ScvSMQt/HEJxasipOGo+5FOuHAWAdc2AGSe3AQ5+kponK0gx9hAXYLK/Q
 sZMGbl/B+WJeBHK30/5x+BzIDy0T9ZiuGmkKlTk0Mrg==
X-Gm-Gg: AZuq6aInfRZsYZn6kXJfGuDdJtiBE8JRgKVj8pIQFU+/ZEhcTfMwCjrlarFDPYtoa/7
 IpC39ujUuhT+QqbuRTm6pt9OWrVkpoBfb6Ruw/trLpzPIxVly6Ejyg2fmUKf3KC3Ugu1052sK6e
 SIYmX6U8ETMXPkuZqb4MkR530pl+BPHGPn6uNBpkZMKnXHEjM9bAZ4AqCa2+N0a/notm8ZAiaNw
 l/EhOoqp0hZGyFr7SCabPZeTBqHmZkveXxlHsroOgRfPPsJXVBzUnlaA9cBzBRLHYQ4FMAud7JT
 Q6Eu3ExWSsKjm5w=
X-Received: by 2002:a17:906:6a16:b0:b83:b7c5:de2c with SMTP id
 a640c23a62f3a-b8fb41937e5mr203073966b.10.1771019357548; Fri, 13 Feb 2026
 13:49:17 -0800 (PST)
MIME-Version: 1.0
References: <20260205-zcull3-v2-0-ac572f38cc7b@darkrefraction.com>
 <20260205-zcull3-v2-1-ac572f38cc7b@darkrefraction.com>
 <DGE036OEW8ZK.1PX0DRV8R9EVB@kernel.org>
In-Reply-To: <DGE036OEW8ZK.1PX0DRV8R9EVB@kernel.org>
From: M Henning <mhenning@darkrefraction.com>
Date: Fri, 13 Feb 2026 16:48:51 -0500
X-Gm-Features: AZwV_Qg-n6EvKH2NT0I2bWESDP3lTEHQVgOx9h5-JlkkGBzb6bhJS8FquRFVMEw
Message-ID: <CAAgWFh0zX=u7OZYq3QBrs0ySve897LXb1PN9QFzhYg0gtHy5wQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/nouveau: Fetch zcull info from device
To: Danilo Krummrich <dakr@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Mary Guillemard <mary@mary.zone>, 
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.81 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	R_DKIM_ALLOW(-0.20)[darkrefraction-com.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[darkrefraction.com];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:dakr@kernel.org,m:lyude@redhat.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:mary@mary.zone,m:nouveau@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mhenning@darkrefraction.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[redhat.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,mary.zone,lists.freedesktop.org,vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mhenning@darkrefraction.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[darkrefraction-com.20230601.gappssmtp.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: D8F54139AC1
X-Rspamd-Action: no action

On Fri, Feb 13, 2026 at 12:12=E2=80=AFPM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> On Thu Feb 5, 2026 at 7:56 PM CET, Mel Henning wrote:
> > This information will be exposed to userspace in the following commit.
> >
> > Signed-off-by: Mel Henning <mhenning@darkrefraction.com>
>
> For someone looking at this commit, this commit message is not very usefu=
l.
>
> Please add at least a brief explanation of what the patch does and - even=
 more
> important - why it does it. See also [1].
>
> [1] https://docs.kernel.org/process/submitting-patches.html#describe-your=
-changes

What I'm struggling with is that I don't know how to do this without
repeating myself. If you want, I can copy-paste my explanation of
zcull here too and then it will appear three times, once in each
commit and once in the cover letter. But that kind of repetition
doesn't seem very helpful to me.

> > ---
> >  drivers/gpu/drm/nouveau/include/nvkm/engine/gr.h   | 19 +++++++++++++
> >  .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c   |  9 ++++--
> >  .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gr.c   | 32 ++++++++++++++=
++++++--
> >  .../drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/gr.h  | 19 +++++++++++++
> >  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h    |  2 +-
> >  5 files changed, 75 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/include/nvkm/engine/gr.h b/drivers=
/gpu/drm/nouveau/include/nvkm/engine/gr.h
> > index a2333cfe6955..490ce410f6cb 100644
> > --- a/drivers/gpu/drm/nouveau/include/nvkm/engine/gr.h
> > +++ b/drivers/gpu/drm/nouveau/include/nvkm/engine/gr.h
> > @@ -3,9 +3,28 @@
> >  #define __NVKM_GR_H__
> >  #include <core/engine.h>
> >
> > +struct nvkm_gr_zcull_info {
> > +     __u32 width_align_pixels;
> > +     __u32 height_align_pixels;
> > +     __u32 pixel_squares_by_aliquots;
> > +     __u32 aliquot_total;
> > +     __u32 zcull_region_byte_multiplier;
> > +     __u32 zcull_region_header_size;
> > +     __u32 zcull_subregion_header_size;
> > +     __u32 subregion_count;
> > +     __u32 subregion_width_align_pixels;
> > +     __u32 subregion_height_align_pixels;
> > +
> > +     __u32 ctxsw_size;
> > +     __u32 ctxsw_align;
> > +};
> > +
> >  struct nvkm_gr {
> >       const struct nvkm_gr_func *func;
> >       struct nvkm_engine engine;
> > +
> > +     struct nvkm_gr_zcull_info zcull_info;
> > +     bool has_zcull_info;
> >  };
> >
> >  u64 nvkm_gr_units(struct nvkm_gr *);
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c b/dri=
vers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c
> > index ddb57d5e73d6..73844e1e7294 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c
> > @@ -249,7 +249,7 @@ r535_gr_get_ctxbuf_info(struct r535_gr *gr, int i,
> >  }
> >
> >  static int
> > -r535_gr_get_ctxbufs_info(struct r535_gr *gr)
> > +r535_gr_get_ctxbufs_and_zcull_info(struct r535_gr *gr)
>
> Why did you combine those two callbacks? Why not extend struct nvkm_rm_ap=
i_gr
> with another callback?

ctxsw_size and ctxsw_align come from
NV2080_CTRL_CMD_INTERNAL_STATIC_KGR_GET_CONTEXT_BUFFERS_INFO, which is
already called by r570_gr_get_ctxbufs., while the rest of the zcull
info comes from
NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_GRAPHICS_ZCULL.
If we add another callback then we either need to:

1) Call GET_CONTEXT_BUFFERS_INFO twice, once for each callback. This
is a little slower and more verbose than calling it once.
or
2) fill out zcull_info partially in r570_gr_get_ctxbufs and partially
in the new callback. Since we fill out only some of the info in each
we now need to handle edge cases where one function is called but not
the other as well as them being called in an arbitrary order.

Because of this, I decided that it was simplest to combine them in a
single call, which avoids repeated rpc calls to the gpu without the
complexity of handling partially complete states.

> >  {
> >       NV2080_CTRL_INTERNAL_STATIC_GR_GET_CONTEXT_BUFFERS_INFO_PARAMS *i=
nfo;
> >       struct nvkm_subdev *subdev =3D &gr->base.engine.subdev;
> > @@ -265,6 +265,9 @@ r535_gr_get_ctxbufs_info(struct r535_gr *gr)
> >               r535_gr_get_ctxbuf_info(gr, i, &info->engineContextBuffer=
sInfo[0].engine[i]);
> >
> >       nvkm_gsp_rm_ctrl_done(&gsp->internal.device.subdevice, info);
> > +
> > +     gr->base.has_zcull_info =3D false;
> > +
> >       return 0;
> >  }
> >
> > @@ -312,7 +315,7 @@ r535_gr_oneinit(struct nvkm_gr *base)
> >        *
> >        * Also build the information that'll be used to create channel c=
ontexts.
> >        */
> > -     ret =3D rm->api->gr->get_ctxbufs_info(gr);
> > +     ret =3D rm->api->gr->get_ctxbufs_and_zcull_info(gr);
> >       if (ret)
> >               goto done;
> >
> > @@ -352,5 +355,5 @@ r535_gr_dtor(struct nvkm_gr *base)
> >
> >  const struct nvkm_rm_api_gr
> >  r535_gr =3D {
> > -     .get_ctxbufs_info =3D r535_gr_get_ctxbufs_info,
> > +     .get_ctxbufs_and_zcull_info =3D r535_gr_get_ctxbufs_and_zcull_inf=
o,
> >  };
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gr.c b/dri=
vers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gr.c
> > index b6cced9b8aa1..3e7af2ffece9 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gr.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gr.c
> > @@ -164,9 +164,10 @@ r570_gr_scrubber_init(struct r535_gr *gr)
> >  }
> >
> >  static int
> > -r570_gr_get_ctxbufs_info(struct r535_gr *gr)
> > +r570_gr_get_ctxbufs_and_zcull_info(struct r535_gr *gr)
> >  {
> >       NV2080_CTRL_INTERNAL_STATIC_GR_GET_CONTEXT_BUFFERS_INFO_PARAMS *i=
nfo;
> > +     NV2080_CTRL_GR_GET_ZCULL_INFO_PARAMS *zcull_info;
> >       struct nvkm_subdev *subdev =3D &gr->base.engine.subdev;
> >       struct nvkm_gsp *gsp =3D subdev->device->gsp;
> >
> > @@ -179,13 +180,40 @@ r570_gr_get_ctxbufs_info(struct r535_gr *gr)
> >       for (int i =3D 0; i < ARRAY_SIZE(info->engineContextBuffersInfo[0=
].engine); i++)
> >               r535_gr_get_ctxbuf_info(gr, i, &info->engineContextBuffer=
sInfo[0].engine[i]);
> >
> > +     NV2080_CTRL_INTERNAL_ENGINE_CONTEXT_BUFFER_INFO zcull =3D info->e=
ngineContextBuffersInfo[0]
> > +             .engine[NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_EN=
GINE_ID_GRAPHICS_ZCULL];
> > +     gr->base.zcull_info.ctxsw_size =3D zcull.size;
> > +     gr->base.zcull_info.ctxsw_align =3D zcull.alignment;
> > +
> >       nvkm_gsp_rm_ctrl_done(&gsp->internal.device.subdevice, info);
> > +
> > +     zcull_info =3D nvkm_gsp_rm_ctrl_rd(&gsp->internal.device.subdevic=
e,
> > +                                      NV2080_CTRL_CMD_GR_GET_ZCULL_INF=
O,
> > +                                      sizeof(*zcull_info));
> > +     if (WARN_ON(IS_ERR(zcull_info)))
>
> What justifies this WARN_ON()? To me this seems like normal error handlin=
g, i.e.
> it is not a violation of some API invariant, etc. Also, this is in the dr=
iver's
> probe() path.

I was just copying the error handling that already exists in this function.

I do think these are weird error cases though - they mean that the gpu
was partially but not fully initialized which shouldn't happen during
normal usage. The only cases I can think of that would trigger this
warning are a kernel bug or an intermittent PCI link, which I think
are both reasonable to warn on.

> > +             return PTR_ERR(zcull_info);
> > +
> > +     gr->base.zcull_info.width_align_pixels =3D zcull_info->widthAlign=
Pixels;
> > +     gr->base.zcull_info.height_align_pixels =3D zcull_info->heightAli=
gnPixels;
> > +     gr->base.zcull_info.pixel_squares_by_aliquots =3D zcull_info->pix=
elSquaresByAliquots;
> > +     gr->base.zcull_info.aliquot_total =3D zcull_info->aliquotTotal;
> > +     gr->base.zcull_info.zcull_region_byte_multiplier =3D zcull_info->=
zcullRegionByteMultiplier;
> > +     gr->base.zcull_info.zcull_region_header_size =3D zcull_info->zcul=
lRegionHeaderSize;
> > +     gr->base.zcull_info.zcull_subregion_header_size =3D zcull_info->z=
cullSubregionHeaderSize;
> > +     gr->base.zcull_info.subregion_count =3D zcull_info->subregionCoun=
t;
> > +     gr->base.zcull_info.subregion_width_align_pixels =3D zcull_info->=
subregionWidthAlignPixels;
> > +     gr->base.zcull_info.subregion_height_align_pixels =3D zcull_info-=
>subregionHeightAlignPixels;
> > +
> > +     nvkm_gsp_rm_ctrl_done(&gsp->internal.device.subdevice, zcull_info=
);
> > +
> > +     gr->base.has_zcull_info =3D true;
> > +
> >       return 0;
> >  }
