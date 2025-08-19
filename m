Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DD8B2C119
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 13:49:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74CF010E0D8;
	Tue, 19 Aug 2025 11:49:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4067110E0D8;
 Tue, 19 Aug 2025 11:49:49 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?=27Thomas=20Hellstr=C3=B6m=27?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <dev@lankhorst.se>,
 Maxime Ripard <mripard@kernel.org>, Natalie Vock <natalie.vock@gmx.de>,
 Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
 =?UTF-8?q?=27Michal=20Koutn=C3=BD=27?= <mkoutny@suse.com>,
 Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "'Liam R . Howlett'" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: Michal Hocko <mhocko@suse.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 cgroups@vger.kernel.org, linux-mm@kvack.org
Subject: [RFC 0/3] cgroups: Add support for pinned device memory
Date: Tue, 19 Aug 2025 13:49:33 +0200
Message-ID: <20250819114932.597600-5-dev@lankhorst.se>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

When exporting dma-bufs to other devices, even when it is allowed to use
move_notify in some drivers, performance will degrade severely when
eviction happens.

A perticular example where this can happen is in a multi-card setup,
where PCI-E peer-to-peer is used to prevent using access to system memory.

If the buffer is evicted to system memory, not only the evicting GPU wher
the buffer resided is affected, but it will also stall the GPU that is
waiting on the buffer.

It also makes sense for long running jobs not to be preempted by having
its buffers evicted, so it will make sense to have the ability to pin
from system memory too.

This is dependant on patches by Dave Airlie, so it's not part of this
series yet. But I'm planning on extending pinning to the memory cgroup
controller in the future to handle this case.

Implementation details:

For each cgroup up until the root cgroup, the 'min' limit is checked
against currently effectively pinned value. If the value will go above
'min', the pinning attempt is rejected.

Pinned memory is handled slightly different and affects calculating
effective min/low values. Pinned memory is subtracted from both,
and needs to be added afterwards when calculating.

This is because increasing the amount of pinned memory, the amount of
free min/low memory decreases for all cgroups that are part of the
hierarchy.

Maarten Lankhorst (3):
  page_counter: Allow for pinning some amount of memory
  cgroup/dmem: Implement pinning device memory
  drm/xe: Add DRM_XE_GEM_CREATE_FLAG_PINNED flag and implementation

 drivers/gpu/drm/xe/xe_bo.c      | 66 +++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_dma_buf.c | 10 +++-
 include/linux/cgroup_dmem.h     |  2 +
 include/linux/page_counter.h    |  8 +++
 include/uapi/drm/xe_drm.h       | 10 +++-
 kernel/cgroup/dmem.c            | 57 ++++++++++++++++++-
 mm/page_counter.c               | 98 ++++++++++++++++++++++++++++++---
 7 files changed, 237 insertions(+), 14 deletions(-)

-- 
2.50.0

