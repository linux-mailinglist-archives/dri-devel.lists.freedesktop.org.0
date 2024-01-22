Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A300836087
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 12:06:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2469110E6A5;
	Mon, 22 Jan 2024 11:06:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 189BC10E6A5
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 11:06:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 83F2DB8075F;
 Mon, 22 Jan 2024 11:06:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C865C433C7;
 Mon, 22 Jan 2024 11:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705921570;
 bh=V/MmW1yVoK0TjvFsg0TJRYR3IjhkDr66kgUMy4s5icQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sT8RYILNkg7DURq+DonPfOgYKWZzT9z1t7mKh5x8C8ZtDBgG2Ac0So6ocPeViznQk
 +b371knvzEQWiydLKI1rfHATW4gAcoP59HbiRavhYPxlUmUDhWQYFGir8/FVGINZd4
 4pbOy4f0jZXJrLq+pJ3U/hqDcEQirBEh7ORQTHlbVbDWuK1Bz5xSiDRJ61ytOBjCy+
 MIKGPKdVLBk54rOk1kK1ZfjKmuXIlY6qfkGds5xNN06kmh+7o/uJaxX7pptL30KyeJ
 KtePRH0INjn0SKiK3esQsx8GBl9w/Z8ZG+lbA3GAdrOUfJSnUjJhBs97oG+pTIzNU4
 jhoAF4LEG4IIA==
Date: Mon, 22 Jan 2024 16:36:06 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [Linaro-mm-sig] Re: [PATCH v5 3/8] dmaengine: Add API function
 dmaengine_prep_slave_dma_vec()
Message-ID: <Za5MHkzSjyVUoytI@matsya>
References: <20231219175009.65482-1-paul@crapouillou.net>
 <20231219175009.65482-4-paul@crapouillou.net>
 <ZYRWbROAuMXftH07@matsya>
 <86a30af0db2232bd473a38cd001342156cd4012e.camel@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <86a30af0db2232bd473a38cd001342156cd4012e.camel@crapouillou.net>
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
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org,
 Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>, dmaengine@vger.kernel.org,
 Sumit Semwal <sumit.semwal@linaro.org>, Jonathan Cameron <jic23@kernel.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul,


On 08-01-24, 13:20, Paul Cercueil wrote:
> Hi Vinod,
> 
> Le jeudi 21 décembre 2023 à 20:44 +0530, Vinod Koul a écrit :
> > On 19-12-23, 18:50, Paul Cercueil wrote:
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
> > > ---
> > >  include/linux/dmaengine.h | 25 +++++++++++++++++++++++++
> > >  1 file changed, 25 insertions(+)
> > > 
> > > diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
> > > index 3df70d6131c8..ee5931ddb42f 100644
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
> 
> I don't want to be pushy, but I'd like to know how to solve this now,
> otherwise I'll just send the same patches for my v6.
> 
> > so you want to transfer multiple buffers, right? why not use
> > dmaengine_prep_slave_sg(). If there is reason for not using that one?
> 
> The reason is that we want to have the possibility to transfer less
> than the total size of the scatterlist, and that's currently very hard
> to do - scatterlists were designed to not be tampered with.
> 
> Christian König then suggested to introduce a "dma_vec" which had been
> on his TODO list for a while now.

Yeah for this interleaved seems overkill. Lets go with this api. I would
suggest change the name of the API replacing slave with peripheral
though

-- 
~Vinod
