Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA3EB303B5
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 22:08:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB3FB10EA0B;
	Thu, 21 Aug 2025 20:08:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="YrchmRgT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E13310EA0C
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 20:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755806900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5INZuVEW8ZoCVRVHt0CSLhpT4h786L9PUsnD4NVlnkc=;
 b=YrchmRgTkp/T/Ji2mPCA7onSMi7eLi/o4YCF4d9LsqJfEdLjzYJAyO+s145PGvQCbZirUI
 /PQ1+BEOB7JCaEwWDsPOC7nG+VtsOhvsVL20QogiCVnsbqa9hdR4Ia4EjaienvCqsMY4sZ
 +BGHIk1FGeIsHEcrPSm+YMQL99QITYQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-689-pXk79cdUPkaNDtOEodjqjg-1; Thu, 21 Aug 2025 16:08:18 -0400
X-MC-Unique: pXk79cdUPkaNDtOEodjqjg-1
X-Mimecast-MFC-AGG-ID: pXk79cdUPkaNDtOEodjqjg_1755806897
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-45b51411839so824215e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 13:08:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755806897; x=1756411697;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5INZuVEW8ZoCVRVHt0CSLhpT4h786L9PUsnD4NVlnkc=;
 b=vBJt2Z5WZ2pfub0bjUAHjxwQ8TO1q4m/vgG+fGnmneCb/e+iht0zEv2jfndkL1gjyP
 UH1q1ju2VzN2Q95WIGt9wOM9AC94w1Zs7SDN3dSppZRvzuamk39vBEUNrWJ+tPrwquyQ
 MDLdn3C32mab1GNLkP7B0B/N/gfzLhuIwEAZV1EHsJNQLRosWfROghmA8QxnjqZ5+R1k
 aVmyP4+D6f8Y2yGc3B1f4wmBSduSIb2LxnKiYtkKy8+GOFDs/LUqd8U+cBIGbOUSiAZJ
 sj8RaGV5u2NIoZr1qAXAVqk8jLgzK21rL6mjm4LINHFMEL9fMuiaA28yvhuKjmdkTB2l
 yc2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW78ZCPRcmrC4q1qTodJ/JjlZDbieBSsK4gXmgtvAUNBmcv4zfbZTp0PPVrUVDZZX0uqSc5pOvNgMc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxTjsTf6kbPtbJeQa7P4x2lKsg/wfrEixecxI+uNHpDwPLMOlJ6
 9c47ADAUMUU4KpBB5Mz+4zUZcMg06Gv8/36Uiwx8DKgc5rRNT54j7gyQ1HXtPhWn+w2iG2FgD9j
 lC5em+GvtwFvq7t4Fqv7V4eVZdkqSOpUJ4g9cOx6pVts6mvyboBvReIUKHyiBfhsvwVk2BA==
X-Gm-Gg: ASbGncva06gRE8gScalnOPzFpSCw+rOln02hvZhgXD4apg+a+Dw8u7tMHna3AW6tstQ
 h6UloDv56mWgsGTVVjD+DNbs9iFJDihsm+AqcDJ+Qzm/agtiDmeDWytO1k33fZqpD4W0Kt/Xl6Q
 teDcp6i8N4u3mRKxYGjFeCdcLyRMhpZCYay3Zj0Yf8AX6ddXtWuTkfwsQzchYjq/Y65XTrQkyj8
 ooKjr4wkNuV6vJ+W+oTuKXuZivQeERlvwmohpUJvs0VbAMlCEbjBcc91PqfueuMtkttXlfPjq24
 DkwLwP7Esk7B3spsFFjYtuZESMIfny4Y9Jh7X/VKPZgWdu1XcDsoCFdDNHQsqx/+QusywnZEFaz
 hGLW29RmmeDq21E/oSdesCw==
X-Received: by 2002:a05:600c:470c:b0:456:285b:db29 with SMTP id
 5b1f17b1804b1-45b517d416bmr2506065e9.29.1755806897462; 
 Thu, 21 Aug 2025 13:08:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPdYXvWWhsiYzUao4v8GSpApokx2tOJxTxGWaryOs6bj53AmOc+7o5w7P2pIRGnKU6jzi+ow==
X-Received: by 2002:a05:600c:470c:b0:456:285b:db29 with SMTP id
 5b1f17b1804b1-45b517d416bmr2505625e9.29.1755806896948; 
 Thu, 21 Aug 2025 13:08:16 -0700 (PDT)
Received: from localhost
 (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de.
 [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45b50e3a551sm8831035e9.19.2025.08.21.13.08.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 13:08:16 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: David Hildenbrand <david@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Alexander Potapenko <glider@google.com>,
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
Subject: [PATCH RFC 25/35] drm/i915/gem: drop nth_page() usage within SG entry
Date: Thu, 21 Aug 2025 22:06:51 +0200
Message-ID: <20250821200701.1329277-26-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: faS1oc9LYsNRRzXQX2OP806zlaZdR_jToVRHJ7ZUJN8_1755806897
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

Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_pages.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
index c16a57160b262..031d7acc16142 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
@@ -779,7 +779,7 @@ __i915_gem_object_get_page(struct drm_i915_gem_object *obj, pgoff_t n)
 	GEM_BUG_ON(!i915_gem_object_has_struct_page(obj));
 
 	sg = i915_gem_object_get_sg(obj, n, &offset);
-	return nth_page(sg_page(sg), offset);
+	return sg_page(sg) + offset;
 }
 
 /* Like i915_gem_object_get_page(), but mark the returned page dirty */
-- 
2.50.1

