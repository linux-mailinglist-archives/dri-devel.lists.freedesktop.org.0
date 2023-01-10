Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1860664DF3
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 22:20:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A05010E297;
	Tue, 10 Jan 2023 21:20:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 003E310E297
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 21:20:53 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id 203so13097936yby.10
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 13:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=84KT4Y38nuS6AqrFyQ10BjxIC1+dkLajEGpo0qupIB0=;
 b=i/6/56Gy833/2gGx1GeT3ZzLw4GAb2tQtNavrOKj4NlxFTVOWLp78X2Ov2cTpKcVsd
 AhtwTb8zNzs1JHuEhffOCDu9/95KApcUGu3AekwtGQU5lfj9CG3KbESeSgmjAxHkGK2C
 wsWa8sg2APavwS+OnGEbWnUI035DrjGNUjMbGquCiDbMaehKCoCiSvJorbDeX8NHhAu3
 FAa4PrPwhQnXLRp9VARVROA2N5OwVsGi865QW3YX/rEGLyaesZe3078I9PnGdlbFLZxR
 oXcS5AtXHOe8J8ptKKiRRWtMzlKUBsoo/PN4j1C+Emlp+1z/gMmS3LICR+7pfoG4970d
 e1NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=84KT4Y38nuS6AqrFyQ10BjxIC1+dkLajEGpo0qupIB0=;
 b=bjAAt7Pfq6BOHzycPPv6/5jFmZ6bcX5qT/BOMQy3L5g+I98POdz7WZlGmtPthgQ7x4
 pfXZfI4cjocGLlsIceCwzavLMOFWyVMjC/RIw7XiRm0i/TCz7l7v+ZPU8acvjQNdzGqc
 Zo+F78L7xLuBI+SA52aO9pio2a/RMBIOlVquBbEnnZuNn5piWCR3qEpr/bShU2v4skZH
 cGcl2Jc0+KZb3fsnLpEh7O3tkAlgWe0j4iHEgNRhc6q81gco60uk0MhlKRtvZiv3ls/f
 ss86eymLUeberTOB5F0vwQtGTesIg0qjB9WHTV7VphBuR4CUcQMNDn5vGBeyJITDLTjd
 BC+w==
X-Gm-Message-State: AFqh2krcUg3rh5i2h4g2UJTYT65WH/C5GyYfwUGgqxZug0ZYg1SO4uSI
 aMfnCCK0EjuJmEl6q1GyGPmBQgO8pPD1nwEeRl1cQw==
X-Google-Smtp-Source: AMrXdXtxQf7auE0xRMOWiMXojs73pb+1H3ND26svrQT5CSOEUgrdcb+PU3bWS05ph908nwkFJn3XixWD2o+uI4W6Tzs=
X-Received: by 2002:a25:ac8e:0:b0:7c0:d1d:3193 with SMTP id
 x14-20020a25ac8e000000b007c00d1d3193mr468341ybi.61.1673385653016; Tue, 10 Jan
 2023 13:20:53 -0800 (PST)
MIME-Version: 1.0
References: <20230109213809.418135-1-tjmercier@google.com>
 <20230109213809.418135-4-tjmercier@google.com>
 <20230110014720.281-1-hdanton@sina.com>
In-Reply-To: <20230110014720.281-1-hdanton@sina.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 10 Jan 2023 13:20:42 -0800
Message-ID: <CABdmKX11WP-ijLbU34Y7GG21NtqsCyMVyhnkxMMnL_hG7+TV6g@mail.gmail.com>
Subject: Re: [PATCH 3/4] binder: Add flags to relinquish ownership of fds
To: Hillf Danton <hdanton@sina.com>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, Tejun Heo <tj@kernel.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 9, 2023 at 6:07 PM Hillf Danton <hdanton@sina.com> wrote:
>
> On 9 Jan 2023 21:38:06 +0000 T.J. Mercier <tjmercier@google.com>
> >
> > @@ -2275,6 +2276,26 @@ static int binder_translate_fd(u32 fd, binder_size_t fd_offset,
> >               goto err_security;
> >       }
> >
> > +     if (IS_ENABLED(CONFIG_MEMCG) && (flags & BINDER_FD_FLAG_XFER_CHARGE)) {
> > +             struct dma_buf *dmabuf;
> > +
> > +             if (unlikely(!is_dma_buf_file(file))) {
> > +                     binder_user_error(
> > +                             "%d:%d got transaction with XFER_CHARGE for non-dmabuf fd, %d\n",
> > +                             proc->pid, thread->pid, fd);
> > +                     ret = -EINVAL;
> > +                     goto err_dmabuf;
> > +             }
>
> It barely makes sense to expose is_dma_buf_file() only for this.
> > +
> > +             dmabuf = file->private_data;
> > +             ret = dma_buf_transfer_charge(dmabuf, target_proc->tsk);
> > +             if (ret) {
> > +                     pr_warn("%d:%d Unable to transfer DMA-BUF fd charge to %d\n",
> > +                             proc->pid, thread->pid, target_proc->pid);
> > +                     goto err_xfer;
> > +             }
> > +     }
> > +
>
> This whole hunk should go to dma-buf instead by adding change to
> dma_buf_transfer_charge() for instance.

Fair enough, will change this for v2. I think we'd still want to
distinguish between the two failure modes for logging purposes, so
I'll use the return value of dma_buf_transfer_charge to do that.
