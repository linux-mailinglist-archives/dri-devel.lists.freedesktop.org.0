Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6853B303AF
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 22:08:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E155910EA0A;
	Thu, 21 Aug 2025 20:08:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="RpPHIlIz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5EE710EA08
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 20:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755806897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qEz5al18caSg7WeU7/xaDhHrA43/vq8xaUIrOF+uMyw=;
 b=RpPHIlIzTn2wy4DImGCL6lMrvKPiPAG8KmWV9t7khMbi/4nUYWvaLrEGXrPwNwJ+42n/uC
 OErGeNh7AqwBjFtTuJHcMlvC/WwdcxMjwcrabUj3JwiQPwlUalSi2xA3/3xdEl5JlXksFy
 YllAkT3ItE+u3VH4kKDNhliOVy9zE1Y=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-570-_tl1tQ9uM7ql9DKji1yGqA-1; Thu, 21 Aug 2025 16:08:16 -0400
X-MC-Unique: _tl1tQ9uM7ql9DKji1yGqA-1
X-Mimecast-MFC-AGG-ID: _tl1tQ9uM7ql9DKji1yGqA_1755806895
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3b9e4117542so631248f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 13:08:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755806894; x=1756411694;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qEz5al18caSg7WeU7/xaDhHrA43/vq8xaUIrOF+uMyw=;
 b=AWF0Mzr9Drku4udfhetWpGX44DEElfWafL6hgaiyrvAgJH/O2/7cYwFxm/nS3xIIne
 hK6YoKAsKvVtGd7ZFuo0faCyTdWCjkRelxAt32+U4CAL9xUn2oPzyVQY2+UZA6UE83Sn
 oNHrdVgm7QOx8bb9RRTt4pOXCrLtXRw4Vx8ue6fAGjb+GVCX2yVGirJ+17DPXwXJAKZP
 zOSIun0FU0PPXXKK80DkyY3bpDNHGKAHbItHPGUGDLIwKxVh69VTiC2krauLm3saGdkT
 UIf41+kaI0zuLuhYqeyFk5/G5BjG87JNuUJHD8PJJQEGA6hZbOvbdyVgfIO6LfinD7fJ
 ykfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrKgmwWfuvjZ10RifTnWXwr+GxPtw+trbGmw4UrIO+FQjfWAhsTrxWkCrbKAvBHvSpw2WC0qozBY8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKj1yKf+6qH8epxBTOv7UFZ9DLKgnb9+X2eM/Hp6FFjnGuKqiv
 I04rcSy4dLKqP91NYkAwMPEOPG/yFcMVepL600dcD67rhSstbD3Uo4lwzpo8Xtb+K2rWOC3UZip
 of7vobukVav7/OJ9qiVRoO4MtV+SwHWHVNkX/7wyqxejcnjC/NpD9n3AY/3CuYJ+pc/5JkQ==
X-Gm-Gg: ASbGncu2K6HFZd/s6IOcg4IrSfLeew/ye+Ftswq260bbzjAyAGkXo72GBm6sZywHMgN
 xUYFA0jvlmZ9DR7en1RQr5MI9nYoYxT0xoP1w6ra/H3xfSbpu1FcLcSYxRaxVx0JdX057UYpCae
 KDX1GHsasTnAq52bg2OUKyBcNqNOSFS2bXvM5gU4kD4JYUVF0JX5K7a/SZBUKCfn+1EjKd7j1oH
 QKnuhql2iuCxbCp6VrWFUao1VPrOLsJvbYFtT8AqhoXEtyaapLWgy0r9u20BlpsQtA85PwxWkNo
 zIz/bqasz9nzWr1xG0NghRO0PAMnJmBydoDjfdqpjFRsukWE9IIQnzRD8xeltS0TPePkK7/yIK8
 xq9ig4377TZFzd/tondfRQA==
X-Received: by 2002:a05:6000:18ad:b0:3b7:9c79:32bb with SMTP id
 ffacd0b85a97d-3c5dcdf9bd9mr215830f8f.44.1755806894485; 
 Thu, 21 Aug 2025 13:08:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYrE9N2OTZOZSEOVxEUY9xhX4UsF8UOhI+5wOqBRpd/3VSIxUjVMLdiea20BiXkc+w3FSZ8A==
X-Received: by 2002:a05:6000:18ad:b0:3b7:9c79:32bb with SMTP id
 ffacd0b85a97d-3c5dcdf9bd9mr215789f8f.44.1755806894010; 
 Thu, 21 Aug 2025 13:08:14 -0700 (PDT)
Received: from localhost
 (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de.
 [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3c074e38d65sm12982954f8f.27.2025.08.21.13.08.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 13:08:13 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: David Hildenbrand <david@redhat.com>, Damien Le Moal <dlemoal@kernel.org>,
 Niklas Cassel <cassel@kernel.org>, Alexander Potapenko <glider@google.com>,
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
Subject: [PATCH RFC 24/35] ata: libata-eh: drop nth_page() usage within SG
 entry
Date: Thu, 21 Aug 2025 22:06:50 +0200
Message-ID: <20250821200701.1329277-25-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KkT26ZHw65aEIsKWLVkLZHqHpRejUBBhpKlrMQ7_Mwk_1755806895
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

Cc: Damien Le Moal <dlemoal@kernel.org>
Cc: Niklas Cassel <cassel@kernel.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/ata/libata-sff.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/ata/libata-sff.c b/drivers/ata/libata-sff.c
index 7fc407255eb46..9f5d0f9f6d686 100644
--- a/drivers/ata/libata-sff.c
+++ b/drivers/ata/libata-sff.c
@@ -614,7 +614,7 @@ static void ata_pio_sector(struct ata_queued_cmd *qc)
 	offset = qc->cursg->offset + qc->cursg_ofs;
 
 	/* get the current page and offset */
-	page = nth_page(page, (offset >> PAGE_SHIFT));
+	page += offset / PAGE_SHIFT;
 	offset %= PAGE_SIZE;
 
 	/* don't overrun current sg */
@@ -631,7 +631,7 @@ static void ata_pio_sector(struct ata_queued_cmd *qc)
 		unsigned int split_len = PAGE_SIZE - offset;
 
 		ata_pio_xfer(qc, page, offset, split_len);
-		ata_pio_xfer(qc, nth_page(page, 1), 0, count - split_len);
+		ata_pio_xfer(qc, page + 1, 0, count - split_len);
 	} else {
 		ata_pio_xfer(qc, page, offset, count);
 	}
@@ -751,7 +751,7 @@ static int __atapi_pio_bytes(struct ata_queued_cmd *qc, unsigned int bytes)
 	offset = sg->offset + qc->cursg_ofs;
 
 	/* get the current page and offset */
-	page = nth_page(page, (offset >> PAGE_SHIFT));
+	page += offset / PAGE_SIZE;
 	offset %= PAGE_SIZE;
 
 	/* don't overrun current sg */
-- 
2.50.1

