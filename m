Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7528273BDC7
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 19:28:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 862B410E68C;
	Fri, 23 Jun 2023 17:28:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99A5910E68C
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 17:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687541309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6fU0VQ2K9z1Jj6RIKw9Q80E8iMxB7q7U8hKNsz0tnJQ=;
 b=FtcB+sF2aYIWgQH5vOKmv8OZc05KqktlQX9ZltkFVdJtNZHlVLDnbrSHeqO81Jqdbi74kY
 nN1UdKp2kDL34hB7a2vIjZFqOe9pyX+c7gQrRybbmo6jiGnzucflg5SAk5W+Q9eucTwIWo
 vOIXRsOnSY+2j8gUD0NkYCP17o6chLE=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-155-PXkCJw8ZOUejc6wNAM_KVg-1; Fri, 23 Jun 2023 13:28:27 -0400
X-MC-Unique: PXkCJw8ZOUejc6wNAM_KVg-1
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-76248f3057bso16703085a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 10:28:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687541307; x=1690133307;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6fU0VQ2K9z1Jj6RIKw9Q80E8iMxB7q7U8hKNsz0tnJQ=;
 b=YphCABlBZ75znZqmgHYrFI13M6jYGHIjnYjroZxtbEBsVNjR6UWqUTc8Hk8zobeZqT
 JC2asSGjnrJ/S34NManUKfT9rkBV7P2C18PJ3Zni0rMcXxYkV7xr+IUrYxDVJIEn5xAp
 Yg704PSy4mVjCs1+4S5kvuEPYeDjLUf5mpnbLNH6W5YFA7fbMzntGnkk3DuoAaFsUH4V
 M88Juo6Vqzd38t+cjdzStRDHsJyh8yqedOecq5neAiLslcSccdLouM477qbJwAhnEnvU
 13HbtxslnVxbTpZeS+RB+CTU70FIaW7uvhTNhzYWocMvZeSiUylfAmQY3hOfoz9rpky9
 PlfA==
X-Gm-Message-State: AC+VfDxCNymNh+GJFeH7ML0JwbRlvzvaoURp1r9pnocaxybYCNe5Bunr
 GwaldZUkySHTzTYVaBMLZLiqgtGW9YYernnHJGh3gOE5OyyyIl0dTKdX8ghgx8JdFMK9Q6T6TV5
 tMwEsjzBN0iMIcr6sZYoMLaoo8Jb/
X-Received: by 2002:a05:620a:2889:b0:75b:23a1:82a4 with SMTP id
 j9-20020a05620a288900b0075b23a182a4mr26765902qkp.5.1687541306768; 
 Fri, 23 Jun 2023 10:28:26 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7VViwaF12FfX/6pdG6AhUpCLUwFn4YR+G53Vb5p5iJruwoc/aa4i7ism3ViDHYJzAgSv9udQ==
X-Received: by 2002:a05:620a:2889:b0:75b:23a1:82a4 with SMTP id
 j9-20020a05620a288900b0075b23a182a4mr26765869qkp.5.1687541306451; 
 Fri, 23 Jun 2023 10:28:26 -0700 (PDT)
Received: from x1n (cpe5c7695f3aee0-cm5c7695f3aede.cpe.net.cable.rogers.com.
 [99.254.144.39]) by smtp.gmail.com with ESMTPSA id
 a30-20020a0ca99e000000b0062b35b691cdsm5293141qvb.93.2023.06.23.10.28.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jun 2023 10:28:25 -0700 (PDT)
Date: Fri, 23 Jun 2023 13:28:24 -0400
From: Peter Xu <peterx@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v1 0/2] udmabuf: Add back support for mapping hugetlb pages
Message-ID: <ZJXWOCwcms1DjN8w@x1n>
References: <20230622072710.3707315-1-vivek.kasireddy@intel.com>
 <6e429fbc-e0e6-53c0-c545-2e2cbbe757de@redhat.com>
 <IA0PR11MB718510999F2C0E2B70914E2AF823A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZJXJ4ULRKVN5JPyv@x1n> <ZJXKZkxDKYxaJI/1@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <ZJXKZkxDKYxaJI/1@nvidia.com>
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
Cc: James Houghton <jthoughton@google.com>,
 Jerome Marchand <jmarchan@redhat.com>, "Kim, Dongwon" <dongwon.kim@intel.com>,
 David Hildenbrand <david@redhat.com>, "Chang,
 Junxiao" <junxiao.chang@intel.com>, Muchun Song <muchun.song@linux.dev>,
 "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "Hocko, Michal" <mhocko@suse.com>,
 Gerd Hoffmann <kraxel@redhat.com>, John Hubbard <jhubbard@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 23, 2023 at 01:37:58PM -0300, Jason Gunthorpe wrote:
> On Fri, Jun 23, 2023 at 12:35:45PM -0400, Peter Xu wrote:
> 
> > It seems the previous concern on using gup was majorly fork(), if this is it:
> > 
> > https://patchwork.freedesktop.org/patch/210992/?series=39879&rev=2#comment_414213
> 
> Fork and GUP have been fixed since that comment anyhow there is no
> longer a problem using GUP and fork together.

Ah, I read it previously as a requirement that the child will also be able
the see the same / coherent page when manipulating the dmabuf later after
fork(), e.g., the udmabuf can be created before fork().

> 
> > Could it also be guarded by just making sure the pages are MAP_SHARED when
> > creating the udmabuf, if fork() is a requirement of the feature?
> 
> Also a resaonable thing to do
> 
> > For instance, what if the userapp just punchs a hole in the shmem/hugetlbfs
> > file after creating the udmabuf (I see that F_SEAL_SHRINK is required, but
> > at least not F_SEAL_WRITE with current impl), and fault a new page into the
> > page cache?
> 
> It becomes incoherent just like all other GUP users if userspace
> explicitly manipulates the VMAs. It is no different to what happens
> with VFIO, qemu should treat this memory the same as it does for VFIO
> memory.

Agreed.

-- 
Peter Xu

