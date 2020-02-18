Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F607163ED7
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 09:20:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 113886EB2A;
	Wed, 19 Feb 2020 08:20:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 006B56EA6E
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 18:41:28 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id j23so1461067qtr.11
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 10:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+8trNULk0p7YTqlS76VkwaHxCoBJjgc3YSZwDVrMPcc=;
 b=h6M6HrVl/s5ivPkO5Z1ae1j41oRDK/YZ/CMQeyTHeCm70Xf8uzH3NUd2U1TEIBQctu
 zaEPJnigmUn3fvfj0Sa0Vtkti5inbKWVcYrGvzz2Z9j3tAywKdkucVFFz9PkvyoLP6wY
 /5mIIY9IuOmrH7z2JMau9X++QuLwtDTXvMskap9MpzjyVWX//o0rQmGkyGijHqEUft0+
 AU7HWAlmw783ySPgijXZvqNYfdh2o/ASnQ85K/RkvHNBsduuWv8f5kxmfZKVXm30kVa7
 V0121A5vUilpN8Q72rXVxAfFiad3uPlDcFp8JTCASh2TMuKUxiBf1gGHBdEe1Hb0xtjP
 zpcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+8trNULk0p7YTqlS76VkwaHxCoBJjgc3YSZwDVrMPcc=;
 b=oBhZc51CifJvJ92073f0thQGjXlDEncx49uE1coHmfx81pWTIbURYonFtuIpe094Mx
 tWyyfEnKA5zevCqunGtSoTcEdVQI0kRlC4Nz44clkHz14m4Y4m0SwZkey3EL5jecW8fE
 n3SF9aeiXd+Yz9Mu/c4Cor9Pe8ueqbHKZgQAez+yEqwtKARbqN6SKyU8obdCOT2EguQ8
 DgFw944DGk5FWoE8NDPqElqGScmzKshZa+gicu43uJShuJaTtmq57qpOWWsxT3YMPv0s
 b2luNehcuoRDu27UQSGA8Kd4e4Lu7ebq6Ann3+rM+lA0BLUOSsMFXVZAOzbYX4R370K6
 COnQ==
X-Gm-Message-State: APjAAAW7u1jkOBD2nBPlDEJqld3kORA+Z8rVdRsBgOsnAl2/g+dA2OLl
 DehLXT1XC47zb66dhk4BgBId9n0cZUmtTJ0Y4Dq1axYhlIJIwQ==
X-Google-Smtp-Source: APXvYqwNn+oeDOLhVeJz9u7cgOo+LDlda9ul4xQGNdm+tuTn6q87++mwk68MeqHh4jfoH64EprmRSvnltHAJHxaIXcI=
X-Received: by 2002:ac8:2ffa:: with SMTP id m55mr18764287qta.189.1582051287712; 
 Tue, 18 Feb 2020 10:41:27 -0800 (PST)
MIME-Version: 1.0
References: <20191227063204.5813-1-xiyou.wangcong@gmail.com>
In-Reply-To: <20191227063204.5813-1-xiyou.wangcong@gmail.com>
From: Chenbo Feng <fengc@google.com>
Date: Tue, 18 Feb 2020 10:41:16 -0800
Message-ID: <CAMOXUJ=mvh0Aj-==wmPGh6x3dz0K3YTfaSw+osMwU=rgQv+Qkw@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: free dmabuf->name in dma_buf_release()
To: Cong Wang <xiyou.wangcong@gmail.com>
X-Mailman-Approved-At: Wed, 19 Feb 2020 08:19:59 +0000
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
Cc: LKML <linux-kernel@vger.kernel.org>, Greg Hackmann <ghackmann@google.com>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 syzbot+b2098bc44728a4efb3e9@syzkaller.appspotmail.com,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Acked-by: Chenbo Feng <fengc@google.com>


On Thu, Dec 26, 2019 at 10:32 PM Cong Wang <xiyou.wangcong@gmail.com> wrote:
>
> dma-buff name can be set via DMA_BUF_SET_NAME ioctl, but once set
> it never gets freed.
>
> Free it in dma_buf_release().
>
> Fixes: bb2bb9030425 ("dma-buf: add DMA_BUF_SET_NAME ioctls")
> Reported-by: syzbot+b2098bc44728a4efb3e9@syzkaller.appspotmail.com
> Cc: Greg Hackmann <ghackmann@google.com>
> Cc: Chenbo Feng <fengc@google.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Signed-off-by: Cong Wang <xiyou.wangcong@gmail.com>
> ---
>  drivers/dma-buf/dma-buf.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index ce41cd9b758a..2427398ff22a 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -108,6 +108,7 @@ static int dma_buf_release(struct inode *inode, struct file *file)
>                 dma_resv_fini(dmabuf->resv);
>
>         module_put(dmabuf->owner);
> +       kfree(dmabuf->name);
>         kfree(dmabuf);
>         return 0;
>  }
> --
> 2.21.0
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
