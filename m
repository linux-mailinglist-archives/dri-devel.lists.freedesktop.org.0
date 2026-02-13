Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFAnOpqgj2kuSAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 23:07:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54169139B79
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 23:07:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08A3810E333;
	Fri, 13 Feb 2026 22:07:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="rUAKvq3X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B260010E83D
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 22:07:17 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-b8fbb24a9a9so119481066b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 14:07:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771020436; cv=none;
 d=google.com; s=arc-20240605;
 b=W+sR0Rkg2k/f+tLtfeODDERPk4Nn1i36y6vKr3EwwTk2R2ZoA1EoqJuq9awiYXj0hK
 4EqVMlIruXVtlKeQNbM9a/Rq2b0f/HBuPuwlzioampMzO0FpnDK5rQh0xSnzfU5Zt9uj
 3T+sCLbaanoOfYg6R9biFNmdIdnUDIrqA+o1HSyN+kW00NRDdiL5ZgqHz2R1AEQEaCb3
 wCoSQlUB8bWi1S23kMXp+9yki07X60x9p5PoGbuiBVxX1OxthSBfzOZVDkKdEsWZ/tor
 GT1ymg3MDTsy4tYTLVcCz/X72+pEEqlE7H5jxqehAzxgV6ETs5+r1vGbCoOXM02V762Y
 PWiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=DL8wMAc57bqbNTeHsP9udij3SwqaDpC6X44tvY86qXU=;
 fh=Kab63+4QoZFnOKUXFZX4GSV3XOEzMYGLrlgWaQj9o4U=;
 b=ej7+map9dYhvAlkKK7CFd82IOMlUEYv4xos7hD4R9ybgu8bKgFKolEDc1Z/X+nzcMU
 K5V5xBiFlXshY1K26L2s/T0k3gPkHWooOjN7iK+2liKqA/Z2dbp7/mq/4kv/cn7TEO4j
 heWmATXt1QlFG6nDxNY6h5PPOTOM7pMLj63gYz/cTVb4R/+47ZYZyHN3sO8kTXehgKrW
 d16A9qUIRQNBQLm43Oicq0N/nw3pjm55rbUFWxEEuAM468oLuZnmw6ILRUQ/36OrOb0i
 IDB6rYIH7RU1pfBPJi0iwLZoU+M0Az/IPr7XCC9Xoa1p4wumA5yiB+7yTcS69PSPHiUM
 gNrA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1771020436;
 x=1771625236; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DL8wMAc57bqbNTeHsP9udij3SwqaDpC6X44tvY86qXU=;
 b=rUAKvq3XOkQSX73uDmgAT4VVhIgHrUHFGR9vYTiFwWpuFd+7N+O+Zt2Mk6JgOAO2Ic
 FUNXNQeOpyqhx6eLtp7jXDJgFfWv0jXHfUfWB5pNZ2zlDAEsWBdCsowHdWLAd82RNnDM
 txIdk96gHpWK/dJJY/kQ7xunLMO3dXpzIZ1GzY4BFeRkNXFZ7pz89hAstiA8ox344dil
 IEgZ+Tn1vCaBFJ9MkXRSmWnMQXvbE+tFSTBTb+mBvaomCczIJT0u8Fp2ALVV4BDvm8g1
 0cLX2+ETNohocIOhZMB5K4aU2QjDHxKR3hZ+gJ306Q4w9PXn2LK0leLuuwlm4Cm7Txrb
 gMqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771020436; x=1771625236;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=DL8wMAc57bqbNTeHsP9udij3SwqaDpC6X44tvY86qXU=;
 b=rICcKDaCDK2919kY2nkwXwYtbKQHWXUnMTCz0KzpElo6EqAa3GKlzqxZnR3RQMfd2Y
 MjjDgCDCZS1Pl264XoEGc1cUxqY5FIBJ8WVUWuf3YpemdtIHRcAHDucIs1BIlfRgs/bu
 dmRLMOlJFeQetYk4CNe6icyjw4Sv3BLIy1O8ZLfCKuCYT7Wt7wAwNwFkqF2lzKOTPFfQ
 5SQMjM1Dictb5OafGb8mA9cVdsvgYEuZFV9PGyyh8HjBxpDlAsMeHxbAwbBkt7UHWoEe
 UY6VhutDCITMiGQvls47krolEPeinNCNvwWG5BIzay8w1RFu5oBIKgdKwLhaJch77OM2
 QuHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW99nzQOTA1Z5BujA+ZQpC3asazJYvn602YUO/dZXTdTEnCqczlo2H9zjYsfEvinv/4eYVO7vbxrig=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKqRsFhxoqLSPXrS+XiOuZz8VKxDXcUW5m+o5YDFiGijpukNKC
 ECbJs16bFIrde37U3c2LofLSlN0zIylXZjb66hvhLMhdUyHsFYwPLz27ME8Ho/TZ8QF6ikbXUm6
 FIuzPjuW70u3mXY9pF11O14OMvfPSgI7VTNMLudTkMQ==
