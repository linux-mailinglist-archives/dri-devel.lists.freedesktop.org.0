Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B7255BA21
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 15:51:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 286DB1136EE;
	Mon, 27 Jun 2022 13:51:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com
 [IPv6:2607:f8b0:4864:20::f2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7D611136EE
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 13:51:27 +0000 (UTC)
Received: by mail-qv1-xf2e.google.com with SMTP id 89so14865033qvc.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 06:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :content-transfer-encoding:user-agent:mime-version;
 bh=IO/5LQDipzPqsfiPf2oKew6mU+NIadwTqMByhggPg0I=;
 b=GOyk+HaLucKVVNkgp6ddt+d56vzd0A8t7G4KOm1AbUEU5/BeYVRzygTy8xCIa+lNPf
 Si1v7SHohI30eBXdgPyC7mZJixMFZ35tJljXaSgkh0Li26Q+p0JAIButdSaunBS85MXd
 WXo6/Mf1UKxdoyn+uUXME6FEzJ7YFXrx6o2LDBi9QFHEZtTbCLtan2urHYd2GWdvzte5
 3V0ii1UopvsZFN2VxRhYSgOy6FU3B7szGbIf0CymZAbD0Ba5wzZmNVE7nN1mxUBGPJ2n
 duSOw6JuHYdOLa2znVpddX5BlAaBgG0AbhYMuNzwZXU/IS2NZvQlGSPIK6kyuB6VzIBx
 PFKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:content-transfer-encoding:user-agent:mime-version;
 bh=IO/5LQDipzPqsfiPf2oKew6mU+NIadwTqMByhggPg0I=;
 b=4CQtCODRWaiIEf85xGtXjQgXXkrY17iYBVShNVh2I7BzZo9TdpBqSGwI+gmjob7bBJ
 i4cfdYKUdrLAuzXMXNcw26cj5RGmCnlAxFgUE6wm0EtKXVAWhvxgN1sq4RD/2a1RLCPp
 WLhAFHgrCoNusZaK8cV8jFQXHpI4LzKrJhLTSTvKejceguAU2AtUEFB/aNC8+zJoG8MG
 +nw4nIHeIPdhxoDb8a1DZQI8ctraDUbpma9izDJ5J0Meuqap04dKqlbBBNEnEQIohl2L
 wXIgctP/D9Mg3lmUSoccfyPVRYcXvKJ1pTMMJBzBpPjwocokY8iLuJ6xy5mpq6zcr2S5
 CKog==
X-Gm-Message-State: AJIora8U++73pAtj/0PGtsyUPGEO2I/mCsKQpnGtANaFWunJ5b3ChQiq
 w7D6qOGxzh7IbQ9UPWY8M77GMg==
X-Google-Smtp-Source: AGRyM1uwTUgcdBTwPIHf6SCg4Il6IWSeM4ajg7IuHzzyn8HZDcP+XrUxKuXlZI8HzHEN016LOLSDHA==
X-Received: by 2002:a05:622a:5985:b0:31b:899:3093 with SMTP id
 gb5-20020a05622a598500b0031b08993093mr2059921qtb.616.1656337886689; 
 Mon, 27 Jun 2022 06:51:26 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net.
 [192.222.136.102]) by smtp.gmail.com with ESMTPSA id
 s24-20020ac85ed8000000b00317c519be8bsm6996967qtx.66.2022.06.27.06.51.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 06:51:26 -0700 (PDT)
Message-ID: <36eef859d63640b4456360e17383635644703e3d.camel@ndufresne.ca>
Subject: Re: DMA-buf and uncached system memory
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Lucas Stach <l.stach@pengutronix.de>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Pekka Paalanen <ppaalanen@gmail.com>
Date: Mon, 27 Jun 2022 09:51:24 -0400
In-Reply-To: <fbb228cd78e9bebd7e7921c19e0c4c09d0891f23.camel@pengutronix.de>
References: <91ff0bbb-ea3a-2663-3453-dea96ccd6dd8@amd.com>
 <YCuPhOT4GhY3RR/6@phenom.ffwll.local>
 <9178e19f5c0e141772b61b759abaa0d176f902b6.camel@ndufresne.ca>
 <CAPj87rPYQNkgVEdHECQcHcYe2nCpgF3RYQKk_=wwhvJSxwHXCg@mail.gmail.com>
 <c6e65ee1-531e-d72c-a6a6-da7149e34f18@amd.com>
 <20220623101326.18beeab3@eldfell>
 <954d0a9b-29ef-52ef-f6ca-22d7e6aa3f4d@amd.com>
 <4b69f9f542d6efde2190b73c87096e87fa24d8ef.camel@pengutronix.de>
 <adc626ec-ff5a-5c06-44ce-09111be450cd@amd.com>
 <fbb228cd78e9bebd7e7921c19e0c4c09d0891f23.camel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.2 (3.44.2-1.fc36) 
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
Cc: "Sharma, Shashank" <Shashank.Sharma@amd.com>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linaro-mm-sig@lists.linaro.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Le jeudi 23 juin 2022 =C3=A0 10:58 +0200, Lucas Stach a =C3=A9crit=C2=A0:
> > > In the DMA API keeping things mapped is also a valid use-case, but th=
en
> > > you need to do explicit domain transfers via the dma_sync_* family,
> > > which DMA-buf has not inherited. Again those sync are no-ops on cache
> > > coherent architectures, but do any necessary cache maintenance on non
> > > coherent arches.
> >=20
> > Correct, yes. Coherency is mandatory for DMA-buf, you can't use=20
> > dma_sync_* on it when you are the importer.
> >=20
> > The exporter could of course make use of that because he is the owner o=
f=20
> > the buffer.
>=20
> In the example given here with UVC video, you don't know that the
> buffer will be exported and needs to be coherent without
> synchronization points, due to the mapping cache at the DRM side. So
> V4L2 naturally allocates the buffers from CPU cached memory. If the
> expectation is that those buffers are device coherent without relying
> on the map/unmap_attachment calls, then V4L2 needs to always
> synchronize caches on DQBUF when the=C2=A0 buffer is allocated from CPU
> cached memory and a single DMA-buf attachment exists. And while writing
> this I realize that this is probably exactly what V4L2 should do...

I'm not sure we are making any progress here. Doing so will just regress
performance of coherent devices used to render UVC video feeds. In fact, th=
ey
are all coherent except the display controller (on Intel). What my colleagu=
e was
suggesting me to try (with the expectation that some adaptation will be nee=
ded,
perhaps new signalling flags), is to read the dma_coherency_mask values on =
the
devices that calls attach() and adapt v4l2 exporter accordingly.

Its likely wrong as-is, not intended to be used for that, but the value is =
that
it tries to fix the problem, unlike what I'm reading here.

Nicolas

