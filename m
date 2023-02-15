Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C26C6697A32
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 11:49:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F50D10EAA0;
	Wed, 15 Feb 2023 10:49:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EC2610EAA0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Feb 2023 10:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1676458139; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:in-reply-to:
 references; bh=ZHe7JolY/BobglmmhQYnFvCdmN/ZLCE2J/uPgfJFoos=;
 b=ix5Z29OKgb6nv2f8ywrwzbbIBABf/26vJCC1rdb3sYWsEob4n0zCkKupmiI7JJWlRYSMRP
 wM4gNVdA69mZHvlUIacLCii0ugFWKJRwGs5EjDrxp7o5vNSuj51olW/yQ/qLnOnzPWoDMx
 WxGMKkxmXlvwHvVEO5PkUgzUStM+QFg=
Message-ID: <53ea4d2db570d3ca514a69015488bd5b849a5193.camel@crapouillou.net>
Subject: Question: partial transfers of DMABUFs
From: Paul Cercueil <paul@crapouillou.net>
To: Sumit Semwal <sumit.semwal@linaro.org>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Vinod Koul <vkoul@kernel.org>
Date: Wed, 15 Feb 2023 10:48:56 +0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

I am working on adding support for DMABUFs in the IIO subsystem.

One thing we want there, is the ability to specify the number of bytes
to transfer (while still defaulting to the DMABUF size).

Since dma_buf_map_attachment() returns a sg_table, I basically have two
options, and I can't decide which one is the best (or the less ugly):

- Either I add a new API function similar to dmaengine_prep_slave_sg(),
which still takes a scatterlist as argument but also takes the number
of bytes as argument;

- Or I add a function to duplicate the scatterlist and then shrink it
manually, which doesn't sound like a good idea either.

What would be the recommended way?

Cheers,
-Paul
