Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB261B303BD
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 22:08:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B97510EA11;
	Thu, 21 Aug 2025 20:08:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Gj5GTYJ6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E7F210EA0C
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 20:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755806907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yR/3u5W37RASrGsn/s3pQVQ78UUgH4ByCavV3b4UG3M=;
 b=Gj5GTYJ6dXzgNF0m9XHgiHOdNPBk0v1RaHpSOBTf/YBBgJOO/pEpJGWxMMvBj4Ji+lfAki
 KtS07d+FXuzkNWaIMqoazz5AqwvGf42Y5bOL4jMp07YmebaBD8/mAKFLHkh8p7kEsQr+jB
 uYhmDwTFYltMXuH7aaZuauWyKAy0fsg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-270-CIEo_DiHMNaNKx8BVQJsHg-1; Thu, 21 Aug 2025 16:08:24 -0400
X-MC-Unique: CIEo_DiHMNaNKx8BVQJsHg-1
X-Mimecast-MFC-AGG-ID: CIEo_DiHMNaNKx8BVQJsHg_1755806904
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3b9bfe2c601so767108f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 13:08:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755806903; x=1756411703;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yR/3u5W37RASrGsn/s3pQVQ78UUgH4ByCavV3b4UG3M=;
 b=SOjAwsAImRVI1YHfzaPtweXoytD2KDoM+IFqVnhzFhb9QMxVhrUMHgac40gih5iM5+
 HEIjV/gcct7OuMkINchywUHmwvajiJyMos5M7mKzE8d2GwtbTvNwjQYIZq+48fyRn3qn
 js2UbDrd5ecnbXjNG72T8akOWCeWs+jTVQH9fqYSSsIlp8sWJ1X3y1jbFjFKkTMq+5Tw
 3/ZkrtdfveFOih4Y2oHreJdCDCWexEu2Ujkw2ZfhXrYJ8u8chgoh+4xZeG82Xpsv6vTV
 Ti0zUqdfpI1XaWLaoDkhRDVAdwL5Ru7eF9CvSZp4TVKcA7n3MHvnPIoJDNEmBaBpZoqX
 2Vug==
X-Forwarded-Encrypted: i=1;
 AJvYcCXaD9ArG1VtLmJTphT6b+iAo+C9ZcvbnK1O6brAq3/Si4sRW1sp0HxzDiamr9k9dndI7euIu1+q7Zc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyuqKz2g2K/8KPArmusL/N01XLFx/F09Mh5ks7S2LyicWFfEFVU
 HzZkC1fggTgf2pC18p35dUXZilkfXe9krg/d88VepMN8OeFEXshqOuqBiYixjInF2b3ubCeFp8A
 y4RQhIzH05dvdAyMLquMRTJutvRkQnZ/m4ttP7w1gDmIHhHfmB472H4uPLwtQAbChcbM6pw==
X-Gm-Gg: ASbGncvivT38GQ+gmJGsRCo1b1BKwQ/hoLPwDheZKVv78GoCmT64b6jKZPrVsF1/M0X
 DGrDewp4q8z+bioBca91e7ZU1Cl+lbJB2Qu92NYTacAN+ajh+XhNPgsFjlS3S9igU7o0Op2udx0
 /Srl6kzVhBv0HQS+q4vh6ekRgO5vYBGKzyUWLmB/IWDtR7vdBRCHPNB4FoQ5Uk7Zan3FRou7dGr
 pmSw5mOxZ6EWrMPXnuqj7ajnoMC91y3iAb4b5hOExgb0vRJC1nQRYyYjzAybKRQDm1Q3Pk3nIFw
 gU9jVTpaETzvYhvoQzpXCv56h5CnNRpHj2In697G+F0mU/G+bAZLQ0ZOnGwXTE5NfUV8HKCSR1H
 m/k9wqTWlm0FE37pdL5iHTg==
X-Received: by 2002:a05:6000:310e:b0:3c3:5406:12b0 with SMTP id
 ffacd0b85a97d-3c5d53b40abmr247275f8f.30.1755806903622; 
 Thu, 21 Aug 2025 13:08:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+53ePp4gOBoZK5+aLlST4uu6G3xHtHBUa0vmdrbtPfJ4bf44S3Zn2IpCr0m84pAneAOD81g==
X-Received: by 2002:a05:6000:310e:b0:3c3:5406:12b0 with SMTP id
 ffacd0b85a97d-3c5d53b40abmr247245f8f.30.1755806903113; 
 Thu, 21 Aug 2025 13:08:23 -0700 (PDT)
Received: from localhost
 (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de.
 [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3c0771c1708sm13032145f8f.38.2025.08.21.13.08.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 13:08:22 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: David Hildenbrand <david@redhat.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>, Alex Dubov <oakad@yahoo.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
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
Subject: [PATCH RFC 27/35] memstick: drop nth_page() usage within SG entry
Date: Thu, 21 Aug 2025 22:06:53 +0200
Message-ID: <20250821200701.1329277-28-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1ewhJQ4j43A0EoneXTV_5kLZYRCfaIYGk3URkUTtxuI_1755806904
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

Cc: Maxim Levitsky <maximlevitsky@gmail.com>
Cc: Alex Dubov <oakad@yahoo.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/memstick/host/jmb38x_ms.c | 3 +--
 drivers/memstick/host/tifm_ms.c   | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/memstick/host/jmb38x_ms.c b/drivers/memstick/host/jmb38x_ms.c
index cddddb3a5a27f..c5e71d39ffd51 100644
--- a/drivers/memstick/host/jmb38x_ms.c
+++ b/drivers/memstick/host/jmb38x_ms.c
@@ -317,8 +317,7 @@ static int jmb38x_ms_transfer_data(struct jmb38x_ms_host *host)
 		unsigned int p_off;
 
 		if (host->req->long_data) {
-			pg = nth_page(sg_page(&host->req->sg),
-				      off >> PAGE_SHIFT);
+			pg = sg_page(&host->req->sg) + off / PAGE_SIZE;
 			p_off = offset_in_page(off);
 			p_cnt = PAGE_SIZE - p_off;
 			p_cnt = min(p_cnt, length);
diff --git a/drivers/memstick/host/tifm_ms.c b/drivers/memstick/host/tifm_ms.c
index db7f3a088fb09..0d64184ca10a9 100644
--- a/drivers/memstick/host/tifm_ms.c
+++ b/drivers/memstick/host/tifm_ms.c
@@ -201,8 +201,7 @@ static unsigned int tifm_ms_transfer_data(struct tifm_ms *host)
 		unsigned int p_off;
 
 		if (host->req->long_data) {
-			pg = nth_page(sg_page(&host->req->sg),
-				      off >> PAGE_SHIFT);
+			pg = sg_page(&host->req->sg) + off / PAGE_SIZE;
 			p_off = offset_in_page(off);
 			p_cnt = PAGE_SIZE - p_off;
 			p_cnt = min(p_cnt, length);
-- 
2.50.1

