Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D4F55BA27
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 15:54:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E87DD10E275;
	Mon, 27 Jun 2022 13:54:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [IPv6:2607:f8b0:4864:20::f2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A81B8112307
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 13:54:36 +0000 (UTC)
Received: by mail-qv1-xf2b.google.com with SMTP id cu16so14781062qvb.7
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 06:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :content-transfer-encoding:user-agent:mime-version;
 bh=+rT6LzOd0Ynn4L0BL114LxRE92j4qXXlsy4/5QmiSjk=;
 b=VyTjn5Ro348LXEPtw2w2syMtzdMPEZ6X7C/Fw4X9wyUUT3HPVakiQB8V2V197BUjFp
 PqUnOJH63MHHh5gWdb+uMnVyh8k1yPGBbnBaLlHgBlsFR8BbNniU01pw7FJckXFOf+51
 zJaaiL3NjdTjjTj0GlpzdHcxuGcQt8lvRNWa7dkDDRQGn8cLkOUc3dhyAvJq/foeMak2
 oe297m7nYPA+6+r2EUbtBfLXAhVBj3rLmL2tUc8gsu/fMp6mqbH5oJpcm47Q9+v717Jq
 82/NaHub6V3BEnXN2htMrunDsPSOGd5x+f4/OZ4aSlMRdkAwNzk5K3IJPVcnn5SYvsz8
 1j2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:content-transfer-encoding:user-agent:mime-version;
 bh=+rT6LzOd0Ynn4L0BL114LxRE92j4qXXlsy4/5QmiSjk=;
 b=r5Xc0yskPOxx3a79XCONioe4N2G/yLt0sgNFrTRYdGddHIgeXCSK5sxDnPLJWlm7Nl
 HvLySMYKgGJSEqejRxnDD4NsiNIfrV7ZHNl/tGIQCHF5/be6QRCfyPWEjNI0GhTt/bKq
 5lOY6Zsog6wGsLu+LSJ5FrdaoySQ9MlwV6LBL9qyKXCIGuR1h1fOmJiEm27gLJ9Fg4cJ
 F4hIEkpfSOk4/5OoF6/m0iE9wcS3jTIcmUV+pKVmJ0T82Dy/pchin4Vvh3AvtICVEzJ9
 2TNEHmSCR1YylqHwfyASL/uz6IqnrshD+vZEWN1IJJ/JVdt0QHQEAH+I2IVzATa1wwEY
 KTsA==
X-Gm-Message-State: AJIora/myFk/RVJYQsMpPCI61xzzURUPGimgjsHOPokgPiKiKJ6QcJxm
 t2icx0Xh40gJ+0qtQH4eeXifaA==
X-Google-Smtp-Source: AGRyM1u0PSq5wvrP+0gsBOTu5G7rYKCZmC5okHVqQiWH9j0V5hIV4K4cJ+oQ8PeKxOq7oGdESYJ8CQ==
X-Received: by 2002:a05:622a:1209:b0:305:2d22:3248 with SMTP id
 y9-20020a05622a120900b003052d223248mr9153550qtx.189.1656338075795; 
 Mon, 27 Jun 2022 06:54:35 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net.
 [192.222.136.102]) by smtp.gmail.com with ESMTPSA id
 t16-20020a37aa10000000b006a760640118sm8624036qke.27.2022.06.27.06.54.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 06:54:35 -0700 (PDT)
Message-ID: <0abe475a7b4b04758c03a9d19b228e86d95ac1dd.camel@ndufresne.ca>
Subject: Re: DMA-buf and uncached system memory
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Lucas Stach <l.stach@pengutronix.de>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Pekka Paalanen <ppaalanen@gmail.com>
Date: Mon, 27 Jun 2022 09:54:34 -0400
In-Reply-To: <95cca943bbfda6af07339fb8d2dc7f4da3aa0280.camel@pengutronix.de>
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
 <e691bccc-171d-f674-2817-13a945970f4a@amd.com>
 <95cca943bbfda6af07339fb8d2dc7f4da3aa0280.camel@pengutronix.de>
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

Le jeudi 23 juin 2022 =C3=A0 11:33 +0200, Lucas Stach a =C3=A9crit=C2=A0:
> >=20
> > See for example on AMD/Intel hardware most of the engines can perfectly=
=20
> > deal with cache coherent memory accesses. Only the display engines can'=
t.
> >=20
> > So on import time we can't even say if the access can be coherent and=
=20
> > snoop the CPU cache or not because we don't know how the imported=20
> > DMA-buf will be used later on.
> >=20
> So for those mixed use cases, wouldn't it help to have something
> similar to the dma_sync in the DMA-buf API, so your scanout usage can
> tell the exporter that it's going to do non-snoop access and any dirty
> cache lines must be cleaned? Signaling this to the exporter would allow
> to skip the cache maintenance if the buffer is in CPU uncached memory,
> which again is a default case for the ARM SoC world.

Telling the exporter for every scan is unneeded overhead. If that informati=
on is
made available "properly", then tracking it in attach/detach is sufficient =
and
lightweight.

Nicolas

