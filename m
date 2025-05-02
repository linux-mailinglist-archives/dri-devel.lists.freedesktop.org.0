Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED234AA6976
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 05:41:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0039E10E8A2;
	Fri,  2 May 2025 03:41:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79A5010E89E
 for <dri-devel@lists.freedesktop.org>; Fri,  2 May 2025 03:41:24 +0000 (UTC)
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-646-oNMIEx3FPpGL0YQNr-jFIg-1; Thu,
 01 May 2025 23:41:11 -0400
X-MC-Unique: oNMIEx3FPpGL0YQNr-jFIg-1
X-Mimecast-MFC-AGG-ID: oNMIEx3FPpGL0YQNr-jFIg_1746157265
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 24B8D180036D; Fri,  2 May 2025 03:41:03 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.64.136.70])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id BB73F1800115; Fri,  2 May 2025 03:40:55 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org, tj@kernel.org, christian.koenig@amd.com,
 Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>
Cc: cgroups@vger.kernel.org, Waiman Long <longman@redhat.com>, simona@ffwll.ch
Subject: [rfc] drm/ttm/memcg: simplest initial memcg/ttm integration (v2)
Date: Fri,  2 May 2025 13:35:59 +1000
Message-ID: <20250502034046.1625896-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CPW7uGIwtst37qH-O_yyhXz2epGvOWR9togko_NqZjw_1746157265
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

Hey all,

This is my second attempt at adding the initial simple memcg/ttm
integration.

This varies from the first attempt in two major ways:

1. Instead of using __GFP_ACCOUNT and direct calling kmem charges
for pool memory, and directly hitting the GPU statistic, Waiman
suggested I just do what the network socket stuff did, which looks
simpler. So this adds two new memcg apis that wrap accounting.
The pages no longer get assigned the memcg, it's owned by the
larger BO object which makes more sense.

2. Christian suggested moving it up a layer to avoid the pool business,
this was a bit tricky, since I want the gfp flags, but I think it only
needs some of them and it should work. One other big difference is that
I aligned it with the dmem interaction, where it tries to get space in
the memcg before it has even allocated any pages, I'm not 100% sure
this is how things should be done, but it was easier, so please let=20
me know if it is wrong.

This still doesn't do anything with evictions except ignore them,
and I've some follows up on the old thread to discuss more on them.

Dave.

