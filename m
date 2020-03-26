Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 286B5193A71
	for <lists+dri-devel@lfdr.de>; Thu, 26 Mar 2020 09:08:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DED866E2D1;
	Thu, 26 Mar 2020 08:08:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65E266E0A5
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Mar 2020 02:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Transfer-Encoding
 :Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=uIV1dMF8f1Bx0qqtr1nXCMlrLokE0SVaAEV1OmGtP74=; b=XBVHyY5LqgEp/M2/ztuf9zK8pB
 fW3/IgQhGLqx1X1dHycX+BGaX+wSL+jgzgzuqaJtVRv0eDJRqcsUE35sDbn5MNrwUgWf+xIOuRQ8K
 WwYuXJwIw5ixD12I2x0wWSg0Ik8LfxJkFUgIwrBIsEwtKGOa2R1DOXMBhSgkXFZW2s9YZMLmGtdJH
 s2ZyRzlQ8DPzjk2MwWhdHuHGsm6TIifU/IolnPYBaK0rA0iRzL4+OPSkNjXVTu1a0YH9pD41Lhj1i
 hK3OCplTUTSBFppLyDSLgbuK66xHzdQx2cf4E+ex1CDwHajldIEPb1kOpDoWbhbrhW6sYbGdADYQa
 4gDgzwqw==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jHIaY-0000PW-8h; Thu, 26 Mar 2020 02:49:46 +0000
Date: Wed, 25 Mar 2020 19:49:46 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m_=28VMware=29?= <thomas_os@shipmail.org>
Subject: Re: [PATCH v7 1/9] fs: Constify vma argument to vma_is_dax
Message-ID: <20200326024946.GE22483@bombadil.infradead.org>
References: <20200324201123.3118-1-thomas_os@shipmail.org>
 <20200324201123.3118-2-thomas_os@shipmail.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200324201123.3118-2-thomas_os@shipmail.org>
X-Mailman-Approved-At: Thu, 26 Mar 2020 08:08:32 +0000
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, Michal Hocko <mhocko@suse.com>,
 pv-drivers@vmware.com, Roland Scheidegger <sroland@vmware.com>,
 Dan Williams <dan.j.williams@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 linux-graphics-maintainer@vmware.com,
 Andrew Morton <akpm@linux-foundation.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 24, 2020 at 09:11:15PM +0100, Thomas Hellstr=F6m (VMware) wrote:
> From: "Thomas Hellstrom (VMware)" <thomas_os@shipmail.org>
> =

> The function is used by upcoming vma_is_special_huge() with which we want
> to use a const vma argument. Since for vma_is_dax() the vma argument is
> only dereferenced for reading, constify it.
> =

> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
> Cc: Ralph Campbell <rcampbell@nvidia.com>
> Cc: "J=E9r=F4me Glisse" <jglisse@redhat.com>
> Cc: "Christian K=F6nig" <christian.koenig@amd.com>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Signed-off-by: Thomas Hellstrom (VMware) <thomas_os@shipmail.org>
> Reviewed-by: Roland Scheidegger <sroland@vmware.com>
> Acked-by: Christian K=F6nig <christian.koenig@amd.com>

Acked-by: Matthew Wilcox (Oracle) <willy@infradead.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
