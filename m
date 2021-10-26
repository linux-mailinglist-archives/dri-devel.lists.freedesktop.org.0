Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 981DC43AE63
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 10:52:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 342C8898E4;
	Tue, 26 Oct 2021 08:52:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE6F1898E4
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 08:52:40 +0000 (UTC)
X-UUID: 948bcc1d34534473aba2297d7f7dc96a-20211026
X-UUID: 948bcc1d34534473aba2297d7f7dc96a-20211026
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
 (envelope-from <guangming.cao@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1795022158; Tue, 26 Oct 2021 16:52:37 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 26 Oct 2021 16:52:36 +0800
Received: from mszswglt01.gcn.mediatek.inc (10.16.20.20) by
 mtkcas10.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Tue, 26 Oct 2021 16:52:35 +0800
From: <guangming.cao@mediatek.com>
To: <daniel@ffwll.ch>
CC: <christian.koenig@amd.com>, <ckoenig.leichtzumerken@gmail.com>,
 <dri-devel@lists.freedesktop.org>, <guangming.cao@mediatek.com>,
 <linaro-mm-sig@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
 <sumit.semwal@linaro.org>, <wsd_upstream@mediatek.com>, Guangming Cao
 <Guangming.Cao@mediatek.com>
Subject: Re: [Linaro-mm-sig] [PATCH] dma-buf: add attachments empty check for
 dma_buf_release
Date: Tue, 26 Oct 2021 16:52:41 +0800
Message-ID: <20211026085241.5116-1-guangming.cao@mediatek.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <YW80iakRm5jWjIUp@phenom.ffwll.local>
References: <YW80iakRm5jWjIUp@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK: N
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

From: Guangming Cao <Guangming.Cao@mediatek.com>

On Tue, 2021-10-19 at 23:11 +0200, Daniel Vetter wrote:
> On Tue, Oct 19, 2021 at 05:37:27PM +0200, Christian K鰊ig wrote:
> > 
> > 
> > Am 19.10.21 um 14:41 schrieb Daniel Vetter:
> > > On Tue, Oct 19, 2021 at 08:23:45PM +0800, 
> > > guangming.cao@mediatek.com wrote:
> > > > From: Guangming Cao <Guangming.Cao@mediatek.com>
> > > > 
> > > > Since there is no mandatory inspection for attachments in
> > > > dma_buf_release.
> > > > There will be a case that dma_buf already released but
> > > > attachment is still
> > > > in use, which can points to the dmabuf, and it maybe cause
> > > > some unexpected issues.
> > > > 
> > > > With IOMMU, when this cases occurs, there will have IOMMU
> > > > address
> > > > translation fault(s) followed by this warning,
> > > > I think it's useful for dma devices to debug issue.
> > > > 
> > > > Signed-off-by: Guangming Cao <Guangming.Cao@mediatek.com>
> > > 
> > > This feels a lot like hand-rolling kobject debugging. If you want
> > > to do
> > > this then I think adding kobject debug support to
> > > dma_buf/dma_buf_attachment would be better than hand-rolling
> > > something
> > > bespoke here.
> > 
> > Well I would call that overkill.
> 
> I think if done right the object debug stuff should be able to give
> you a
> backtrace. Which might be useful if you have a dma-buf heaps design
> where
> you really have no clue why a buffer was allocated/attached without
> some
> hints.
Well, I think it's the finally solution, for current thinking, it maybe bring a high
overloading. Just as this revert patch: 
https://lore.kernel.org/lkml/CA+wgaPMHA+8+LxfGNL+q4=XrdXqfu4TXoWLX7e28z9Z7kPsf-w@mail.gmail.com/
So, we need to find a lightweight way to do this.

Guangming
> 
> > > Also on the patch itself: You don't need the trylock. For
> > > correctly
> > > working code non one else can get at the dma-buf, so no locking
> > > needed to
> > > iterate through the attachment list. For incorrect code the
> > > kernel will be
> > > on fire pretty soon anyway, trying to do locking won't help :-)
> > > And
> > > without the trylock we can catch more bugs (e.g. if you also
> > > forgot to
> > > unlock and not just forgot to detach).

Yes, It's also a error case, I will remove to lock at next version patch. Thanks!

Guangming

> > 
> > You also don't need the WARN(!list_empty...) because a few line
> > below we
> > already have a "WARN_ON(!list_empty(&dmabuf->attachments));".

Sorry, could you tell me wich function will check it?
I didn't found it so I submit this patch.

Guangming
> 
> Yeah this patch here alone isn't really that useful I think. Maybe we
> could add the dmabuf->exp_name or so to that warning, but otherwise
> the
> info printed here isn't all that useful for debugging. Grabbing a

I also printed dmabuf->exp_name in warn message.

The reason adding it here is that some users on ANDROID of dma-buf is not familiar
with linux dma-buf or maybe write some problematic code, add this check can find
who lost call get_dma_buf or any other api can let let the dma-buf lifecycle is
under users' expectation.
Add it just like check in dma-fence:
https://github.com/torvalds/linux/blob/master/drivers/dma-buf/dma-fence.c#L519

Do you have any suggestion to debug this part?

Guangming

> backtrace of the allocator or attacher otoh should fairly immedialy
> point
> at the buggy code.
> -Daniel
> 
> > 
> > Christian.
> > 
> > > -Daniel
> > > 
> > > > ---
> > > >   drivers/dma-buf/dma-buf.c | 23 +++++++++++++++++++++++
> > > >   1 file changed, 23 insertions(+)
> > > > 
> > > > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-
> > > > buf.c
> > > > index 511fe0d217a0..672404857d6a 100644
> > > > --- a/drivers/dma-buf/dma-buf.c
> > > > +++ b/drivers/dma-buf/dma-buf.c
> > > > @@ -74,6 +74,29 @@ static void dma_buf_release(struct dentry
> > > > *dentry)
> > > >   	 */
> > > >   	BUG_ON(dmabuf->cb_shared.active || dmabuf-
> > > > >cb_excl.active);
> > > > +	/* attachment check */
> > > > +	if (dma_resv_trylock(dmabuf->resv) &&
> > > > WARN(!list_empty(&dmabuf->attachments),
> > > > +	    "%s err, inode:%08lu size:%08zu name:%s exp_name:%s
> > > > flags:0x%08x mode:0x%08x, %s\n",
> > > > +	    __func__, file_inode(dmabuf->file)->i_ino, dmabuf-
> > > > >size,
> > > > +	    dmabuf->name, dmabuf->exp_name,
> > > > +	    dmabuf->file->f_flags, dmabuf->file->f_mode,
> > > > +	    "Release dmabuf before detach all attachments, dump
> > > > attach:\n")) {
> > > > +		int attach_cnt = 0;
> > > > +		dma_addr_t dma_addr;
> > > > +		struct dma_buf_attachment *attach_obj;
> > > > +		/* dump all attachment info */
> > > > +		list_for_each_entry(attach_obj, &dmabuf-
> > > > >attachments, node) {
> > > > +			dma_addr = (dma_addr_t)0;
> > > > +			if (attach_obj->sgt)
> > > > +				dma_addr =
> > > > sg_dma_address(attach_obj->sgt->sgl);
> > > > +			pr_err("attach[%d]: dev:%s
> > > > dma_addr:0x%-12lx\n",
> > > > +			       attach_cnt, dev_name(attach_obj-
> > > > >dev), dma_addr);
> > > > +			attach_cnt++;
> > > > +		}
> > > > +		pr_err("Total %d devices attached\n\n",
> > > > attach_cnt);
> > > > +		dma_resv_unlock(dmabuf->resv);
> > > > +	}
> > > > +
> > > >   	dmabuf->ops->release(dmabuf);
> > > >   	if (dmabuf->resv == (struct dma_resv *)&dmabuf[1])
> > > > -- 
> > > > 2.17.1
> > > > 
> 
> 
