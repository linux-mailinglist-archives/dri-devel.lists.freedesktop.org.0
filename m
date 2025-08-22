Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5224FB31658
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 13:31:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B533710EAC8;
	Fri, 22 Aug 2025 11:31:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MOzvdOwb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD64810EACB;
 Fri, 22 Aug 2025 11:31:29 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-45a1b05fe23so11578375e9.1; 
 Fri, 22 Aug 2025 04:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755862288; x=1756467088; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SfbHPH5Jjp8Rpz5+ZFUkvP8crb1ywqdy8VPh1hjPgaM=;
 b=MOzvdOwbCpNxKxpGsZ+YJ0NCwEErlAtOcX8+KMZUBBhmAbPKacYcJAHNHj0kDyAo90
 6eAmQWHpVuozO36KB5VlZAcLGsfXsxhM2S7VMXoo2SrAeX+vNw9GBF2qWlL7QGQixyon
 6B/DJvCkSZYN8IEhf6NXfxBl7YxMqIHQ6Ve6tJLHvoReXSA6IUUjftyoQ1tchzR8FlU3
 tRJPEWqgTCkR8rpmSMuVvldYRQnDXgYhoxZYOxB2PIW++CHnoU7C7I7tHeYvwNRETh7u
 uJrYflhvIBSMv/wxSGk5DpiICqLuksfalpmy7S3Qw6geKbNEFei+ZTyTDqI/7zSnOGID
 zhoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755862288; x=1756467088;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SfbHPH5Jjp8Rpz5+ZFUkvP8crb1ywqdy8VPh1hjPgaM=;
 b=wZPGiBXZxtZfNl8ulLSxG3V6PtIRu5GxXkCkdCuLPMMtfkXuiePlT/UKcCaydPRcC1
 DBBx50bOz+yj5xIewWT0wSCbQDey4nBL+eBtDHmalFf5rrpFJpbOX4mlkXiLen66O1CM
 +TdPLrJqCt/1Y3U3cJgcMn4Da9BcG4ZoLlhoAaREHaGQq1LukcuBMdQ5CMU+M5k1hTlY
 O6KUmPXEnxyFL59gW8L99rC3V2SNeMYkM9Xh7VXVHblzlwesw7emqqzo5meLd+a9rEF8
 D2h2TVi5Ccq5IE5pMRwsmNht3Jy1t86/5a9wAQqk+XdK7UR0lKetgmHG1ZSiz7YnWCk/
 y/UQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVHyc+aDiucPaODvUHpI3Sn0jOHWyV07v7OBBTJ5CageEpjnQTEvSnQR1YUMR73Z/jaW1J/SkyAFg=@lists.freedesktop.org,
 AJvYcCVFgTU8TRFIANU+kBoAR+48AkaZ6dBbO6NLvFWGPNoDPR43/kWd3hR0tsziVOwss6WAglZLl2QJXVZP@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwRtFVRTCXaY7dVglkp1B1zP8rmv09AozqxblsmgzFiua+AHvk1
 AIC5qMonc1x7cfjdvBw0mjRMN9yqbvrO+xsmMxujKSRA9GwcSo6hrlCr
X-Gm-Gg: ASbGncsCdUHTFL1KkLx+Er1QPFNXIcylw94Bp/ew0Z3ReiKScjEc07IDPurWPrV354k
 ifgFQuaQyoeH1n/Vx7dgsBvImHGhhJStkot/BS8HrG1Uv78BvM77/B7sR9SLXrhmAI62SOx6i+y
 LNjcNrWCdXrT+GzmPDu5gp+OAkU64RYz6e0RuAnDaNIkdn99QSEOxCMpnrT8owzrtj1qQ2grmlR
 6EuNeaUOe/iOTSU3yHUA3qN88uYjBBTxZw5ApRogYBtdDPgBacuJ0qR0qgY6ExCnx/PLNRj/Qtz
 u/5jO6Isd6m3Ngu86QBI7X9MoGWSRnBRoLaZM8SBTkl1USR+emLAvOEzXbgOUWSEM9HH7JqmqwJ
 V/AEQvi2JRy0PfJuTbxSZ85iiwlBDTR3WFC1fmrMvEVSUPcg9ur/5edY=
