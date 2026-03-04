Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id fRM3MUTmp2mDlgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 08:59:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 205231FC136
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 08:58:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F4B310E12B;
	Wed,  4 Mar 2026 07:58:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="VW0X/hp4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C59CA10E12B
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 07:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772611135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wcqpRt8jvMP8XWtSPkO4bteIZfJG5tmplM3Y6kGZdoo=;
 b=VW0X/hp4O1IQo+Lv3+QFu2uH75QK0Ag2xrWlbtJRpOEknfg2vibGbb3Lb+qcEbPOBbtPXI
 MS6bgpIqBeai4zzshIsP5diS0Hhe/bPbrBr5bykJpj6zP5UZoQMuXGdHPKk5hAlqXEOaJW
 IK2yfCXgJ4JY+eYSGSoDRsRTZ8XCboU=
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com
 [74.125.224.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-425-2beBh7BqPWSguP6nbpR7wA-1; Wed, 04 Mar 2026 02:58:54 -0500
X-MC-Unique: 2beBh7BqPWSguP6nbpR7wA-1
X-Mimecast-MFC-AGG-ID: 2beBh7BqPWSguP6nbpR7wA_1772611134
Received: by mail-yx1-f72.google.com with SMTP id
 956f58d0204a3-64ca6895833so8865559d50.2
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 23:58:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772611134; x=1773215934;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wcqpRt8jvMP8XWtSPkO4bteIZfJG5tmplM3Y6kGZdoo=;
 b=oFAG8BuhuRO9UXj/PwWbJ7kxZ6P4SmrZZGi/JBa0SJ5P4JxHqT4gvf23MBdgOmDFwg
 g0Q+Fw8NJlu81muKg+h9GCqiGc8hIlgySZLdhWNE+JfkHkCpomNMa281Sqj0GqwTcgHG
 xLzJGb2F87+KCeNT3uQHOahUdB8ENIDlKIqAzOVlxCmhh96oybtRfirXC8GLl8n7VrCv
 OD0QOCh3fNXkgG//VRR3Yb94jP1i8Gy/q8ePSNcZmCLuwLfuPljcJxSNpEAiVFmTEIRI
 J7abNXJzNAQKL4B5VLGFhId2+WuFyLwbBYz4XWKqP4SXCfXsy+c7cFGANW9ke/pmA2m+
 bmdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBYMEH2Bgys7/Lwdr8VmUAMsbV0kCWCF5ovt+gStmVnhEmCbaQabiafRX+v/ok5WW9wJEWuwQJ95s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwvCa++Eokyg/hQE9QN5kdDcHMy05pQfNttdI30w93nElUv5+xM
 rCqHAQ+Ir2zSOXI4t1Sy3qnuWBB9aevIhGZhLXYbuoCUvwHr951z8ITN3DkjJgRIP+/c1Pg/zcf
 dsV8pGASRBRucDu3Hd08rs5VUSC9AI1BZZOVmlrui07MUbiDbbCPW3XtNuQuHS1w4Gg5fhMa7uQ
 oi+iQUMs4z41czrVuULoFtF1iayNXxHDi+zR2IgY4Dkm/r
X-Gm-Gg: ATEYQzwkvW3xzDFWu7KFX5DqDDJ+kvOxpAJiOhRCiI7cCZTK5blA0OG0/3CybMA5RKG
 rqmgZAenT24hJnH8Dl9gNWtwImR0UAdUtuAA3ozXc7uftaUp4cXXEUxDzbR4gTRzj9oZY8LbxUB
 7NFDxaXPwRc4YhU9IexXy1cungq0719bGG0UzZgrqmUFZ35nnncHHNzGEntXsVwNzVAn5ML1//p
 A==
X-Received: by 2002:a53:ee53:0:b0:649:b04c:25c3 with SMTP id
 956f58d0204a3-64cf9c1872amr761652d50.62.1772611134093; 
 Tue, 03 Mar 2026 23:58:54 -0800 (PST)
X-Received: by 2002:a53:ee53:0:b0:649:b04c:25c3 with SMTP id
 956f58d0204a3-64cf9c1872amr761636d50.62.1772611133749; Tue, 03 Mar 2026
 23:58:53 -0800 (PST)
MIME-Version: 1.0
References: <20260303-b4-dmabuf-heap-coherent-rmem-v2-0-65a4653b3378@redhat.com>
 <20260303-b4-dmabuf-heap-coherent-rmem-v2-3-65a4653b3378@redhat.com>
 <20260303-weightless-crafty-hyrax-bdf1ca@houat>
In-Reply-To: <20260303-weightless-crafty-hyrax-bdf1ca@houat>
From: Albert Esteve <aesteve@redhat.com>
Date: Wed, 4 Mar 2026 08:58:42 +0100
X-Gm-Features: AaiRm50vjbd8iZF9aZq1Cno_RqIuyn0PYTIuzz9Iq5d5rpEaa4iOCaZKKjWryT4
Message-ID: <CADSE00LodeTg8Xfvo4VOZDvHh25=8+Jsqq+V8iynmpYx2bBRjA@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] of_reserved_mem: add a helper for rmem device_init
 op
