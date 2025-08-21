Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4019FB3035F
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 22:07:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A27510E3BA;
	Thu, 21 Aug 2025 20:07:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="HgJ7eRIi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0B3010E3B9
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 20:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755806836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7sWLap5u4LkaWlbSo2T/W3JLtp2tuveUv2Z9sucaeo0=;
 b=HgJ7eRIiRnHUwprw8uD+r1ajPbmAARMgTrShQtGg1sioMAt8EgUgFef4vrY+ot4FQmuFbk
 0Ii31kXOjJrOklrts4rPKdqCnpL3OwIhKWoYf1d76pOXYRfVgQeRDIgAAGOPPypiYEq77G
 Yxj9qQkyxewoHCwOAyMLSjVhWqngJBU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-614-LTWOBNvrO5O1XJ6v-dcMXg-1; Thu, 21 Aug 2025 16:07:14 -0400
X-MC-Unique: LTWOBNvrO5O1XJ6v-dcMXg-1
X-Mimecast-MFC-AGG-ID: LTWOBNvrO5O1XJ6v-dcMXg_1755806833
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-45a1b05d251so7730775e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 13:07:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755806833; x=1756411633;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7sWLap5u4LkaWlbSo2T/W3JLtp2tuveUv2Z9sucaeo0=;
 b=NEzCnWJdIlBZMKjtHB/GyxyjcyRKtAwutZDhydlfP1/08ejfV4Ww7ABVQkgOC5R/o8
 dzMN7gKbG1txfNLmYJRmgGSRjCli/VlKJP3abiKuaQCO+65R+885/NTBIcpXfunGJtmb
 /Loim1Hf2TlI/fm9iDz1ITH0/pUqgGgpSOt2quyvj+bcqBauHoJWc714rlk8g9Yr2P5B
 kqCPWwh0wzZJL11p6OQQR/3D8O0Gorle6QNy35b0MzY1OLJcPoRmZ6QSXoeBhIhV3PbA
 TItYsHzjjj1WK0M7GWaorDXoD8UQs4Zm+JkLMZ9O5DwuzM/UPJ7FV0hFvBu6blzEERHe
 4O6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwLKDQedufPK2zm/px5ig6/tDJWWXO07PcSjP7prtdSwtiz57mBsbuerQSHGlIzkoVKPdMQrCG56o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx8HThAOlRxLwKwC018l/SbyPt6y6UphKoDzRufB2cE6mRkCOCN
 QkdnEh+uJxIpLBOqwgRBreWTQrwiXpuO5ZdFBPG//GpUOlNa2ry+Sz0PZLgJqMACFkiI7TJc9Bm
 JUY/KSQEx26TYhAUjb71u7+MHm9BNTwxOr+sSpRD+885o4N6m7xMBQ/Ogdd+tJJxIxoZ6mQ==
X-Gm-Gg: ASbGncsOdKf96zoSAIv5M6Ox14ZLJmaRy5smW5dt6BiKaOtlVhMIVi9GvQ2WiD1eew6
 dwRY5/v/mq/XyhasTx2WibWkepsMBo/L3cNQLAJitaNRdo3Es8ZIgHA0J9+487+7e3t/Xs49aeb
 VYjTm5OA2EJXbShq7T7rZBSAqf37mWyUiLClMp2it4nGcUsx/T52ikM3bv9yJ97fW224yijFP5X
 Xw+fhL6UckhVcRdKn/P7ps3NoZrjAo4g6rXA/2OR+toLspLr/gRPu7o4BHepQeufMc/zBPTlegM
 A73yYSphUs8vIEuHZRCMpone/OtKEHavlic+Xcl0MTvhrZ5JdRI7Z64CXtcHrWbH9QpepdNgxZm
 2cTxC7rfHii2hKxZ0bbGOMQ==
X-Received: by 2002:a05:600c:1d06:b0:455:ed48:144f with SMTP id
 5b1f17b1804b1-45b5179669dmr2598615e9.14.1755806833372; 
 Thu, 21 Aug 2025 13:07:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSutx6qbatKffMJ28UfT2ZDXFlSv+vNq81oYks3KAGI73zxxTWKo8ClwQ/mmPq6W0wDfVQow==
X-Received: by 2002:a05:600c:1d06:b0:455:ed48:144f with SMTP id
 5b1f17b1804b1-45b5179669dmr2597955e9.14.1755806832889; 
 Thu, 21 Aug 2025 13:07:12 -0700 (PDT)
Received: from localhost
 (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de.
 [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3c0771c166bsm12916801f8f.33.2025.08.21.13.07.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 13:07:11 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: David Hildenbrand <david@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
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
Subject: [PATCH RFC 02/35] arm64: Kconfig: drop superfluous "select
 SPARSEMEM_VMEMMAP"
Date: Thu, 21 Aug 2025 22:06:28 +0200
Message-ID: <20250821200701.1329277-3-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NeAShInkXXHShn0GrC1IPtagipwvudjrmP0aXvcK4qY_1755806833
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

Now handled by the core automatically once SPARSEMEM_VMEMMAP_ENABLE
is selected.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/arm64/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index e9bbfacc35a64..b1d1f2ff2493b 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1570,7 +1570,6 @@ source "kernel/Kconfig.hz"
 config ARCH_SPARSEMEM_ENABLE
 	def_bool y
 	select SPARSEMEM_VMEMMAP_ENABLE
-	select SPARSEMEM_VMEMMAP
 
 config HW_PERF_EVENTS
 	def_bool y
-- 
2.50.1

