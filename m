Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1FD173258
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2020 09:00:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFD376EE40;
	Fri, 28 Feb 2020 08:00:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D57F6ED5C
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 21:38:15 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id d62so734600oia.11
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 13:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MS04y4tC6v0yvFrubQXJfXoPpIt2cXWeU3+olbxgrlI=;
 b=axo31MdcQ0SZroPbHQ++aFLzgIHEwq5vyQmASKUqoegs88CC0tgZu9O7eDyL8J/kNS
 e1U2J0oHIaBaMgApSTJQdFAm65z8sagrmcsRCVbnWAPaBbcn8yDOC3JCYvxixGXmi7uj
 gbo7aZam4fEhNeEwozgiiHliXdQMlC3m2mPzMu9LbVNvwbShUiO6yr0jhSkHw4kD4UGw
 Nd5S+wyxBintX5vg2LowZpAlZmXkXN2i6L+9ktRiGj0Rv/s779IWREgeXVKEX8Dggtle
 tt4VDmhJJRlqW6CbV6UWAWH4hae8IuvRVetpWkkHYOH+p+l5OzxNqp9zfpfOwrVK0pW/
 yvuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MS04y4tC6v0yvFrubQXJfXoPpIt2cXWeU3+olbxgrlI=;
 b=ts8KpgPOXCb4K2QRtSPPm14UyvMurHXoHCbDZRpyq9Eyr1Mt29r9OXiQE1qmpk+8xm
 HU0uQ39aUQ4Z383uHPmKxncRIOyCCbQa/k36OCL14vr7zyTtbamuQsrGjejLvBdSsjm3
 odeS4hUKP+TRjj1DEu1vNRMkeRj+RWRMjE3SoBcxj6sy1Y02jtSw6eLDC+zSFamD9Ax8
 1jhGueQupu3qQoCQz0d1S2YN8VFIBgmPa8GLDp4Brx+NJVhR7Umh9rEU0xYHVQtZifXV
 /r8s9AKTUW1zubUa+VJrBjSBk5K4zCYgHLE9VGLuG2WRlpI1MA161zRzG9fvDrHtFyQR
 5Rjw==
X-Gm-Message-State: APjAAAUGcIqPRJqtamy5IdsypCBWP3HIMaac1zL/tfljKZynNPPneMKN
 xkOJh1/sV5mEZRAHilliTyNew04HCRduyxU5OXc=
X-Google-Smtp-Source: APXvYqxCEKKThcyTyMOksvnHs/9A9wJ38y7/5HmoEZLOVcUi/4u4L0/dM8f0vFH7F8M33vJBdy3wbRzEA8zEi38CXtQ=
X-Received: by 2002:aca:1215:: with SMTP id 21mr842995ois.5.1582839494675;
 Thu, 27 Feb 2020 13:38:14 -0800 (PST)
MIME-Version: 1.0
References: <20200225204446.11378-1-xiyou.wangcong@gmail.com>
 <20200225175418.2d3af2180cbf895b727ce4b1@linux-foundation.org>
In-Reply-To: <20200225175418.2d3af2180cbf895b727ce4b1@linux-foundation.org>
From: Cong Wang <xiyou.wangcong@gmail.com>
Date: Thu, 27 Feb 2020 13:38:03 -0800
Message-ID: <CAM_iQpU7kXXGuxeOVvAGLoBRvjrhpuw2D=ih=PagGXKK-g_muw@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: free dmabuf->name in dma_buf_release()
To: Andrew Morton <akpm@linux-foundation.org>
X-Mailman-Approved-At: Fri, 28 Feb 2020 07:59:27 +0000
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
Cc: Chenbo Feng <fengc@google.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 syzbot+b2098bc44728a4efb3e9@syzkaller.appspotmail.com,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 25, 2020 at 5:54 PM Andrew Morton <akpm@linux-foundation.org> wrote:
>
> On Tue, 25 Feb 2020 12:44:46 -0800 Cong Wang <xiyou.wangcong@gmail.com> wrote:
>
> > dma-buff name can be set via DMA_BUF_SET_NAME ioctl, but once set
> > it never gets freed.
> >
> > Free it in dma_buf_release().
> >
> > ...
> >
> > --- a/drivers/dma-buf/dma-buf.c
> > +++ b/drivers/dma-buf/dma-buf.c
> > @@ -108,6 +108,7 @@ static int dma_buf_release(struct inode *inode, struct file *file)
> >               dma_resv_fini(dmabuf->resv);
> >
> >       module_put(dmabuf->owner);
> > +     kfree(dmabuf->name);
> >       kfree(dmabuf);
> >       return 0;
> >  }
>
> ow.  Is that ioctl privileged?

It looks unprivileged to me, as I don't see capable() called along
the path.

Thanks.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
