Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F361F4AD2D4
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 09:09:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A42A110E25E;
	Tue,  8 Feb 2022 08:09:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1CC210E30D
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 08:09:40 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id j2so47786370ybu.0
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Feb 2022 00:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DC5h5QPa2MMSD8jMuUZaOZTMv0rKCEv7tr+WwakctiM=;
 b=UKt/5gqtEQEDR+I4jR//5bWv57hPVaW9KmAr8xHRshFW+V9PDSWkFrBE8Hyb8wlSkA
 QQKQ+stzgyEgp5J4DyVY4bvPNBtHP4wSzJ6uJck+8cplu8GPkuIVWQ+Y8zm1xv27s0Zu
 cR2ljgqob8w9EmBGVw0EdJVkId5N+xNPUHeADg5epuSLdcXTrW9Tqo5OcA22EaRu8U3K
 l3cuLzKBbOc9GbQXk+h497gXyT6KtsqpW966ysKE5jotsGOXr7l3B+dKnggATk5GoyUy
 KJOt1xwxzqYiEqEVIBRmXg0oLWnTj4m1q1+iR+FtOucXjtQu9GfhLJMBe3O/kYgazNfR
 tnQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DC5h5QPa2MMSD8jMuUZaOZTMv0rKCEv7tr+WwakctiM=;
 b=1FFihoUiJBys0mWgQHBFvvRmBAWQf9U1hL+EsayydAY/u3Wug20192P+XpNJMRBCfe
 Z7cEoihNt0RBig2q464Qh/kvlCfIsS7Ad3Fum652pmlxru3CeLxVDF4jyqPXoL4kxv0v
 UVjxIWyA6f7rnfins1N74viur3KKCOaQcC7iBzBQGcyrMaadX8NQ+v+ZzCA11JNv66+y
 Io46iC3nK6y/YnceJfr2oRgzuk5tUXeMS1mbo+oQ5MXMJkZ7gdHXvPPkXgP8x/B/j2mw
 6ayB8Bk6kKEDF2r2QxmMoJgvFpruOzilUV9X69zH6ozLqeNRDg/Vz/4rO9iuWKZq31YT
 kxsQ==
X-Gm-Message-State: AOAM531BTlpWSli9qQcd7kB3B/rMeMbDnhMOZltsub+cerTsfWi9F/g+
 guwa0xHfF/mvi4vUl1ZiQ0yDCHsaQu8v44hCQyTcAw==
X-Google-Smtp-Source: ABdhPJyFSmuR7M4HIJ31YSJoOUpobAKTBK69kzVotLKdLdB2NRipgBTZ2XLKWECEqSNiqnwAnFetqc4Ion8CCMp0OGY=
X-Received: by 2002:a81:ad46:: with SMTP id l6mr3668263ywk.31.1644307779769;
 Tue, 08 Feb 2022 00:09:39 -0800 (PST)
MIME-Version: 1.0
References: <20220207063249.1833066-1-hch@lst.de>
 <20220207063249.1833066-5-hch@lst.de>
In-Reply-To: <20220207063249.1833066-5-hch@lst.de>
From: Muchun Song <songmuchun@bytedance.com>
Date: Tue, 8 Feb 2022 16:09:03 +0800
Message-ID: <CAMZfGtUqbU9VpCOA-9bdU6d1CoQ7n8D+26v4j79uLcH1uc5Q2w@mail.gmail.com>
Subject: Re: [PATCH 4/8] mm: move free_devmap_managed_page to memremap.c
To: Christoph Hellwig <hch@lst.de>
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
Cc: nvdimm@lists.linux.dev, Ralph Campbell <rcampbell@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, dri-devel@lists.freedesktop.org,
 Karol Herbst <kherbst@redhat.com>,
 Linux Memory Management List <linux-mm@kvack.org>,
 nouveau@lists.freedesktop.org, Felix Kuehling <Felix.Kuehling@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Ben Skeggs <bskeggs@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Logan Gunthorpe <logang@deltatee.com>, Dan Williams <dan.j.williams@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 7, 2022 at 2:42 PM Christoph Hellwig <hch@lst.de> wrote:
>
> free_devmap_managed_page has nothing to do with the code in swap.c,
> move it to live with the rest of the code for devmap handling.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Muchun Song <songmuchun@bytedance.com>

Thanks.
