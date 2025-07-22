Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E61DB0CF58
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 03:50:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9AB610E5C4;
	Tue, 22 Jul 2025 01:50:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D64910E5C4
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 01:50:46 +0000 (UTC)
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-302-xfYiSgwNMU-YOIV9eZyv-Q-1; Mon,
 21 Jul 2025 21:49:53 -0400
X-MC-Unique: xfYiSgwNMU-YOIV9eZyv-Q-1
X-Mimecast-MFC-AGG-ID: xfYiSgwNMU-YOIV9eZyv-Q_1753148992
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id A628A1800365; Tue, 22 Jul 2025 01:49:51 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.67.32.7])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 46C5019560A3; Tue, 22 Jul 2025 01:49:46 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Johannes Weiner <hannes@cmpxchg.org>,
 Christian Koenig <christian.koenig@amd.com>
Cc: Dave Chinner <david@fromorbit.com>,
	Kairui Song <kasong@tencent.com>
Subject: drm/ttm/memcg/lru: enable memcg tracking for ttm and amdgpu driver
 (complete series v3)
Date: Tue, 22 Jul 2025 11:43:13 +1000
Message-ID: <20250722014942.1878844-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6wtWCFAkIxk37H4CFSvw0pr7Y5lZxYfI2E12naGL4DI_1753148992
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

This is a 2nd repost with some fixes and cleanups. Original post is below.

https://lore.kernel.org/dri-devel/20250714052243.1149732-1-airlied@gmail.co=
m/ is the 2nd post.
https://lore.kernel.org/dri-devel/20250630045005.1337339-1-airlied@gmail.co=
m/ is the 1st post.

Differences since last posting:
1. Shakeel suggested I squash some export additions - done now
2. Shakeel suggested I use lruvec in the earlier vmstat accounting - done
3. Christian asked for the turn off patch to be more generic - added Kconfi=
g/module option

I would probably squash 16 into other places, but left it alone for now so =
we can see it.

Christian has an outstanding statement on suspend/resume breakage that I'm =
waiting for a respone.

I'd like to at least land 01->06 in drm-misc-next soon, to at least reduce =
the patch load.

Patch order is now:
01->02: add support for global gpu stat counters
03->06: port ttm pools to list_lru for numa awareness
07->13,16: add memcg stats + gpu apis, then port ttm pools to memcg aware l=
ist_lru and shrinker
14: enable amdgpu to use new functionality.

Differences since last posting:
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
03->07: port ttm pools to list_lru for numa awareness
08->14: add memcg stats + gpu apis, then port ttm pools to memcg aware list=
_lru and shrinker
15->17: enable amdgpu to use new functionality.

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

