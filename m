Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E149BAF828E
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 23:22:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6320B10E8F0;
	Thu,  3 Jul 2025 21:22:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="hk0HHFCi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8FCE10E8F0
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jul 2025 21:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751577755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Hj/RZV132CEm1ornmujQIV2oN5pOhDeHuqZxkw4e3AI=;
 b=hk0HHFCiDxk5fVh2nYyhpBmYhlfaXoTFabKH2anfU7A1ldPsjSr73PTR+R4A6FiHmBvZyk
 OhKyMjZtlt+dMRsCVtPJ0C6uTst6NpX9yx/JKoux4WrHm5SrALx0Mii3MiTE5K9OSHUArz
 5FDiXZhZdj6r39fVvh9LBI2jxHsM880=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-347-qZJrWaC_OwOrkoGbekrhjg-1; Thu, 03 Jul 2025 17:22:34 -0400
X-MC-Unique: qZJrWaC_OwOrkoGbekrhjg-1
X-Mimecast-MFC-AGG-ID: qZJrWaC_OwOrkoGbekrhjg_1751577753
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-312df02acf5so1064411a91.1
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jul 2025 14:22:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751577752; x=1752182552;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Hj/RZV132CEm1ornmujQIV2oN5pOhDeHuqZxkw4e3AI=;
 b=Cqk//nVfcW7okM9E5AJRqwcor+P1zXL6CBVRXrCQfGh3gU07lS8eipAV5Wpk/S6m1A
 McyYgif36jjcHWKL/UG4tGhrv7i8WN9sT9a/mYDe6sL5X9hZFxsCfarabOjHyk/8Q4v9
 NNhqPWCi4bsPHg5wx1AcNYQEDZ43OgTi1hCAAtzCFSnScDohUwVfTWMLM1QFhiPgj2Mq
 J/PrHopk2ndSkBPMPtfCPVmUJV80nuzXrgDM0ktyiZvYrIc2Cw+L9yvXDiPK7KFJRmjM
 bW/BrsKTxGPcBPOU6D2BLma3zmUkTkvz3KNSmfS+in7eOOzfzQe3pi1CS20UWvdmRVzF
 Yr5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9NXAnYhGfQeIitCGS9TvM0kiwnertBtwo6fjJrz2NdBlH23mxn8z4sTjgkm7IZetK1l6NGf4ap/I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyDElALWzc5r4OpX+k9MBS1wRaeoT43W2ZA1uZsEj9Z84Yh4egg
 16ZXwb0Iq8WIbDrhtWl5hgSq/ayWTeX6Hpnhop+fEx2Brqdja0FZXz3L5+9STkIRJC1MikwiTkq
 XzIbMNBcAzlGm9tEhJ3ej9UyqgSyzuFb6zUsLZN0r17YCBabQwzfyocPzpwGqi/SQ2O4Gvaju6d
 xMyNKyime1EkJaeBCvd9eFHl48nDfYjWSqeXM/JNF0viWeTttEhwuruOc=
X-Gm-Gg: ASbGncvmxf9DbZj9SIXAfee8MVHMKhNH0tPxUsmbUEMR/B7trI+Rts97fq5WWzM0o9Z
 Avl+7YOhXtzsnq9EEYxQkMtnJ2hrUE8XIYgs7cxfTXQtNQc/wDToB8kZXjoIIjgR9xbQlkI1odK
 QbOQ==
X-Received: by 2002:a17:90b:288b:b0:313:aefa:b08 with SMTP id
 98e67ed59e1d1-31aab8ed31fmr517323a91.16.1751577752275; 
 Thu, 03 Jul 2025 14:22:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEfGS4zw2IpBk5STJ0Hm0dnh1KNZ245qqlOIaPU/7TdkTGJTG1oQZNFO9TWe6ekxtILRdjuSItsclw+H7tjcss=
X-Received: by 2002:a17:90b:288b:b0:313:aefa:b08 with SMTP id
 98e67ed59e1d1-31aab8ed31fmr517305a91.16.1751577751937; Thu, 03 Jul 2025
 14:22:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250630045005.1337339-1-airlied@gmail.com>
 <20250630045005.1337339-18-airlied@gmail.com>
 <wejb2ykaltp5gtufrzz3mwp43hrxugzuubclt4amrpr4koznan@cb7dfmnvik6a>
 <CAMwc25rPTiTshBMvHeGr=8kwC+MJdSA=UdKucybTwSxbuWvk4A@mail.gmail.com>
 <3b5t4djauhnbvhqjwuktrcphlvahpdyi2b6j3ktoapakxcvpgz@zjpokeykiwy7>
 <0b887b01-6de3-4633-86f7-20f5b43eeb35@amd.com>
 <jsmwlcpgsmhkwohao6t5eu3mhypumuqp2pvtbxxkkchivbg4vp@i4pcdsq5xflq>
In-Reply-To: <jsmwlcpgsmhkwohao6t5eu3mhypumuqp2pvtbxxkkchivbg4vp@i4pcdsq5xflq>
From: David Airlie <airlied@redhat.com>
Date: Fri, 4 Jul 2025 07:22:20 +1000
X-Gm-Features: Ac12FXwU62okdCrSxmcxw0FH27VG5IbHzWriW3mZObaAGPhhechQmL-w2YyFi20
Message-ID: <CAMwc25pTVMqF6j+Fb7CQr1HGn6kGvdMquSzzYYbP4vs4RvBMnQ@mail.gmail.com>
Subject: Re: [PATCH 17/17] amdgpu: add support for memory cgroups
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, 
 Johannes Weiner <hannes@cmpxchg.org>, Dave Chinner <david@fromorbit.com>, 
 Kairui Song <kasong@tencent.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZSzcL5pdINzmmUnyfCN4n8A_bAMnLDbK7B1njZADf7Q_1751577753
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>
> Do you mean a task in cgroup A does amdgpu_gem_object_create() and then
> the actual allocation can happen in the task in cgroup B?

On android and in some graphics scenarios, this might happen, not sure
if it does always though. We have scenarios where a display server
allocate a buffer for an application to write into and then it
displays it, the ownership of that buffer can be a big rough.

But in most scenarios I think it'll be the same cgroup, and I think we
generally should account it to the original cgroup unless we
explicitly move the object to another one, (which we haven't got any
code for yet).

> >
> > BTW: It might be a good idea to not only limit the amount of memory you actually have allocated, but also how much you wanted to allocate.
>
> Do you mean accounting and limiting the reservations? Something like
> what hugetlb cgroup provides?
>

I'll let Christian answer that,
Dave.

