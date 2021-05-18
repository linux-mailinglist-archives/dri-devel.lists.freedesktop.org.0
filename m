Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1BA387F2D
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 20:01:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F26396EC5B;
	Tue, 18 May 2021 18:01:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A7DA6EC5B
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 18:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621360901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Oue7U1wjftn7xVwPmUZCJccBeCJY9jE5A9d8yc2+hO4=;
 b=Ora0ec0MtMLAuvk+SbeTaOUni3CLwx59zVFX5AqLzUlof5EBxe0IA8CZNvO17Q+uDbisd0
 FgtwJ9J3KXftksjHr0Rdrigywaka5q7oWMySvpVP28sE+X2eFqtF78oLGJQuZcJQ7DrQTk
 M8APNkPboCNwMbRfLfAbVDrK6NqsCJk=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-248-Aw3gbewvNp2lc26nYGSNQA-1; Tue, 18 May 2021 14:01:39 -0400
X-MC-Unique: Aw3gbewvNp2lc26nYGSNQA-1
Received: by mail-qv1-f72.google.com with SMTP id
 x2-20020a0cda020000b02901edb4c412fdso7987905qvj.11
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 11:01:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Oue7U1wjftn7xVwPmUZCJccBeCJY9jE5A9d8yc2+hO4=;
 b=GbahVdl+3gSZD3fgR/4YbgnbIjv57Azm2Au43tMUXJRNkM9caOhiU3qUAzZXUzao/z
 539Ri+mAnyN4qLGGoPmuK8c1mVCUWL9xEYY50AvmKAewwggtvvOlmfMQ7Ia5weKOwbv+
 7TilgOwJi0hsJPTv5RB8epiMPivYDAc6LlzKVTb7i61O1NUEbvPoQFU9TMukmVgalKmC
 FhFyI94AOvYaBAwDwuEs7GdCMNzmxVHNxjr3g79NsxXPxj9BVO1Zhq659MQyxcX19sdc
 CVqcyTnh+Qt7z/5/n0FVfZs7W3oDYBxAaoYzHBkPjv7SkN7/NXbCtfajH2NbBf93APxO
 g7KA==
X-Gm-Message-State: AOAM531u0t+Qfz2NQtRad8nKN6RqdfEMnxNliln2G0TvZTZynJSanMnB
 a4YvC6gDz3JaZ+xfr8ldXltzQPf/gh0T75bgBF//q9pK/R3MYpdKpoWKIBmMkTGpLHJbxdWkD7i
 oM4YIi2Qg3S8MYT7FtwEWF7fCt3KF
X-Received: by 2002:ac8:a49:: with SMTP id f9mr6060397qti.157.1621360898458;
 Tue, 18 May 2021 11:01:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxTICgj8/egwsE0Ivgqvw8kGv1T8HxyWhbScHPLgGtw0FYHBEe8vymzLu/hxY0OnGRaALaW5w==
X-Received: by 2002:ac8:a49:: with SMTP id f9mr6060354qti.157.1621360898147;
 Tue, 18 May 2021 11:01:38 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-72-184-145-4-219.dsl.bell.ca.
 [184.145.4.219])
 by smtp.gmail.com with ESMTPSA id b23sm1488671qtp.7.2021.05.18.11.01.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 11:01:37 -0700 (PDT)
Date: Tue, 18 May 2021 14:01:36 -0400
From: Peter Xu <peterx@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v8 5/8] mm: Device exclusive memory access
Message-ID: <YKQBACJCjsxeM3ro@t490s>
References: <20210407084238.20443-1-apopple@nvidia.com>
 <20210407084238.20443-6-apopple@nvidia.com>
 <YKMhorngO2DVrxac@t490s> <47694715.suB6H4Uo8R@nvdebian>
 <YKP5Dj4Q/riGGc43@t490s> <20210518173334.GE1002214@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20210518173334.GE1002214@nvidia.com>
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

On Tue, May 18, 2021 at 02:33:34PM -0300, Jason Gunthorpe wrote:
> On Tue, May 18, 2021 at 01:27:42PM -0400, Peter Xu wrote:
> 
> > I also have a pure and high level question regarding a process fork() when
> > there're device exclusive ptes: would the two processes then own the device
> > together?  Is this a real usecase?
> 
> If the pages are MAP_SHARED then yes. All VMAs should point at the
> same device_exclusive page and all VMA should migrate back to CPU
> pages together.

Makes sense.  If we keep the anonymous-only in this series (I think it's good
to separate these), maybe we can drop the !COW case, plus some proper installed
WARN_ON_ONCE()s.

> 
> > Indeed it'll be odd for a COW page since for COW page then it means after
> > parent/child writting to the page it'll clone into two, then it's a mistery on
> > which one will be the one that "exclusived owned" by the device..
> 
> For COW pages it is like every other fork case.. We can't reliably
> write-protect the device_exclusive page during fork so we must copy it
> at fork time.
> 
> Thus three reasonable choices:
>  - Copy to a new CPU page
>  - Migrate back to a CPU page and write protect it
>  - Copy to a new device exclusive page

IMHO the ownership question would really help us to answer this one..

If the device ownership should be kept in parent IMHO option (1) is the best
approach. To be explicit on page copy: we can do best-effort, even if the copy
is during a device atomic operation, perhaps?

If the ownership will be shared, seems option (3) will be easier as I don't see
a strong reason to do immediate restorinng of ptes; as long as we're careful on
the refcounting.

Thanks,

-- 
Peter Xu

