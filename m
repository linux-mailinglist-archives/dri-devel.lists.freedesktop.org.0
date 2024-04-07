Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD7E89AF89
	for <lists+dri-devel@lfdr.de>; Sun,  7 Apr 2024 10:19:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6625710FA06;
	Sun,  7 Apr 2024 08:19:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bQL45DWu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D81D10FA06
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Apr 2024 08:19:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1FF9E60BB5;
 Sun,  7 Apr 2024 08:19:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F29BC433F1;
 Sun,  7 Apr 2024 08:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712477945;
 bh=e9UXYTAc5sFI75CK5XgqAQXmOoDPNUpaUP0KGJszuPQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bQL45DWu0HxJomMb0clRFnENNm4bArAijal3EZ3qTPml9cdTdnQD/Jv+nZ6r4estn
 tdFm3p3nVi1vJ7RNY79r2A213/2M8AZsb3FfhENk6Agglm3lvLZmkpgMrH5L3HWAuU
 1mdfJp57B03c6ql4jqZ4OM6opBEQZTdC85Czud6bGKKwlGvmwv3roxGCrb88TvH02/
 TPIjgoqyRoHs4zvdtsgjgaUksKCcFJEmaIFG1lDVXc4m8ISrskkrOi2Hn/iIHyNQtI
 JNoPhQ3FBDp0yzYfHuEd/7iNzyF1QjxWLZZwhc+321A+Kax/Gni7nVcjqHjoPfQVAD
 +9J6be2H9OZHg==
Date: Sun, 7 Apr 2024 13:49:00 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Cc: Jonathan Cameron <jic23@kernel.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Jonathan Corbet <corbet@lwn.net>, Lars-Peter Clausen <lars@metafoo.de>,
 Sumit Semwal <sumit.semwal@linaro.org>, Nuno Sa <nuno.sa@analog.com>,
 Michael Hennerich <michael.hennerich@analog.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v9 1/6] dmaengine: Add API function
 dmaengine_prep_peripheral_dma_vec()
Message-ID: <ZhJW9JEqN2wrejvC@matsya>
References: <20240310124836.31863-1-paul@crapouillou.net>
 <20240310124836.31863-2-paul@crapouillou.net>
 <ZgUM1LFEWs3lwoAU@matsya>
 <599394c0220079b7b42dc732be817ca8a1eb4214.camel@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <599394c0220079b7b42dc732be817ca8a1eb4214.camel@crapouillou.net>
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

