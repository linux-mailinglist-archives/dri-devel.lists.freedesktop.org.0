Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D7295A01C
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 16:39:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 593FF10E63E;
	Wed, 21 Aug 2024 14:39:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="Dxd4LFQe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9FC310E63E
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 14:39:04 +0000 (UTC)
Delivered-To: boris.brezillon@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1724251141; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=WfQDs93SYT+i9J79NlPp/I7i7EY8sgKvi6stH067ccW97XSFSFROydjpmAkbppAklVytiOcRJz2naN8CEP7j/rR1SnJ3jjNXvi5qiGW2HI3JGEP/5dDYL+INrV6tFLD3XiN8rjxPZGAhyekDklSAROcNjJlQ23WhjESElxkCmFY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1724251141;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=HL5w15xGJTVkRRqNu8utX28aSRMGFxWi99Z7omzG7fc=; 
 b=Z2BlWgDg94ovTBh8wT0iNvs4kBI2IEgSSyZ+gA/XYkixg2yTMzHwzgkrWmymWjT+EcXhsHFJ4XMqWPxLBuqtYRyavdJnAeluBozoCKlwU08sgSHyh5mAQnbXy2nnpZ2vMV93aiNerbec2/EFkY92qdZ2uFBGxst+Fo5q1QEyD58=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724251141; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=HL5w15xGJTVkRRqNu8utX28aSRMGFxWi99Z7omzG7fc=;
 b=Dxd4LFQeDubpsgSrMS4QohAqmZ2sd9n4Y5m18fFlnEDGBwe8z7rhlyCtxApdGBHS
 +2wcdaaXI3KTrWLDQnvGZIOh5aJFUQ8IyetOljbfyJt0RacwEbwK+7vewE2V7XN/pGC
 kU37W9XugwF9r5B3VU6wg9G5+gF2b3pu+iIA5G7U=
Received: by mx.zohomail.com with SMTPS id 1724251139471361.4755537553998;
 Wed, 21 Aug 2024 07:38:59 -0700 (PDT)
From: Daniel Almeida <daniel.almeida@collabora.com>
To: liviu.dudau@arm.com, steven.price@arm.com, carsten.haitzler@arm.com,
 boris.brezillon@collabora.com, robh@kernel.org,
 faith.ekstrand@collabora.com
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 RESEND 0/5] Panthor devcoredump support
Date: Wed, 21 Aug 2024 11:37:26 -0300
Message-ID: <20240821143826.3720-1-daniel.almeida@collabora.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240710225011.275153-1-daniel.almeida@collabora.com>
References: <20240710225011.275153-1-daniel.almeida@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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


Resending this because, among other things, the patches themselves did
not have dri-devel on cc.

------------------

Hi all.

I will refrain from writing a changelog here, since I have rewritten
this series from the ground up in C. I removed the Rust-for-Linux people
from the loop for now, since this has become a bit tangential to Rust.

Lastly, this is no longer RFC.

For those looking for a branch instead, please see [0].

I have tested this with the decoder tool I wrote at [1]. Unfortunately
the dumps are too large to share.

You will notice that I added support for a new query. I am still working
on the IGT tests for that. 


Let me know what you think.

-- Daniel

[0] https://gitlab.collabora.com/dwlsalmeida/for-upstream/-/tree/panthor-devcoredump?ref_type=heads
[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30651

Daniel Almeida (5):
  drm: panthor: expose some fw information through the query ioctl
  drm: panthor: add devcoredump support
  drm: panthor: add debugfs support in panthor_sched
  drm: panthor: add debugfs knob to dump successful jobs
  drm: panthor: allow dumping multiple jobs

 drivers/gpu/drm/panthor/Kconfig          |   1 +
 drivers/gpu/drm/panthor/Makefile         |   1 +
 drivers/gpu/drm/panthor/panthor_device.h |   3 +
 drivers/gpu/drm/panthor/panthor_drv.c    |   9 +
 drivers/gpu/drm/panthor/panthor_dump.c   | 459 +++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_dump.h   |  36 ++
 drivers/gpu/drm/panthor/panthor_mmu.c    |  22 ++
 drivers/gpu/drm/panthor/panthor_mmu.h    |   6 +
 drivers/gpu/drm/panthor/panthor_sched.c  |  92 ++++-
 drivers/gpu/drm/panthor/panthor_sched.h  |  17 +
 include/uapi/drm/panthor_drm.h           | 143 +++++++
 11 files changed, 788 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/panthor/panthor_dump.c
 create mode 100644 drivers/gpu/drm/panthor/panthor_dump.h

-- 
2.45.2

