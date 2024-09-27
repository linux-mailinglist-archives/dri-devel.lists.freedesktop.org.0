Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 915C0988AC2
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 21:33:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0D9110ED02;
	Fri, 27 Sep 2024 19:33:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="ogsOBjEz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DB6D10ED02
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2024 19:33:20 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id
 6a1803df08f44-6cb2d2a7d48so16890106d6.3
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2024 12:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1727465599; x=1728070399;
 darn=lists.freedesktop.org; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=VKladj2sFJjdiWtfrOuq4uA29WlsH18GzOxyRfbvkm8=;
 b=ogsOBjEzjTKsNiMLWVoAD22YihrR8HyM2I0AJI8Wp9icKDKwpYSe0DVgX7PjKZ9Jng
 Y5/kJfmrgMOonNVD8A99FkLNsQZZ7spAQgsX7QHMih8nE2JCzAuEi50d+joLoOf9fwT9
 XotCqOXf7se2JJBs17vXrNvIIxmyrjSAseL1uU4aV5c+JNJfSYgwEKuDiaRD9lvKnwX4
 9efBEV6CqCnWRIQapKxwPtdzSzeHhGlkWzXSRqknqrEOWkg+qFYvNGakPmZ/nypr2Kzy
 Wm6/c0xX2mpBb3rIU8b8hiEur4Y2u9h9XaXrge3Qy1L4DfVjn7MFKR9/Z+/qtsKaIRf/
 YWbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727465599; x=1728070399;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VKladj2sFJjdiWtfrOuq4uA29WlsH18GzOxyRfbvkm8=;
 b=UBo/I+MzoIpCYYiC4LvVSh5kJEHboofG9PNYzqoWKu9WSVdKYkB/D4K77JYzOxmrXP
 //NbIbrYYePnX7h1Qy1gZ2KhDDAifFbQ3bpBE/g+pC0HMifc+CwC8lZ/VWW9yAZt4XwF
 loTIAigzpbdZh9DvAipBx+iQMOcEBAhGzvZSpEJ7tapHJ+bsz4z52zTlpqJLZW78lPzK
 XCZAuPfh2Cn+xkA5XwCJogYaMbKPyKFoVE4Y8bvp3fgoNI1jYb/uDTbmIBgyTZ5lz45k
 MYfCnHsDueaKjmRmMftRDHSIqTOGW19qGYVRP0DNl79rUdgUh40Sy9T0bza1Kon6IFXN
 +SFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTvLclRn20A5Rw60Wi5nGGKipjS6JG7T9UHyuC15I9SJGijZTSxIQL3wXQdj7QsCVLe87ZOtD2lcE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxAbox25fgTfcLqGVlVii4u5lIIB+hXz24tVzXbZ5sqxBpTdyft
 G3k2JjXD5WXkB1Pf11NEliQ3R9fz9RoHwdQtukFo+to0Po4u1MWv7MSuskFve6Y=
X-Google-Smtp-Source: AGHT+IEhDe5EE9y0RFQCZTtCNmMq10z4RbPVeb2m5iqTjmA1e9FxI+tgYD6oSZc2Z9WqFDJgdWHibA==
X-Received: by 2002:a05:6214:3bc7:b0:6cb:4e39:1a93 with SMTP id
 6a1803df08f44-6cb4e395f0cmr619406d6.38.1727465599241; 
 Fri, 27 Sep 2024 12:33:19 -0700 (PDT)
Received: from nicolas-tpx395.lan ([2606:6d00:15:862e::580])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6cb3b680045sm11835946d6.104.2024.09.27.12.33.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2024 12:33:18 -0700 (PDT)
Message-ID: <386f4e12fd835b18c3f618f2c94cbd426bd6cf28.camel@ndufresne.ca>
Subject: Re: [PATCH v2 2/2] media: imx: vdic: Introduce mem2mem VDI
 deinterlacer driver
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Marek Vasut <marex@denx.de>, linux-media@vger.kernel.org
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, Fabio
 Estevam <festevam@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, Sascha
 Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Steve
 Longerbeam <slongerbeam@gmail.com>, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev,  linux-arm-kernel@lists.infradead.org,
 linux-fbdev@vger.kernel.org,  linux-staging@lists.linux.dev
