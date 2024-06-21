Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BCA911C71
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 09:09:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9E0C10EA4D;
	Fri, 21 Jun 2024 07:09:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lNq1eGwh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72F4B10E220
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 07:09:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B66D36243D;
 Fri, 21 Jun 2024 07:09:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93D8AC2BBFC;
 Fri, 21 Jun 2024 07:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718953754;
 bh=u0vhe0zqMs5Sy8rTYox/NGGE8oBJtjiHtJOPAUxZARU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lNq1eGwhTNeOpkK9YsjekhMnPYqCfAedSVRmRHNMbdf4aeB/9D+zs1CrdzzASh6C4
 Maf7DhWqeLVEpF4KQEehVBKMm1cJoVh9EPYfS+yepq3tAEjsydKxiI4rtjYFzFLCuR
 K4G7MpuUTZdEm6yo6puU+n7u/0RTXerFzKxf55Nsf5kairPX2eyXlOQi8bBhCAYjqc
 X/twLc6wl8sQTLvX/olSZYVRPkvixcmITIyfJDSYgj16lS797Ip960DrepCfU7mH7Q
 6MKx+CIt1g2fhTe1olIQIEbjsh0QvACjeCVEG6doqO9oc6g6olhnMMeO5Qjbw2BTHF
 Qcz/Pt9DgHS/w==
Date: Fri, 21 Jun 2024 12:39:09 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Markus Elfring <Markus.Elfring@web.de>, lkp@intel.com,
 Paul Cercueil <paul@crapouillou.net>,
 Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 linux-iio@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 oe-kbuild-all@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>,
 linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Julia Lawall <julia.lawall@inria.fr>, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [v11 3/7] iio: core: Add new DMABUF interface infrastructure
Message-ID: <ZnUnFeum1Z2ahm9M@matsya>
References: <202406191014.9JAzwRV6-lkp@intel.com>
 <c25aab0d-48f6-4754-b514-d6caf8d51fd1@web.de>
 <ZnRUSaHJhz7XLcKa@matsya> <20240620170522.GU3029315@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240620170522.GU3029315@google.com>
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

On 20-06-24, 18:05, Lee Jones wrote:
> On Thu, 20 Jun 2024, Vinod Koul wrote:
> 
> > On 20-06-24, 12:45, Markus Elfring wrote:
> > > …
> > > > All errors (new ones prefixed by >>):
> > > >
> > > >>> drivers/iio/industrialio-buffer.c:1715:3: error: cannot jump from this goto statement to its label
> > > >     1715 |                 goto err_dmabuf_unmap_attachment;
> > > …
> > > 
> > > Which software design options would you like to try out next
> > > so that such a questionable compilation error message will be avoided finally?
> > 
> > The one where all emails from Markus go to dev/null
> 
> Play nice please.

Would love to... but Markus has been repeat offender

Sadly, I am yet to see a constructive approach or even better a helpful
patch which improve something, rather than vague suggestions on the list

-- 
~Vinod
