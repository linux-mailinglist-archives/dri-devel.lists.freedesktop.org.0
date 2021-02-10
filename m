Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B54531672F
	for <lists+dri-devel@lfdr.de>; Wed, 10 Feb 2021 13:56:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD27B6E0C2;
	Wed, 10 Feb 2021 12:56:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4261A6EC8E
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 12:56:37 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id q85so1439654qke.8
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 04:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=+MVRo4/XnQIx3fd6415VPGbeWHNWjyo8mTnVMpej2lA=;
 b=O53d2BI1j53KMGAaF6bzA0O5LOM9nvSszG+MG7vHXtJizZwpWW8S02aJyhNyL5wBFV
 mnrjSjqLO68+sywN8hY/2H8Q4H0Bqlujxc5cNSQ3c93vkFkfN8336ieQq2/Xd43DQ1aL
 YOcAyEETi1AONr9aaDF5ImQHc/MpJ6pnXwy8pTGJ8eFuLBgOfJUq8VwBgtsKOqasXKm6
 QOHLwog1rbX7Xi6mNrkS5/AssX+IYssu6x3VuOj/+f9dYS/3wjog1YIcNRNZuUv+X/wz
 b7Y8peA5t7BBpa1BNm/UzOpgs5ZkK1km/gtTeRC+QLirflyIAA6lwp2R/L7+gQnGKoH5
 pG7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+MVRo4/XnQIx3fd6415VPGbeWHNWjyo8mTnVMpej2lA=;
 b=YcTXtnXQ4Tuy3feU5IUv4JG1zppay0uOmDlWnhCVdCP18+opyG5izDkVgMfEruW2VY
 Ti8o0qYy14/k5jpp5kAbzt6rjAi0XA0azcMLCgve5yqMRRohVFgjRZQZ8Nlklql9uy0j
 QpU+b/xx3fV5uCAl+TCYnCfkm5QPOaNswt9mAHHQtD5QFqgkqtM+jnEomWAasNuxb+//
 gtxSzVi77GUPgwOlC6R1yrQSHxxH7L5ufoCOocuqG0s3rXRbNaqo+qslY+bzYUAmnpE3
 I5+WbDuXS0jGUMTFdGyRRXRE2HluyvudPMQTpRi/tvQesrhtZPMbobJisSzz3DY6gKfO
 3WAA==
X-Gm-Message-State: AOAM532lzYWRUMJO4PbEZOlOyf04RhdOEHMTj3tInboX6ynzdL7myBcy
 i0C4gRDboPuDYg6L13YRJ3gjrA==
X-Google-Smtp-Source: ABdhPJxjqcsRFWifv9FC85VtsN1NtJhfvFQm3LwV9wq/GU8W4tcO6YLlagLlTq+fjHi5rG8zRu4Ivw==
X-Received: by 2002:a37:a8d6:: with SMTP id r205mr3094578qke.489.1612961796341; 
 Wed, 10 Feb 2021 04:56:36 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-115-133.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.115.133])
 by smtp.gmail.com with ESMTPSA id y190sm1331727qkb.133.2021.02.10.04.56.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 04:56:35 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1l9p2o-005qZi-KG; Wed, 10 Feb 2021 08:56:34 -0400
Date: Wed, 10 Feb 2021 08:56:34 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH 1/9] mm/migrate.c: Always allow device private pages to
 migrate
Message-ID: <20210210125634.GL4718@ziepe.ca>
References: <20210209010722.13839-1-apopple@nvidia.com>
 <20210209010722.13839-2-apopple@nvidia.com>
 <20210209133932.GD4718@ziepe.ca> <1780857.6Ip0F2Sa4d@nvdebian>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1780857.6Ip0F2Sa4d@nvdebian>
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
Cc: rcampbell@nvidia.com, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org, linux-mm@kvack.org,
 jglisse@redhat.com, bskeggs@redhat.com, jhubbard@nvidia.com,
 akpm@linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 10, 2021 at 02:40:10PM +1100, Alistair Popple wrote:
> On Wednesday, 10 February 2021 12:39:32 AM AEDT Jason Gunthorpe wrote:
> > On Tue, Feb 09, 2021 at 12:07:14PM +1100, Alistair Popple wrote:
> > > Device private pages are used to represent device memory that is not
> > > directly accessible from the CPU. Extra references to a device private
> > > page are only used to ensure the struct page itself remains valid whilst
> > > waiting for migration entries. Therefore extra references should not
> > > prevent device private page migration as this can lead to failures to
> > > migrate pages back to the CPU which are fatal to the user process.
> > 
> > This should identify the extra references in expected_count, just
> > disabling this protection seems unsafe, ZONE_DEVICE is not so special
> > that the refcount means nothing
> 
> This is similar to what migarte_vma_check_page() does now. The issue is that a 
> migration wait takes a reference on the device private page so you can end up 
> with one thread stuck waiting for migration whilst the other can't migrate due 
> to the extra refcount.
> 
> Given device private pages can't undergo GUP and that it's not possible to 
> differentiate the migration wait refcount from any other refcount we assume 
> any possible extra reference must be from migration wait.

GUP is not the only thing that elevates the refcount, I think this is
an unsafe assumption

Why is migration holding an extra refcount anyhow?

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
