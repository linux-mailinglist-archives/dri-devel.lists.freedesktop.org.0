Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8364A347533
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 10:58:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 293D86E332;
	Wed, 24 Mar 2021 09:58:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20A896E332
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 09:58:31 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 f22-20020a7bc8d60000b029010c024a1407so808376wml.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 02:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=21lx1XKTgIyEE/5VMZ8Qm6fLn097QzloxjnfqNNT1ZQ=;
 b=IskXKKJt0n34jbY6p0Qq2XnJ3B2KYreze8cG9V12QxYKHqjR1+sMwqd1XwbzUSp4ZD
 5OVtuN4oN/u0fC1Lzk6+7syNkfwboqjlLvBQAheeMJtKkJPWfMZAEvyoB+onjTtNIM4x
 uiDRR9tSDGxpp2cidX9yS5na7MD8H8tVxQurQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=21lx1XKTgIyEE/5VMZ8Qm6fLn097QzloxjnfqNNT1ZQ=;
 b=ELXyrOpdKbMb/Yc/++7vU4PuBRw990y/qr59xXM7wY0IETEunNsYejtTsJ4KtZNrg+
 LkqsbNH3Q+mELrV6OC7PbNfPTNdc5EMSAtdFD6gxutAbceJkFiiEDQZth1p+1ky+POBb
 xb6ebC+pn9g0nbzURAsLljhb2fn1xPpzq0Br4F8TGLQVCs49vtFs7HOD3CcUwxkMiL29
 0QfmyIvUxTWxLhV38FQ4pseCDTxSOmGvZ9DSMr7b42oK+eS/6v9ECms8lwPWcYiFEE70
 vyE3j8z8LMSUYa52xnynVEbh9OhqgIyVVtfyKJuQobfU6jtpIA5oI5XrG72Mi0GDZUim
 lc8Q==
X-Gm-Message-State: AOAM531C1cc/VztYWcVtNEpOZUdDi2WdMAU/znXbIM/6FOYSO9U7TsDH
 U3iD8O94zgP5rmbBvxSS5ZhJtQ==
X-Google-Smtp-Source: ABdhPJwZIBgLGHXn/QNIGKntkctRuF7sTo3S5PNdweokZQ6ttJuFqd/ULSxIfXm5SgSCIgWZXGgd0Q==
X-Received: by 2002:a7b:cb89:: with SMTP id m9mr2084820wmi.27.1616579910680;
 Wed, 24 Mar 2021 02:58:30 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 9sm1719104wmf.13.2021.03.24.02.58.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 02:58:30 -0700 (PDT)
Date: Wed, 24 Mar 2021 10:58:28 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m_=28Intel=29?= <thomas_os@shipmail.org>
Subject: Re: [RFC PATCH 1/2] mm,drm/ttm: Block fast GUP to TTM huge pages
Message-ID: <YFsNRIUYrwVQanVF@phenom.ffwll.local>
Mail-Followup-To: Thomas =?iso-8859-1?Q?Hellstr=F6m_=28Intel=29?=
 <thomas_os@shipmail.org>, 
 "Williams, Dan J" <dan.j.williams@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "jgg@nvidia.com" <jgg@nvidia.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>
References: <20210321184529.59006-1-thomas_os@shipmail.org>
 <20210321184529.59006-2-thomas_os@shipmail.org>
 <ec99146c7abc35d16b245816aba3e9d14862e624.camel@intel.com>
 <c2239da2-c514-2c88-c671-918909cdba6b@shipmail.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c2239da2-c514-2c88-c671-918909cdba6b@shipmail.org>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "jgg@nvidia.com" <jgg@nvidia.com>,
 "Williams, Dan J" <dan.j.williams@intel.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 23, 2021 at 09:42:18PM +0100, Thomas Hellstr=F6m (Intel) wrote:
> =

> On 3/23/21 8:52 PM, Williams, Dan J wrote:
> > On Sun, 2021-03-21 at 19:45 +0100, Thomas Hellstr=F6m (Intel) wrote:
> > > TTM sets up huge page-table-entries both to system- and device
> > > memory,
> > > and we don't want gup to assume there are always valid backing struct
> > > pages for these. For PTEs this is handled by setting the pte_special
> > > bit,
> > > but for the huge PUDs and PMDs, we have neither pmd_special nor
> > > pud_special. Normally, huge TTM entries are identified by looking at
> > > vma_is_special_huge(), but fast gup can't do that, so as an
> > > alternative
> > > define _devmap entries for which there are no backing dev_pagemap as
> > > special, update documentation and make huge TTM entries _devmap,
> > > after
> > > verifying that there is no backing dev_pagemap.
> > Please do not abuse p{m,u}d_devmap like this. I'm in the process of
> > removing get_devpagemap() from the gup-fast path [1]. Instead there
> > should be space for p{m,u}d_special in the page table entries (at least
> > for x86-64). So the fix is to remove that old assumption that huge
> > pages can never be special.
> > =

> > [1]:
> > http://lore.kernel.org/r/161604050866.1463742.7759521510383551055.stgit=
@dwillia2-desk3.amr.corp.intel.com
> > =

> Hmm, yes with that patch it will obviously not work as intended.
> =

> Given that, I think we'll need to disable the TTM huge pages for now until
> we can sort out and agree on using a page table entry bit.

Yeah :-/

I think going full pud/pmd_mkspecial should then also mesh well with
Jason's request to wrap it all up into a vmf_insert_* helper, so at least
it would all look rather pretty in the end.
-Daniel
-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
