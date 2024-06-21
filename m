Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E983911D24
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 09:45:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C115A10EDDB;
	Fri, 21 Jun 2024 07:45:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VHcU5OcK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5021610EDDB
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 07:45:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4D27ECE2B81;
 Fri, 21 Jun 2024 07:45:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A549BC2BBFC;
 Fri, 21 Jun 2024 07:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718955906;
 bh=kaVMXrwTmSC64V9oowdkW3LocVFxxI6q7Bieew/jhU4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VHcU5OcKmyIuSvFX2uiCfjL+hqzmLLUuXSpxQkSHq290dmv2VLJhQ4Ta69W49r4Nk
 uirkX9qtF2gwmdG1GscRoyErHl9DlfDUe44+Yh+AS6Z4lR/aZ3g4gKMawl1Xc6IgEn
 oagGpD0YxZXKrpnOurjlzGmtWfOwmP4XgtUkg2Ac0ncef6ZnwCaHM92NX08d7xgJKr
 a1uwzIT4X0/2Zk3peizz7HR8/P1MY7wMhCKjy08jJ9d0yxXEVHVULJ02ZVXc+HQelZ
 w2FYmT3aSRxqx9efS351bY1cxqsRu9O443MHLLDnCqdeKFc4QmbjElYWuvO6qWmFig
 7zxU5x/94AxYg==
Date: Fri, 21 Jun 2024 08:44:59 +0100
From: Lee Jones <lee@kernel.org>
To: Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Markus Elfring <Markus.Elfring@web.de>,
 lkp@intel.com, Paul Cercueil <paul@crapouillou.net>,
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
Message-ID: <20240621074459.GF1318296@google.com>
References: <202406191014.9JAzwRV6-lkp@intel.com>
 <c25aab0d-48f6-4754-b514-d6caf8d51fd1@web.de>
 <ZnRUSaHJhz7XLcKa@matsya> <20240620170522.GU3029315@google.com>
 <ZnUnFeum1Z2ahm9M@matsya>
 <b7283f9458047e63e7d8c8b80daf2bd6232403cb.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b7283f9458047e63e7d8c8b80daf2bd6232403cb.camel@gmail.com>
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

On Fri, 21 Jun 2024, Nuno Sá wrote:

> On Fri, 2024-06-21 at 12:39 +0530, Vinod Koul wrote:
> > On 20-06-24, 18:05, Lee Jones wrote:
> > > On Thu, 20 Jun 2024, Vinod Koul wrote:
> > > 
> > > > On 20-06-24, 12:45, Markus Elfring wrote:
> > > > > …
> > > > > > All errors (new ones prefixed by >>):
> > > > > > 
> > > > > > > > drivers/iio/industrialio-buffer.c:1715:3: error: cannot jump from
> > > > > > > > this goto statement to its label
> > > > > >     1715 |                 goto err_dmabuf_unmap_attachment;
> > > > > …
> > > > > 
> > > > > Which software design options would you like to try out next
> > > > > so that such a questionable compilation error message will be avoided
> > > > > finally?
> > > > 
> > > > The one where all emails from Markus go to dev/null
> > > 
> > > Play nice please.
> > 
> > Would love to... but Markus has been repeat offender
> > 
> > Sadly, I am yet to see a constructive approach or even better a helpful
> > patch which improve something, rather than vague suggestions on the list

Right, there are communication issues.

Doesn't mean we have to lower our own standards.

> Yeah, just look at how many automatic replies he get's from Greg pretty much
> saying to ignore his comments.

Yes, Greg is also grumpy about it, but at least he remains polite.

-- 
Lee Jones [李琼斯]
