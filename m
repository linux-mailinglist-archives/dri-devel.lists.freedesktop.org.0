Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 914164ACCA3
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 00:42:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F33210E3D0;
	Mon,  7 Feb 2022 23:42:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2319710E11A
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 23:42:51 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id n32so15747978pfv.11
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Feb 2022 15:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xL7zYBxlDA9OyfIUt1+hVo3jnzbaDpzhjP+X9npLjjg=;
 b=wphYccQt9nxerxeU/p5xPEp3OdfAMZRtra+QtigCBGV2rEpNVW9+U6vtvsejhTgn8e
 AjHdHHleGcguuyudfB/EYL8nXm+kpV8ZcSykDngC+byWUyRxqjSZ/RPjTH8AXc+RnLns
 uIgVupROuzl/7/rcKGowF45+b0zBguco1bdtkEO3QuTU6AEph9xDvvOseyxx2hOke+gU
 uNJF3+A19rkf9glt328qDrxjnlD9a+5MH5956bLQ7wt6C83PtpfdJpKPQIdDraMVj14L
 rYSrK3ggYTWNdNsRn2y7f5gnAE9dOOC2PJVNruXRQWVHXWccOP1/uFHHzbWsGMDwZaME
 cPJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xL7zYBxlDA9OyfIUt1+hVo3jnzbaDpzhjP+X9npLjjg=;
 b=2ho4isvkVz3+4AlHDn2yydJWTM6oERN55gS8MuCSSYdYM/kBARpz8285xbBqDNIaNN
 vVPAlGMPKa1Eglrrgxw5lTGIHXtvZBFTU5bYwbq2WedtYi1kY8AgZC/pG+4CfWbZBqtJ
 aaUjVCVf/pek+lLy3dqZypemGmU5AqQgcCeEs5gLHI3pSte387RiERYqv3g/aDj7yhqT
 zKhe0QqllZoIfqD3kBiLCZWRMIYOAbwajoHIJ6KJT8mcceheOdLVhwHQjhyX25fY8UA6
 eWvz24gsCkU+AJHfDvBKUGOHti5p7bOHqYD91Dz0S/nLHiJcJL5z8g8vGLxukClc4/T0
 06Fg==
X-Gm-Message-State: AOAM533ZXajGc95ArVNVaITlXYQerG//gjQhUmOrP96kceSxaDrGxk6l
 e+JMLze3CPqZGK1LXMaiMTB5cc/B+4zND89wsbcp4w==
X-Google-Smtp-Source: ABdhPJwrqWzltx/fzSQ9DuX2BTfk2qmQ+rOek9DuscJqYjd5cc23devekMbaCYKV7qKyZJb3bcu/cjHgnw2J/KhyG60=
X-Received: by 2002:a65:484b:: with SMTP id i11mr1385516pgs.40.1644277370737; 
 Mon, 07 Feb 2022 15:42:50 -0800 (PST)
MIME-Version: 1.0
References: <20220207063249.1833066-1-hch@lst.de>
 <20220207063249.1833066-6-hch@lst.de>
In-Reply-To: <20220207063249.1833066-6-hch@lst.de>
From: Dan Williams <dan.j.williams@intel.com>
Date: Mon, 7 Feb 2022 15:42:39 -0800
Message-ID: <CAPcyv4iP=+jtVgdnuZjR3b-jM27zH5uk167HM=wz+=PBfvA49Q@mail.gmail.com>
Subject: Re: [PATCH 5/8] mm: simplify freeing of devmap managed pages
To: Christoph Hellwig <hch@lst.de>
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
Cc: Linux NVDIMM <nvdimm@lists.linux.dev>,
 Ralph Campbell <rcampbell@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Karol Herbst <kherbst@redhat.com>, Linux MM <linux-mm@kvack.org>,
 nouveau@lists.freedesktop.org, Felix Kuehling <Felix.Kuehling@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Ben Skeggs <bskeggs@redhat.com>, Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Logan Gunthorpe <logang@deltatee.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Feb 6, 2022 at 10:33 PM Christoph Hellwig <hch@lst.de> wrote:
>
> Make put_devmap_managed_page return if it took charge of the page
> or not and remove the separate page_is_devmap_managed helper.

Looks good to me:

Reviewed-by: Dan Williams <dan.j.williams@intel.com>