On 02-04-24, 13:31, Paul Cercueil wrote:
> Hi Vinod,
> 
> Le jeudi 28 mars 2024 à 11:53 +0530, Vinod Koul a écrit :
> > On 10-03-24, 13:48, Paul Cercueil wrote:
> > > This function can be used to initiate a scatter-gather DMA
> > > transfer,
> > > where the address and size of each segment is located in one entry
> > > of
> > > the dma_vec array.
> > > 
> > > The major difference with dmaengine_prep_slave_sg() is that it
> > > supports
> > > specifying the lengths of each DMA transfer; as trying to override
> > > the
> > > length of the transfer with dmaengine_prep_slave_sg() is a very
> > > tedious
> > > process. The introduction of a new API function is also justified
> > > by the
> > > fact that scatterlists are on their way out.
> > > 
> > > Note that dmaengine_prep_interleaved_dma() is not helpful either in
> > > that
> > > case, as it assumes that the address of each segment will be higher
> > > than
> > > the one of the previous segment, which we just cannot guarantee in
> > > case
> > > of a scatter-gather transfer.
> > > 
> > > Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> > > Signed-off-by: Nuno Sa <nuno.sa@analog.com>
> > > 
> > > ---
> > > v3: New patch
> > > 
> > > v5: Replace with function dmaengine_prep_slave_dma_vec(), and
> > > struct
> > >     'dma_vec'.
> > >     Note that at some point we will need to support cyclic
> > > transfers
> > >     using dmaengine_prep_slave_dma_vec(). Maybe with a new "flags"
> > >     parameter to the function?
> > > 
> > > v7:
> > >   - Renamed *device_prep_slave_dma_vec() ->
> > > device_prep_peripheral_dma_vec();
> > >   - Added a new flag parameter to the function as agreed between
> > > Paul
> > >     and Vinod. I renamed the first parameter to prep_flags as it's
> > > supposed to
> > >     be used (I think) with enum dma_ctrl_flags. I'm not really sure
> > > how that API
> > >     can grow but I was thinking in just having a bool cyclic
> > > parameter (as the
> > >     first intention of the flags is to support cyclic transfers)
> > > but ended up
> > >     "respecting" the previously agreed approach.
> > > ---
> > >  include/linux/dmaengine.h | 27 +++++++++++++++++++++++++++
> > >  1 file changed, 27 insertions(+)
> > > 
> > > diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
> > > index 752dbde4cec1..856df8cd9a4e 100644
> > > --- a/include/linux/dmaengine.h
> > > +++ b/include/linux/dmaengine.h
> > > @@ -160,6 +160,16 @@ struct dma_interleaved_template {
> > >  	struct data_chunk sgl[];
> > >  };
> > >  
> > > +/**
> > > + * struct dma_vec - DMA vector
> > > + * @addr: Bus address of the start of the vector
> > > + * @len: Length in bytes of the DMA vector
> > > + */
> > > +struct dma_vec {
> > > +	dma_addr_t addr;
> > > +	size_t len;
> > > +};
> > > +
> > >  /**
> > >   * enum dma_ctrl_flags - DMA flags to augment operation
> > > preparation,
> > >   *  control completion, and communicate status.
> > > @@ -910,6 +920,10 @@ struct dma_device {
> > >  	struct dma_async_tx_descriptor
> > > *(*device_prep_dma_interrupt)(
> > >  		struct dma_chan *chan, unsigned long flags);
> > >  
> > > +	struct dma_async_tx_descriptor
> > > *(*device_prep_peripheral_dma_vec)(
> > > +		struct dma_chan *chan, const struct dma_vec *vecs,
> > > +		size_t nents, enum dma_transfer_direction
> > > direction,
> > > +		unsigned long prep_flags, unsigned long flags);
> > >  	struct dma_async_tx_descriptor *(*device_prep_slave_sg)(
> > >  		struct dma_chan *chan, struct scatterlist *sgl,
> > >  		unsigned int sg_len, enum dma_transfer_direction
> > > direction,
> > > @@ -973,6 +987,19 @@ static inline struct dma_async_tx_descriptor
> > > *dmaengine_prep_slave_single(
> > >  						  dir, flags,
> > > NULL);
> > >  }
> > >  
> > > +static inline struct dma_async_tx_descriptor
> > > *dmaengine_prep_peripheral_dma_vec(
> > > +	struct dma_chan *chan, const struct dma_vec *vecs, size_t
> > > nents,
> > > +	enum dma_transfer_direction dir, unsigned long prep_flags,
> > > +	unsigned long flags)
> > > +{
> > > +	if (!chan || !chan->device || !chan->device-
> > > >device_prep_peripheral_dma_vec)
> > > +		return NULL;
> > > +
> > > +	return chan->device->device_prep_peripheral_dma_vec(chan,
> > > vecs, nents,
> > > +							    dir,
> > > prep_flags,
> > > +							   
> > > flags);
> > > +}
> > 
> > API looks good to me, thanks
> > Few nits though:
> > - Can we add kernel-doc for this new API please
> > - Also update the documentation adding this new api
> > - Lastly, we seem to have two flags, I know you have added a comment
> > but
> >   I dont seem to recall the discussion (looked at old threads for
> > clue
> >   as well), can you please remind me why we need both? And in your
> > case,
> >   what is the intended usage of these flags, i would prefer single
> >   clean one...
> > 
> 
> The "prep_flags" is a mask of "enum dma_ctrl_flags".
> 
> The second "flags" was supposed to be specific to this function, and
> was to future-proof the API as we eventually want to have a "cyclic"
> flag, which would emulate a cyclic transfer by linking the SG hardware
> descriptors accordingly.
> 
> However - I think we can already do that with DMA_PREP_REPEAT and
> DMA_PREP_LOAD_EOT, right? So we can probably drop the second "flags".

Yeah that could be done, we should add Documentation to clarify this

-- 
~Vinod
