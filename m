Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0646E485891
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jan 2022 19:38:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 976AC10EEA4;
	Wed,  5 Jan 2022 18:38:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC96E10EF19
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jan 2022 18:38:38 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id 139so516302ybd.3
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jan 2022 10:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KDSSdl8IkbacxfFwsObHrS3PgJqOAa/GBT59WYZWGOY=;
 b=hUkWbHbz2hswycTdHLnrAm/MuO98IXDtZgYocw1/GhNAggTm949CZWE6RzTXjapTkW
 VS/DmW3iWzF0xKhT605D1XzwhMahz1ldavEJ2ZiPOQQzZEHJm7O71WALq9e/xkPsHQA4
 ENSyX5bKdJpqS3MOLxFVwu64vbML9heMh50dW8sH9YnMBKvfUfcsOO8Wz+cVwujxsZ/V
 Qek2oUB3vP8MzA5MMbz7HhUs52Zm1EXLKmd3xp8VauwoxCaEEjyLisUAc9Fet3GlfJT+
 x2L3Vjm7P/YbuIV7Wv7W7JxbyKct7n0LHl+DvlGmfCdNG+6DoeOyNtA41DfLDsswyNoH
 onrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KDSSdl8IkbacxfFwsObHrS3PgJqOAa/GBT59WYZWGOY=;
 b=QiwWeFFelAG7S/HMv3h6i7h3aozQ9vrxyvb7xluNWsUS2DGpUD1ESTB1WqzCInzalE
 CKwp1tVwydRMVoMlh3iDOznLgG0ZaDWcAVTGs0CpiDnfpx6TcZzK7tfmvm03FIoP9T2I
 XPFyr8UEIbO/0kQh9jWOaN8/aco56qGDhW9/Wou4DZa0zz6IRKAdC/syEV/IqwsKYP3E
 +Ns5wip765Xv4r2kQ6Iarhsx42jefYvbFyEi3dvVy62j1qPNBAEwRc458zitVUfnrhne
 bULTqQcl7sd05uO0talW+RjgDAivAf5T4flpGGgqDM1zVdLERp2OEhmwrZNXI80knIv5
 eAkw==
X-Gm-Message-State: AOAM531dxdy/LNmVn93JhsCxMMRuR3w9XUBfbK+A0jYO/K5q7c1KVSQC
 Bm+1+uP56FZjEPP3gL0mpt/4cb8jN61Hq/NcARUQTQ==
X-Google-Smtp-Source: ABdhPJxb7sBxKDM43T6iP1tu6DArcpsKXXzzig25USibmzC/QeMkWpl4LwfoJZyuV92oHcxUzXWi2NF5BZOIohtw5jg=
X-Received: by 2002:a25:ae13:: with SMTP id a19mr52540860ybj.327.1641407917644; 
 Wed, 05 Jan 2022 10:38:37 -0800 (PST)
MIME-Version: 1.0
References: <20220104235148.21320-1-hridya@google.com>
 <YdW1hPRvKYjfORvp@kroah.com>
In-Reply-To: <YdW1hPRvKYjfORvp@kroah.com>
From: Hridya Valsaraju <hridya@google.com>
Date: Wed, 5 Jan 2022 10:38:02 -0800
Message-ID: <CA+wgaPPSO1f=c+jYWqisNy_e8hxuxcr0VtpJcWe+FnKGyC2ZKg@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: Move sysfs work out of DMA-BUF export/release
 path
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, keescook@google.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, kaleshsingh@google.com, surenb@google.com,
 tjmercier@google.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 5, 2022 at 7:13 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Jan 04, 2022 at 03:51:48PM -0800, Hridya Valsaraju wrote:
> > Recently, we noticed an issue where a process went into direct reclaim
> > while holding the kernfs rw semaphore for sysfs in write(exclusive)
> > mode. This caused processes who were doing DMA-BUF exports and releases
> > to go into uninterruptible sleep since they needed to acquire the same
> > semaphore for the DMA-BUF sysfs entry creation/deletion. In order to avoid
> > blocking DMA-BUF export/release for an indeterminate amount of time
> > while another process is holding the sysfs rw semaphore in exclusive
> > mode, this patch moves the per-buffer sysfs file creation/deleteion to
> > a kthread.
> >
> > Fixes: bdb8d06dfefd ("dmabuf: Add the capability to expose DMA-BUF stats in sysfs")
> > Signed-off-by: Hridya Valsaraju <hridya@google.com>
> > ---
> >  drivers/dma-buf/dma-buf-sysfs-stats.c | 343 ++++++++++++++++++++++++--
> >  include/linux/dma-buf.h               |  46 ++++
> >  2 files changed, 366 insertions(+), 23 deletions(-)
>
> Crazy, but if this works in your testing, it looks ok to me.  Nice work.
>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Thank you for the review Greg :)
