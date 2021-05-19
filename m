Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DF9388FF8
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 16:09:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C1D36EDC8;
	Wed, 19 May 2021 14:09:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A42C6EDC3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 14:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621433379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uA5LBQUpQQcpe5I2oDgwRimXB7jI4me/eAnHY5LMMkc=;
 b=QZoouhKRvFvtERgoGOmJnf9pIblfrwfd2yOU1vG6/wmlQElw362ziYQK7zfrWnvWnss3MK
 W6/K9zEKeplRIEfB44Q9jdA/iGbzuQSAKE/3+D5Jm98GI3JBIE2FJV7+n8FS/+bLIkALbf
 4VP0n0o8wRakA/bt8EIa2OT+LTfK2Mk=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-Uz0ecBNnOz-Z9ndqTfRe7g-1; Wed, 19 May 2021 10:09:35 -0400
X-MC-Unique: Uz0ecBNnOz-Z9ndqTfRe7g-1
Received: by mail-qv1-f71.google.com with SMTP id
 bc3-20020ad456830000b02901f47dbd7ef6so474769qvb.6
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 07:09:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uA5LBQUpQQcpe5I2oDgwRimXB7jI4me/eAnHY5LMMkc=;
 b=cibNHZ0nXgNEQ7qG2XaYnObPbgHpl64LY8Q6D7sZ8sEn7+IC9SAD9YScTWw46yHJgf
 /WtK/5BcBL1Dkh7WeDhkDeHRHBwwURXoP0gdFAotctn73VuG7+VkiYDcRerrliJAqJj5
 PoG3YK4gIym+bI+AqR5vyobU6pMooDaVX0a8NvdnoAGDh9BCVlL391faAXaqxo+ilYfR
 9RCsDQYXckBM8cEls/A1kxyEAnSmsrm5Ooh0DOu/MiCRnaM0fczO0EkHYZRO0Ehx0zYE
 +D62cr4EkSqDlp/bZ8931I/PzefkM4DaSJkcBKh/wiCkCmMIbKu9inu5XIQ75t9drOIh
 Mx9A==
X-Gm-Message-State: AOAM5308xMasfh+ijEISBRipHrStIaSetehTLNFtoNVqXTNip9hzH/LV
 19nATapPll9QZyGTF4+nx7ePBl0bDKao5avd7KVH5itaEm3fy/uT6IhKUFXy3eIkwM7B6iagsap
 DOGVZJs8gV8mgDrnho8SF12ey/1J6
X-Received: by 2002:a05:622a:413:: with SMTP id
 n19mr11309606qtx.238.1621433375268; 
 Wed, 19 May 2021 07:09:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwfgXghdceBt0pzuJuLcMWZrj1qSDnzHPuTLDIdA4muPS9QaO8qeOo+lEtQMgzjzxGPQ17Ppg==
X-Received: by 2002:a05:622a:413:: with SMTP id
 n19mr11309576qtx.238.1621433375015; 
 Wed, 19 May 2021 07:09:35 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-72-184-145-4-219.dsl.bell.ca.
 [184.145.4.219])
 by smtp.gmail.com with ESMTPSA id c20sm15634299qtm.52.2021.05.19.07.09.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 07:09:34 -0700 (PDT)
Date: Wed, 19 May 2021 10:09:33 -0400
From: Peter Xu <peterx@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v8 5/8] mm: Device exclusive memory access
Message-ID: <YKUcHfhQMbDnjXC7@t490s>
References: <YKMhorngO2DVrxac@t490s> <47694715.suB6H4Uo8R@nvdebian>
 <YKP5Dj4Q/riGGc43@t490s> <20210518173334.GE1002214@nvidia.com>
 <YKQBACJCjsxeM3ro@t490s> <20210518194509.GF1002214@nvidia.com>
 <YKQjmtMo+YQGx/wZ@t490s> <20210518230327.GG1002214@nvidia.com>
 <YKRRgZmRMdk1vH7A@t490s> <20210519132842.GJ1002214@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20210519132842.GJ1002214@nvidia.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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
Cc: rcampbell@nvidia.com, willy@infradead.org, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, bsingharora@gmail.com,
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hch@infradead.org, linux-mm@kvack.org,
 jglisse@redhat.com, bskeggs@redhat.com, jhubbard@nvidia.com,
 akpm@linux-foundation.org, Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 19, 2021 at 10:28:42AM -0300, Jason Gunthorpe wrote:
> On Tue, May 18, 2021 at 07:45:05PM -0400, Peter Xu wrote:
> > On Tue, May 18, 2021 at 08:03:27PM -0300, Jason Gunthorpe wrote:
> > > Logically during fork all these device exclusive pages should be
> > > reverted back to their CPU pages, write protected and the CPU page PTE
> > > copied to the fork.
> > > 
> > > We should not copy the device exclusive page PTE to the fork. I think
> > > I pointed to this on an earlier rev..
> > 
> > Agreed.  Though please see the question I posted in the other thread: now I am
> > not very sure whether we'll be able to mark a page as device exclusive if that
> > page has mapcount>1.
> 
> IMHO it is similar to write protect done by filesystems on shared
> mappings - all VMAs with a copy of the CPU page have to get switched
> to the device exclusive PTE. This is why the rmap stuff is involved in
> the migration helpers

Right, I think Alistair corrected me there that I missed the early COW
happening in GUP.

Actually even without that GUP triggering early COW it won't be a problem,
because as long as one child mm restored the pte from exclusive to normal
(before any further COW happens) device exclusiveness is broken in the mmu
notifiers, and after that point all previous-exclusive ptes actually becomes
the same as a very normal PageAnon.  Then it's very sane to even not have the
original page in parent process, because we know each COWed page will contain
all the device atomic modifications (so we don't really have the requirement to
return the original page to parent).

Sorry for the noise.

-- 
Peter Xu

