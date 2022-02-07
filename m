Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9534AC835
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 19:08:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A84D310E3A5;
	Mon,  7 Feb 2022 18:08:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F61110E3AC
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 18:08:12 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id m7so13615818pjk.0
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Feb 2022 10:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nxHF7bigQnfZfNGCQpq6EtXcG8/j6GHHAEIHGHy2fyU=;
 b=W2DDXQJis+1qeQfXY6E/rxnSkSH+QKQccGw4pZqh3cKQQ7Ll28D21ZTANWBpjdTXkB
 +oBg0dRp7zXiF2K9fvNxjOnqLQ0NU4tSCX/uoDUgYXiPcW3lrnrEZ8WrBiPWSBgY4/tx
 9wQBgc3U+/16XX6zr1IGWZp+OTMhC+7AmHWl4HQOtmJdf1TDvqV9PwZseP44xIAvTKTJ
 lY9+rCsDVlGtJn+K+JfRbJQJUoxEyKL8bHmbimQ1ptdoTfcpwUfxMxs8lIMS2tr1n+Up
 0WNvMspuYRbKnLIowW6FPQwT66Mrqlup7UTEmGoUmJqEmINAArubT4xrd5hjAe0QVo24
 gEeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nxHF7bigQnfZfNGCQpq6EtXcG8/j6GHHAEIHGHy2fyU=;
 b=dw5P73RBgANhBBV/2EcoVSRKvpFOkm4Uw/IawEa1WGvsNySjVbNZIv/g5RNKfwKXdv
 aupi8pyfeq5RcvK+8Etk1FVlnnfZkO0RTLzSBn5OVNn+R//IrBZUWsBLAvX2pTS7BRgx
 ZQWcJ7wmXIf3DsOOywkYxzYsXymQvl+jN1cEt0vQKVthXBXAmDrLRMkFvI+EQa3gmkNa
 MvC0SL34oake+mu3iwkYL8QhYywCL6mMuuRwvQVe/edZMDOjN+8mAj1dTxmnCa/OUFyQ
 pRgscFVsPvxf/4n2C0sH2Sd7iM3A0VK34nbvjuTbjIQ6/WUC/mdj+CUzeace2CcqHmfr
 oi/Q==
X-Gm-Message-State: AOAM533zGZWaDtCr2mEjKnzFFB8PG62Hyr26ezC0FnzAtyp+1Inok0kz
 2vMc/wOeENRahEKOKVdR7iOPWYcEgxzd4MahkmyCvw==
X-Google-Smtp-Source: ABdhPJxbjfLp1vymzfVN/rUSu7NFfwM27TjFOxcEJErT+R82ivD+XXC3ZWylDTpvE/Ebzm6hUwz4bOsdTAqXcC6BA2A=
X-Received: by 2002:a17:902:ccce:: with SMTP id
 z14mr815477ple.34.1644257292200; 
 Mon, 07 Feb 2022 10:08:12 -0800 (PST)
MIME-Version: 1.0
References: <20220207063249.1833066-1-hch@lst.de>
 <20220207063249.1833066-2-hch@lst.de>
In-Reply-To: <20220207063249.1833066-2-hch@lst.de>
From: Dan Williams <dan.j.williams@intel.com>
Date: Mon, 7 Feb 2022 10:08:01 -0800
Message-ID: <CAPcyv4iKLXJftFL+jdAXFXt6-fjwSdK9D2un9PywfXDT0W7HzQ@mail.gmail.com>
Subject: Re: [PATCH 1/8] mm: remove a pointless CONFIG_ZONE_DEVICE check in
 memremap_pages
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
> memremap.c is only built when CONFIG_ZONE_DEVICE is set, so remove
> the superflous extra check.

Looks good to me.

Reviewed-by: Dan Williams <dan.j.williams@intel.com>
