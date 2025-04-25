Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFE5A9C0B5
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 10:17:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE72710E8CC;
	Fri, 25 Apr 2025 08:17:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="IjfP2hX8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 967A910E8CC
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 08:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745569064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9zl4AHm9mXbjqorzBNgFLxI0voD1/7+bTcOR/2Fa4AA=;
 b=IjfP2hX8BUjPBUsYA/CfvBpPf2pEg/bYNBPhGsUUUpebed+UYMchcafASaTHd0Pe1V4Rfg
 4GCQZk7605R10MIr7lqBpREk8/VWMkGvJAfH4hQowWE7Cv/o6nZpqOLDEnGV5F0Ry8qPAJ
 /chRNZYi+KpZrSWqj6Tz6SYvI7Kg27E=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-536-FGRXTVqnPF-fKPeajg52pw-1; Fri, 25 Apr 2025 04:17:42 -0400
X-MC-Unique: FGRXTVqnPF-fKPeajg52pw-1
X-Mimecast-MFC-AGG-ID: FGRXTVqnPF-fKPeajg52pw_1745569061
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-39d9243b1c2so667653f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 01:17:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745569061; x=1746173861;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9zl4AHm9mXbjqorzBNgFLxI0voD1/7+bTcOR/2Fa4AA=;
 b=PX1Il8nM+OhryxIdj4kYtxat5G7cYCCfdqR95pAn01YKPr2FvZPk7QanjnOG+IZOAu
 XOEakmCXPHZdY6Din7fyBsJLRk/XU37tiTbOzyCG8RxU7z1gcGR+tpsxdNlRtgObq5VW
 MH4Cj/zngBMpwAMru4alR0ZwNQFE/fgrrIb88/D9Dh7NneBta0vJ5XUfqvDy7cgrrwaH
 1KntooFYD7cjuoK/76MXX4FqUkhhdjrlX1Pz3+07suCh3mb+zOtMPrIBd+Ly/gFZp0fY
 ep4Fs8Kf/wCro/hK2F+isqgIee5p0J19p2MCr5gjyM0eeXtX7pXnDHSrcjw6vZbXZd5i
 VWpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXjCSsX7Ln7C3WClvoUmKwYhN8VInScb7hbqCLl8V1l4GR/MGAw+QgLQotJ9p5Lf4iFopvEROK5yM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzzPcljoLEroBwMPf4MJymEi16Qa8HGTeqM/OIftSSumqctJZuq
 i/C9upGQ7xNjtp/2ZuRQ+xAXgSJhqTEfrjfVVXH5KSK+wWrTZ+xApFyXRhj6w6qqBDMwy5HySay
 8cqJwaVDEkCUNZ/ryKtRcn2sLhaswqIwmzyckB4ruLgbedDOjbbBooz6Vk0hxO3F1uA==
X-Gm-Gg: ASbGncvoOZzJmAdRnd6YXu4zRT83SXd5XiGqpZOjT+8yIVw/fkriADx1Q8kNjFUz9Iz
 8xXnIHTH4+TT0kDJ9uCqR6k/4B2lAh8DJDFxvoW839TJmVmwi1osPuuj1CCDurRCq80FMqGk9+t
 +6Raf2uVkvBD7FM+0IK6UxbdEyu/fFkdlqXa46v5NpJidLXHLADwd5a68C3mt18tVcb67F5U4WW
 Hizug1O4qOW/SaoRlsFniAnKAMXFsKh+J+cVyfFHk4lqhEi8ILhdbv7X6YBSLCBlhK3XigRykNm
 kEQUoQMySE/OwEoFf2NsKzoaj5hgmsiCZhV34ys6tTjl6C38rhAoaBdzeaqaGpbvgMaGkkQ=
X-Received: by 2002:a05:6000:4028:b0:391:2ab1:d4b8 with SMTP id
 ffacd0b85a97d-3a074e0efd6mr859046f8f.1.1745569061448; 
 Fri, 25 Apr 2025 01:17:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6cbIXolQS+v1W8kKfDd2qap93n7uHX4eGz19p8/zV2hhP2TLcyzd7t5uofpqhlq66/UdpGw==
X-Received: by 2002:a05:6000:4028:b0:391:2ab1:d4b8 with SMTP id
 ffacd0b85a97d-3a074e0efd6mr859013f8f.1.1745569061032; 
 Fri, 25 Apr 2025 01:17:41 -0700 (PDT)
Received: from localhost
 (p200300cbc70f69006c5680f80c146d2a.dip0.t-ipconnect.de.
 [2003:cb:c70f:6900:6c56:80f8:c14:6d2a])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a073cc4153sm1649210f8f.57.2025.04.25.01.17.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Apr 2025 01:17:40 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, x86@kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org,
 David Hildenbrand <david@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrew Morton <akpm@linux-foundation.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>, Peter Xu <peterx@redhat.com>
Subject: [PATCH v1 10/11] drm/i915: track_pfn() -> "pfnmap tracking"
Date: Fri, 25 Apr 2025 10:17:14 +0200
Message-ID: <20250425081715.1341199-11-david@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250425081715.1341199-1-david@redhat.com>
References: <20250425081715.1341199-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yMljprLB3WOQay3KDN7o-5FKHMSCoVaiKerqnZhkqn8_1745569061
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

track_pfn() does not exist, let's simply refer to it as "pfnmap
tracking".

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/gpu/drm/i915/i915_mm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_mm.c b/drivers/gpu/drm/i915/i915_mm.c
index 76e2801619f09..c33bd3d830699 100644
--- a/drivers/gpu/drm/i915/i915_mm.c
+++ b/drivers/gpu/drm/i915/i915_mm.c
@@ -100,7 +100,7 @@ int remap_io_mapping(struct vm_area_struct *vma,
 
 	GEM_BUG_ON((vma->vm_flags & EXPECTED_FLAGS) != EXPECTED_FLAGS);
 
-	/* We rely on prevalidation of the io-mapping to skip track_pfn(). */
+	/* We rely on prevalidation of the io-mapping to skip pfnmap tracking. */
 	r.mm = vma->vm_mm;
 	r.pfn = pfn;
 	r.prot = __pgprot((pgprot_val(iomap->prot) & _PAGE_CACHE_MASK) |
@@ -140,7 +140,7 @@ int remap_io_sg(struct vm_area_struct *vma,
 	};
 	int err;
 
-	/* We rely on prevalidation of the io-mapping to skip track_pfn(). */
+	/* We rely on prevalidation of the io-mapping to skip pfnmap tracking. */
 	GEM_BUG_ON((vma->vm_flags & EXPECTED_FLAGS) != EXPECTED_FLAGS);
 
 	while (offset >= r.sgt.max >> PAGE_SHIFT) {
-- 
2.49.0

