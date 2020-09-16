Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6255C26C48E
	for <lists+dri-devel@lfdr.de>; Wed, 16 Sep 2020 17:49:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B51966EA57;
	Wed, 16 Sep 2020 15:49:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 778F96E135
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 14:07:13 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id w186so8277719qkd.1
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 07:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=La99VFybE95ljQbGxohkbmDHsRKJC2A6ovW4ZDnoPGg=;
 b=VOJ9CnElE1tIzpvRDzSJxLQXWm/++E5FKZhGlhD2qVUn6aMIi84JEKIgO4BLKBmrP8
 08+579lu3VaATYWW4i8PGHX9Si56Ffjc2npOiCodIUUWmw/m9Buy2lOkdee413PzBJtT
 x9mYMzsldhpi7ImCKJBtzzGQ3/8cMBlG1qLA+/dMmxPgByr1NS/GqvGpDW5O/vceKxtJ
 +XQSEKzGfX7GYU0a3pfCCcvviY717MYm16mP2bE42kUhSaKvxtNvUTUwkG+cuUo+ADJz
 ftd1VkfL3CHhvcCXW38fSX0htUIapxKqapCQC8eiBeQHlHvZFfCUe4nIqG0OLueSoAQq
 4aWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=La99VFybE95ljQbGxohkbmDHsRKJC2A6ovW4ZDnoPGg=;
 b=Zl/Ta0wHufLfnBECVK9ZLVF+z3rJK37q1Pi/6tRNJIEpMavy/5e0GVm/mSD3s//e0q
 EZpTEx5vq5e6YtM+Ns2jzPvglkW65Lo5sUWsPBBnI26pbJ2V1umEyq+vq46EcExMhDuS
 aNNCBxCCE4eQud2hEjeQyQbxg/tyS0xZGRaCS/MVi0Y1hv1G8IKnGO2+ft/PruWarYfi
 h+cDYib7BQr1qsbKuTht4iyP2mgvWfhwJsUB57dRZlwlj+gYVlhxsOyGWrxdYU0Jcp/f
 Ks9Tx3yWXn14vZwUxZrlrCB4G26Mr+QLgWq9vY98l68HrEGU0GIocFqAganvgnYY9/4T
 IakQ==
X-Gm-Message-State: AOAM532NxX/x1bU6KACUO6lLBwjzvgAXVgRHTwxvDjhGdxtViaWfkyFV
 bqLn5MniL7OBKTccQAW13MFwXFgIUjePSJ79
X-Google-Smtp-Source: ABdhPJyGvoVtODTTRAjWRbOAqjMljnU8wALvrzaWChMgxILat6SxGUHhK0nHHjrTElsiKnfbm48/tg==
X-Received: by 2002:a37:84f:: with SMTP id 76mr22783375qki.251.1600265232291; 
 Wed, 16 Sep 2020 07:07:12 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id k48sm20623786qtk.44.2020.09.16.07.07.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 07:07:11 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kIY5W-0002hp-NA; Wed, 16 Sep 2020 11:07:10 -0300
Date: Wed, 16 Sep 2020 11:07:10 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: christian.koenig@amd.com, akpm@linux-foundation.org,
 sumit.semwal@linaro.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: Changing vma->vm_file in dma_buf_mmap()
Message-ID: <20200916140710.GA8409@ziepe.ca>
References: <20200914132920.59183-1-christian.koenig@amd.com>
 <40cd26ae-b855-4627-5a13-4dcea5d622f6@gmail.com>
 <20200914140632.GD1221970@ziepe.ca>
 <9302e4e0-0ff0-8b00-ada1-85feefb49e88@gmail.com>
 <20200916095359.GD438822@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200916095359.GD438822@phenom.ffwll.local>
X-Mailman-Approved-At: Wed, 16 Sep 2020 15:49:22 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 16, 2020 at 11:53:59AM +0200, Daniel Vetter wrote:

> But within the driver, we generally need thousands of these, and that
> tends to bring fd exhaustion problems with it. That's why all the private
> buffer objects which aren't shared with other process or other drivers are
> handles only valid for a specific fd instance of the drm chardev (each
> open gets their own namespace), and only for ioctls done on that chardev.
> And for mmap we assign fake (but unique across all open fd on it) offsets
> within the overall chardev. Hence all the pgoff mangling and re-mangling.

Are they still unique struct files? Just without a fdno?
 
> Hence why we'd like to be able to forward aliasing mappings and adjust the
> file and pgoff, while hopefully everything keeps working. I thought this
> would work, but Christian noticed it doesn't really.

It seems reasonable to me that the dma buf should be the owner of the
VMA, otherwise like you say, there is a big mess attaching the custom
vma ops and what not to the proper dma buf.

I don't see anything obviously against this in mmap_region() - why did
Chritian notice it doesn't really work?

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
