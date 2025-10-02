Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 878D5BB3EA2
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 14:40:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF8B410E7D9;
	Thu,  2 Oct 2025 12:40:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="P68Q+mw8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84C2210E7D9
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Oct 2025 12:40:38 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id
 af79cd13be357-85d5cd6fe9fso91970085a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Oct 2025 05:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1759408837; x=1760013637;
 darn=lists.freedesktop.org; 
 h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
 :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=9tG3CglHbeY/0AI4Rz2tx44tc/toPYUH7TVppo+t14c=;
 b=P68Q+mw8KV4hvPFjxGekAnNOA2i9YVEP+YHUo+Q8eEznpChqj05vXiuAD01o3nqLE1
 R9aA4Pqpxk1kgGJg7VLlRRRemJmalgXcL08Vz5pBePG0fzEgvIBN7mOOeibAUzeetrcX
 2Mw/wZVi/op2D8Hyj8depJr1MRCAI3BTx9+lrMzopyDUWkjPveX+sb9+AN8N9De+7cpV
 /KK2KcLckzUTE30vDsVYXkvExIe2rI8B2GHw0xLudiaStIRZB5rPU/vEYQeVo0oRM7mL
 UbiJx3LXsmk3sPGfjObEVE3M3itONAot/Fh5vVZ/MJH0UOZDIEOK+f7kQbwpXjNtCF4T
 D6VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759408837; x=1760013637;
 h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
 :subject:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9tG3CglHbeY/0AI4Rz2tx44tc/toPYUH7TVppo+t14c=;
 b=S84fISnxbyI5etoDueRTOKlzMwgjg0dmlx1pE165Km8SjRWdM35sK/r7/tAuT8W216
 jEy074Qw6opOHUTAytzv+5Wq93CLmgrcXdxnaVZtqkBIMzHFiyv79ruAnus16Lc4yZMo
 OJd405+O9i7UlcVu2IbFOJbwvUXHXBwZwQ+JMuGqhPUz5Rf/6JlbJJzHGao7lI+g1lfy
 WxUOl6o2YCYeQXyK2kg5j+D+xBgZswEV1jSPRv2O79blWozzE4t/Pfx2XWehX85ZC+o9
 Ml3w4sd1T0gFLREDBimq0zDYr+/TfDKbZWvA02wwA68Ud+drGarIxkZd+Qv/EIwgVoI+
 E+tQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUW7w1sVGspsboz68mwJRV1GArtVyaG5aUgt03gbKcuoF6x4tvF+bEQnCAIaKrHiJHASlJvKtHOtFc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywb6DEirYcvG7DTFLnSL7hQ8q9CrpBkphdO6LUEDspjMOsKIAll
 uPdLNnOGFEKmSPIP4BFGVl0AS/3Erqpk9ZTWVsBNNzD3RQ4twCmP4Ne+5ygvrbE/xDE=
X-Gm-Gg: ASbGnctCQxx7goTaMC5AZhV0LGUsJF/161uN9d7vLfx1JoDuTO01E1uHkYFHyTBEnq5
 y7LbpPStgwSU7kYqq6aqOUNo9zFdgaoxLMlonAyggIDs57+Nisr/tNx0BjIODUxcbVMfQdtH6tz
 JUtYjiUooEZ3tUengYl4JPS/xNydsJPOUr6g+UpodtSViXM+niHNtsXJkPz7b+4hE5PjkHa6Meh
 GsCMc2M9hXuWxq+RIQxFMS54anUzu0Wdz1+H7Dqzipv5Ibioij9PjF4jR91P+vg9+EP/gNwRv7n
 cx/0TAai4dSIx89hwPY1SseTHaElLQmRMWJMRoIynFoSLEXn96bbM4fVParUdWd2s0Gns8ixnRp
 /XrLtzpWLHN+SSZaqzmFLhDqxOuncZtyMYLCA+U96s7Vl8H4vQSZB3vqD6ggerFQ=
X-Google-Smtp-Source: AGHT+IHfFbRDc0lxQJHEnEb/USvJWquapfe/e1sD30gNrrrl/FzbGv+DojWArzyJNLJRhyT1vMSzeQ==
X-Received: by 2002:a05:620a:1a0c:b0:85e:5022:33b7 with SMTP id
 af79cd13be357-8737780ae60mr1022559585a.72.1759408837081; 
 Thu, 02 Oct 2025 05:40:37 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:ebd3::5ac? ([2606:6d00:17:ebd3::5ac])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-87771129fcdsm200898385a.13.2025.10.02.05.40.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Oct 2025 05:40:36 -0700 (PDT)