Date: Fri, 27 Sep 2024 15:33:17 -0400
In-Reply-To: <6b45e30c-b215-4f7a-91a4-fde05d78f737@denx.de>
References: <20240724002044.112544-1-marex@denx.de>
 <20240724002044.112544-2-marex@denx.de>
 <85a5a42667e5867bc45da31baf045d4c9557f5f1.camel@ndufresne.ca>
 <6b45e30c-b215-4f7a-91a4-fde05d78f737@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
MIME-Version: 1.0
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

Le mercredi 25 septembre 2024 =C3=A0 22:45 +0200, Marek Vasut a =C3=A9crit=
=C2=A0:
> On 9/25/24 7:58 PM, Nicolas Dufresne wrote:
>=20
>=20

[...]

>=20
> > > +static irqreturn_t ipu_mem2mem_vdic_nfb4eof_interrupt(int irq, void =
*dev_id)
> > > +{
> > > +	struct ipu_mem2mem_vdic_priv *priv =3D dev_id;
> > > +
> > > +	/* That is about all we can do about it, report it. */
> > > +	dev_warn_ratelimited(priv->dev, "NFB4EOF error interrupt occurred\n=
");
> >=20
> > Not sure this is right. If that means ipu_mem2mem_vdic_eof_interrupt wo=
n't fire,
> > then it means streamoff/close after that will hang forever, leaving a z=
ombie
> > process behind.
> >=20
> > Perhaps mark the buffers as ERROR, and finish the job.
>=20
> The NFB4EOF interrupt is generated when the VDIC didn't write (all of)=
=20
> output frame . I think it stands for "New Frame Before EOF" or some=20
> such. Basically the currently written frame will be corrupted and the=20
> next frame(s) are likely going to be OK again.

So the other IRQ will be triggered ? After this one ? Is so, perhaps take a
moment to mark the frames as ERROR (which means corrupted).

[...]

> >=20
> > The driver is not taking ownership of prev_buf, only curr_buf is guaran=
teed to
> > exist until v4l2_m2m_job_finish() is called. Usespace could streamoff, =
allocate
> > new buffers, and then an old freed buffer may endup being used.
>=20
> So, what should I do about this ? Is there some way to ref the buffer to=
=20
> keep it around ?
>=20
> > Its also unclear to me how userspace can avoid this ugly warning, how c=
an you
> > have curr_buf set the first time ? (I might be missing something you th=
is one
> > though).
>=20
> The warning happens when streaming starts and there is only one input=20
> frame available for the VDIC, which needs three fields to work=20
> correctly. So, if there in only one input frame, VDI uses the input=20
> frame bottom field as PREV field for the prediction, and input frame top=
=20
> and bottom fields as CURR and NEXT fields for the prediction, the result=
=20
> may be one sub-optimal deinterlaced output frame (the first one). Once=
=20
> another input frame gets enqueued, the VDIC uses the previous frame=20
> bottom field as PREV and the newly enqueued frame top and bottom fields=
=20
> as CURR and NEXT and the prediction works correctly from that point on.

Warnings by default are not acceptable.

>=20
> > Perhaps what you want is a custom job_ready() callback, that ensure you=
 have 2
> > buffers in the OUTPUT queue ? You also need to ajust the CID
> > MIN_BUFFERS_FOR_OUTPUT accordingly.
>=20
> I had that before, but gstreamer didn't enqueue the two frames for me,=
=20
> so I got back to this variant for maximum compatibility.

Its well known that GStreamer v4l2convert element have no support for
detinterlacing and need to be improved to support any deinterlace drivers o=
ut
there.

Other drivers will simply holds on output buffers until it has enough to pr=
oduce
the first valid picture. Holding meaning not marking them done, which keeps=
 then
in the ACTIVE state, which is being tracked by the core for your.

[...]

> > > +
> > > +	if (ipu_mem2mem_vdic_format_is_yuv420(f->fmt.pix.pixelformat))
> > > +		f->fmt.pix.bytesperline =3D f->fmt.pix.width * 3 / 2;
> > > +	else if (ipu_mem2mem_vdic_format_is_yuv422(f->fmt.pix.pixelformat))
> > > +		f->fmt.pix.bytesperline =3D f->fmt.pix.width * 2;
> > > +	else if (ipu_mem2mem_vdic_format_is_rgb16(f->fmt.pix.pixelformat))
> > > +		f->fmt.pix.bytesperline =3D f->fmt.pix.width * 2;
> > > +	else if (ipu_mem2mem_vdic_format_is_rgb24(f->fmt.pix.pixelformat))
> > > +		f->fmt.pix.bytesperline =3D f->fmt.pix.width * 3;
> > > +	else if (ipu_mem2mem_vdic_format_is_rgb32(f->fmt.pix.pixelformat))
> > > +		f->fmt.pix.bytesperline =3D f->fmt.pix.width * 4;
> > > +	else
> > > +		f->fmt.pix.bytesperline =3D f->fmt.pix.width;
> > > +
> > > +	f->fmt.pix.sizeimage =3D f->fmt.pix.height * f->fmt.pix.bytesperlin=
e;
> >=20
> > And use v4l2-common ?
>=20
> I don't really understand, there is nothing in v4l2-common.c that would=
=20
> be really useful replacement for this ?

Not sure I get your response, v4l2-common is used in many drivers already, =
and
we intent to keep improving it so that all driver uses it in the long term.=
 It
been created because folks believed they can calculate bytesperline and
sizeimage, but as the number of format grows, it always endup wrong, causin=
g the
HW to overflow and break the system at a larger scale.

>=20
> > > +	return 0;
> > > +}
> > > +
> > > +static int ipu_mem2mem_vdic_s_fmt(struct file *file, void *fh, struc=
t v4l2_format *f)
> > > +{
> > > +	struct ipu_mem2mem_vdic_ctx *ctx =3D fh_to_ctx(fh);
> > > +	struct ipu_mem2mem_vdic_priv *priv =3D ctx->priv;
> > > +	struct v4l2_pix_format *fmt, *infmt, *outfmt;
> > > +	struct vb2_queue *vq;
> > > +	int ret;
> > > +
> > > +	vq =3D v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
> > > +	if (vb2_is_busy(vq)) {
> > > +		dev_err(priv->dev, "%s queue busy\n",  __func__);
> > > +		return -EBUSY;
> > > +	}
> > > +
> > > +	ret =3D ipu_mem2mem_vdic_try_fmt(file, fh, f);
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > > +	fmt =3D ipu_mem2mem_vdic_get_format(priv, f->type);
> > > +	*fmt =3D f->fmt.pix;
> > > +
> > > +	/* Propagate colorimetry to the capture queue */
> > > +	infmt =3D ipu_mem2mem_vdic_get_format(priv, V4L2_BUF_TYPE_VIDEO_OUT=
PUT);
> > > +	outfmt =3D ipu_mem2mem_vdic_get_format(priv, V4L2_BUF_TYPE_VIDEO_CA=
PTURE);
> > > +	outfmt->colorspace =3D infmt->colorspace;
> > > +	outfmt->ycbcr_enc =3D infmt->ycbcr_enc;
> > > +	outfmt->xfer_func =3D infmt->xfer_func;
> > > +	outfmt->quantization =3D infmt->quantization;
> >=20
> > So you can do CSC conversion but not colorimetry ? We have
> > V4L2_PIX_FMT_FLAG_SET_CSC if you can do colorimetry transforms too. I h=
ave
> > patches that I'll send for the csc-scaler driver.
>=20
> See ipu_ic_calc_csc() , that's what does the colorspace conversion in=20
> this driver (on output from VDI).

int ipu_ic_calc_csc(struct ipu_ic_csc *csc,
                    enum v4l2_ycbcr_encoding in_enc,
                    enum v4l2_quantization in_quant,
                    enum ipu_color_space in_cs,
                    enum v4l2_ycbcr_encoding out_enc,
                    enum v4l2_quantization out_quant,
                    enum ipu_color_space out_cs)

So instead of simply overriding CSC like you do, let userspace set differen=
t CSC
in and out, so that IPU can handle the conversion properly with correct col=
ors.
That requires to flag these in the fmt_desc structure during enum format, a=
nd to
only read acknowledge the CSC if userspace have set V4L2_PIX_FMT_FLAG_SET_C=
SC,
in other condition, the information must be ignored (which you don't).

Nicolas
