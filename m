Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F419CB3AA5B
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 20:53:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D031610E1EA;
	Thu, 28 Aug 2025 18:53:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="E5WBwKoG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 081C810E1EA
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 18:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756407178;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ox+fdqHLvqvHkCQcV7jSITHMPKa6EWT2tpRcTnamaBA=;
 b=E5WBwKoGQo9zqO/HLEpsrkpXIOyUZpErlYEJrl85UZI+vKSRJUAQwMGOSSx7lqmu1cb2CU
 5fJc4OMGF0GVr4Wi8tvBRYFzTmMWW2MwRdrH7RZy/1YiuyYZ25Najtv/JZrrWbeSqGya4e
 4F4ikQb7l52dvkvpxswwKeBKqLFNOfA=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-175-R9nfyuoLM7qdKmM1Ccu86A-1; Thu, 28 Aug 2025 14:52:57 -0400
X-MC-Unique: R9nfyuoLM7qdKmM1Ccu86A-1
X-Mimecast-MFC-AGG-ID: R9nfyuoLM7qdKmM1Ccu86A_1756407176
Received: by mail-il1-f200.google.com with SMTP id
 e9e14a558f8ab-3ea4d2f503cso3983665ab.1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 11:52:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756407176; x=1757011976;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ox+fdqHLvqvHkCQcV7jSITHMPKa6EWT2tpRcTnamaBA=;
 b=LmIiJTn9uK4TIgIK0rUzYF+EqwIJHHevVfOk2LtG/EqUXHOsPChwpxWSj6R0qV2gWf
 BEKQLlsN7lTocKBS+ArWTO6pbSfUjVaZDT4Z5TYMEV4dn/P3g+VnZlxbVkvliJlFkhK8
 3e6uCzmYltGT3sVr7yxwLQKUcTJ/7CNZPRFZd3Q7Qb8BP3OCEcrQlEoE1U5HBV3AA3L1
 K4xUXR0bfyrwCM22feM9tfpB0cW+WQPlIPPcp2otcm/NRD1oUkR51TugN56+NspR39t5
 SIo9LDrdIAm/25pkGR0n6AY6IEpmy6ToTG1erpXfcWb8GrdZQQ9iVJMOyoOecFcfSHT0
 +UyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxsYe8Ueq3F5RC6ZfbihBFC/31rAZvn0B/tHfLZX4s/N9TusXOWcJL8BK5UlIqAqO6Jzk2utfiTYw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyDsKc+HStIyCxY1xYdxBhRD2z6tEZnPU58TnXCpIasa4lkmpPe
 tq6dK2o5IQQrrUFWUO2tqzdacGPfOBm/wMebRFJy/zkWUbOyq371FqwO/SQO8lK/rT1IRzW2+7T
 jx4rrJzH5NRLNtNLNemcp5pslhltlrnVFOUF22QrZdLdMfz2y3AQfWBmBHBzRXhFdarOfBg==
X-Gm-Gg: ASbGncvaSemRMZlQ8zTqlFdHdtJD2lBxcoW5KskKX8f9V9cR9VIgC5tNJ7EeqMoPtoU
 Yt6j6Mv4XbUzYrnsq8tljMNEPVI/0HYb975EJqSq6LhhKVqQ+fG1m8EtZyYlAx6lWrwDVYj+zaz
 U/Tm2gCq5jMnXmtrKbjvwCT3pzlNOK1lQ7CN15zdKooJjKT916fYYHxMG1MN9k68NVbsTIYwucL
 a+sAsOo+25hgaH5uGSSV6WsmPlpaGJqNzpzd7QGdJdWGBS6ISFWRJpibuuEueActIG8lEnZpVfe
 1bksMkkUVIKEmj8UESuq4Gx7j0h+nbTf0zic+tT8T+s=
X-Received: by 2002:a05:6e02:1a86:b0:3ee:cb14:e90f with SMTP id
 e9e14a558f8ab-3eecb14ea03mr61888735ab.7.1756407176410; 
 Thu, 28 Aug 2025 11:52:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEP6X5C8fKyFwSWmjzqPdfkbd7PprjZnYQm1xQXLb3Ss2KjE+y/MhfTqxlaUhO3jzRNfBiTrg==
X-Received: by 2002:a05:6e02:1a86:b0:3ee:cb14:e90f with SMTP id
 e9e14a558f8ab-3eecb14ea03mr61888495ab.7.1756407175934; 
 Thu, 28 Aug 2025 11:52:55 -0700 (PDT)
