Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69ABA72B8FD
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 09:46:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC49710E1AB;
	Mon, 12 Jun 2023 07:46:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B5ED10E1AB
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 07:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686555989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yP4vMHkO+yCSQ+z82iPRDsudDDu4cQh6jmBlyoee49w=;
 b=DYhHGbWpB2Pr8IqLQiPfLxm+X79OR0u9RUC26YQO2gh+S4HX76cCI/MKM1nsUmB/QkeAx/
 qx3Uepk5AspKf7wy4p9TqFF2gpkr4jn8ErJH8LzeDRfXgRbLYGKQP5fKxVt05VSorGuu59
 u9A6CKFud8pLKHar2APqy/J5pdU/+ec=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-232-Nn3a8tiZNgqreukNwn8d7Q-1; Mon, 12 Jun 2023 03:46:25 -0400
X-MC-Unique: Nn3a8tiZNgqreukNwn8d7Q-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-30fc5d6e697so130392f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 00:46:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686555984; x=1689147984;
 h=content-transfer-encoding:in-reply-to:subject:organization:from
 :references:cc:to:content-language:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yP4vMHkO+yCSQ+z82iPRDsudDDu4cQh6jmBlyoee49w=;
 b=izMwVTMjrRRnTne9X5cmMIGiV8O85lGSC8KdXswB91nYW+4wo1jPistDDxASdgwaw3
 v9XQyLjyAaCv8d9R6a5QpoSPHz25WyvdOgKuvQZv6dO7ZXtIVrOvwZjstECNKTqS/DHN
 ICSYROrPHFhDSkKnqNjn81XbdrPjn12y0kNUaV2DGXAatq+RtLWCpz70kb4Uf1cAJTtk
 AMqMBPR6BBX9ZV5g0inOXxUzVrnPgejmev+JyMOj0wLRx2fheLVWsLsFo6cdhufyRz1h
 yx5svKfgWUYly44dd5nN3hf+fgcTJAXVpD5lsjKOWN3zJxJI1itF3DFC7JT0OussT2Hq
 1svw==
X-Gm-Message-State: AC+VfDyqQUQkEcpEfJyZRlxjw6zoEgeYCt/xC+yZYoiFA48y69FilKxx
 EDDEkeDc/1s1wkzdKQNJ6kokx6U74ACquSvZzF0mGTU/2vE/dZcmEb80PrpeVur1OEdzHnRxDwk
 a+E/SEpsCH+LlDD0vKW6d5NsyYfoh
X-Received: by 2002:a05:6000:14c:b0:30f:a895:d991 with SMTP id
 r12-20020a056000014c00b0030fa895d991mr3131802wrx.55.1686555984695; 
 Mon, 12 Jun 2023 00:46:24 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ73G0tqHUKMiC3veRGtl5w/v7h2Kk9F4KUkzVL4unSRQmLHkul9W56Mg29yppbvMAA2E73L5A==
X-Received: by 2002:a05:6000:14c:b0:30f:a895:d991 with SMTP id
 r12-20020a056000014c00b0030fa895d991mr3131789wrx.55.1686555984277; 
 Mon, 12 Jun 2023 00:46:24 -0700 (PDT)
Received: from ?IPV6:2003:cb:c74e:1600:4f67:25b2:3e8c:2a4e?
 (p200300cbc74e16004f6725b23e8c2a4e.dip0.t-ipconnect.de.
 [2003:cb:c74e:1600:4f67:25b2:3e8c:2a4e])
 by smtp.gmail.com with ESMTPSA id
 b5-20020adff905000000b0030aedb8156esm11491237wrr.102.2023.06.12.00.46.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jun 2023 00:46:23 -0700 (PDT)
Message-ID: <281caf4f-25da-3a73-554b-4fb252963035@redhat.com>
Date: Mon, 12 Jun 2023 09:46:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Hugh Dickins <hughd@google.com>
References: <20230608204927.88711-1-mike.kravetz@oracle.com>
 <IA0PR11MB71851B64A5E7062E3BDD8D2FF854A@IA0PR11MB7185.namprd11.prod.outlook.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH] udmabuf: revert 'Add support for mapping hugepages (v4)'
In-Reply-To: <IA0PR11MB71851B64A5E7062E3BDD8D2FF854A@IA0PR11MB7185.namprd11.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: "Hocko, Michal" <mhocko@suse.com>,
 "jmarchan@redhat.com" <jmarchan@redhat.com>, "Kim,
 Dongwon" <dongwon.kim@intel.com>, "Chang, Junxiao" <junxiao.chang@intel.com>,
 "muchun.song@linux.dev" <muchun.song@linux.dev>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 James Houghton <jthoughton@google.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12.06.23 09:10, Kasireddy, Vivek wrote:
> Hi Mike,

Hi Vivek,

> 
> Sorry for the late reply; I just got back from vacation.
> If it is unsafe to directly use the subpages of a hugetlb page, then reverting
> this patch seems like the only option for addressing this issue immediately.
> So, this patch is
> Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> 
> As far as the use-case is concerned, there are two main users of the udmabuf
> driver: Qemu and CrosVM VMMs. However, it appears Qemu is the only one
> that uses hugetlb pages (when hugetlb=on is set) as the backing store for
> Guest (Linux, Android and Windows) system memory. The main goal is to
> share the pages associated with the Guest allocated framebuffer (FB) with
> the Host GPU driver and other components in a zero-copy way. To that end,
> the guest GPU driver (virtio-gpu) allocates 4k size pages (associated with
> the FB) and pins them before sharing the (guest) physical (or dma) addresses
> (and lengths) with Qemu. Qemu then translates the addresses into file
> offsets and shares these offsets with udmabuf.

Is my understanding correct, that we can effectively long-term pin 
(worse than mlock) 64 MiB per UDMABUF_CREATE, allowing eventually !root 
users

ll /dev/udmabuf
crw-rw---- 1 root kvm 10, 125 12. Jun 08:12 /dev/udmabuf

to bypass there effective MEMLOCK limit, fragmenting physical memory and 
breaking swap?


Regarding the udmabuf_vm_fault(), I assume we're mapping pages we 
obtained from the memfd ourselves into a special VMA (mmap() of the 
udmabuf). I'm not sure how well shmem pages are prepared for getting 
mapped by someone else into an arbitrary VMA (page->index?).

... also, just imagine someone doing FALLOC_FL_PUNCH_HOLE / ftruncate() 
on the memfd. What's mapped into the memfd no longer corresponds to 
what's pinned / mapped into the VMA.


Was linux-mm (and especially shmem maintainers, ccing Hugh) involved in 
the upstreaming of udmabuf?

-- 
Cheers,

David / dhildenb

