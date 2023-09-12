Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5F279D44F
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 17:05:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D340810E429;
	Tue, 12 Sep 2023 15:05:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A1F710E42E
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 15:05:42 +0000 (UTC)
Received: by mail-qk1-x736.google.com with SMTP id
 af79cd13be357-76f18e09716so336740485a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 08:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1694531141; x=1695135941;
 darn=lists.freedesktop.org; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=vM3oyGRFxtHxm1neHgA67Osk9iJA5NE4DNejEYZfvZ8=;
 b=ST3lkyUkAqNwljBnVdo6s3ra7jRZ18TYZ8G2nT4yDLnqY/XkJM7ZdxTQepdsqqkaut
 81bAHi6pB0A9kkc/pZYq69/y+FLczw2lutTDAVWe87T+3F1P3i4iq+b/ytr7jZpqZT4y
 kuDL6Gl458msuNkp8dFKo1vSegheN51QAV9JuyNQaBIaUbZLRgIOEqrqPIJx4Ck1PFmd
 Y/rsvBnp+vXr40R6Tb5PpYy9/2pX7e2tGHGdl76TUg7guyKABRusCW4PvE+oy/uAOkXP
 iN4FzpeXxI/AXoUHRX4dwUMmyFMTNSto9U2krqzLFRFGOIy3yRdQIsO16rdsHUUOH5gn
 tTjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694531141; x=1695135941;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vM3oyGRFxtHxm1neHgA67Osk9iJA5NE4DNejEYZfvZ8=;
 b=jTa8zHzvTwdHQ29AfN+wuFebQ3IdzdezqvqswFirkomO3M9pCckuEV1yXBAfVPa6uG
 igLMzhTh8T1jN/L2tw0eCh7g8D1v0fMExCZGQtiC1kfJ80E1ARsLmfpMj5MbH9NEb9HX
 k0XFXp2x4gb8R+cMxOV8P8QKBYWl/buKiD2BSGSoOVpdz1toEw6QKrh7gvGB5tVTmXhZ
 1LmIPuWVzgPgK72Q5drCq5QL4uJvATgj5j+IfU7MS7dndCD+YkfciwpZvkEdJQisLOHQ
 ESfbBZHoMMU/HMtIBTunpZ2/E1Stko4i8eLB4BaFnkB0LQFU5f9Nw/tIDxNJOCOCPMPt
 93fg==
X-Gm-Message-State: AOJu0YxNWsxzIWiGNeKM+/PKRm7djHJZ48gpHrAk28H6c1aeCDPM50x9
 9990ocUd72/1yEXLbgE+JqWrMQ==
X-Google-Smtp-Source: AGHT+IETEyxKiwuQg/hyiHZWR8ejsoB5rvNcCqFck37LlPZlL1+L6Aam0BaJ+MZGh5Xo6lDDiukNdA==
X-Received: by 2002:a05:620a:454c:b0:76c:aff9:9f27 with SMTP id
 u12-20020a05620a454c00b0076caff99f27mr17152733qkp.59.1694531136409; 
 Tue, 12 Sep 2023 08:05:36 -0700 (PDT)
Received: from nicolas-tpx395.localdomain ([2606:6d00:15:bae9::7a9])
 by smtp.gmail.com with ESMTPSA id
 s41-20020a05622a1aa900b004053bcffe49sm3380085qtc.9.2023.09.12.08.05.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Sep 2023 08:05:36 -0700 (PDT)
Message-ID: <d15067b12571f8868925aace9dc84473cd74ec1f.camel@ndufresne.ca>
Subject: Re: [PATCH 3/9] dma-heap: Provide accessors so that in-kernel
 drivers can allocate dmabufs from specific heaps
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Yong Wu =?UTF-8?Q?=28=E5=90=B4=E5=8B=87=29?= <Yong.Wu@mediatek.com>, 
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>, 
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "sumit.semwal@linaro.org"
 <sumit.semwal@linaro.org>
