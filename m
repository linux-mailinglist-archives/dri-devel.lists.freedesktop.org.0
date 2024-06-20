Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CCE910B66
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 18:09:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CEEB10EACF;
	Thu, 20 Jun 2024 16:09:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="b/vqKjnk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D38AE10EACF
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 16:09:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3A1A0621EF;
 Thu, 20 Jun 2024 16:09:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A5A4C2BD10;
 Thu, 20 Jun 2024 16:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718899789;
 bh=XQWFgbT1rILISA7GfD948pyMzLIvF0B1LSVD5WWIYrA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b/vqKjnkHu+L1R4UdBumQWvGZcFgNTl2F9cMHXjtfeby5EBZ06pxIECyEeoI7HNlf
 IOK34i3IorowljsYyoXsX/yB83rvD9RXoU0LOZ4C4TacZ1YdhNkCzOPP+v2Na6ON8n
 RNJ7UDIgveeS1ta1aGV3qlfjC6MKsO3VptQGp0Nt1os6xti5YTw94JpNH4Ml57ESh1
 Adi1p0o/PKimgZcHce23WfypOPqnkwnrFX/RNgBJ5oK0AIKTaIHUfWPrYSG1aly0RT
 DhriWD6p6OnZn5VmGYVINgUg48uAgRIqk2cibDkEmQxTsySp+zAk3EUYu8e6/BtpN+
 N08P0hApcNYtA==
Date: Thu, 20 Jun 2024 21:39:45 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: lkp@intel.com, Paul Cercueil <paul@crapouillou.net>,
 Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 linux-iio@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 oe-kbuild-all@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>,
 linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Julia Lawall <julia.lawall@inria.fr>, Lee Jones <lee@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [v11 3/7] iio: core: Add new DMABUF interface infrastructure
Message-ID: <ZnRUSaHJhz7XLcKa@matsya>
References: <202406191014.9JAzwRV6-lkp@intel.com>
 <c25aab0d-48f6-4754-b514-d6caf8d51fd1@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c25aab0d-48f6-4754-b514-d6caf8d51fd1@web.de>
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

On 20-06-24, 12:45, Markus Elfring wrote:
> …
> > All errors (new ones prefixed by >>):
> >
> >>> drivers/iio/industrialio-buffer.c:1715:3: error: cannot jump from this goto statement to its label
> >     1715 |                 goto err_dmabuf_unmap_attachment;
> …
> 
> Which software design options would you like to try out next
> so that such a questionable compilation error message will be avoided finally?

The one where all emails from Markus go to dev/null

-- 
~Vinod
