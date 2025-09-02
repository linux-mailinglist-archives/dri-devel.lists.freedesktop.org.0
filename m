Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 637DEB3FA22
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 11:22:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 434EB10E60E;
	Tue,  2 Sep 2025 09:22:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="FvRDXiq5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6E8010E60C
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 09:22:12 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-45b7d497abaso33599915e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 02:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1756804931; x=1757409731;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0Be300C9M54HN2j6qqn3KzILYOn0Dm/rUn/s4aJntRQ=;
 b=FvRDXiq5YinIsGc3VhHvX39TN56wdw26wOXxdPcWcnwCFV89QlY+33b/19ToKqkvwq
 6AmLMOv1rFleQ71vWvWBqdFZkMcRhc4fJN1IzwfO+++UcGZjusAa7AavlbwZ+et5BXV0
 bOxT38uB3MOK460NEN8FUkM5jCloEcSLzagG8bxC1uds1+cjp81bMh+ykCUm3jQeYnmy
 vONXQAqv66nU/JZA5t6LsBPRHP0x3BEmkKLo9uij88Y0/HHVplB46PiaVkLSNSxIv3NH
 320bNdtmrihkL6Os8sPCuS8z5KIjpp7w+G3JOFnxem3UJV15U31EzljMshONWW0AZn2o
 hsSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756804931; x=1757409731;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0Be300C9M54HN2j6qqn3KzILYOn0Dm/rUn/s4aJntRQ=;
 b=K7I+fANnunXVDYtDARsMQI/okVnooDBQOib4D+gAVQ51YdPTPJKBCkT++31NoHHqfP
 6JRZM2fxHYRfbHNXkam5zAwnmHY3HNbmqywZwJZ/4h0r+46IMeHiVLFvRh4eHRsgD7IY
 g8veN0RKh13R8/Zv5VGVXp2myLxVqDKEMkyHCFlASXmOpEjYvaoMSzT5UrS5Ht4zIFp3
 MWrO1ObEtoaShaGVgpg7lgx4D2PGvebHI3L0pqNHZOyJVRbxz7HzwTo+FKMQhnpPt+BL
 2zTKSUzGs4cx2A/wlv3d7LAhGQq+Xq+uaA68LlghHPue1bNoNIuAgO5p6KqVpReGyE/1
 Satw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnXwz/xkB85M2ye91WLdVFkhXENZs0K02nr17POUBnGdNPCiLD7CJTbIMrXGR4+UvXyHCzpIQqgKo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyqnS/0XhupOS5EMYd9l0pe5EUJyglKmRIXj401PDDlZwj4VvSw
 C+BoYaUJVGO6n+biVgYMi+oDLOot2l3cCI/vNtb404C8W8ABNA1GvxcHfsAJ+Bd6cXc=
X-Gm-Gg: ASbGncu+cMLDVzyiHtP4kSw6D/cckOAMcVT6YdyCDj3xBzY2WGMzj0Gf0WOEdU7hV1w
 7Cc/px+FklVgyT8M056Q9vRItbFljdXCkLUGoWY2nFjXb1sqoMv64/WOmN8X3VUeFzmHlOgPnaT
 aOpbDl0f2XjO2SxRe+LOxTSs6olazvUgcZ/B4LlvfJiG6i+6GkZQV7qwJYmbMaJ/oqwzr9KMsh5
 eFqYW+jFwczoWHB6BHtY/I65dv+UZP+mR84aaJjy+fdG8wxCSr2VNuqJnykRan0z8YOK+DcCLBM
 XrtRQe8WV9KaY3DE0NHyPKJv+syghEpPP64v4Ulb6mSZZxoe0WHfH24jS6p3VJ0yoFZFSi+J0D0
 RDls6HxHKISYsRJc4OJdLfPxOZGHbyVUKpfQ=
X-Google-Smtp-Source: AGHT+IFjGWdM7r4OC2xPYq10JBW42QzIVS9ISDbv655toZnOdc57tKWSkMByc2ni755H7QY3mBnVYA==
X-Received: by 2002:a05:600c:a04:b0:45b:7d24:beac with SMTP id
 5b1f17b1804b1-45b8553335amr94619035e9.10.1756804930815; 
 Tue, 02 Sep 2025 02:22:10 -0700 (PDT)
Received: from [192.168.0.101] ([84.66.36.92])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3d0b9402299sm17994846f8f.18.2025.09.02.02.22.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Sep 2025 02:22:10 -0700 (PDT)
Message-ID: <4bbf5590-7591-4dfc-a23e-0bda6cb31a80@ursulin.net>
Date: Tue, 2 Sep 2025 10:22:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 26/37] drm/i915/gem: drop nth_page() usage within SG
 entry
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
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
 linux-scsi@vger.kernel.org, Marco Elver <elver@google.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Muchun Song <muchun.song@linux.dev>,
 netdev@vger.kernel.org, Oscar Salvador <osalvador@suse.de>,
 Peter Xu <peterx@redhat.com>, Robin Murphy <robin.murphy@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>,
 virtualization@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>,
 wireguard@lists.zx2c4.com, x86@kernel.org, Zi Yan <ziy@nvidia.com>
References: <20250901150359.867252-1-david@redhat.com>
 <20250901150359.867252-27-david@redhat.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20250901150359.867252-27-david@redhat.com>
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


On 01/09/2025 16:03, David Hildenbrand wrote:
> It's no longer required to use nth_page() when iterating pages within a
> single SG entry, so let's drop the nth_page() usage.
> 
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_pages.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> index c16a57160b262..031d7acc16142 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> @@ -779,7 +779,7 @@ __i915_gem_object_get_page(struct drm_i915_gem_object *obj, pgoff_t n)
>   	GEM_BUG_ON(!i915_gem_object_has_struct_page(obj));
>   
>   	sg = i915_gem_object_get_sg(obj, n, &offset);
> -	return nth_page(sg_page(sg), offset);
> +	return sg_page(sg) + offset;
>   }
>   
>   /* Like i915_gem_object_get_page(), but mark the returned page dirty */

LGTM. If you want an ack to merge via a tree other than i915 you have 
it. I suspect it might be easier to coordinate like that.

Regards,

Tvrtko