X-Google-Smtp-Source: AGHT+IGRxFKrTZ5eDvBkmi1zEgN6s0gJ3t3AoyWptSyZJnQ5Bb32czELomyx9FMDxkr1p0nFemiRbQ==
X-Received: by 2002:a05:600c:4747:b0:459:e094:92cb with SMTP id
 5b1f17b1804b1-45b517ad81bmr24844685e9.12.1755862287996; 
 Fri, 22 Aug 2025 04:31:27 -0700 (PDT)
Received: from ?IPV6:2620:10d:c096:325:77fd:1068:74c8:af87?
 ([2620:10d:c092:600::1:1b93]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b50e4241dsm35921185e9.24.2025.08.22.04.31.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Aug 2025 04:31:27 -0700 (PDT)
Message-ID: <b5b08ad3-d8cd-45ff-9767-7cf1b22b5e03@gmail.com>
Date: Fri, 22 Aug 2025 12:32:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 18/35] io_uring/zcrx: remove "struct io_copy_cache"
 and one nth_page() usage
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
Cc: Jens Axboe <axboe@kernel.dk>, Alexander Potapenko <glider@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Brendan Jackman <jackmanb@google.com>, Christoph Lameter <cl@gentwo.org>,
 Dennis Zhou <dennis@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 iommu@lists.linux.dev, io-uring@vger.kernel.org,
 Jason Gunthorpe <jgg@nvidia.com>, Johannes Weiner <hannes@cmpxchg.org>,
 John Hubbard <jhubbard@nvidia.com>, kasan-dev@googlegroups.com,
 kvm@vger.kernel.org, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-arm-kernel@axis.com,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Marco Elver <elver@google.com>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>,
 Muchun Song <muchun.song@linux.dev>, netdev@vger.kernel.org,
 Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>,
 Robin Murphy <robin.murphy@arm.com>, Suren Baghdasaryan <surenb@google.com>,
 Tejun Heo <tj@kernel.org>, virtualization@lists.linux.dev,
 Vlastimil Babka <vbabka@suse.cz>, wireguard@lists.zx2c4.com, x86@kernel.org,
 Zi Yan <ziy@nvidia.com>
References: <20250821200701.1329277-1-david@redhat.com>
 <20250821200701.1329277-19-david@redhat.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20250821200701.1329277-19-david@redhat.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/21/25 21:06, David Hildenbrand wrote:
> We always provide a single dst page, it's unclear why the io_copy_cache
> complexity is required.

Because it'll need to be pulled outside the loop to reuse the page for
multiple copies, i.e. packing multiple fragments of the same skb into
it. Not finished, and currently it's wasting memory.

Why not do as below? Pages there never cross boundaries of their folios.

Do you want it to be taken into the io_uring tree?

diff --git a/io_uring/zcrx.c b/io_uring/zcrx.c
index e5ff49f3425e..18c12f4b56b6 100644
--- a/io_uring/zcrx.c
+++ b/io_uring/zcrx.c
@@ -975,9 +975,9 @@ static ssize_t io_copy_page(struct io_copy_cache *cc, struct page *src_page,
  
  		if (folio_test_partial_kmap(page_folio(dst_page)) ||
  		    folio_test_partial_kmap(page_folio(src_page))) {
-			dst_page = nth_page(dst_page, dst_offset / PAGE_SIZE);
+			dst_page += dst_offset / PAGE_SIZE;
  			dst_offset = offset_in_page(dst_offset);
-			src_page = nth_page(src_page, src_offset / PAGE_SIZE);
+			src_page += src_offset / PAGE_SIZE;
  			src_offset = offset_in_page(src_offset);
  			n = min(PAGE_SIZE - src_offset, PAGE_SIZE - dst_offset);
  			n = min(n, len);

-- 
Pavel Begunkov