Received: from redhat.com ([38.15.36.11]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-50d78c67b4dsm47783173.7.2025.08.28.11.52.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 11:52:54 -0700 (PDT)
Date: Thu, 28 Aug 2025 12:52:51 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, Brett Creeley <brett.creeley@amd.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Shameer
 Kolothum <shameerali.kolothum.thodi@huawei.com>, Kevin Tian
 <kevin.tian@intel.com>, Alexander Potapenko <glider@google.com>, Andrew
 Morton <akpm@linux-foundation.org>, Brendan Jackman <jackmanb@google.com>,
 Christoph Lameter <cl@gentwo.org>, Dennis Zhou <dennis@kernel.org>, Dmitry
 Vyukov <dvyukov@google.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, iommu@lists.linux.dev,
 io-uring@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>, Jens Axboe
 <axboe@kernel.dk>, Johannes Weiner <hannes@cmpxchg.org>, John Hubbard
 <jhubbard@nvidia.com>, kasan-dev@googlegroups.com, kvm@vger.kernel.org,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Linus Torvalds
 <torvalds@linux-foundation.org>, linux-arm-kernel@axis.com,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Marco Elver <elver@google.com>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Michal Hocko <mhocko@suse.com>, Mike Rapoport
 <rppt@kernel.org>, Muchun Song <muchun.song@linux.dev>,
 netdev@vger.kernel.org, Oscar Salvador <osalvador@suse.de>, Peter Xu
 <peterx@redhat.com>, Robin Murphy <robin.murphy@arm.com>, Suren
 Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>,
 virtualization@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>,
 wireguard@lists.zx2c4.com, x86@kernel.org, Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH v1 31/36] vfio/pci: drop nth_page() usage within SG entry
Message-ID: <20250828125251.08e4a429.alex.williamson@redhat.com>
In-Reply-To: <20250827220141.262669-32-david@redhat.com>
References: <20250827220141.262669-1-david@redhat.com>
 <20250827220141.262669-32-david@redhat.com>
Organization: Red Hat
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nLFqHENOItRFi0YHtExqYRnuF4sbz6wm3HFjmwRXdi0_1756407176
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Thu, 28 Aug 2025 00:01:35 +0200
David Hildenbrand <david@redhat.com> wrote:

> It's no longer required to use nth_page() when iterating pages within a
> single SG entry, so let's drop the nth_page() usage.
> 
> Cc: Brett Creeley <brett.creeley@amd.com>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Yishai Hadas <yishaih@nvidia.com>
> Cc: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> Cc: Kevin Tian <kevin.tian@intel.com>
> Cc: Alex Williamson <alex.williamson@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  drivers/vfio/pci/pds/lm.c         | 3 +--
>  drivers/vfio/pci/virtio/migrate.c | 3 +--
>  2 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/vfio/pci/pds/lm.c b/drivers/vfio/pci/pds/lm.c
> index f2673d395236a..4d70c833fa32e 100644
> --- a/drivers/vfio/pci/pds/lm.c
> +++ b/drivers/vfio/pci/pds/lm.c
> @@ -151,8 +151,7 @@ static struct page *pds_vfio_get_file_page(struct pds_vfio_lm_file *lm_file,
>  			lm_file->last_offset_sg = sg;
>  			lm_file->sg_last_entry += i;
>  			lm_file->last_offset = cur_offset;
> -			return nth_page(sg_page(sg),
> -					(offset - cur_offset) / PAGE_SIZE);
> +			return sg_page(sg) + (offset - cur_offset) / PAGE_SIZE;
>  		}
>  		cur_offset += sg->length;
>  	}
> diff --git a/drivers/vfio/pci/virtio/migrate.c b/drivers/vfio/pci/virtio/migrate.c
> index ba92bb4e9af94..7dd0ac866461d 100644
> --- a/drivers/vfio/pci/virtio/migrate.c
> +++ b/drivers/vfio/pci/virtio/migrate.c
> @@ -53,8 +53,7 @@ virtiovf_get_migration_page(struct virtiovf_data_buffer *buf,
>  			buf->last_offset_sg = sg;
>  			buf->sg_last_entry += i;
>  			buf->last_offset = cur_offset;
> -			return nth_page(sg_page(sg),
> -					(offset - cur_offset) / PAGE_SIZE);
> +			return sg_page(sg) + (offset - cur_offset) / PAGE_SIZE;
>  		}
>  		cur_offset += sg->length;
>  	}

Reviewed-by: Alex Williamson <alex.williamson@redhat.com>

