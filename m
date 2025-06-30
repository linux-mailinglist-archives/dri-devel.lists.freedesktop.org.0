Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 287CAAED389
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 06:50:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08E1E10E0A2;
	Mon, 30 Jun 2025 04:50:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4795310E0A2
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 04:50:22 +0000 (UTC)
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-47-K_va_72UMMi8zod4aG77Fw-1; Mon,
 30 Jun 2025 00:50:17 -0400
X-MC-Unique: K_va_72UMMi8zod4aG77Fw-1
X-Mimecast-MFC-AGG-ID: K_va_72UMMi8zod4aG77Fw_1751259016
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 668C4193F048; Mon, 30 Jun 2025 04:50:15 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.67.24.96])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 3DCFD1956095; Mon, 30 Jun 2025 04:50:09 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Johannes Weiner <hannes@cmpxchg.org>,
 Christian Koenig <christian.koenig@amd.com>
Cc: Dave Chinner <david@fromorbit.com>,
	Kairui Song <kasong@tencent.com>
Subject: drm/ttm/memcg/lru: enable memcg tracking for ttm and amdgpu driver
Date: Mon, 30 Jun 2025 14:49:19 +1000
Message-ID: <20250630045005.1337339-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XFmcbzs2X1fvWm4PzdhhJdFddE3YlxO4t5uV8yhNcMU_1751259016
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

