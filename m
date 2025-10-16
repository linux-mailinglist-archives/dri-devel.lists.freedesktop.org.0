Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 759A1BE1486
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 04:33:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6DA610E91D;
	Thu, 16 Oct 2025 02:33:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E933610E91D
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 02:33:30 +0000 (UTC)
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-588-PmTr5S_wOAebkj-IuA69SQ-1; Wed,
 15 Oct 2025 22:32:19 -0400
X-MC-Unique: PmTr5S_wOAebkj-IuA69SQ-1
X-Mimecast-MFC-AGG-ID: PmTr5S_wOAebkj-IuA69SQ_1760581937
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 776EF18002E4; Thu, 16 Oct 2025 02:32:16 +0000 (UTC)
Received: from dreadlord.taild9177d.ts.net (unknown [10.67.32.64])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 7FF541800579; Thu, 16 Oct 2025 02:32:09 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org, tj@kernel.org, christian.koenig@amd.com,
 Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>
Cc: cgroups@vger.kernel.org, Dave Chinner <david@fromorbit.com>,
 Waiman Long <longman@redhat.com>, simona@ffwll.ch
Subject: drm/ttm/memcg/lru: enable memcg tracking for ttm and amdgpu driver
 (complete series v4)
Date: Thu, 16 Oct 2025 12:31:28 +1000
Message-ID: <20251016023205.2303108-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vzfvNVM4n8rDl0xKMgfV2pOGu5hQxa0GMyVHhpPE-Tw_1760581937
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

Hi all,

This is a another repost with some fixes and cleanups. I've added Christian=
's acks/reviews from the
previous round. I've fixed the obj_cgroup_put into the core, instead of in =
the drivers.

I'd really like to land this into drm-next, I've added Maarten xe support p=
atch to this. I'd like
to get any missing acks/reviews.

Christian, I think you said patch 4 got lost last time, hopefully you get i=
t this time.

Patches still needing ack/review:
ttm/pool: drop numa specific pools
ttm/pool: track allocated_pages per numa node.
ttm: add objcg pointer to bo and tt (v2)
ttm/pool: enable memcg tracking and shrinker. (v2)
amdgpu: add support for memory cgroups

Differences since v1 posting:
1. added ttm_bo_set_cgroup wrapper - the cgroup reference is passed to the =
ttm object.
2. put the cgroup reference in ttm object release
3. rebase onto 6.19-rc1
4. added xe support patch from Maarten.

Differences since v2 posting:
1. Squashed exports into where they are used (Shakeel)
2. Fixed bug in uncharge path memcg
3. Fixed config bug in the module option.

Differences since 1st posting:
1. Added patch 18: add a module option to allow pooled pages to not be stor=
ed in the lru per-memcg
   (Requested by Christian Konig)
2. Converged the naming and stats between vmstat and memcg (Suggested by Sh=
akeel Butt)
3. Cleaned up the charge/uncharge code and some other bits.

Dave.

Original cover letter:
tl;dr: start using list_lru/numa/memcg in GPU driver core and amdgpu driver=
 for now.

This is a complete series of patches, some of which have been sent before a=
nd reviewed,
but I want to get the complete picture for others, and try to figure out ho=
w best to land this.

There are 3 pieces to this:
01->02: add support for global gpu stat counters (previously posted, patch =
2 is newer)
03->06: port ttm pools to list_lru for numa awareness
07->13: add memcg stats + gpu apis, then port ttm pools to memcg aware list=
_lru and shrinker
14: enable amdgpu to use new functionality.
15: add a module option to turn it all off.

The biggest difference in the memcg code from previously is I discovered wh=
at
obj cgroups were designed for and I'm reusing the page/objcg intergration t=
hat=20
already exists, to avoid reinventing that wheel right now.

There are some igt-gpu-tools tests I've written at:
https://gitlab.freedesktop.org/airlied/igt-gpu-tools/-/tree/amdgpu-cgroups?=
ref_type=3Dheads

One problem is there are a lot of delayed action, that probably means the t=
esting
needs a bit more robustness, but the tests validate all the basic paths.

Regards,
Dave.