X-Gm-Gg: AZuq6aLaDrlNw61/1is9Mji4xUTS6Xznh05f4ecf4Hs4AfAQp3eBkp32Q9qKqeEIUA9
 8AX5wAO17jR2HjKGXDCL3HK8tfcoVw5EklxxhVHhdx37aGXwoksYdyAKWMG26i0nKrcqy4FoihQ
 XmUc1QQf61DwPd0teU2s6HAE3Fi5PKuTqr5umiUgV2kzC0yImwJB3n+w7O3awbFZm+xn3qY++ks
 t33DyT0Gqgj5u3LODGCGXYwGA9YkvkMnLWaU/KILKlkAfFU9OvIzgFMstC91Sfii4dQ77fNbGtd
 cPnYYVeTsvpKJqQ=
X-Received: by 2002:a17:906:99c4:b0:b8e:7e21:133e with SMTP id
 a640c23a62f3a-b8fc06ad554mr99933666b.27.1771020435404; Fri, 13 Feb 2026
 14:07:15 -0800 (PST)
MIME-Version: 1.0
References: <20260205-zcull3-v2-0-ac572f38cc7b@darkrefraction.com>
 <20260205-zcull3-v2-2-ac572f38cc7b@darkrefraction.com>
 <DGE03Z9YNGAW.3RUQ7P7L93HEE@kernel.org>
In-Reply-To: <DGE03Z9YNGAW.3RUQ7P7L93HEE@kernel.org>
From: M Henning <mhenning@darkrefraction.com>
Date: Fri, 13 Feb 2026 17:06:49 -0500
X-Gm-Features: AZwV_QhA2ln9EmOt7c3z3p115W1c-p7mbF6XQu3-8Fn76SQW3316QUd_reHz9b0
Message-ID: <CAAgWFh0FGMvvryFPQObyeNqFFkv2hS8NRpVFeQPEvxRSk174=Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/nouveau: Add DRM_IOCTL_NOUVEAU_GET_ZCULL_INFO
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[darkrefraction-com.20230601.gappssmtp.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	DMARC_NA(0.00)[darkrefraction.com];
	FORGED_RECIPIENTS(0.00)[m:dakr@kernel.org,m:lyude@redhat.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:mary@mary.zone,m:nouveau@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mhenning@darkrefraction.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,mary.zone,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mhenning@darkrefraction.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[darkrefraction-com.20230601.gappssmtp.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,darkrefraction-com.20230601.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: 54169139B79
X-Rspamd-Action: no action

On Fri, Feb 13, 2026 at 12:14=E2=80=AFPM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> On Thu Feb 5, 2026 at 7:56 PM CET, Mel Henning wrote:
> > +int
> > +nouveau_abi16_ioctl_get_zcull_info(ABI16_IOCTL_ARGS)
> > +{
> > +     struct nouveau_drm *drm =3D nouveau_drm(dev);
> > +     struct nvkm_gr *gr =3D nvxx_gr(drm);
> > +     struct drm_nouveau_get_zcull_info *out =3D data;
> > +
> > +     if (gr->has_zcull_info) {
> > +             const struct nvkm_gr_zcull_info *i =3D &gr->zcull_info;
> > +
> > +             out->width_align_pixels =3D i->width_align_pixels;
> > +             out->height_align_pixels =3D i->height_align_pixels;
> > +             out->pixel_squares_by_aliquots =3D i->pixel_squares_by_al=
iquots;
> > +             out->aliquot_total =3D i->aliquot_total;
> > +             out->zcull_region_byte_multiplier =3D i->zcull_region_byt=
e_multiplier;
> > +             out->zcull_region_header_size =3D i->zcull_region_header_=
size;
> > +             out->zcull_subregion_header_size =3D i->zcull_subregion_h=
eader_size;
> > +             out->subregion_count =3D i->subregion_count;
> > +             out->subregion_width_align_pixels =3D i->subregion_width_=
align_pixels;
> > +             out->subregion_height_align_pixels =3D i->subregion_heigh=
t_align_pixels;
> > +             out->ctxsw_size =3D i->ctxsw_size;
> > +             out->ctxsw_align =3D i->ctxsw_align;
> > +
> > +             return 0;
> > +     } else {
> > +             return -ENODEV;
>
> ENODEV usually means that that device fell off the bus, I think ENOTTY wo=
uld be
> a better fit.

Done.

> > +     }
> > +}
