Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9973A7BA6B
	for <lists+dri-devel@lfdr.de>; Fri,  4 Apr 2025 12:08:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 943A010E025;
	Fri,  4 Apr 2025 10:08:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="l55TQE1g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com
 [91.218.175.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9812010EBA3
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Apr 2025 10:08:41 +0000 (UTC)
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1743761317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H3vWWRH8W6vSZf9b1BUtRvjzptf2hYf7bVz0hYZoaVk=;
 b=l55TQE1g/+e4KBgCOcGnu2XR1SFz6vXlDu9SB52QszYdsR2e9jqG5Puuvjqj6894HcRP7g
 AXC+6FHsyF38ePGmjeNrpYfvmhkC+Gr97PBm4ZQ2YcTxuop+qctK73VjuvsL1xsVpFVxo5
 oWgIrkZXg5yN42z6egTF3GqXNsWU2B4=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP is broken, was Re: [RFC
 PATCH 0/6] Deep talk about folio vmap
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <9A899641-BDED-4773-B349-56AF1DD58B21@linux.dev>
Date: Fri, 4 Apr 2025 18:07:50 +0800
Cc: bingbu.cao@linux.intel.com, Christoph Hellwig <hch@lst.de>,
 Matthew Wilcox <willy@infradead.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>, Shuah Khan <shuah@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 opensource.kernel@vivo.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <43DD699A-5C5D-429B-A2B5-61FBEAE2E252@linux.dev>
References: <20250327092922.536-1-link@vivo.com>
 <20250404090111.GB11105@lst.de>
 <9A899641-BDED-4773-B349-56AF1DD58B21@linux.dev>
To: Huan Yang <link@vivo.com>
X-Migadu-Flow: FLOW_OUT
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



> On Apr 4, 2025, at 17:38, Muchun Song <muchun.song@linux.dev> wrote:
>=20
>=20
>=20
>> On Apr 4, 2025, at 17:01, Christoph Hellwig <hch@lst.de> wrote:
>>=20
>> After the btrfs compressed bio discussion I think the hugetlb changes =
that
>> skip the tail pages are fundamentally unsafe in the current kernel.
>>=20
>> That is because the bio_vec representation assumes tail pages do =
exist, so
>> as soon as you are doing direct I/O that generates a bvec starting =
beyond
>> the present head page things will blow up.  Other users of bio_vecs =
might
>> do the same, but the way the block bio_vecs are generated are very =
suspect
>> to that.  So we'll first need to sort that out and a few other things
>> before we can even think of enabling such a feature.
>>=20
>=20
> I would like to express my gratitude to Christoph for including me in =
the
> thread. I have carefully read the cover letter in [1], which indicates
> that an issue has arisen due to the improper use of `vmap_pfn()`. I'm
> wondering if we could consider using `vmap()` instead. In the HVO =
scenario,
> the tail struct pages do **exist**, but they are read-only. I've =
examined
> the code of `vmap()`, and it appears that it only reads the struct =
page.
> Therefore, it seems feasible for us to use `vmap()` (I am not a expert =
in
> udmabuf.). Right?

I believe my stance is correct. I've also reviewed another thread in =
[2].
Allow me to clarify and correct the viewpoints you presented. You =
stated:
  "
   So by HVO, it also not backed by pages, only contains folio head, =
each
   tail pfn's page struct go away.
  "
This statement is entirely inaccurate. The tail pages do not cease to =
exist;
rather, they are read-only. For your specific use-case, please use =
`vmap()`
to resolve the issue at hand. If you wish to gain a comprehensive =
understanding
of the fundamentals of HVO, I kindly suggest a thorough review of the =
document
in [3].

[2] =
https://lore.kernel.org/lkml/5229b24f-1984-4225-ae03-8b952de56e3b@vivo.com=
/#t
[3] Documentation/mm/vmemmap_dedup.rst

>=20
> [1] =
https://lore.kernel.org/linux-mm/20250327092922.536-1-link@vivo.com/T/#m05=
5b34978cf882fd44d2d08d929b50292d8502b4
>=20
> Thanks,
> Muchun.
>=20

