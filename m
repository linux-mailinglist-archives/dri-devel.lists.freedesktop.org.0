Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2E03A379A
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 01:04:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A67436EE11;
	Thu, 10 Jun 2021 23:04:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9FBB6EE11
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 23:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623366265;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Kn4921Fy2QxClPboKoVBlarBT42fXZONHXvZsMc4G14=;
 b=CfKlhAmZb3hVqq2jr2l5kLw8iuG7uJZEXSceX1xRdpFnC6UbN6MJpQRV0LKpg/AoNsX9le
 2aEsoJ2ldMY4KlinHnjh/wlk7yey2nY0z19TOhnJ94PKcaQRWMd0dvL9iO/NnfWomoMiT4
 Z6/WJDQPPWtLgtdQ3J8OMbzchmbBhJk=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-YHdLE4IhPjGdSidku4Mi5A-1; Thu, 10 Jun 2021 19:04:22 -0400
X-MC-Unique: YHdLE4IhPjGdSidku4Mi5A-1
Received: by mail-qv1-f72.google.com with SMTP id
 t7-20020ad45bc70000b029023930e98a57so6238579qvt.18
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 16:04:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Kn4921Fy2QxClPboKoVBlarBT42fXZONHXvZsMc4G14=;
 b=Xd8/gpO5iA6FCHhGb1f3RwYTA7ls6R0dG2ClGKoQ+Pdnzv4Ve2EHVs534CArEQX9Bv
 xUQeRDQ8uaD6TK9O/COUP0SkLaf2HToNOKqrqSbErg5vrmUDexMnJVSgVwIr4rMfzDV1
 nreLbNvrt1+1k1sB4VezgTCPbYcp+MEL2HETC1Ye8ifOW8Hppzl9wPRWllrzYcrZMZjn
 7nlYpad7R7S2ZdWdPRybJnHAoLFk0z15WsD9wswrmWRm/Q/oimOD1qpDTh5trN2DjgZ3
 VE1B8P3s1YA3OLIl+rfozsWLJpIGIco03jx9uHvZz0en2XPjIcuj0ujwZjse3S0E96Tb
 /Gsg==
X-Gm-Message-State: AOAM530bueGWvx631KAwUZOPJ2A9cR+cf8V7rXVoR7s76xNDGPAisD+J
 0gjCsgsn8iTBUfEXErYuwLhWc+duS6kJScI4IjRLUHiVbAndaD4lbrDk+VqZzCuYAg3tEmrhPKz
 nrB4YOGnIdDuXymlmWnNvbbBCPqrH
X-Received: by 2002:a05:620a:1116:: with SMTP id
 o22mr1055468qkk.263.1623366261642; 
 Thu, 10 Jun 2021 16:04:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwrG/yfGVS5sWgTKcNo1dgRgBZLWinZ0GsXIy0VHGuGgZrohA7iNbV+b0qys3C0GTOZDsvbFg==
X-Received: by 2002:a05:620a:1116:: with SMTP id
 o22mr1055448qkk.263.1623366261403; 
 Thu, 10 Jun 2021 16:04:21 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-88-174-93-75-200.dsl.bell.ca.
 [174.93.75.200])
 by smtp.gmail.com with ESMTPSA id j14sm3076434qtj.96.2021.06.10.16.04.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 16:04:20 -0700 (PDT)
Date: Thu, 10 Jun 2021 19:04:19 -0400
From: Peter Xu <peterx@redhat.com>
To: Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v10 07/10] mm: Device exclusive memory access
Message-ID: <YMKacyNstEM9brUD@t490s>
References: <20210607075855.5084-1-apopple@nvidia.com>
 <2773835.D95cIkl9rl@nvdebian> <YMJUM4sx1VclR7oz@t490s>
 <6429491.QiJgnDeYu7@nvdebian>
MIME-Version: 1.0
In-Reply-To: <6429491.QiJgnDeYu7@nvdebian>
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
 nouveau@lists.freedesktop.org, hughd@google.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hch@infradead.org, linux-mm@kvack.org,
 shakeelb@google.com, bskeggs@redhat.com, jgg@nvidia.com, jhubbard@nvidia.com,
 akpm@linux-foundation.org, Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 11, 2021 at 12:21:26AM +1000, Alistair Popple wrote:
> > Hmm, the thing is.. to me FOLL_SPLIT_PMD should have similar effect to explicit
> > call split_huge_pmd_address(), afaict.  Since both of them use __split_huge_pmd()
> > internally which will generate that unwanted CLEAR notify.
> 
> Agree that gup calls __split_huge_pmd() via split_huge_pmd_address()
> which will always CLEAR. However gup only calls split_huge_pmd_address() if it
> finds a thp pmd. In follow_pmd_mask() we have:
> 
> 	if (likely(!pmd_trans_huge(pmdval)))
> 		return follow_page_pte(vma, address, pmd, flags, &ctx->pgmap);
> 
> So I don't think we have a problem here.

Sorry I didn't follow here..  We do FOLL_SPLIT_PMD after this check, right?  I
mean, if it's a thp for the current mm, afaict pmd_trans_huge() should return
true above, so we'll skip follow_page_pte(); then we'll check FOLL_SPLIT_PMD
and do the split, then the CLEAR notify.  Hmm.. Did I miss something?

-- 
Peter Xu