Message-ID: <9ca0e8b7b644637101f8bbc3f69cb71f20665f04.camel@ndufresne.ca>
Subject: Re: [PATCH v12 2/9] dma-buf: dma-heap: export declared functions
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Maxime Ripard <mripard@redhat.com>, Jens Wiklander
 <jens.wiklander@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
 Olivier Masse <olivier.masse@nxp.com>, Thierry Reding
 <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>,  Sumit Semwal
 <sumit.semwal@linaro.org>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Brian Starkey	 <Brian.Starkey@arm.com>,
 John Stultz <jstultz@google.com>, "T . J . Mercier"	
 <tjmercier@google.com>, Christian =?ISO-8859-1?Q?K=F6nig?=	
 <christian.koenig@amd.com>, Sumit Garg <sumit.garg@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com,
 Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone
 <daniel@fooishbar.org>, Rouven Czerwinski	 <rouven.czerwinski@linaro.org>,
 robin.murphy@arm.com, Sumit Garg	 <sumit.garg@oss.qualcomm.com>
Date: Thu, 02 Oct 2025 08:40:35 -0400
In-Reply-To: <20251002-shaggy-mastiff-of-elevation-c8e1f0@houat>
References: <20250911135007.1275833-1-jens.wiklander@linaro.org>
 <20250911135007.1275833-3-jens.wiklander@linaro.org>
 <20251002-shaggy-mastiff-of-elevation-c8e1f0@houat>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-45N4bvp/oD9a6lFdlKUD"
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
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


--=-45N4bvp/oD9a6lFdlKUD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 02 octobre 2025 =C3=A0 09:47 +0200, Maxime Ripard a =C3=A9crit=C2=
=A0:
> Hi,
>=20
> On Thu, Sep 11, 2025 at 03:49:43PM +0200, Jens Wiklander wrote:
> > Export the dma-buf heap functions to allow them to be used by the OP-TE=
E
> > driver. The OP-TEE driver wants to register and manage specific secure
> > DMA heaps with it.
> >=20
> > Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > Reviewed-by: T.J. Mercier <tjmercier@google.com>
> > Acked-by: Sumit Semwal <sumit.semwal@linaro.org>
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> > =C2=A0drivers/dma-buf/dma-heap.c | 4 ++++
> > =C2=A01 file changed, 4 insertions(+)
> >=20
> > diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> > index 3cbe87d4a464..8ab49924f8b7 100644
> > --- a/drivers/dma-buf/dma-heap.c
> > +++ b/drivers/dma-buf/dma-heap.c
> > @@ -11,6 +11,7 @@
> > =C2=A0#include <linux/dma-buf.h>
> > =C2=A0#include <linux/dma-heap.h>
> > =C2=A0#include <linux/err.h>
> > +#include <linux/export.h>
> > =C2=A0#include <linux/list.h>
> > =C2=A0#include <linux/nospec.h>
> > =C2=A0#include <linux/syscalls.h>
> > @@ -202,6 +203,7 @@ void *dma_heap_get_drvdata(struct dma_heap *heap)
> > =C2=A0{
> > =C2=A0	return heap->priv;
> > =C2=A0}
> > +EXPORT_SYMBOL_NS_GPL(dma_heap_get_drvdata, "DMA_BUF_HEAP");
> > =C2=A0
> > =C2=A0/**
> > =C2=A0 * dma_heap_get_name - get heap name
> > @@ -214,6 +216,7 @@ const char *dma_heap_get_name(struct dma_heap *heap=
)
> > =C2=A0{
> > =C2=A0	return heap->name;
> > =C2=A0}
> > +EXPORT_SYMBOL_NS_GPL(dma_heap_get_name, "DMA_BUF_HEAP");
> > =C2=A0
> > =C2=A0/**
> > =C2=A0 * dma_heap_add - adds a heap to dmabuf heaps
> > @@ -303,6 +306,7 @@ struct dma_heap *dma_heap_add(const struct
> > dma_heap_export_info *exp_info)
> > =C2=A0	kfree(heap);
> > =C2=A0	return err_ret;
> > =C2=A0}
> > +EXPORT_SYMBOL_NS_GPL(dma_heap_add, "DMA_BUF_HEAP");
>=20
> It's not clear to me why we would need to export those symbols.
>=20
> As far as I know, heaps cannot be removed, and compiling them as module
> means that we would be able to remove them.
>=20
> Now, if we don't expect the users to be compiled as modules, then we
> don't need to export these symbols at all.

Maybe I'm getting out of topic, sorry if its the case, but making that a ha=
rd
rule seems very limiting. Didn't we said that a heap driver could be made t=
o
represent memory region on a remote device such as an eGPU ?

Nicolas

>=20
> Am I missing something?
>=20
> Maxime

--=-45N4bvp/oD9a6lFdlKUD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaN5ywwAKCRDZQZRRKWBy
9KyVAP0e+zNS/qwzQzV67XRNZS/HR4iYLotJyohgk+o985wA0gD/cUs7EW6a2cas
LUv2nPsRzhxVleDso0vC+2RD1vBV7wE=
=kgiD
-----END PGP SIGNATURE-----

--=-45N4bvp/oD9a6lFdlKUD--
