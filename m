Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7D3B303C2
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 22:08:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF92B10EA12;
	Thu, 21 Aug 2025 20:08:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="dtxD3YGY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5440510EA14
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 20:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755806911;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yKmA6ti8X8/YIeKKq4I8EEiHVsObQn302mzSXytdc/A=;
 b=dtxD3YGYU6uAi03axOW8N//O5xEjTvzitT812+BY3kScnQTuXiEG5DkCcCcI0btEz1flvU
 jr2Zly0or1ryGHmtKZAByXPbjVCfri3Yq4cYE0kcevc2KkK4Qzrj488VQCrrEYqjTcwwGf
 qhBfTfxLsjtKN8jVF9DRIzru+WJAt6A=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-511---YTXUZjNgGEtAlZU8nhnw-1; Thu, 21 Aug 2025 16:08:28 -0400
X-MC-Unique: --YTXUZjNgGEtAlZU8nhnw-1
X-Mimecast-MFC-AGG-ID: --YTXUZjNgGEtAlZU8nhnw_1755806907
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3b9d41b88ffso838606f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 13:08:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755806907; x=1756411707;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yKmA6ti8X8/YIeKKq4I8EEiHVsObQn302mzSXytdc/A=;
 b=HL0m7+KfM8YGIvlz8KeS0+wDXv7AyY5F1q+s9/WG37QZKKRohoVbCJRhZUDBhfhZH9
 XnEXfrzwdGIDKv5RykYNRs+9j+Xs2emLppxYReNg3UR61oAgDgZeCSGjjzBNMyoe9rJV
 6OXMlpJeQZmTe37j9xMrOqVShkeqYkLf4y3MZa7eXRp5Hi+6VuJ8eUh/YsJW1nA+V/kO
 tWUd76AtcGjRXSbIjLslyBzrJAIOP3qUmHkWyTl4kyNhKK94DhWsA0uDjsplUO+fTxak
 Jq16yeAwltkPUoZW3Fmu3ws2HWGe6aGMcscgfbV82zYb3BvhcPLj87MjwQd9O9wRpqr6
 NSGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHomtJ6zoYP72he6vMUiDg6uKjoU2DeuAghtgfFYA9aknL7w6J83iVpEIwXj3djMlH8ZXmiaBKP04=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwIzeOMtyU3jqNT51FEFhDXLHZa9UPqTOrcJMROP9d+wEuNlBpv
 EpT0NXrS4XilfJJJtZoEtewH3FKxEM78KdiOvyvClKDUXVsVZz/AYTVLcnCfk8PZU24qI4hu2lk
 zvBTH8+XyjlGpHkeL5DrCAJg+sEUEWrhulnTDQJEV2j9mndYVs8vSnrbdPngahodAlYybig==
X-Gm-Gg: ASbGncvPUcc3fJsroyhPviPHsx96geNsH+aWegDxiS9cj0fkrKHA7xUcA9tcGCn6qJb
 Uiaq+1+7rgCTkdsEdlfI4Nj6vhlpioeVBbCVWntT0pC7hb4+XSNBA0KRbPiFJ8f2MIAb3OUNkqv
 rrP1MReeITLS7sSx7fPJqvv0+Y4hJ7d/atdtigo/uTefbES5LgeJvJYw/YPqfuZYbSQ6wTrDjUp
 grd85LV0Xtz/LSTGzDjwoV4Mg8i5OY38WKt2Cw1FuDZAR0sPyfs5WI5isKe1D83HhFm6YSqdmdA
 bP3e+WJ1AFNvprrR1MR2wFHqsWWLSlZjpoQ9gTzn4IvpjRtd/tAca6tLWwx+r6ENkiReUx2ScVv
 yu0vI6GROU5kOtE4BxoQlbg==
X-Received: by 2002:a05:6000:288a:b0:3c3:f134:28ba with SMTP id
 ffacd0b85a97d-3c5db2dcc73mr210112f8f.28.1755806906742; 
 Thu, 21 Aug 2025 13:08:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFquQDwTQ7641wc0kBtooMvxSzqNfE3+XbhkCNDvunKpGE2abRVQ6uRBkb0Dc/grDWRh0uIiA==
X-Received: by 2002:a05:6000:288a:b0:3c3:f134:28ba with SMTP id
 ffacd0b85a97d-3c5db2dcc73mr210077f8f.28.1755806906301; 
 Thu, 21 Aug 2025 13:08:26 -0700 (PDT)
