Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B3241B746
	for <lists+dri-devel@lfdr.de>; Tue, 28 Sep 2021 21:13:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDD726E95B;
	Tue, 28 Sep 2021 19:13:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58E036E950;
 Tue, 28 Sep 2021 19:13:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3384A6135E;
 Tue, 28 Sep 2021 19:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632856393;
 bh=7B069zu3fIEzc7J70Px6o5DhIK24ITV1Z/pXFm5SPE0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=l6f3rhKcvzS0cbgcm8Mrrz4ooPJZlG/4m1v9BWnHnLbjLhFxTHio3iJqUb30rWppT
 bkrU3N/7CrsynPS44VKf0F2VQiuAKkNUFlNPTayOIUECmpi5i8qpKmMSC/lBmgtS7j
 X4kQkoxKPRo4YEiG5j2cprdm3SqnXAJO0aQYTGHuo1F1PYDZMuTo0r+HG+4p53LGkx
 6g2hElAnx6lHAbgmMZ4OmahFoV7S1PCe5RpOroGQpbz3A8K5WRGTW29H9j5IXkbBGD
 3mQlgTa3+GnIvq5ZXBvfbIyXjy3El0UVXSA16dxV71BieYlJXPFw3G4y+ns8x5uyUQ
 yBbjLwWqCZu2w==
Received: by mail-yb1-f176.google.com with SMTP id m70so34039334ybm.5;
 Tue, 28 Sep 2021 12:13:13 -0700 (PDT)
X-Gm-Message-State: AOAM5301TARsb6oM2OFlQtCqA4kRDNClQyPmoK6hF5yqdAmnCPX6P9La
 0utYopZC2tS4s6s3EEoKQv5sblejluQCt//p3Z0=
X-Google-Smtp-Source: ABdhPJzG+BFlkram6wvHYJeDdwoU4EG8PEfLiuo+UnYK/GvSnKWgTPJ0sB5vh6yCxEX5jumwKy2fpW82HRuvpNo3wUE=
X-Received: by 2002:a25:3614:: with SMTP id d20mr8888513yba.537.1632856392408; 
 Tue, 28 Sep 2021 12:13:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210912165309.98695-1-ogabbay@kernel.org>
 <20210912165309.98695-2-ogabbay@kernel.org>
 <20210928171329.GF3544071@ziepe.ca>
In-Reply-To: <20210928171329.GF3544071@ziepe.ca>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Tue, 28 Sep 2021 22:12:45 +0300
X-Gmail-Original-Message-ID: <CAFCwf11_2TTVnqr8HqrsCW6cxUHu9txKuX-3U6mgMVPq8WqKdg@mail.gmail.com>
Message-ID: <CAFCwf11_2TTVnqr8HqrsCW6cxUHu9txKuX-3U6mgMVPq8WqKdg@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] habanalabs: define uAPI to export FD for DMA-BUF
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Daniel Vetter <daniel.vetter@ffwll.ch>, Gal Pressman <galpress@amazon.com>, 
 Yossi Leybovich <sleybo@amazon.com>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 linux-rdma <linux-rdma@vger.kernel.org>, 
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Doug Ledford <dledford@redhat.com>, 
 Dave Airlie <airlied@gmail.com>, Alex Deucher <alexander.deucher@amd.com>, 
 Leon Romanovsky <leonro@nvidia.com>, Christoph Hellwig <hch@lst.de>, 
 amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>
Content-Type: text/plain; charset="UTF-8"
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

On Tue, Sep 28, 2021 at 8:13 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Sun, Sep 12, 2021 at 07:53:08PM +0300, Oded Gabbay wrote:
> >       /* HL_MEM_OP_* */
> >       __u32 op;
> > -     /* HL_MEM_* flags */
> > +     /* HL_MEM_* flags.
> > +      * For the HL_MEM_OP_EXPORT_DMABUF_FD opcode, this field holds the
> > +      * DMA-BUF file/FD flags.
> > +      */
> >       __u32 flags;
> >       /* Context ID - Currently not in use */
> >       __u32 ctx_id;
> > @@ -1072,6 +1091,13 @@ struct hl_mem_out {
> >
> >                       __u32 pad;
> >               };
> > +
> > +             /* Returned in HL_MEM_OP_EXPORT_DMABUF_FD. Represents the
> > +              * DMA-BUF object that was created to describe a memory
> > +              * allocation on the device's memory space. The FD should be
> > +              * passed to the importer driver
> > +              */
> > +             __u64 fd;
>
> fd's should be a s32 type in a fixed width uapi.
Yep, will correct this.

>
> I usually expect to see the uapi changes inside the commit that
> consumes them, splitting the patch like this seems strange but
> harmless.
I'll remember that when I send the RDMA patches down the road :)

Thanks,
Oded
>
> Jason
