Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE46379D42A
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 16:58:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C576A10E42A;
	Tue, 12 Sep 2023 14:58:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39A5C10E42A
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 14:58:48 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id
 af79cd13be357-76ef653af2eso352048685a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 07:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1694530727; x=1695135527;
 darn=lists.freedesktop.org; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Eoo29MeQUAIUv6tGjm0mF+Jl3ogymeV13KAAfraCdL0=;
 b=P63Ig1aK6u7IXXPbS6IFYhmGFaSmYJhlVmlgVxl6l6NzNr8oGGfap0SkFIfyqGxDYI
 h7Rmn/GvJF7pXSOJwgTN0yY9KFCOuQ/i1D0HTfNwHGlof7B1gcwV8rounx7E5nxlTR98
 BGx6tjp8/8lQ4bK7647mW8WHftjNJ3QzF8on19OC+m5jL5XvYCj6PPVxP1v8nh7DqE+8
 4Nh3zT+d+qALvfn15tfqMyf+wPPe7r9EgL87suysG2qTHa+8OU93odKTLtjYJX2Qxf13
 wG4C+mzgS2UzbCPv3HgFZw7X5rkT6UFTprUG2ObsUTDjnyDYwt1gCV8ebcZBEWhcxluE
 OGXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694530727; x=1695135527;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Eoo29MeQUAIUv6tGjm0mF+Jl3ogymeV13KAAfraCdL0=;
 b=Zk/Q24TMyRVwLFO20L4paYQlHFHPfBYMrtR08aSMn5VfsDc1VvkiaDhNPgtsUCRYZW
 CtDvK6AWBNtrwjcFjNqRoSwio20p/UOtYPYX+hpf+oAwqY4ZCjnnaFsyPaGKy4elvJKY
 DFqb+FQ1Uif31puEsk9cE9dQi9k3rbxWAtQWxYjdgF5ARRIIpr6ssmd0glTsBHzl+G3q
 2ROfCCZVbG8/D+17MQQxut/VEIp2WP8uRbOvimy2mSIS51cYFr40GEwkcwVlI+QhmQjN
 Vk8wYVH7pqdcngM+GZt0OP2MqUGAL7T36n9XrtFvsK/kpoZEKUJ+SE4ixOLC54+V7mTV
 joHQ==
X-Gm-Message-State: AOJu0YxYZDTc2zsPeLJrq4JaX9hDgoRVcDFcl0EXLJJVeHI4YeV/nl/Z
 IU7BGYHxoZvB2OI8274Bh1x+rA==
X-Google-Smtp-Source: AGHT+IGyVl5EhWb4dmDbUhd1ETJuzzG2tL8uNGiJBeQ5lfOHSv0Ap/ccPuu267/edyULKyU0FY0O+A==
X-Received: by 2002:a05:620a:408a:b0:768:4206:fc8d with SMTP id
 f10-20020a05620a408a00b007684206fc8dmr17108475qko.50.1694530727023; 
 Tue, 12 Sep 2023 07:58:47 -0700 (PDT)
Received: from nicolas-tpx395.localdomain ([2606:6d00:15:bae9::7a9])
 by smtp.gmail.com with ESMTPSA id
 m12-20020ae9e70c000000b0076c60b95b87sm3208422qka.96.2023.09.12.07.58.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Sep 2023 07:58:46 -0700 (PDT)
Message-ID: <8140975aa1f5c3cbdfa2e6f42aecebe3701f29da.camel@ndufresne.ca>
Subject: Re: [PATCH 3/9] dma-heap: Provide accessors so that in-kernel
 drivers can allocate dmabufs from specific heaps
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 Yong Wu =?UTF-8?Q?=28=E5=90=B4=E5=8B=87=29?=
 <Yong.Wu@mediatek.com>, "jstultz@google.com" <jstultz@google.com>
Date: Tue, 12 Sep 2023 10:58:45 -0400
In-Reply-To: <95797f3d-65bf-1bd9-9e19-6de42605cfe3@gmail.com>
References: <20230911023038.30649-1-yong.wu@mediatek.com>
 <20230911023038.30649-4-yong.wu@mediatek.com>
 <803846bc-fd1d-d2ec-2855-456af22c82f8@amd.com>
 <CANDhNCrQyiFZ+8DnG0iyKBXC0H1698K1a9d2AxOq4whDsZBn+Q@mail.gmail.com>
 <23e71d1f-08c1-3834-5b1f-2b5714c7bfaa@gmail.com>
 <255ae6b9ac1b6bea9262069747824b8461475e70.camel@mediatek.com>
 <95797f3d-65bf-1bd9-9e19-6de42605cfe3@gmail.com>
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
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "tjmercier@google.com" <tjmercier@google.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 Jianjiao Zeng =?UTF-8?Q?=28=E6=9B=BE=E5=81=A5=E5=A7=A3=29?=
 <Jianjiao.Zeng@mediatek.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le mardi 12 septembre 2023 =C3=A0 16:46 +0200, Christian K=C3=B6nig a =C3=
=A9crit=C2=A0:
> Am 12.09.23 um 10:52 schrieb Yong Wu (=E5=90=B4=E5=8B=87):
> > [SNIP]
> > > But what we should try to avoid is that newly merged drivers provide
> > > both a driver specific UAPI and DMA-heaps. The justification that
> > > this
> > > makes it easier to transit userspace to the new UAPI doesn't really
> > > count.
> > >=20
> > > That would be adding UAPI already with a plan to deprecate it and
> > > that
> > > is most likely not helpful considering that UAPI must be supported
> > > forever as soon as it is upstream.
> > Sorry, I didn't understand this. I think we have not change the UAPI.
> > Which code are you referring to?
>=20
> Well, what do you need this for if not a new UAPI?
>=20
> My assumption here is that you need to export the DMA-heap allocation=20
> function so that you can server an UAPI in your new driver. Or what else=
=20
> is that good for?
>=20
> As far as I understand you try to upstream your new vcodec driver. So=20
> while this change here seems to be a good idea to clean up existing=20
> drivers it doesn't look like a good idea for a newly created driver.

MTK VCODEC has been upstream for quite some time now. The other patchset is
trying to add secure decoding/encoding support to that existing upstream dr=
iver.

Regarding the uAPI, it seems that this addition to dmabuf heap internal API=
 is
exactly the opposite. By making heaps available to drivers, modification to=
 the
V4L2 uAPI is being reduced to adding "SECURE_MODE" + "SECURE_HEAP_ID" contr=
ols
(this is not debated yet has an approach). The heaps is being used internal=
ly in
replacement to every allocation, user visible or not.

Nicolas

>=20
> Regards,
> Christian.
>=20
> > > > So I think this patch is a little confusing in this series, as I
> > > don't
> > > > see much of it actually being used here (though forgive me if I'm
> > > > missing it).
> > > >=20
> > > > Instead, It seems it get used in a separate patch series here:
> > > >    =20
> > > https://lore.kernel.org/all/20230911125936.10648-1-yunfei.dong@mediat=
ek.com/
> > >=20
> > > Please try to avoid stuff like that it is really confusing and eats
> > > reviewers time.
> > My fault, I thought dma-buf and media belonged to the different tree,
> > so I send them separately. The cover letter just said "The consumers of
> > the new heap and new interface are our codecs and DRM, which will be
> > sent upstream soon", and there was no vcodec link at that time.
> >=20
> > In the next version, we will put the first three patches into the
> > vcodec patchset.
> >=20
> > Thanks.
> >=20
>=20