To: Maxime Ripard <mripard@redhat.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, 
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
 linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, echanude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZuFUJCEj7BC4cVcDblrsGh29HReJj1yGsUKv0fxCtPE_1772611134
X-Mimecast-Originator: redhat.com
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
X-Rspamd-Queue-Id: 205231FC136
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[18];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:mripard@redhat.com,m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:tjmercier@google.com,m:christian.koenig@amd.com,m:m.szyprowski@samsung.com,m:robin.murphy@arm.com,m:robh@kernel.org,m:saravanak@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:echanude@redhat.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[aesteve@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[aesteve@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Tue, Mar 3, 2026 at 2:13=E2=80=AFPM Maxime Ripard <mripard@redhat.com> w=
rote:
>
> On Tue, Mar 03, 2026 at 01:33:46PM +0100, Albert Esteve wrote:
> > Add a helper function wrapping internal reserved memory
> > device_init call and expose it externally.
> >
> > Use the new helper function within of_reserved_mem_device_init_by_idx()=
.
> >
> > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > ---
> >  drivers/of/of_reserved_mem.c    | 27 +++++++++++++++++++++++----
> >  include/linux/of_reserved_mem.h |  8 ++++++++
> >  2 files changed, 31 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.=
c
> > index 1fd28f8056108..3a350bef8f11e 100644
> > --- a/drivers/of/of_reserved_mem.c
> > +++ b/drivers/of/of_reserved_mem.c
> > @@ -605,6 +605,28 @@ struct rmem_assigned_device {
> >  static LIST_HEAD(of_rmem_assigned_device_list);
> >  static DEFINE_MUTEX(of_rmem_assigned_device_mutex);
> >
> > +/**
> > + * of_reserved_mem_device_init_with_mem() - assign reserved memory reg=
ion to
> > + *                                       given device
> > + * @dev:     Pointer to the device to configure
> > + * @rmem:    Reserved memory region to assign
> > + *
> > + * This function assigns respective DMA-mapping operations based on th=
e
> > + * reserved memory region already provided in @rmem to the @dev device=
,
> > + * without walking DT nodes.
> > + *
> > + * Returns error code or zero on success.
> > + */
> > +int of_reserved_mem_device_init_with_mem(struct device *dev,
> > +                                      struct reserved_mem *rmem)
> > +{
> > +     if (!dev || !rmem || !rmem->ops || !rmem->ops->device_init)
> > +             return -EINVAL;
> > +
> > +     return rmem->ops->device_init(rmem, dev);
> > +}
> > +EXPORT_SYMBOL_GPL(of_reserved_mem_device_init_with_mem);
> > +
> >  /**
> >   * of_reserved_mem_device_init_by_idx() - assign reserved memory regio=
n to
> >   *                                     given device
> > @@ -643,14 +665,11 @@ int of_reserved_mem_device_init_by_idx(struct dev=
ice *dev,
> >       rmem =3D of_reserved_mem_lookup(target);
> >       of_node_put(target);
> >
> > -     if (!rmem || !rmem->ops || !rmem->ops->device_init)
> > -             return -EINVAL;
> > -
> >       rd =3D kmalloc_obj(struct rmem_assigned_device);
> >       if (!rd)
> >               return -ENOMEM;
> >
> > -     ret =3D rmem->ops->device_init(rmem, dev);
> > +     ret =3D of_reserved_mem_device_init_with_mem(dev, rmem);
> >       if (ret =3D=3D 0) {
> >               rd->dev =3D dev;
> >               rd->rmem =3D rmem;
>
> I think you need to take the allocation of rd, and everything below.
> Otherwise, your device, despite being attechd, wouldn't be listed
> anywhere.

True, I did not pay enough attention to that part. I will fix it in
the next version.

>
> Maxime