Date: Tue, 12 Sep 2023 11:05:35 -0400
In-Reply-To: <8e795311ff93c7a336eb688818f055c5c569741e.camel@mediatek.com>
References: <20230911023038.30649-1-yong.wu@mediatek.com>
 <20230911023038.30649-4-yong.wu@mediatek.com>
 <827b859e3ff8176ef0b18c29bc17481b4105e368.camel@ndufresne.ca>
 <8e795311ff93c7a336eb688818f055c5c569741e.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 Kuohong Wang =?UTF-8?Q?=28=E7=8E=8B=E5=9C=8B=E9=B4=BB=29?=
 <kuohong.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "tjmercier@google.com" <tjmercier@google.com>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "jstultz@google.com" <jstultz@google.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 Jianjiao Zeng =?UTF-8?Q?=28=E6=9B=BE=E5=81=A5=E5=A7=A3=29?=
 <Jianjiao.Zeng@mediatek.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le mardi 12 septembre 2023 =C3=A0 08:47 +0000, Yong Wu (=E5=90=B4=E5=8B=87)=
 a =C3=A9crit=C2=A0:
> On Mon, 2023-09-11 at 12:12 -0400, Nicolas Dufresne wrote:
> >  	=20
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >  Hi,
> >=20
> > Le lundi 11 septembre 2023 =C3=A0 10:30 +0800, Yong Wu a =C3=A9crit :
> > > From: John Stultz <jstultz@google.com>
> > >=20
> > > This allows drivers who don't want to create their own
> > > DMA-BUF exporter to be able to allocate DMA-BUFs directly
> > > from existing DMA-BUF Heaps.
> > >=20
> > > There is some concern that the premise of DMA-BUF heaps is
> > > that userland knows better about what type of heap memory
> > > is needed for a pipeline, so it would likely be best for
> > > drivers to import and fill DMA-BUFs allocated by userland
> > > instead of allocating one themselves, but this is still
> > > up for debate.
> >=20
> >=20
> > Would be nice for the reviewers to provide the information about the
> > user of
> > this new in-kernel API. I noticed it because I was CCed, but
> > strangely it didn't
> > make it to the mailing list yet and its not clear in the cover what
> > this is used
> > with.=20
> >=20
> > I can explain in my words though, my read is that this is used to
> > allocate both
> > user visible and driver internal memory segments in MTK VCODEC
> > driver.
> >=20
> > I'm somewhat concerned that DMABuf objects are used to abstract
> > secure memory
> > allocation from tee. For framebuffers that are going to be exported
> > and shared
> > its probably fair use, but it seems that internal shared memory and
> > codec
> > specific reference buffers also endup with a dmabuf fd (often called
> > a secure fd
> > in the v4l2 patchset) for data that is not being shared, and requires
> > a 1:1
> > mapping to a tee handle anyway. Is that the design we'd like to
> > follow ?=20
>=20
> Yes. basically this is right.
>=20
> > Can't
> > we directly allocate from the tee, adding needed helper to make this
> > as simple
> > as allocating from a HEAP ?
>=20
> If this happens, the memory will always be inside TEE. Here we create a
> new _CMA heap, it will cma_alloc/free dynamically. Reserve it before
> SVP start, and release to kernel after SVP done.

Ok, I see the benefit of having a common driver then. It would add to the
complexity, but having a driver for the tee allocator and v4l2/heaps would =
be
another option?

>  =20
> Secondly. the v4l2/drm has the mature driver control flow, like
> drm_gem_prime_import_dev that always use dma_buf ops. So we can use the
> current flow as much as possible without having to re-plan a flow in
> the TEE.

From what I've read from Yunfei series, this is only partially true for V4L=
2.
The vb2 queue MMAP feature have dmabuf exportation as optional, but its not=
 a
problem to always back it up with a dmabuf object. But for internal SHM buf=
fers
used for firmware communication, I've never seen any driver use a DMABuf.

Same applies for primary decode buffers when frame buffer compression or po=
st-
processing it used (or reconstruction buffer in encoders), these are not us=
er
visible and are usually not DMABuf.

>=20
> >=20
> > Nicolas
> >=20
> > >=20
> > > Signed-off-by: John Stultz <jstultz@google.com>
> > > Signed-off-by: T.J. Mercier <tjmercier@google.com>
> > > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > > [Yong: Fix the checkpatch alignment warning]
> > > ---
> > >  drivers/dma-buf/dma-heap.c | 60 ++++++++++++++++++++++++++++----
> > ------
> > >  include/linux/dma-heap.h   | 25 ++++++++++++++++
> > >  2 files changed, 69 insertions(+), 16 deletions(-)
> > >=20
> [snip]

