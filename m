Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A59C6A62E
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 16:48:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EC5510E02C;
	Tue, 18 Nov 2025 15:48:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="k5pjPCDm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC13310E02C
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 15:48:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 95AAE443C8;
 Tue, 18 Nov 2025 15:48:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BED5DC4AF0C;
 Tue, 18 Nov 2025 15:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763480882;
 bh=ftZPrL7pkqvYgzApMIEmVisxDVAsYx0F5C0VOMSH8Uc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=k5pjPCDmvhAAn2oD9/OV0u6iLC0wJSXclH9vdGlaSAM+UfJxYDhpzeScPhOK42i5a
 novsxhH4WsGPI03LBveRVb7SU1HdfjfUyPCKxB2wPSW2SnVZAadV1fN3ytqp24ezF8
 gGKajyIDUkQmuc7r+OHkA700Bva3XuF2atYlX8MNRmtRxN8sU7/WKvQHUx6j3eCrIs
 D9SjRUcUqkSOBJisCQ6Hz+QHTrZ1Mf1srHA9CTSq2c8ybWCR0jgKKvQwGtwXCINSU4
 AyMM8+k847N3VhhKl9DRi1Bpv9L87t3x4tqDp5EMhbHmXXrGOkZA5HVXb+4tYKh55J
 ziWLY/7RtV2aA==
Date: Tue, 18 Nov 2025 09:52:49 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
Cc: kpallavi@qti.qualcomm.com, srini@kernel.org, amahesh@qti.qualcomm.com, 
 arnd@arndb.de, gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, 
 ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, 
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 jingyi.wang@oss.qualcomm.com, 
 aiqun.yu@oss.qualcomm.com, ktadakam@qti.qualcomm.com
Subject: Re: [PATCH v3 3/4] misc: fastrpc: Add support for new DSP IOVA
 formatting
Message-ID: <yucfjksc5w2eac6fmsamknjhbwebxg7xsz6633vs2rw3qt4kfa@w2wsbfvszhb7>
References: <20251114084142.3386682-1-kumari.pallavi@oss.qualcomm.com>
 <20251114084142.3386682-4-kumari.pallavi@oss.qualcomm.com>
 <di5fqyh4uygb72xov6zqvg2i2ujlllrnnzlsphlzvghgttdqpe@u6uwwa4rxiow>
 <8c59e08a-99cb-473b-999c-e7d08bc2124b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8c59e08a-99cb-473b-999c-e7d08bc2124b@oss.qualcomm.com>
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

On Mon, Nov 17, 2025 at 12:32:59PM +0530, Kumari Pallavi wrote:
> 
> 
> On 11/14/2025 9:21 PM, Bjorn Andersson wrote:
> > On Fri, Nov 14, 2025 at 02:11:41PM +0530, Kumari Pallavi wrote:
> > > Implement the new IOVA formatting required by the DSP architecture change
> > > on Kaanapali SoC. Place the SID for DSP DMA transactions at bit 56 in the
> > > physical address. This placement is necessary for the DSPs to correctly
> > > identify streams and operate as intended.
> > > To address this, set SID position to bit 56 via OF matching on the fastrpc
> > > node; otherwise, default to legacy 32-bit placement.
> > > This change ensures consistent SID placement across DSPs.
> > > 
> > 
> > In patch 2 I said I think it would be a good idea to separate the two
> > perspectives (Linux/SMMU vs remote addresses).
> > 
> > Looking ta this patch I'm completely convinced that it's the right thing
> > to do!
> > 
> > > Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
> > > ---
> > >   drivers/misc/fastrpc.c | 46 +++++++++++++++++++++++++++++++++++-------
> > >   1 file changed, 39 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> > > index d6a7960fe716..bcf3c7f8d3e9 100644
> > > --- a/drivers/misc/fastrpc.c
> > > +++ b/drivers/misc/fastrpc.c
> > > @@ -33,7 +33,6 @@
> > >   #define FASTRPC_ALIGN		128
> > >   #define FASTRPC_MAX_FDLIST	16
> > >   #define FASTRPC_MAX_CRCLIST	64
> > > -#define FASTRPC_PHYS(p)	((p) & 0xffffffff)
> > >   #define FASTRPC_CTX_MAX (256)
> > >   #define FASTRPC_INIT_HANDLE	1
> > >   #define FASTRPC_DSP_UTILITIES_HANDLE	2
> > > @@ -105,6 +104,15 @@
> > >   #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
> > > +/* Extract smmu pa from consolidated iova */
> > > +#define IPA_TO_DMA_ADDR(iova, sid_pos) (iova & ((1ULL << sid_pos) - 1ULL))
> > > +/*
> > > + * Prepare the consolidated iova to send to dsp by prepending the sid
> > > + * to smmu pa at the appropriate position
> > > + */
> > > +#define IOVA_FROM_SID_PA(sid, phys, sid_pos) \
> > > +       (phys += sid << sid_pos)
> > 
> > This is a horrible macro. It looks just like a function taking values,
> > it's named to sound like it takes a sid and pa and return an iova, but
> > it has side effects.
> > 
> > And what's up with the ordering? Take argument 1 and 3, and put the
> > result in argument 2?!
> > 
> 
> Thank you for the feedback regarding the macro implementation. I understand
> your concern about readability and hidden side effects.
> To address this, I’ve replaced the macro with an inline function
> 
> 
> static inline u64 fastrpc_compute_sid_offset(u64 sid, u32 sid_pos)
> {
>     return sid << sid_pos;
> }
> 
> 
> buf->dma_addr += fastrpc_compute_sid_offset(sid, sid_pos);
> 
> Could you confirm if this is in line with what you suggested?
> 

That is possible to read, so yes that would be much better. 

Regards,
Bjorn
