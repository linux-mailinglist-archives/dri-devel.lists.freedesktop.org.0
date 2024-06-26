Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B968D918DA8
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 19:56:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E908D10E982;
	Wed, 26 Jun 2024 17:56:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="QCflwIAS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CDC310E982
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 17:56:49 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2ec5f72f073so3811061fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 10:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1719424607; x=1720029407; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9ZM4co7+zgQAd1qBwWCVAAvV8TVVgRW2ezKZ6IWngwg=;
 b=QCflwIASqAjCDWFEO1o0qKcG4TlNtSv+MtG3+QY7UVuG2yE0E9TSggkzcfQ6M+pjyD
 w8jKsOYfqkmSneCOnkNZMksw5zlhekTe83vpCzNrujQ3pAjLQMVci4Fqyq4xolcby/tc
 lAXIjC9B27PE93HN3sRqE3BrrUGhDEtaScVLk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719424607; x=1720029407;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9ZM4co7+zgQAd1qBwWCVAAvV8TVVgRW2ezKZ6IWngwg=;
 b=N//p8WvNdHLtcryAExn4E7x914jHnqmvibcYQMHHxfDwpftLxLHIB+JLPtedH0bAoZ
 41ycR/gWIw06ipBNb1Gc+ZTeiAAV1aneARU8yPdJsCjyh3/lU423P9GN6clWbV7CYMdN
 7xdyNxAT8FvsPX4qjRljBexO2+xprF0lv9V+/n+IalzUHEQRmFA7qAG/2H470TJ10+ih
 NE6ayg4Po6oop0w8eMCGb2yxWlnaNrG5adXO2wYje8gBUExkn/+9VJZTvsqNCiUI1odV
 aJtTL9WdLIlGK/ldCzvnJo+E94totzCtkA/V0jZzmOkWJ0fYLObjccig2y8IGUg+SuVX
 A4rw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2H1at3agQ7GgAmr6QWUfa1BIzNJvjQUZvhP9H5tgolpC9u8E8aucKaITDyZVMLHqyWcQRYjcbpa5+QGY5w0MhJOaaM99dGRyIK8ylbKsY
X-Gm-Message-State: AOJu0YweTIjR9VdtVSWEa0VLu596I+S/ctr3uQPE//RmneyGFNjUUV4Z
 jNdNcHYp4zmHRH2iaqAmhignJZIEA2eec6UHlpHIGaycRtKCtahdIAE0mMtuHYE=
X-Google-Smtp-Source: AGHT+IHpT050wLlCJMuYquS/RZZlwvPNrgj194MZbf2u4dKv3AnFWfObCpyKJAMPQnTOJYHQGnJJZA==
X-Received: by 2002:a2e:9903:0:b0:2ec:4176:dcaf with SMTP id
 38308e7fff4ca-2ec54ce1c2bmr76783881fa.3.1719424605371; 
 Wed, 26 Jun 2024 10:56:45 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-424c84245f0sm34437855e9.33.2024.06.26.10.56.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 10:56:44 -0700 (PDT)
Date: Wed, 26 Jun 2024 19:56:42 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Jason-JH Lin =?utf-8?B?KOael+edv+elpSk=?= <Jason-JH.Lin@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 Yong Wu =?utf-8?B?KOWQtOWLhyk=?= <Yong.Wu@mediatek.com>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "jstultz@google.com" <jstultz@google.com>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Jianjiao Zeng =?utf-8?B?KOabvuWBpeWnoyk=?= <Jianjiao.Zeng@mediatek.com>,
 "willy@infradead.org" <willy@infradead.org>,
 Kuohong Wang =?utf-8?B?KOeOi+Wci+m0uyk=?= <kuohong.wang@mediatek.com>,
 "quic_vjitta@quicinc.com" <quic_vjitta@quicinc.com>,
 "pavel@ucw.cz" <pavel@ucw.cz>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>,
 "contact@emersion.fr" <contact@emersion.fr>,
 "logang@deltatee.com" <logang@deltatee.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "jkardatzke@google.com" <jkardatzke@google.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "Brian.Starkey@arm.com" <Brian.Starkey@arm.com>,
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 "tjmercier@google.com" <tjmercier@google.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "joakim.bech@linaro.org" <joakim.bech@linaro.org>,
 "ppaalanen@gmail.com" <ppaalanen@gmail.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, 
 Youlin Pei =?utf-8?B?KOijtOWPi+aelyk=?= <youlin.pei@mediatek.com>
