Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4423342A097
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 11:06:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB0256E808;
	Tue, 12 Oct 2021 09:06:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 448D56E808
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 09:06:07 +0000 (UTC)
X-UUID: 7ab4f167e4e14508a0f398268e47d28f-20211012
X-UUID: 7ab4f167e4e14508a0f398268e47d28f-20211012
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <guangming.cao@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1131730382; Tue, 12 Oct 2021 17:06:04 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 12 Oct 2021 17:06:03 +0800
Received: from mszswglt01.gcn.mediatek.inc (10.16.20.20) by
 mtkcas11.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Tue, 12 Oct 2021 17:06:02 +0800
From: <guangming.cao@mediatek.com>
To: <christian.koenig@amd.com>
CC: <dri-devel@lists.freedesktop.org>, <guangming.cao@mediatek.com>,
 <linaro-mm-sig@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
 <sumit.semwal@linaro.org>, <wsd_upstream@mediatek.com>, Guangming Cao
 <Guangming.Cao@mediatek.com>
Subject: Re: [PATCH v2] dma-buf: acquire name lock before read/write
 dma_buf.name
Date: Tue, 12 Oct 2021 17:07:55 +0800
Message-ID: <20211012090755.177441-1-guangming.cao@mediatek.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <169957a7-302b-1de9-39b0-415c4675743a@amd.com>
References: <169957a7-302b-1de9-39b0-415c4675743a@amd.com>
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

> Am 08.10.21 um 09:54 schrieb guangming.cao@mediatek.com:
> > From: Guangming Cao <Guangming.Cao@mediatek.com>
> >
> > Because dma-buf.name can be freed in func: "dma_buf_set_name",
> > so, we need to acquire lock first before we read/write dma_buf.name
> > to prevent Use After Free(UAF) issue.
> >
> > Signed-off-by: Guangming Cao <Guangming.Cao@mediatek.com>
> 
> Reviewed-by: Christian König <christian.koenig@amd.com>
> 
> Going to push that upstream if nobody else objects.
> 
> Thanks,
> Christian.

I'm sorry to disturb you, actually I need this patch to solve our issues.
Is there any question about it? seems it hasn't been merged into mainline.

Thanks,
Guangming.
> 
> > ---
> >   drivers/dma-buf/dma-buf.c | 3 +++
> >   1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > index 511fe0d217a0..a7f6fd13a635 100644
> > --- a/drivers/dma-buf/dma-buf.c
> > +++ b/drivers/dma-buf/dma-buf.c
> > @@ -1372,6 +1372,8 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
> >   		if (ret)
> >   			goto error_unlock;
> >   
> > +
> > +		spin_lock(&buf_obj->name_lock);
> >   		seq_printf(s, "%08zu\t%08x\t%08x\t%08ld\t%s\t%08lu\t%s\n",
> >   				buf_obj->size,
> >   				buf_obj->file->f_flags, buf_obj->file->f_mode,
> > @@ -1379,6 +1381,7 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
> >   				buf_obj->exp_name,
> >   				file_inode(buf_obj->file)->i_ino,
> >   				buf_obj->name ?: "");
> > +		spin_unlock(&buf_obj->name_lock);
> >   
> >   		robj = buf_obj->resv;
> >   		fence = dma_resv_excl_fence(robj);

