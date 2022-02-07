Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8254AC92A
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 20:07:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 853C410F869;
	Mon,  7 Feb 2022 19:07:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76CBE10F84F
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 19:07:03 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id 192so14627709pfz.3
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Feb 2022 11:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+WVqg4iM1IK5woHe616yKoTPDV85yaqed+lmC/0zx4Q=;
 b=E8Yv+tJ27QtdnqCiahy1ynDTxSrIHFQS9v3T6SGxOtbvrS4oJdOaAbBOu5WkKuOBfd
 YZVQDjXpyCcHf5TePEiE9WLubJVn7pkXJNntqfcUu0FB+cpVUKi2U/fVQ/r2P4FuKOGP
 rrsKex566q7w8weRBoU0ZAbtyAsexA2NArqSSGJ8aSE3asKbO/kySJdCGSVU84OEGUiB
 QCLOFQgtfcBKBXnXRpXprEE7iAtFckobPiWULixyKadweXpHSIl4fOM/cfTnhyD31lEn
 X5EcS76XqYpJKN3mK9thEa6gK63RHYW8pEdrhtUg2qPw6l/cPnln0K7VaxQOTiViReVV
 h7aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+WVqg4iM1IK5woHe616yKoTPDV85yaqed+lmC/0zx4Q=;
 b=jA0BKoazGMa5uMjeZSCrdUqZGXAyVjBEMl7c1jhfPvZ5YJpi6H+LGwRmn18HKwjX4k
 kCo1DRkJ4lIPUZEc03ZFruXiqHcfGDXbrgXz677bHTyDjEv+I/jqJWGTxcW+xqaywHBQ
 l6WNnDeOGkRN4OXrH7E05K6ud5K+sjZ7wi3/dvWVXjaEfqLU1NuDj3JBxIIdouXZbtEX
 4O9yYrM5SJxPiYtLjtOW3pCnDJ9AiSskSxZlzirysA5K9nVAxqJ6y+PMZNYb2s7H4pH1
 eWq2u7YK2Dy3cXuIcfFyoj4RWKpA6XhjrHjIZr5vKdNqR8vMFcCLDqwpW7bXjq3rSbxy
 ZD6Q==
X-Gm-Message-State: AOAM531KwR9JiEbVuQglJUVWTqbtH6IJhsZ7jzofQ71gQYPcrJ1aohTe
 nhG0i7SELzsaQHBSAx/H4vWTDvpcBhtl7CXhAeM5Rw==
X-Google-Smtp-Source: ABdhPJx4gFwHpx6eXlK2M23aHGpthiH4fAIYOpnEcI58LRfZznkCnIjyKeDQJsC3Q3CmCC8lC+fdRuCFIdo+hfnPs1A=
X-Received: by 2002:a62:784b:: with SMTP id t72mr939106pfc.86.1644260822995;
 Mon, 07 Feb 2022 11:07:02 -0800 (PST)
MIME-Version: 1.0
References: <20220207063249.1833066-1-hch@lst.de>
 <20220207063249.1833066-5-hch@lst.de>
In-Reply-To: <20220207063249.1833066-5-hch@lst.de>
From: Dan Williams <dan.j.williams@intel.com>
Date: Mon, 7 Feb 2022 11:06:52 -0800
Message-ID: <CAPcyv4ipZUeCjf5teFQuJX5DEs7ViGHW_PKKfoJEK8chjJTZig@mail.gmail.com>
Subject: Re: [PATCH 4/8] mm: move free_devmap_managed_page to memremap.c
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
> free_devmap_managed_page has nothing to do with the code in swap.c,
> move it to live with the rest of the code for devmap handling.
>

Looks good.

Reviewed-by: Dan Williams <dan.j.williams@intel.com>