Subject: Re: [PATCH v5 2/9] scatterlist: Add a flag for the restricted memory
Message-ID: <ZnxWWtdShekGSUif@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, 
 Jason-JH Lin =?utf-8?B?KOael+edv+elpSk=?= <Jason-JH.Lin@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 Yong Wu =?utf-8?B?KOWQtOWLhyk=?= <Yong.Wu@mediatek.com>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "jstultz@google.com" <jstultz@google.com>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Jianjiao Zeng =?utf-8?B?KOabvuWBpeWnoyk=?= <Jianjiao.Zeng@mediatek.com>,
 "willy@infradead.org" <willy@infradead.org>,
 Kuohong Wang =?utf-8?B?KOeOi+Wci+m0uyk=?= <kuohong.wang@mediatek.com>,
 "quic_vjitta@quicinc.com" <quic_vjitta@quicinc.com>,
 "pavel@ucw.cz" <pavel@ucw.cz>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>,
 "contact@emersion.fr" <contact@emersion.fr>,
 "logang@deltatee.com" <logang@deltatee.com>,
 "jkardatzke@google.com" <jkardatzke@google.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "Brian.Starkey@arm.com" <Brian.Starkey@arm.com>,
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 "tjmercier@google.com" <tjmercier@google.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "joakim.bech@linaro.org" <joakim.bech@linaro.org>,
 "ppaalanen@gmail.com" <ppaalanen@gmail.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, 
 Youlin Pei =?utf-8?B?KOijtOWPi+aelyk=?= <youlin.pei@mediatek.com>
References: <20240515112308.10171-1-yong.wu@mediatek.com>
 <20240515112308.10171-3-yong.wu@mediatek.com>
 <98721904-003d-4d0d-8cfe-1cecdd59ce01@amd.com>
 <779ce30a657754ff945ebd32b66e1c644635e84d.camel@mediatek.com>
 <cef8f87d-edab-41d8-8b95-f3fc39ad7f74@amd.com>
 <1050c44512374031d1349b5dced228d0efc3fbde.camel@mediatek.com>
 <3104b765-5666-44e4-8788-f1b1b296fe17@amd.com>
 <98c11bad7f40bcc79ed7a2039ddb3a46f99908f5.camel@mediatek.com>
 <75dc1136-7751-4772-9fa7-dd9124684cd2@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <75dc1136-7751-4772-9fa7-dd9124684cd2@amd.com>
X-Operating-System: Linux phenom 6.8.9-amd64 
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

On Wed, Jun 26, 2024 at 12:49:02PM +0200, Christian König wrote:
> Am 26.06.24 um 10:05 schrieb Jason-JH Lin (林睿祥):
> > > > I think I have the same problem as the ECC_FLAG mention in:
> > > > > > https://lore.kernel.org/linux-media/20240515-dma-buf-ecc-heap-v1-0-54cbbd049511@kernel.org/
> > > > > > I think it would be better to have the user configurable private
> > > > information in dma-buf, so all the drivers who have the same
> > > > requirement can get their private information from dma-buf directly
> > > > and
> > > > no need to change or add the interface.
> > > > > > What's your opinion in this point?
> > >  > Well of hand I don't see the need for that.
> > > > What happens if you get a non-secure buffer imported in your secure
> > > device?
> > 
> > We use the same mediatek-drm driver for secure and non-secure buffer.
> > If non-secure buffer imported to mediatek-drm driver, it's go to the
> > normal flow with normal hardware settings.
> > 
> > We use different configurations to make hardware have different
> > permission to access the buffer it should access.
> > 
> > So if we can't get the information of "the buffer is allocated from
> > restricted_mtk_cma" when importing the buffer into the driver, we won't
> > be able to configure the hardware correctly.
> 
> Why can't you get this information from userspace?

Same reason amd and i915/xe also pass this around internally in the
kernel, it's just that for those gpus the render and kms node are the same
driver so this is easy.

But on arm you have split designs everywhere and dma-buf import/export, so
something else is needed. And neither current kms uapi nor
protocols/extensions have provisions for this (afaik) because it works on
the big gpus, and on android it's just hacked up with backchannels.

So yeah essentially I think we probably need something like this, as much
as it sucks. I see it somewhat similar to handling pcip2pdma limitations
in the kernel too.

Not sure where/how it should be handled though, and maybe I've missed
something around protocols, in which case I guess we should add some
secure buffer flags to the ADDFB2 ioctl.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
