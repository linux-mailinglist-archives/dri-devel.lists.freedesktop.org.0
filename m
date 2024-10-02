Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D385E98E742
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 01:45:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74E8D10E179;
	Wed,  2 Oct 2024 23:45:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="E52gQzv4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B66E10E07D;
 Wed,  2 Oct 2024 23:45:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1727912746; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=lnRxaE9C5ntkhbKfZFu7T+CDVNALbS0pWObKYrcfC/tKIiCmhuP+0JoqWyl1EQ6xe/mMQGEgyMTVmxfjsli0tJqWj/KrC2E4uTMOt/uTqTreHKUZwS3lZcqVhTAenJCU10Ai6G3u4Ni5cqgfX7OtSFxDArtF/xY11jp8bxFtqek=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1727912746;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=AWY4hADE/Gn1eTfd9x/OOmqUqbsp9RNFlmDY3sZq0pQ=; 
 b=A0bEc6jF60JSnSScPSREBb5/az2f5JUxsiudM2wrHe5nnJEYtbz5KyVKsflJ/XKa6+EH/XX0vv8CKU0qxSQCIe70DzkzjokOkACtN1Zje7dcEFNHdEqVPBhEEbPw1CJyk1zRYXzG+JsSGyUNei1yUWHyHPGH+9tM7NLmKb/JaRs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1727912746; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=AWY4hADE/Gn1eTfd9x/OOmqUqbsp9RNFlmDY3sZq0pQ=;
 b=E52gQzv4xbl+CcDmt2pEAwoTeYMq6mcNkzP16B4qhGEFjqOB1EKdljZwAmtErz7u
 9EduBM/zp0DlfB4GMWSUZXfQSf5N6Vs9gzQQZwWVI07DgjaZ5rVu114AkmXVyQf/M67
 v/9SWPP7QRpeaaViauxy9FTRUZdEvy089OmgaVwI=
Received: by mx.zohomail.com with SMTPS id 1727912744358994.3097024662918;
 Wed, 2 Oct 2024 16:45:44 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Cc: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: [RFC PATCH 0/2] Allow fdinfo to display size of internal BO's
Date: Thu,  3 Oct 2024 00:45:09 +0100
Message-ID: <20241002234531.3113431-1-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This patch series lets DRM fdinfo stats functions display an additional tag
that will reflect the amount of memory internal BOs of a DRM driver take
up.

The rationale for this is that some drivers, like Panthor, need quite a bit
of memory for things like queue ring buffers or tiler heap chunks, and
these will vary dynamically as new scheduler groups, queues or heap chunks
are created by one or more render contexts.

Because these are tied to an open DRM file that represents an ongoing
render context, then it makes sense to provide users with this information
in the DRM file fdinfo descriptor, even though they would never be exposed
to UM through a handle.

These two patches were originally part of a wider series, but broke it down
into two different submissions for ease of discussion.

The previous debate can be found at [1], in its latest two patches.

[1] https://lore.kernel.org/dri-devel/dqhnxhgho6spfh7xhw6yvs2iiqeqzeg63e6jqqpw2g7gkrfphn@dojsixyl4esv/

Adrián Larumbe (2):
  drm/drm_file: Add display of driver's internal memory size
  drm/panthor: register size of internal objects through fdinfo

 drivers/gpu/drm/drm_file.c               |  6 ++-
 drivers/gpu/drm/msm/msm_drv.c            |  2 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c  |  2 +-
 drivers/gpu/drm/panthor/panthor_device.c |  2 +
 drivers/gpu/drm/panthor/panthor_device.h |  6 +++
 drivers/gpu/drm/panthor/panthor_drv.c    | 16 +++++--
 drivers/gpu/drm/panthor/panthor_fw.c     | 14 ++++--
 drivers/gpu/drm/panthor/panthor_fw.h     |  6 ++-
 drivers/gpu/drm/panthor/panthor_gem.c    | 55 ++++++++++++++++++++++--
 drivers/gpu/drm/panthor/panthor_gem.h    | 15 ++++++-
 drivers/gpu/drm/panthor/panthor_heap.c   | 20 ++++++---
 drivers/gpu/drm/panthor/panthor_heap.h   |  6 ++-
 drivers/gpu/drm/panthor/panthor_mmu.c    |  7 ++-
 drivers/gpu/drm/panthor/panthor_mmu.h    |  3 +-
 drivers/gpu/drm/panthor/panthor_sched.c  | 19 ++++----
 drivers/gpu/drm/v3d/v3d_drv.c            |  2 +-
 include/drm/drm_file.h                   |  7 ++-
 17 files changed, 150 insertions(+), 38 deletions(-)

-- 
2.46.2

