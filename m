Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FD7A99AE2
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 23:43:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5EAF10E2BC;
	Wed, 23 Apr 2025 21:43:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CFDC10E2BC
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 21:43:34 +0000 (UTC)
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-635-6vVTT7RnMV-wBLkCJW9S6g-1; Wed,
 23 Apr 2025 17:43:29 -0400
X-MC-Unique: 6vVTT7RnMV-wBLkCJW9S6g-1
X-Mimecast-MFC-AGG-ID: 6vVTT7RnMV-wBLkCJW9S6g_1745444608
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 6A8DF1800570; Wed, 23 Apr 2025 21:43:28 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.64.136.98])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 37B9D19560A3; Wed, 23 Apr 2025 21:43:25 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org, tj@kernel.org, christian.koenig@amd.com
Cc: cgroups@vger.kernel.org
Subject: [rfc] drm/ttm/memcg: simplest initial memcg/ttm integration
Date: Thu, 24 Apr 2025 07:37:02 +1000
Message-ID: <20250423214321.100440-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lvvNEwElSPzqyyMdFHnDsjFuP38LRh2Rza7N6DdmgdQ_1745444608
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

I've been tasked to look into this, and I'm going start from hopeless
naivety and see how far I can get. This is an initial attempt to hook
TTM system memory allocations into memcg and account for them.

It does:
1. Adds memcg GPU statistic,
2. Adds TTM memcg pointer for drivers to set on their user object
allocation paths
3. Adds a singular path where we account for memory in TTM on cached
non-pooled non-dma allocations. Cached memory allocations used to be
pooled but we dropped that a while back which makes them the best target
to start attacking this from.
4. It only accounts for memory that is allocated directly from a userspace
TTM operation (like page faults or validation). It *doesn't* account for
memory allocated in eviction paths due to device memory pressure.

This seems to work for me here on my hacked up tests systems at least, I
can see the GPU stats moving and they look sane.

Future work:
Account for pooled non-cached
Account for pooled dma allocations (no idea how that looks)
Figure out if accounting for eviction is possible, and what it might look
like.

Dave.

