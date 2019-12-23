Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D086129B78
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2019 23:34:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B7CA6E084;
	Mon, 23 Dec 2019 22:34:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A49766E084
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2019 22:34:42 +0000 (UTC)
Received: from X1 (nat-ab2241.sltdut.senawave.net [162.218.216.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0509D206CB;
 Mon, 23 Dec 2019 22:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1577140482;
 bh=j8a30uKBFpUoS+kQpAO4xSXpzCOq7JiQ5JV9DxclKWA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hr5gCpX42uVTaiblB+Bfoal6gLIaxariS4egoyL+iBb+XHZcr0tzDHaLeCzdlgDOU
 HRI6QaMGoQ7qNf6L6plJkPd3QaplPS1+N4TVRYZEd9LdzXOoqiQ7tFcBJ3u+Es7+0P
 WC/F2V273Qdwx2+20nZXtt2YIiZqq554kkwk5QNg=
Date: Mon, 23 Dec 2019 14:34:41 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= (VMware) <thomas_os@shipmail.org>
Subject: Re: Ack to merge through DRM tree? WAS [PATCH v4 0/2] mm, drm/ttm:
 Fix pte insertion with customized protection
Message-Id: <20191223143441.38bca86132378a801094c0cc@linux-foundation.org>
In-Reply-To: <cc7e153d-84ff-d1f8-484f-614eafac1864@shipmail.org>
References: <20191212084741.9251-1-thomas_os@shipmail.org>
 <cc7e153d-84ff-d1f8-484f-614eafac1864@shipmail.org>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>, Michal Hocko <mhocko@suse.com>,
 pv-drivers@vmware.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 =?ISO-8859-1?Q?J=E9r=F4me?= Glisse <jglisse@redhat.com>,
 linux-graphics-maintainer@vmware.com,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Ralph Campbell <rcampbell@nvidia.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 20 Dec 2019 09:06:08 +0100 Thomas Hellstr=F6m (VMware) <thomas_os@s=
hipmail.org> wrote:

> Andrew,
> =

> On 12/12/19 9:47 AM, Thomas Hellstr=F6m (VMware) wrote:
> > From: Thomas Hellstrom <thellstrom@vmware.com>
> >
> > The drm/ttm module is using a modified on-stack copy of the
> > struct vm_area_struct to be able to set a page protection with customiz=
ed
> > caching. Fix that by adding a vmf_insert_mixed_prot() function similar
> > to the existing vmf_insert_pfn_prot() for use with drm/ttm.
> >
> > I'd like to merge this through a drm tree.
> >
> > Changes since v1:
> > *) Formatting fixes in patch 1
> > *) Updated commit message of patch 2.
> > Changes since v2:
> > *) Moved vmf_insert_mixed_prot() export to patch 2 (Michal Hocko)
> > *) Documented under which conditions it's safe to use a page protection
> >     different from struct vm_area_struct::vm_page_prot. (Michal Hocko)
> > Changes since v3:
> > *) More documentation regarding under which conditions it's safe to use=
 a
> >     page protection different from struct vm_area_struct::vm_page_prot.=
 This
> >     time also in core vm. (Michal Hocko)
> >
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: Michal Hocko <mhocko@suse.com>
> > Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> > Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
> > Cc: Ralph Campbell <rcampbell@nvidia.com>
> > Cc: "J=E9r=F4me Glisse" <jglisse@redhat.com>
> > Cc: "Christian K=F6nig" <christian.koenig@amd.com>
> >
> Seems all concerns with this series have been addressed. Could I have an =

> ack to merge this through a DRM tree?
> =


Yes, please do that.

Acked-by: Andrew Morton <akpm@linux-foundation.org>

for both.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
