Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9556405B16
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 18:42:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 949C26E8C0;
	Thu,  9 Sep 2021 16:42:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.protonmail.ch (mail-4317.protonmail.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25E206E8C0
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 16:42:13 +0000 (UTC)
Date: Thu, 09 Sep 2021 16:42:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1631205730;
 bh=CRhRrcUbVIk/J340UbBHAnIQ+ohX2n1/c8QCeVn2Jpo=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=y7yBqNtkhgsRmIfQ4GPpRJvlsGGmxCbL9NUJ/m538lQMlZMvYSQ2UAxRJkZ1CMNg5
 6Iv3yvDrCMOeOwxYbbRVvn+/X/+zaHrT9dGoLGonuL/WPiFACJE0voRMT+1AkymQaf
 xpMkgU49orWB5Ct8we5uSjumO9OVNfB1cftFq9FyfmngXj1PPLacl2K9kbTJmbEl4j
 aKAH+OyZIMBgh1wodGYRej1Mj3bebYZh8blbXxAt8VosQXyk9oxFR2Ly+lqY9xaKtu
 5zFUSyYhMpr2A/t850v6DwTCFLOsflPVrr0IubhqCObbRVJsygo5uWr5+rZ3P5VgHm
 EoGGfdSu+tOXg==
To: Rob Clark <robdclark@gmail.com>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?utf-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 Pekka Paalanen <ppaalanen@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 freedreno <freedreno@lists.freedesktop.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Luben Tuikov <luben.tuikov@amd.com>, Melissa Wen <mwen@igalia.com>,
 Steven Price <steven.price@arm.com>, Tian Tao <tiantao6@hisilicon.com>
Subject: Re: [PATCH v3 0/9] dma-fence: Deadline awareness
Message-ID: <CZ2qg4SOe8RnrJpAfZtag_GZTFRt6wAdspKbP4RqpFQCE9Wiuf4xyHTUyKIkaXGu6LfKpSALrmOC3jxgfPdMRjgIAkrkvTnNd9stjXqnPNI=@emersion.fr>
In-Reply-To: <CAF6AEGuD2bnFpmSWtGxU5+AFj1HVKtnOZmLKRr-pDVbLn0nPVw@mail.gmail.com>
References: <20210903184806.1680887-1-robdclark@gmail.com>
 <i-XmBd_5J3_d8cdm-IT6Ery2kHN0FPZCX968aU5idvxQxNlvDJguLLThtF2NF15LF8gGsH4uI2w0s0CL_39KGpzoGpuCgcz2_-4Wjf3AYEM=@emersion.fr>
 <CAF6AEGuD2bnFpmSWtGxU5+AFj1HVKtnOZmLKRr-pDVbLn0nPVw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, September 9th, 2021 at 18:31, Rob Clark <robdclark@gmail.com> =
wrote:

> Yes, I think it would.. and "dma-buf/sync_file: Add SET_DEADLINE
> ioctl" adds such an ioctl.. just for the benefit of igt tests at this
> point, but the thought was it would be also used by compositors that
> are doing such frame scheduling. Ofc danvet is a bit grumpy that
> there isn't a more real (than igt) userspace for the ioctl yet ;-)

Ah, very nice, I somehow missed it.

I guess one issue is that explicit sync isn't quite plumbed through
compositors yet, so without Jason's DMA-BUF to sync_file IOCTL it'd be
a bit difficult to use.

Can anybody set the deadline? I wonder if clients should be allowed to.

What happens if the deadline is exceeded? I'd assume nothing in
particular, the deadline being just a hint?