Received: from localhost
 (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de.
 [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3c077789d12sm12702699f8f.54.2025.08.21.13.08.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 13:08:25 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: David Hildenbrand <david@redhat.com>, Alex Dubov <oakad@yahoo.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Lars Persson <lars.persson@axis.com>,
 Alexander Potapenko <glider@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Brendan Jackman <jackmanb@google.com>, Christoph Lameter <cl@gentwo.org>,
 Dennis Zhou <dennis@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 iommu@lists.linux.dev, io-uring@vger.kernel.org,
 Jason Gunthorpe <jgg@nvidia.com>, Jens Axboe <axboe@kernel.dk>,
 Johannes Weiner <hannes@cmpxchg.org>, John Hubbard <jhubbard@nvidia.com>,
 kasan-dev@googlegroups.com, kvm@vger.kernel.org,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-arm-kernel@axis.com,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Marco Elver <elver@google.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>,
 Muchun Song <muchun.song@linux.dev>, netdev@vger.kernel.org,
 Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>,
 virtualization@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>,
 wireguard@lists.zx2c4.com, x86@kernel.org, Zi Yan <ziy@nvidia.com>
Subject: [PATCH RFC 28/35] mmc: drop nth_page() usage within SG entry
Date: Thu, 21 Aug 2025 22:06:54 +0200
Message-ID: <20250821200701.1329277-29-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nEE8o_SHlSiO6aLZMfOpjQlrup5lLt_jujfZVsevgMc_1755806907
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
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

It's no longer required to use nth_page() when iterating pages within a
single SG entry, so let's drop the nth_page() usage.

Cc: Alex Dubov <oakad@yahoo.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Jesper Nilsson <jesper.nilsson@axis.com>
Cc: Lars Persson <lars.persson@axis.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/mmc/host/tifm_sd.c    | 4 ++--
 drivers/mmc/host/usdhi6rol0.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/host/tifm_sd.c b/drivers/mmc/host/tifm_sd.c
index ac636efd911d3..f1ede2b39b505 100644
--- a/drivers/mmc/host/tifm_sd.c
+++ b/drivers/mmc/host/tifm_sd.c
@@ -191,7 +191,7 @@ static void tifm_sd_transfer_data(struct tifm_sd *host)
 		}
 		off = sg[host->sg_pos].offset + host->block_pos;
 
-		pg = nth_page(sg_page(&sg[host->sg_pos]), off >> PAGE_SHIFT);
+		pg = sg_page(&sg[host->sg_pos]) + off / PAGE_SIZE;
 		p_off = offset_in_page(off);
 		p_cnt = PAGE_SIZE - p_off;
 		p_cnt = min(p_cnt, cnt);
@@ -240,7 +240,7 @@ static void tifm_sd_bounce_block(struct tifm_sd *host, struct mmc_data *r_data)
 		}
 		off = sg[host->sg_pos].offset + host->block_pos;
 
-		pg = nth_page(sg_page(&sg[host->sg_pos]), off >> PAGE_SHIFT);
+		pg = sg_page(&sg[host->sg_pos]) + off / PAGE_SIZE;
 		p_off = offset_in_page(off);
 		p_cnt = PAGE_SIZE - p_off;
 		p_cnt = min(p_cnt, cnt);
diff --git a/drivers/mmc/host/usdhi6rol0.c b/drivers/mmc/host/usdhi6rol0.c
index 85b49c07918b3..3bccf800339ba 100644
--- a/drivers/mmc/host/usdhi6rol0.c
+++ b/drivers/mmc/host/usdhi6rol0.c
@@ -323,7 +323,7 @@ static void usdhi6_blk_bounce(struct usdhi6_host *host,
 
 	host->head_pg.page	= host->pg.page;
 	host->head_pg.mapped	= host->pg.mapped;
-	host->pg.page		= nth_page(host->pg.page, 1);
+	host->pg.page		= host->pg.page + 1;
 	host->pg.mapped		= kmap(host->pg.page);
 
 	host->blk_page = host->bounce_buf;
@@ -503,7 +503,7 @@ static void usdhi6_sg_advance(struct usdhi6_host *host)
 	/* We cannot get here after crossing a page border */
 
 	/* Next page in the same SG */
-	host->pg.page = nth_page(sg_page(host->sg), host->page_idx);
+	host->pg.page = sg_page(host->sg) + host->page_idx;
 	host->pg.mapped = kmap(host->pg.page);
 	host->blk_page = host->pg.mapped;
 
-- 
2.50.1

