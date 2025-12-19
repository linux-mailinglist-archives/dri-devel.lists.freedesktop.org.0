Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC81ECD20F3
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 22:53:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4340F10EFDE;
	Fri, 19 Dec 2025 21:53:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Kj4I+0kY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F78E10EFDE
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 21:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1766181231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=EAePM3QMKVvKj521+eJkpi020bYlRB7Q4CCT8RGJeHk=;
 b=Kj4I+0kYnxR2cUQrkISAyD3CBeeKYggFhaBZRJyuVvsTGkV52HYn4zYSUvi5SRbLl920WM
 +594KTHW3Tag3+GQ7KThQ7FjgPyd6tNLj84Ckg0mFPedX+cUqdGHI2ef6ikGlxTpglzrc/
 K/0heXZMe3BgKjS6k8QzxIDY93wHGtc=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-392-6PqoTe58OLiqfFYR7RLvIQ-1; Fri,
 19 Dec 2025 16:53:50 -0500
X-MC-Unique: 6PqoTe58OLiqfFYR7RLvIQ-1
X-Mimecast-MFC-AGG-ID: 6PqoTe58OLiqfFYR7RLvIQ_1766181228
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 61CB91955E7F; Fri, 19 Dec 2025 21:53:48 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.80.166])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id D3CAB30001A2; Fri, 19 Dec 2025 21:53:45 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: "Timur Tabi" <ttabi@nvidia.com>, "Dave Airlie" <airlied@redhat.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Ben Skeggs" <bskeggs@nvidia.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Ben Skeggs" <bskeggs@redhat.com>, "David Airlie" <airlied@gmail.com>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Maxime Ripard" <mripard@kernel.org>, "Danilo Krummrich" <dakr@kernel.org>,
 "Lyude Paul" <lyude@redhat.com>
Subject: [PATCH 0/2] drm/nouveau: Fix cursor-related display hang
Date: Fri, 19 Dec 2025 16:52:01 -0500
Message-ID: <20251219215344.170852-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
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

This is a fix for one of the many issues I've been finding on my brand
new desktop. This one in particular is easy to hit if you have a cursor
with a continously updating surface between two displays, what fun!

Reminds me of a another bug from long ago…

Lyude Paul (2):
  drm/nouveau/disp/nv50-: Set lock_core in curs507a_prepare
  drm/nouveau/kms/nv50-: Assert we hold nv50_disp->lock in
    nv50_head_flush_*

 drivers/gpu/drm/nouveau/dispnv50/curs507a.c | 1 +
 drivers/gpu/drm/nouveau/dispnv50/head.c     | 5 +++++
 2 files changed, 6 insertions(+)


base-commit: 8e7460eac786c72f48c4e04ce9be692b939428ce
-- 
2.52.0

