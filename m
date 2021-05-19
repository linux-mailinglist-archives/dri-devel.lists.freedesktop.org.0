Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B924388DD2
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 14:15:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F9356ED84;
	Wed, 19 May 2021 12:15:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E28636ED84
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 12:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621426545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tpsW6GoLBuPX3m2t6ZDWDsXVHyOzAne0XpIqOVeHL30=;
 b=XWnvgk+gmA8q335ZahEcIfurX3JWiQVieP+ijgBkA8GHETaQzRBva9P8v6AMP2XK5YEGKC
 GUlRBQyHMkN48LWDWQTsMFGIU1EVOzD86oqePIxoihk0KLbXBmuz0Tmux//77FLilHSht1
 6/2bGeSVroWR5pTNFncy9VU+NjMZc5o=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-n9mQv1xAMgedcXgqbXMrig-1; Wed, 19 May 2021 08:15:44 -0400
X-MC-Unique: n9mQv1xAMgedcXgqbXMrig-1
Received: by mail-qk1-f199.google.com with SMTP id
 z12-20020a05620a08ccb02902ea1e4a963dso9634285qkz.13
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 05:15:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tpsW6GoLBuPX3m2t6ZDWDsXVHyOzAne0XpIqOVeHL30=;
 b=txVoitSYX7vOmpvM3Hvj/JTJrgD2wkhD/+hXUyLKYqG7615iVfQIqg9F8nD7N9HxC6
 /8GYxyn49c6SfDf4A/Icpnd6MgUSHTMjltkIMdcXCn83bRnPuTDyKgQu3+g1F//4yVIK
 0rTQV7WGfpBy7ebYu8wfO1kA9vmKBm4KN1/tNOAemmDMwJlv0SyS72cPNn0yU2Elk71x
 bEdSQ/k7npWmmxay65KzK0XvtsZ3S6xQWJTMalk5chMgfKCiNgsCN3lM3mspcOok0wj1
 1xKM460DBUHwcWDPcpNIlhFF/RRtHasQM0W6T/lg2mqpRwFlWcHJmjgTkfmB8s9xjtD3
 j5Cw==
X-Gm-Message-State: AOAM531PHaL8C3oi4yOGPO/lCwKh46SeB+PA97ngbvuaVkt8eaBlHUHg
 yh78W85x960TW7mCRrJkIGT8MWHuT4T9bmcP0TDf4thYkOkVFToYUHJwh6H9hR4MgNblg4dc2zS
 Ca3R7VEeSO7IDvMKG9I+rlDtZDh/D
X-Received: by 2002:a05:6214:20c4:: with SMTP id
 4mr13195005qve.38.1621426543766; 
 Wed, 19 May 2021 05:15:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxJeMvnD48yKledjvAvmUkVuVahWxfS9KHq8l5vFptQfcG6pDYRH4satuz1xLVBYj0ZmxaSVA==
X-Received: by 2002:a05:6214:20c4:: with SMTP id
 4mr13194979qve.38.1621426543531; 
 Wed, 19 May 2021 05:15:43 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-72-184-145-4-219.dsl.bell.ca.
 [184.145.4.219])
 by smtp.gmail.com with ESMTPSA id y9sm14576208qkm.19.2021.05.19.05.15.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 05:15:42 -0700 (PDT)
Date: Wed, 19 May 2021 08:15:41 -0400
From: Peter Xu <peterx@redhat.com>
To: Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v8 5/8] mm: Device exclusive memory access
Message-ID: <YKUBbVuvm5FUJRMl@t490s>
References: <20210407084238.20443-1-apopple@nvidia.com>
 <20210518230327.GG1002214@nvidia.com> <YKRRgZmRMdk1vH7A@t490s>
 <2235357.HsqDk0zIjc@nvdebian>
MIME-Version: 1.0
In-Reply-To: <2235357.HsqDk0zIjc@nvdebian>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hch@infradead.org, linux-mm@kvack.org, jglisse@redhat.com, bskeggs@redhat.com,
 Jason Gunthorpe <jgg@nvidia.com>, jhubbard@nvidia.com,
 akpm@linux-foundation.org, Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 19, 2021 at 09:04:53PM +1000, Alistair Popple wrote:
> Failing fork() because we couldn't take a lock doesn't seem like the right 
> approach though, especially as there is already existing code that retries. I 
> get this adds complexity though, so would be happy to take a look at cleaning 
> copy_pte_range() up in future.

Yes, I proposed that as this one won't affect any existing applications (unlike
the existing ones) but only new userspace driver apps that will use this new
atomic feature.

IMHO it'll be a pity to add extra complexity and maintainance burden into
fork() if only for keeping the "logical correctness of fork()" however the code
never triggers. If we start with trylock we'll know whether people will use it,
since people will complain with a reason when needed; however I still doubt
whether a sane userspace device driver should fork() within busy interaction
with the device underneath..

In all cases, please still consider to keep them in copy_nonpresent_pte() (and
if to rework, separating patches would be great).

Thanks,

-- 
Peter Xu

