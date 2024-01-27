Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 471BF83EED2
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jan 2024 17:52:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B80EA10F2BD;
	Sat, 27 Jan 2024 16:51:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31F0D10E6F2
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jan 2024 16:51:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C428C60A65;
 Sat, 27 Jan 2024 16:51:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F7BFC433F1;
 Sat, 27 Jan 2024 16:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706374260;
 bh=QP+swmkCdNQGO0Nmh/aIJ91HocN7GAu5e8lfaOWVe1c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kHE4GT14qyZ9I0dPf3JZXSf2KWCeckxoGqODmilUYb+pouIkOG0PYuxUTRvH5IKL/
 8027UCs0RkMLDqypr8Xez1mHrPzUpaYqXdIBwlJIVmSLOEYJwOHHl2kNuK6G1K4Cse
 gqN+/rdjyKsk/3+BPoMGzF/E9cmtxQkF1zcMmaz10JrLPFLtHbbc1ksahSgc+PY4Va
 fVlv5Kbkq5xj9XOnO1ErYaT0nLxkh/na/nVHByuhTxQp/bWM8P/cf7Usxpyzhuxrar
 11GV3LsFzScBDF4TtjuAK1EHyNaYfrGvDpvsLd692/hySSUirAFWN3Nn7aD1CMlPH8
 Rgo7n1lSqppsw==
Date: Sat, 27 Jan 2024 16:50:44 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v5 5/8] iio: core: Add new DMABUF interface infrastructure
Message-ID: <20240127165044.22f1b329@jic23-huawei>
In-Reply-To: <ee5d7bb2fb3e74e8fc621d745b23d1858e1f0c3c.camel@crapouillou.net>
References: <20231219175009.65482-1-paul@crapouillou.net>
 <20231219175009.65482-6-paul@crapouillou.net>
 <20231221120624.7bcdc302@jic23-huawei>
 <ee5d7bb2fb3e74e8fc621d745b23d1858e1f0c3c.camel@crapouillou.net>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.40; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-iio@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Vinod Koul <vkoul@kernel.org>,
 Nuno =?UTF-8?B?U8Oh?= <noname.nuno@gmail.com>, dmaengine@vger.kernel.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


> > > +	iio_buffer_dmabuf_put(attach);
> > > +
> > > +out_dmabuf_put:
> > > +	dma_buf_put(dmabuf);  
> > As below. Feels like a __free(dma_buf_put) bit of magic would be a
> > nice to have.  
> 
> I'm working on the patches right now, just one quick question.
> 
> Having a __free(dma_buf_put) requires that dma_buf_put is first
> "registered" as a freeing function using DEFINE_FREE() in <linux/dma-
> buf.h>, which has not been done yet.  
> 
> That would mean carrying a dma-buf specific patch in your tree, are you
> OK with that?
Needs an ACK from appropriate maintainer, but otherwise I'm fine doing
so.  Alternative is to circle back to this later after this code is upstream.

> 
> Cheers,
> -Paul

> 

