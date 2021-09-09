Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54098405A93
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 18:16:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83B7C6E8AC;
	Thu,  9 Sep 2021 16:16:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail1.protonmail.ch (mail1.protonmail.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D243E6E8AC
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 16:16:09 +0000 (UTC)
Date: Thu, 09 Sep 2021 16:16:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1631204166;
 bh=Apv6GQaf8fKyhLu5mqniN1a3E749tLdfKHwBJJCqpnM=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=Bwja9UO1rUqLY5hqjqW8ns3FrWLdpUn9SyKSzlHRCF//Yngt12sVjx7jaryvLbXrF
 HqfFGr6Le7ohW1gp6JokPdA1qk7+6ICL8CvqGulmwqjEdzHxvG/eivDp49v2FWYvU9
 2LJmaaBmXgzRbIeHDbAAugPlgU4hlCzu//WiySq4NkRR9uheLEMgxboG+iCR7ZSgn4
 O4iCuvQHWhvstlDqtdQbhFwPwMAdSM3cW4y64wu8Mmhd5fZRhQ8sRHQojxn++hOaCS
 zwiVsa+uK0yDM/ekde0NPPjy8MwNL/94DN1TbKuCEE4x8V79RHTaUxZtW4xyuBfEM3
 H0/oo/bRurDgg==
To: Rob Clark <robdclark@gmail.com>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Daniel Vetter <daniel@ffwll.ch>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?utf-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 Pekka Paalanen <ppaalanen@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, freedreno@lists.freedesktop.org,
 Gustavo Padovan <gustavo@padovan.org>, Jack Zhang <Jack.Zhang1@amd.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, Luben Tuikov <luben.tuikov@amd.com>,
 Melissa Wen <mwen@igalia.com>, Steven Price <steven.price@arm.com>,
 Tian Tao <tiantao6@hisilicon.com>
Subject: Re: [PATCH v3 0/9] dma-fence: Deadline awareness
Message-ID: <i-XmBd_5J3_d8cdm-IT6Ery2kHN0FPZCX968aU5idvxQxNlvDJguLLThtF2NF15LF8gGsH4uI2w0s0CL_39KGpzoGpuCgcz2_-4Wjf3AYEM=@emersion.fr>
In-Reply-To: <20210903184806.1680887-1-robdclark@gmail.com>
References: <20210903184806.1680887-1-robdclark@gmail.com>
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

Out of curiosity, would it be reasonable to allow user-space (more
precisely, the compositor) to set the deadline via an IOCTL without
actually performing an atomic commit with the FB?

Some compositors might want to wait themselves for FB fence completions
to ensure a client doesn't block the whole desktop (by submitting a
very costly rendering job). In this case it would make sense for the
compositor to indicate that it intends to display the buffer on next
vblank if it's ready by that point, without queueing a page-flip yet.
