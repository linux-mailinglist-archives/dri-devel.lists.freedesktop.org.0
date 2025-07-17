Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32202B0878F
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 10:07:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56E5C10E7CB;
	Thu, 17 Jul 2025 08:07:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 042B510E7CB
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 08:07:27 +0000 (UTC)
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mxhk.zte.com.cn (FangMail) with ESMTPS id 4bjQWc13fkz6Fy5l;
 Thu, 17 Jul 2025 16:07:24 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
 by mse-fl1.zte.com.cn with SMTP id 56H874EE006902;
 Thu, 17 Jul 2025 16:07:04 +0800 (+08)
 (envelope-from jiang.peng9@zte.com.cn)
Received: from mapi (xaxapp01[null]) by mapi (Zmail) with MAPI id mid31;
 Thu, 17 Jul 2025 16:07:07 +0800 (CST)
Date: Thu, 17 Jul 2025 16:07:07 +0800 (CST)
X-Zmail-TransId: 2af96878af2bffffffffaf5-1ab35
X-Mailer: Zmail v1.0
Message-ID: <20250717160707018ilXWr01CnLXI8dTRDVKy4@zte.com.cn>
In-Reply-To: <20250717015524-mutt-send-email-mst@kernel.org>
References: 202507171041593886W7pGra5n2hPMaT1j17NV@zte.com.cn,
 20250717015524-mutt-send-email-mst@kernel.org
Mime-Version: 1.0
From: <jiang.peng9@zte.com.cn>
To: <mst@redhat.com>
Cc: <jasowang@redhat.com>, <xuanzhuo@linux.alibaba.com>, <eperezma@redhat.com>,
 <sumit.semwal@linaro.org>, <christian.koenig@amd.com>,
 <virtualization@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <xu.xin16@zte.com.cn>, <yang.yang29@zte.com.cn>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCB2M10gdmlydGlvOiBVcGRhdGUga2VybmVsZG9jIGluIGRyaXZlcnMvdmlydGlvL3ZpcnRpb19kbWFfYnVmLmM=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl1.zte.com.cn 56H874EE006902
X-TLS: YES
X-SPF-DOMAIN: zte.com.cn
X-ENVELOPE-SENDER: jiang.peng9@zte.com.cn
X-SPF: None
X-SOURCE-IP: 10.5.228.132 unknown Thu, 17 Jul 2025 16:07:24 +0800
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6878AF3C.000/4bjQWc13fkz6Fy5l
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

> > diff --git a/drivers/virtio/virtio_dma_buf.c b/drivers/virtio/virtio_dma_buf.c
> > index 3fe1d03b0645..986cc73c503f 100644
> > --- a/drivers/virtio/virtio_dma_buf.c
> > +++ b/drivers/virtio/virtio_dma_buf.c
> > @@ -16,6 +16,8 @@
> >   * This wraps dma_buf_export() to allow virtio drivers to create a dma-buf
> >   * for an virtio exported object that can be queried by other virtio drivers
> >   * for the object's UUID.
> > + *
> > + * Returns: dma-buf pointer on success, ERR_PTR on failure.
>
> Most people write "dmabuf".

Thanks for pointing this out. In virtio_dma_buf.c specifically, "dma-buf" appears more frequently throughout the file.
 For consistency within this file, I'll keep using "dma-buf" in these docs.

> >   */
> >  struct dma_buf *virtio_dma_buf_export
> >         (const struct dma_buf_export_info *exp_info)
> > @@ -36,6 +38,14 @@ EXPORT_SYMBOL(virtio_dma_buf_export);
> >
> >  /**
> >   * virtio_dma_buf_attach - mandatory attach callback for virtio dma-bufs
> > + * @dma_buf: DMA buffer being attached to a device
>
> And here it's different for some reason.
>
> > + * @attach: Attachment metadata for the device-dma_buf association
>
> and here in a third form.

Thanks for catching the inconsistency. Here are the standardized parameter descriptions:
  @dma_buf: dma-buf being attached to a device
  @attach: Attachment metadata for the dma-buf association

> > + *
> > + * Allows virtio devices to perform device-specific setup when a DMA buffer
> > + * is attached to a device. This is part of the DMA-BUF sharing mechanism
> > + * that enables virtio devices to interoperate with other subsystems.
>
> I'm sorry this is just empty of content.
> I can not shake the feeling this is AI written.
> If we wanted AI to document all APIs in this way, I'd just script it.

I‘ll remove the generic description.

Best regards,
Peng Jiang
