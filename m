Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C02C732115
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 22:49:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C5DC10E543;
	Thu, 15 Jun 2023 20:49:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4941310E547
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 20:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686862145;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hKMjMj3FplZLOT+91I/4pBUGTAnLqLsMd/PZxjoHeJI=;
 b=VY/RFTEH78npZ2CTBhF5QX5iCnMcei+jL8WXQQqyKKEyoDBcDVBUqSXm6Qtt6BcdnS0WJR
 kiXaSaQxKJOX6Ft/YrHFF6U9uKpCjmDP/WzrLexJijqkFdKoanwh90RmgPsqqrJ5qbLl3H
 Qotg2eKDcq/F0k7Enkev0BB/7FoQXaE=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-22-N1sKaszOMRaZDfH9RwMFbA-1; Thu, 15 Jun 2023 16:49:01 -0400
X-MC-Unique: N1sKaszOMRaZDfH9RwMFbA-1
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-62dd79f63e0so129526d6.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 13:49:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686862141; x=1689454141;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hKMjMj3FplZLOT+91I/4pBUGTAnLqLsMd/PZxjoHeJI=;
 b=HI9IZWY3GGqZ0sZqi1UmR0Mg2QJaILXd5dt0ZDQiBp4obaNFSVekZaKwXi70AGY4TA
 6kESLhEkOMhe+28wzfBzkp/8EbVIhW4bONDlbXyUI0UluFmKIWTBRqDv9IGh+L72VhDk
 Wu9FHndp7QK/GTyuKEQ1gy5L9IoJd40mAZ12do4/bJCF7fueUAdxaZqroIzYbk8Hkdsr
 tfkRPuzi4UWtrZYKnEBYPiQHNw946ratSkC/VUqwIMjS5qnQQLtwpDQ6wwQwJ4eOWll9
 A5TBOf19BT923A7HpzNCnvsu/crfvb8AG7x56BvAldOwONHFTNfqpEGWkidBzo++OkJy
 +/Ig==
X-Gm-Message-State: AC+VfDwTM7I1Pe2E3BFtgI1vJZnhGxPIKiUCWMHauJWqokPn975IVjJN
 fgmIr7WvRt5iAuT0OmNOWF92xBlXUsHKM/4ByufyUdrqlofkwt/4xkF9cx1LxewmpbJQt6H21FH
 5Jdl7CnSvMe1ZPBp0JDkfGdYfTJhM
X-Received: by 2002:a05:6214:411c:b0:62d:f62b:907 with SMTP id
 kc28-20020a056214411c00b0062df62b0907mr205911qvb.0.1686862140897; 
 Thu, 15 Jun 2023 13:49:00 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ67Q0T7UNcg441S5K48ufQ95OaInqX07S7iw3hjgHEcSdnXpq3izlYE7fKD1k9BhKtWSVJMmA==
X-Received: by 2002:a05:6214:411c:b0:62d:f62b:907 with SMTP id
 kc28-20020a056214411c00b0062df62b0907mr205893qvb.0.1686862140601; 
 Thu, 15 Jun 2023 13:49:00 -0700 (PDT)
Received: from x1n (cpe5c7695f3aee0-cm5c7695f3aede.cpe.net.cable.rogers.com.
 [99.254.144.39]) by smtp.gmail.com with ESMTPSA id
 d24-20020a05620a159800b0074a6c29df4dsm1117082qkk.119.2023.06.15.13.48.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jun 2023 13:48:59 -0700 (PDT)
Date: Thu, 15 Jun 2023 16:48:58 -0400
From: Peter Xu <peterx@redhat.com>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v9 02/14] mm: move page zone helpers from mm.h to mmzone.h
Message-ID: <ZIt5Oho3enLFs+sv@x1n>
References: <20220715150521.18165-1-alex.sierra@amd.com>
 <20220715150521.18165-3-alex.sierra@amd.com> <ZItneGX+sqg7WApF@x1n>
 <ZItxXny9kRDq/ryf@casper.infradead.org>
MIME-Version: 1.0
In-Reply-To: <ZItxXny9kRDq/ryf@casper.infradead.org>
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
Cc: Alex Sierra <alex.sierra@amd.com>, rcampbell@nvidia.com, david@redhat.com,
 Felix.Kuehling@amd.com, apopple@nvidia.com, amd-gfx@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, jgg@nvidia.com, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 15, 2023 at 09:15:26PM +0100, Matthew Wilcox wrote:
> On Thu, Jun 15, 2023 at 03:33:12PM -0400, Peter Xu wrote:
> > My question is whether page_zonenum() is ready for taking all kinds of tail
> > pages?
> > 
> > Zone device tail pages all look fine, per memmap_init_zone_device().  The
> > question was other kinds of usual compound pages, like either thp or
> > hugetlb.  IIUC page->flags can be uninitialized for those tail pages.
> 
> I don't think that's true.  It's my understanding that page->flags is
> initialised for all pages in memmap at boot / hotplug / delayed-init
> time.  So you can check things like zone, node, etc on literally any
> page.  Contrariwise, those flags are not available in tail pages for
> use by the entity that has allocated a compound page / large folio.

Oh so the zone mask is special.  Fair enough.

> 
> Also, I don't believe zone device pages support compound allocation.
> I think they're always allocated as order-0.

Totally not familiar with zone device pages, but memmap_init_zone_device()
has pfns_per_compound which can be >1.  From there, memmap_init_compound()
does go ahead and setup pages as compound ones.

Thanks!

-- 
Peter Xu

