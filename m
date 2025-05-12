Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD94AB2F72
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 08:19:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E20610E2A3;
	Mon, 12 May 2025 06:19:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BB7610E2A3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 06:19:30 +0000 (UTC)
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-650-4WutLAkXMKOEofd8dd3e8A-1; Mon,
 12 May 2025 02:19:25 -0400
X-MC-Unique: 4WutLAkXMKOEofd8dd3e8A-1
X-Mimecast-MFC-AGG-ID: 4WutLAkXMKOEofd8dd3e8A_1747030763
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id F0D3319560AA; Mon, 12 May 2025 06:19:22 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.64.136.70])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 844AD19560B0; Mon, 12 May 2025 06:19:17 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org, tj@kernel.org, christian.koenig@amd.com,
 Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>
Cc: cgroups@vger.kernel.org, Waiman Long <longman@redhat.com>, simona@ffwll.ch
Subject: [rfc] drm/ttm/memcg: simplest initial memcg/ttm integration (series
 v3)
Date: Mon, 12 May 2025 16:12:06 +1000
Message-ID: <20250512061913.3522902-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RRGIMUQJ0UJ8h-CmhjEtrUHcnddfK3Y7qtjCOvoVVi4_1747030763
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
content-type: text/plain; charset=WINDOWS-1252; x-default=true
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

Hey,

This is my 3rd attempt to try and integrate ttm and memcg accounting.

I've tried to take on board the feedback given on the last series, and
made some compromises to try and close in on the solution.

Feedback:
1. memcg folks didn't really like the gpu specific stats due to a lack
of global stats being exposed.
2. After consideration of the resource level memcg accounting, I tried
to reason about swap evictions a bit and couldn't come up with a good
way to make it work, so I moved back down to ttm.
3. Use a placement flag instead of ctx flag.

This series starts by adding two per-node stats to the mm layers,
to track memory allocated to the gpu in active use, and memory sitting
in the reclaimable ttm pools.
Then it adds the memcg stat for active gpu as before,=20
(reclaimable is not accounted to a memcg at all).
I didn't go back to use __GFP_ACCOUNT and manual stat tweaking, because
kmem is definitely not the correct place to account this memory. This
memory is never used by the kernel, it's used by userspace and the GPU
in nearly all cases, so I think accounting it under kmem is very wrong.
I'm hoping adding the global stats might alleviate any concerns.

I had to move back to ttm_tt accounting instead of ttm_resource, as
when a resource gets evicted to swap, the memory is freed and the memcg
accounting should be updated correctly, as such I ended up going back
to adding the accounting in ttm_tt population paths.

Regards,
Dave.

